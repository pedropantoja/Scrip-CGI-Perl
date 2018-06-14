#!/usr/bin/perl

use CGI;
use utf8;

#Declaramos la entrada del CGI.
$perlcgi = new CGI;

    print $perlcgi->header(-charset => 'utf-8');
    print $perlcgi->start_html('Accesos');

    open F, '>>/tmp/accesos.txt' or die "Imposible abrir el fichero:$!";
    if($ENV{'QUERY_STRING'} eq ""){
    print F "$ENV{HTTP_USER_AGENT}:$ENV{REMOTE_ADDR}:$ENV{REQUEST_METHOD}:$ENV{QUERY_STRING} \n";
    }else {
    my $datosPost = '';
    read(STDIN, $datosPost, $ENV{'CONTENT_LENGTH'});

      print F "$ENV{HTTP_USER_AGENT}:$ENV{REMOTE_ADDR}:$ENV{REQUEST_METHOD}:$datosPost \n";
    }
    close F;

    open F, '/tmp/accesos.txt' or die "Imposible abrir el fichero:$!";
      while(<F>) {
      print "$_ <br>";
      }
      close F;
