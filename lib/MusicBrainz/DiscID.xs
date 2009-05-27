/*

	libdiscid perl bindings

	Copyright 2009 Nicholas J. Humfrey <njh@aelius.com>

*/

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <discid/discid.h>

MODULE = MusicBrainz::DiscID	PACKAGE = MusicBrainz::DiscID

##
## Return the name of the default disc drive for this operating system.
##
char*
discid_get_default_device()

##
## Return a handle for a new DiscId object.
##
DiscId*
discid_new()

##
## Release the memory allocated for the DiscId object.
##
void
discid_free( d )
	DiscId *d

##
## Read the disc in the given CD-ROM/DVD-ROM drive.
##
int
discid_read( d, device )
	DiscId *d
  char* device

##
## Return a human-readable error message.
##
char*
discid_get_error_msg( d )
	DiscId *d

##
## Return a MusicBrainz DiscID.
##
char*
discid_get_id( d )
	DiscId *d

##
## Return a FreeDB DiscID.
##
char*
discid_get_freedb_id( d )
	DiscId *d

##
## Return an URL for submitting the DiscID to MusicBrainz.
##
char*
discid_get_submission_url( d )
	DiscId *d

##
## Return an URL for retrieving CD information from MusicBrainz' web service.
##
char*
discid_get_webservice_url( d )
	DiscId *d

##
## Return the number of the first track on this disc.
##
int
discid_get_first_track_num( d )
	DiscId *d

##
## Return the number of the last track on this disc.
##
int
discid_get_last_track_num( d )
	DiscId *d

##
## Return the length of the disc in sectors.
##
int
discid_get_sectors( d )
	DiscId *d

##
## Return the sector offset of a track.
##
int
discid_get_track_offset( d, track_num )
	DiscId *d
	int track_num

##
## Return the length of a track in sectors.
##
int
discid_get_track_length( d, track_num )
	DiscId *d
	int track_num

