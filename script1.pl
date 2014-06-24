#!/usr/bin/perl

# Open file

my $fileName = $ARGV[0];
open (my $fileHandle, '<', $fileName) or die "Nie mozna otworzyc pliku, $!";
my @entireFile=<$fileHandle>;
close($fileHandle);

# Obtain sequence as string

my $numberOfLines=@entireFile;
# print $numberOfLines;
my @sequence = @entireFile[1..$numberOfLines];
$sequence = join('', @sequence);
@sequence = split('\n', $sequence);
$sequence = join('', @sequence);

# Count characters in sequence string

my $lengthOfSequence=length($sequence);
print $lengthOfSequence;

