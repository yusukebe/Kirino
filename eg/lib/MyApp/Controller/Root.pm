package MyApp::Controller::Root;
use Mouse;
extends qw/Kirino::Controller/;

sub echo {
    my $self = shift;
    my $message = $self->req->param('message');
    $self->render('echo.tx', { message => $message });
}

1;
