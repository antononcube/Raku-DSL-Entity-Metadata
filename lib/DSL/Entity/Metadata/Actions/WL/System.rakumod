use v6;

use DSL::Entity::Metadata::Grammar;
use DSL::Entity::Metadata::ResourceAccess;
use DSL::Shared::Actions::English::WL::PipelineCommand;
use DSL::Shared::Entity::Actions::WL::System;

class DSL::Entity::Metadata::Actions::WL::System
        is DSL::Shared::Entity::Actions::WL::System
        is DSL::Shared::Actions::English::WL::PipelineCommand {

    has DSL::Entity::Metadata::ResourceAccess $.resources;

    ##========================================================
    ## Grammar methods
    ##========================================================

    method TOP($/) {
        make $/.values[0].made;
    }

    method data-format-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-data-format-name($/) {
        my $nm = $!resources.name-to-entity-id('DataFormat', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }

    method data-type-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-data-type-name($/) {
        my $nm = $!resources.name-to-entity-id('DataType', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }

    method dataset-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-dataset-name($/) {
        my $nm = $!resources.name-to-entity-id('Dataset', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }

    method metadata-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-metadata-name($/) {
        my $nm = $!resources.name-to-entity-id('MetadataType', $/.Str.lc, :!warn);
        with $nm { make '"' ~ $nm ~ '"' }
        else { make 'MetadataType["Unknown"]' };
    }
}
