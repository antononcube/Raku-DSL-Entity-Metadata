use v6;

use DSL::Entity::Metadata::Grammar;
use DSL::Entity::Metadata::ResourceAccess;
use DSL::Shared::Actions::English::Raku::PipelineCommand;
use DSL::Shared::Entity::Actions::Raku::System;

my DSL::Entity::Metadata::ResourceAccess $resources.instance;

class DSL::Entity::Metadata::Actions::Raku::System
        is DSL::Shared::Entity::Actions::Raku::System
        is DSL::Shared::Actions::English::Raku::PipelineCommand {

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
        my $nm = $resources.name-to-entity-id('DataFormat', $/.Str.lc, :!warn);
        make '\'' ~ $nm ~ '\'';
    }

    method data-type-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-data-type-name($/) {
        my $nm = $resources.name-to-entity-id('DataType', $/.Str.lc, :!warn);
        make '\'' ~ $nm ~ '\'';
    }

    method dataset-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-dataset-name($/) {
        my $nm = $resources.name-to-entity-id('Dataset', $/.Str.lc, :!warn);
        make '\'' ~ $nm ~ '\'';
    }

    method metadata-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-metadata-name($/) {
        my $nm = $resources.name-to-entity-id('MetadataType', $/.Str.lc, :!warn);
        with $nm { make '\'' ~ $nm ~ '\'' }
        else { make 'unknown-metadata-type' };
    }
}
