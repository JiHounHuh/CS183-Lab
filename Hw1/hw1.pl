#!/usr/bin/perl

my $argNum = $#ARGV; #initialize number of arguments
for (my $i = 0; $i < $argNum+1;$i+=1) { #run while it is not only the script running
    open(fileName, $ARGV[$i]); #open file
    while($line = <fileName>) { #while file is not empty, run
        print $line; #print the file contents
    }
    close(fileName); #clean up, close file
}