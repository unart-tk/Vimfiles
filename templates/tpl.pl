#!/usr/bin/perl -w

## [:VIM_EVAL:]expand("%:t")[:END_EVAL:]
## =======================
## 
##     Copyright (C) [:VIM_EVAL:]strftime('%Y')[:END_EVAL:] Ben Leak
##
##     [:VIM_EVAL:]strftime('%Y-%m-%d')[:END_EVAL:], leakin.org
##     perl|
## 
## -----------------------      

use strict;
use warnings;
use Pod::Usage;
use Getopt::Long;
use File::Temp;
use File::Spec;
use Cwd;

=encoding utf8

=head1 NAME

[:VIM_EVAL:]expand("%:t")[:END_EVAL:] - <short descr>

=head1 SYNOPSIS

 [:VIM_EVAL:]expand("%:t")[:END_EVAL:] [--options] file

=head1 DESCRIPTION

B<[:VIM_EVAL:]expand("%:t")[:END_EVAL:]> is a command line tool to  ... C<file>

where C<file> is ...

=head1 EXAMPLES

Display C</etc/foo> file from  ...:

 ./[:VIM_EVAL:]expand("%:t")[:END_EVAL:] 
 ls .

=head1 OPTIONS

=cut

my $help;

=item B<--help>

Display brief help.

=cut

my $color;

=item B<--color>

Display color

=cut


my $version;

=item B<--version>

Display version number and exit.

=cut


GetOptions ("help|?" => \$help,
            "version|v" => \$version,
            "green" => sub { $color = "green"},
    ) or pod2usage (2);

if ($help) { pod2usage(1)};

if ($version) {
    my $version = '0.1';
    exit
}

if (@ARGV == 0) { pod2usage "No file given"};


my $filename = pop @ARGV;


open( my $fh, '<', $filename ) or die "Can't open $filename: $!";
    while ( my $line = <$fh> ) {
        if ( $line =~ /wanted text/ ) {
            print $line;
        }
}
close $fh;

=back

=head1 SEE ALSO

L<File::Spec(3)>,

=head1 AUTHORS

Ben Leak L<http://leakin.org>


=head1 COPYRIGHT

Copyright (C) 2009 Ben Leak

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
