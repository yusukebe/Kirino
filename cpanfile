requires 'Encode';
requires 'Mouse';
requires 'Path::Tiny';
requires 'Plack::Request';
requires 'Plack::Util';
requires 'Router::Boom::Method';
requires 'Text::Xslate';
requires 'Try::Tiny';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
    requires 'perl', '5.008_001';
};

on test => sub {
    requires 'HTTP::Request::Common';
    requires 'Plack::Test';
    requires 'Test::More', '0.98';
    requires 'parent';
};
