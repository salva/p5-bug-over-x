package overx;

use strict;
use warnings;

require overload;
overload->import('x'  => \&_x,
                 '*'  => \&_x,
                 '""' => \&_to_string,
                 '0+' => \&_length);


sub new {
    my ($class, @a) = @_;
    my $self = \@a;
    bless $self, $class;
}

sub _x {
    my $a = shift;
    my $b = shift;
    my $c = [@$a, @$b];
    bless $c;
    print STDERR "$a x $b -> $c\n";
    $c;
}

sub _length {
    my $a = shift;
    scalar @$a;
}

sub _to_string {
    my $a = shift;
    "{".join(', ', @$a)."}";
}

sub sc ($) { $_[0] }

1;
