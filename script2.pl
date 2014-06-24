#!/usr/bin/perl

# Open file

my $fileName = $ARGV[0];
open (my $fileHandle, '<', $fileName) or die "Nie mozna otworzyc pliku, $!";
my @entireFile=<$fileHandle>;
close($fileHandle);

# Obtain sequence as string

my $numberOfLines=@entireFile;
my @sequence = @entireFile[1..$numberOfLines];
my $sequence = join('', @sequence);
@sequence = split('\n', $sequence);
$sequence = join('', @sequence);

# Count characters in sequence string

my $lengthOfSequence=length($sequence);

# Iterate over letter triplets, record stop and start codon positions

my @stopPositions;
my @startPositions;

for my $i (0..$lengthOfSequence-3) {
	$nth=substr($sequence, $i, 3);
	if ($nth eq "TAG" or $nth eq "TAA" or $nth eq "TGA") {
	my $j=$i+1;
	push (@stopPositions, "$j");
	}
}

for my $i (0..$lengthOfSequence-3) {
	$nth=substr($sequence, $i, 3);
	if ($nth eq "ATG") {
	my $j=$i+1;
	push (@startPositions, "$j");
	}
}

$stopPositions = join(', ', @stopPositions);
$startPositions = join(', ', @startPositions);

# Return codon positions (comma-separated for clarity)

print "\nPozycje kodonow STOP (TAG, TAA lub TGA):\n";
print $stopPositions;
print "\n";

print "\nPozycje najczestszego kodonu start (ATG):\n";
print $startPositions;
print "\n";


# Count codons
my $numberOfStopCodons=@stopPositions;
my $numberOfStartCodons=@startPositions;

print "\nKodonow stop jest ";
print $numberOfStopCodons;

print "\nKodonow start jest ";
print $numberOfStartCodons;
print "\n";