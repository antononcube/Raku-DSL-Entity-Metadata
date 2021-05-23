#!/usr/bin/env perl6
use DSL::Entity::Metadata;

sub MAIN(Str $commands, Str $target = 'WL-System' ) {
    put ToMetadataEntityCode($commands, $target);
}