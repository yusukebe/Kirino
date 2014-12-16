package Kirino::Router;
use Mouse;
extends qw/Router::Boom::Method/;

sub get {
    my $self = shift;
    $self->add('GET', @_);
}

sub post {
    my $self = shift;
    $self->add('POST', @_);
}

__PACKAGE__->meta->make_immutable();
