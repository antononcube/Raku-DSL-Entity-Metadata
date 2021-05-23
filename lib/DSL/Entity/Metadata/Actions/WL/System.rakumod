use v6;

use DSL::Entity::Metadata::Grammar;
use DSL::Shared::Actions::English::WL::PipelineCommand;
use DSL::Entity::Metadata::ResourceAccess;

my DSL::Entity::Metadata::ResourceAccess $resources.instance;

class DSL::Entity::Metadata::Actions::WL::System
        is DSL::Shared::Actions::English::WL::PipelineCommand {

    ##========================================================
    ## Grammar methods
    ##========================================================

    method TOP($/) {
        make $/.values[0].made;
    }

    method metadata-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-metadata-name($/) {
        my $nm = $resources.known-name('Metadata', $/.Str.lc, :!bool, :!warn);
        make 'EntityClass["Metadata", "' ~ $nm.wordcase ~ '"]';
    }

    method dataset-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-dataset-name($/) {
        my $nm = $resources.known-name('Dataset', $/.Str.lc, :!bool, :!warn);
        make 'ExampleData[{"' ~ $nm.wordcase ~ '"}]';
    }

}
