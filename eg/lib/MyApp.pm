package MyApp;
use Mouse;
extends qw/Kirino/;

sub startup {
    my $self = shift;
    $self->router->get('/echo', { controller => 'Root', action => 'echo' });
}

1;
