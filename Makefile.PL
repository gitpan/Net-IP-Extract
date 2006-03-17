use 5.008006;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME              => 'Net::IP::Extract',
	VERSION_FROM      => 'lib/Net/IP/Extract.pm',
	PREREQ_PM         => {},

	($] >= 5.005 ?
		(ABSTRACT => 'Perl module to extract Ip Address from a document',
		 AUTHOR   => 'Matteo Cantoni <mcantoni@cpan.org>') : ()),
);
