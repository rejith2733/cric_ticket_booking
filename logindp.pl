#!C:\xampp\perl\bin\perl.exe
print "Content-type:text/html;charset=iso-8859-1\n\n";
use CGI;
use feature "switch";
use CGI::Carp qw(fatalsToBrowser);
use DBI;
$q=new CGI;
read(STDIN,$FormData,$ENV{'CONTENT-LENGTH'});

$email=$q->param('email');
$name=$q->param('name');
$password=$q->param('pass');
my $dbh = DBI->connect('DBI:mysql:mysql',"root","") or die $DBI::errstr;
my $sth = $dbh->prepare("INSERT INTO logindb values(?,?,?,?)");
$sth->execute($name,$email,$password) or die $DBI::errstr;
$sth->finish();
print "Updated LOGINDB<br>";
