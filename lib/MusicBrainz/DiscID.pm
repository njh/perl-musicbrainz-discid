package MusicBrainz::DiscID;

################
#
# libdiscid: perl bindings
#
# Copyright 2009 Nicholas J. Humfrey <njh@aelius.com>
#

use XSLoader;
use Carp;

use strict;

use vars qw/$VERSION/;

$VERSION="0.01";

XSLoader::load('MusicBrainz::DiscID', $VERSION);


sub default_device {
    return MusicBrainz::DiscID::discid_get_default_device();
}

sub new {
    my $class = shift;
    my ($device) = @_;
    
    # Get default device if none given
    if (!defined $device) {
        $device = MusicBrainz::DiscID::discid_get_default_device();
    }
    
    # Bless the hash into an object
    my $self = { device => $device };
    bless $self, $class;
        
    # Create new DiscID instance
    $self->{discid} = MusicBrainz::DiscID::discid_new();
    if (!defined $self->{discid}) {
        carp("Error creating DiscId structure");
        undef $self;
    }

   	return $self;
}



sub DESTROY {
    my $self=shift;
    
    if (defined $self->{discid}) {
        MusicBrainz::DiscID::discid_free( $self->{discid} );
        undef $self->{discid};
    }
}


1;

__END__

=pod

=head1 NAME

MusicBrainz::DiscID - Perl interface for the MusicBrainz libdiscid library

=head1 SYNOPSIS

  use MusicBrainz::DiscID;

  my $discid = new MusicBrainz::DiscID();


=head1 SEE ALSO

L<http://musicbrainz.org/doc/libdiscid>

=head1 AUTHOR

Nicholas J. Humfrey <njh@aelius.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 Nicholas J. Humfrey

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

=cut
