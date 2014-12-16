package TestApp::Controller::Root;
use Mouse;
extends qw/Kirino::Controller/;

sub index {
    return [200, [], ['Hello']];
}

sub template {
    my $self = shift;
    return $self->render('test.tx', { message => 'Hello' });
}

1;
