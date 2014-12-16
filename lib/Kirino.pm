package Kirino;
use Mouse;
use Kirino::Router;
use Plack::Request;
use Plack::Util;
use Try::Tiny;
use Carp;

our $VERSION = "0.01";

has 'router' => (
    is => 'ro',
    isa => 'Kirino::Router',
    default => sub { Kirino::Router->new }
);

has 'controllers' => (
    is => 'rw',
    isa => 'HashRef',
    default => sub { {} }
);

no Mouse;

sub app {
    my $self = shift;
    sub {
        my $env = shift;
        $self->startup();
        my ($dest, $captured, $is_not_allowed)
            = $self->router->match($env->{REQUEST_METHOD}, $env->{PATH_INFO});
        return $self->return_404 if !$dest || $is_not_allowed;
        my $class = $self->controllers->{$dest->{controller}};
        unless ($class) {
            $class = Plack::Util::load_class("Controller::$dest->{controller}", ref $self);
            $self->controllers->{$dest->{controller}} = $class;
        }
        my $method = $dest->{action};
        my $code = try {
            my $instance = $class->new( req => Plack::Request->new($env) );
            $instance->$method();
        };
        return $code;
    };
}

sub startup {}

sub return_404 {
    return [404, [], ['Not Found']];
}

__PACKAGE__->meta->make_immutable();

__END__

=encoding utf-8

=head1 NAME

Kirino - It's new $module

=head1 SYNOPSIS

    use Kirino;

=head1 DESCRIPTION

Kirino is ...

=head1 LICENSE

Copyright (C) Yusuke Wada.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Yusuke Wada E<lt>yusuke@kamawada.comE<gt>

=cut

