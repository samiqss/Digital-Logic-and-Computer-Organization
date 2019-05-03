#!/usr/bin/perl
##############################################################
#                          MMA
# Simulator for MMA.v1.r1
# Docs: MMA-v1.r1.artn and testPlan
# File: MMA.pl
# Author: Peter Walsh csci 261 Feb 2010
#          Updated Nov 25 2015 (PW)
#          Updated Jan 19 2017 (PW)
#          Modified by Sami Al-Qusus   Nov 2018   Modified for MMA 
##############################################################
        
use Bit::Vector;
use Switch;

sub resetMMA { 

   open(MACHINECODE, "mac") || die "can't open mac file \n";

    my $vec1 = Bit::Vector->new(5);
    my $vec2 = Bit::Vector->new(13);
    my $vec = Bit::Vector->new(17);
   $reset=0;
   my $lc=0;
   while (<MACHINECODE>) {
      $instr=substr($_, 0, 16);
      $vec->from_Bin($instr);
      @mem[$lc]=$vec->to_Dec();

      $op=substr($instr, 0,4);       
      $vec1->from_Bin($op);
      @mem1[$lc]=$vec1->to_Dec();
      
      $opAd = substr($instr,4,12);
      $vec2->from_Bin($opAd);
      @mem2[$lc]=$vec2->to_Dec();

      $lc++;
   }

   close (MACHINECODE);

   $pc=0;
   #  $ACC=0;
   $halt=0;
   $fault=0;
}

sub printMenu {
   print "+------------------------+ \n";
   print "|  R: RESET              | \n";
   print "|  b: BREAK              | \n";
   print "|  r: RUN                | \n";
   print "|  A: READ PORT A        | \n";
   print "|  B: WRITE PORT B       | \n";
   print "|  C: READ PORT C        | \n";
   print "|  D: WRITE PORT D       | \n";
   print "|  s: STATUS             | \n";
   print "|  t: TOP                | \n";
   print "|  p: PSW                | \n";
   print "|  q: QUIT               | \n";
   print "|                        | \n";
   print "|  Enter menu selection: | \n";
   print "+------------------------+ \n";
}


sub aluAdd {
   my $xx, $yy;
   $xx=@_[0];
   $yy=@_[1];

   ($xx+$yy) % 256;
}

sub aluSub {
   my $xx, $yy;
   $xx=@_[1];
   $yy=@_[0];

   if ($xx>=128) {
      $xx=($xx % 128);
      $xx=-$xx;
   }

   if ($yy>=128) {
      $yy=($yy % 128);
      $yy=-$yy;
   }


   if ($xx>=$yy) {
      ($xx-$yy) % 128 ;
   } else {
      ((($yy-$xx) + 128 ) % 256) ;
   }

}

sub adjustFlags {
	switch (@mem[0xffb]) {
		case 0 {$Z=0}
		case 0x8000 {$Z=1}
		case 0x4000 {$Z=0}
	}
}

sub setFlags {
	my $xx;
	$xx=@_[0];
	@mem[0xffb]=0;
	if ($xx==0) {
		$Z=1;
		@mem[0xffb]=0x8000;
	} else {
		$Z=0;
	}

}

sub insExe {

   switch ($opcode) {
      case 0 { }
      case 1 { $halt=1}
      case 2 { $ACC= @mem[$operandAddress]; adjustFlags() if ($operandAddress==0xffb)}
      case 3 { @mem[$operandAddress]= $ACC; adjustFlags() if ($operandAddress==0xffb) }
      case 4 { $ACC=aluAdd(@mem[$operandAddress], $ACC);setFlags(@mem[$operandAddress]) }
      case 5 { $ACC=aluSub(@mem[$operandAddress], $ACC);setFlags(@mem[$operandAddress]) }
      case 6 { $pc = $operandAddress } 	
      case 7 { if (!$Z) { $pc=$operandAddress} 
	      else { $pc+=2 } }	
   }
   # print "opcode: $opcode \n operand: $operandAddress \n ACC: $ACC pc: $pc ";
}

sub execMMA {
  
   if ((!$reset) && (!$fault)) {
      $opcode=@mem1[$pc];
      $operandAddress =@mem2[$pc];
      $ir = @mem[$pc]; 
      $pc++;
      	
      #print "opcode: $opcode \n operand: $operandAddress \n ACC: $ACC pc: $pc ";
      if ($opcode>$maxOpCode) {
         $fault=1;
      } else { insExe() }
   }
}

# main

my $portaVec=Bit::Vector->new(16);
my $portcVec=Bit::Vector->new(16);
my $portbVec=Bit::Vector->new(17);
my $portdVec=Bit::Vector->new(17);
my $topStackVec=Bit::Vector->new(16);
my $pswVec=Bit::Vector->new(16);
my $sel;

$maxOpCode=7;
$reset=1;

while (1) {
   printMenu();
   
   $sel=<>;
   chop($sel);
   switch($sel) {
      case "R" { resetMMA() }
      case "b" { if ((!$halt) && (!$fault)) { execMMA() } }
      case "r" { while ((!$halt) && (!$fault)) { execMMA() } }
      case "B" { print "Enter Port B value in binary (16 bits)\n";
                 $portbStr=<>; 
                 $portbStr=substr($portbStr, 0, 16);
                 $portbVec->from_Bin($portbStr);
                 @mem[0xffd]=$portbVec->to_Dec() }
      case "A" { if (defined(@mem[0xffc])) {
                    $portaVec->from_Dec(@mem[0xffc]);
                    $portaStr=$portaVec->to_Bin();
       	         }
                 print "Port A value: $portaStr \n" }
      case "D" { print "Enter Port D value in binary (16 bits)\n";
                 $portdStr=<>;
                 $portdStr=substr($portdStr, 0, 16);
                 $portdVec->from_Bin($portdStr);
                 @mem[0xfff]=$portdVec->to_Dec() } 
      case "C" { if (defined(@mem[0xffe])) {
                    $portcVec->from_Dec(@mem[0xffe]);
                    $portcStr=$portcVec->to_Bin();
                 }
                 print "Port C value: $portcStr \n" }
      case "s" { print "Fault: $fault \n Halt: $halt \n" }

      case "p" { if (defined(@mem[0xffb])) {
                    $pswVec->from_Dec(@mem[0xffb]);
                    $pswStr=$pswVec->to_Bin();
                 }
                 print "PSW: $pswStr \n" }
      case "q" { exit() }
   }
}
