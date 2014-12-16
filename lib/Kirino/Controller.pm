package Kirino::Controller;
use Mouse;
use Text::Xslate;
use Path::Tiny;
use Encode;

has '_xslate' => (
    is => 'rw',
    isa => 'Object',
    lazy_build => 1,
);

has 'req' => (
    is => 'ro',
    isa => 'Plack::Request'
);

no Mouse;

sub _build__xslate {
    my $tx = Text::Xslate->new();
    return $tx;
}

sub render {
    my ($self, $filename, $args) = @_;
    my ($p, $f, $l) = caller;
    my $dir = path($f)->parent(4)->child('templates');
    my $html = $self->_xslate->render($dir->child($filename), $args);
    return [
        200,
        [ 'Content-Length' => length $html, 'Content-Type' => 'text/html' ],
        [ encode_utf8($html) ]
    ];
}

__PACKAGE__->meta->make_immutable();
