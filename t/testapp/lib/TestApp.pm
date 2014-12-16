package TestApp;
use parent qw/Kirino/;

sub startup {
    my $self = shift;
    $self->router->get('/', { controller => 'Root', action => 'index' });
    $self->router->get('/render', { controller => 'Root', action => 'template' });
}

1;
