#!/usr/bin/perl

use DBI;
use strict;

my$dbh = DBI->connect("dbi:SQLite:dbname="table_data.db","", "", {RaiseError =>1},)
or die $DBI:errstr;

my $stmt = qq(SELECT ID, first_name, last_name, home FROM data;);
my $sth = $dbh->prepare($stmt);
my $rv = $sth->execute() or die $DBI:errstr;

if($rv < 0){
	print $DBI::errstr;
}

while(my @row = $sth->fetchrow_array()){
	print "ID: ".$row[0]. "  ";
	print "First Name: ".$row[1]. "  ";
	print "Last Name: ".$row[2]. "  ";
	print "Home: ".$row[3]. "  ";
}

$dbh->disconnect();


