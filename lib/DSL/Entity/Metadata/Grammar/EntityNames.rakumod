use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Entity::Metadata::ResourceAccess;

my DSL::Entity::Metadata::ResourceAccess $resources.instance;

role DSL::Entity::Metadata::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    regex entity-metadata-name {
        ( <word-value>+ % \h+ ) <?{ $resources.known-name('Type', $0.Str.lc) }>
    }

    regex entity-dataset-name {
        ( <word-value>+ % \h+ ) <?{ $resources.known-name('Dataset', $0.Str.lc) }>
    }
}