use strict;
use warnings;
use lib qw!lib ../lib!;
use Plack::Builder;
use MyApp;

my $app = MyApp->new->app();

builder {
    #...;
    $app;
};
