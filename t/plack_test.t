use strict;
use lib 't/testapp/lib';
use TestApp;
use Plack::Test;
use HTTP::Request::Common;
use Test::More;

my $instance = TestApp->new();
ok $instance;
my $app = $instance->app();
ok $app;

my $test = Plack::Test->create($app);
my $res = $test->request(GET '/');
is $res->code, 200;
is $res->content, 'Hello';

$res = $test->request(GET '/render');
is $res->code, 200;
is $res->content, 'Hello';

done_testing;
