package Net::IP::Extract;

use 5.008006;
use strict;
use warnings;

our $VERSION = '0.01';
$VERSION = eval $VERSION;

sub extract{

	my @data = @_;

	my @ip;

	foreach (@data){
		while ($_=~m{\G.*?(\d{1,3}(?:\.\d{1,3}){3})}g){
			my $ip=$1;$ip=~m{(\d+)\.(\d+)\.(\d+)\.(\d+)};
			next unless (0|int($1)|int($2)|int($3)|int($4))<256;
			push @ip, $ip;
		}
	}

	return @ip;
}

1;
__END__

=head1 NAME

Net::IP::Extract - Perl module to extract Ip Address from a document

=head1 SYNOPSIS

  use Parse::IpAddress;

  my $file = $ARGV[0];

  my @file;
  open(FILE, "<$file") || die " Cannot open file $file : $!\n";
    chomp (@file = <FILE>);
  close(FILE);

  my @ip = Parse::IpAddress::parseip(@file);

  foreach (@ip){
    print "$_\n";
  }

=head1 DESCRIPTION

This module permit to extract Ip Address from a document, text, html pages etc..

=head1 METHODS

=head2 extract 

Returns an array with extracted Ip Address:

  my @ip = Parse::IpAddress::parseip(@file);

=head1 SEE ALSO

perlre

=head1 AUTHOR

Matteo Cantoni, E<lt>mcantoni@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

You may distribute this module under the terms of the Artistic license.
See Copying file in the source distribution archive.

Copyright (c) 2006, Matteo Cantoni

=cut
