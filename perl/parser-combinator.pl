#!/usr/bin/perl

use strict;
use warnings;

# open dates file containing dates
my $filename = 'dates';
if (open(my $fh, '<:encoding(UTF-8)', $filename)) {
  while (my $row = <$fh>) {
    chomp $row;
    if ($row =~ /(end)/) {
        print "File termination.\n";
    } elsif ($row =~ /(\d+:\d+)(am|pm)/) {
        my ($hours, $delim, $mins, $ampm) = ($row =~ m/(\d+)(:)(\d+)(am|pm)/);
        print "$row is: $hours hour(s) and $mins minutes(s) in the $ampm\n";
    } elsif ($row =~ /(\d+:\d+)/) {
        my ($hours, $delim, $mins) = ($row =~ m/(\d+)(:)(\d+)/);
        print "$row is: $hours hours and $mins minutes(s)\n";
    } elsif ($row =~ /(\d+)(am|pm)/) {
        my ($hours, $ampm) = ($row =~ m/(\d+)(am|pm)/);
        print "$row is $hours hour(s) in the $ampm\n";
    } else {
        print "ERROR PARSING: $row, unknown date format."
    }
  }
} else {
  warn "Could not open file '$filename' $!";
}
