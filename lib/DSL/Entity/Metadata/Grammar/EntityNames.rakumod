use v6;

use DSL::Entity::Metadata::ResourceAccess;
use DSL::Shared::Entity::Grammar::EntityNames;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

my DSL::Entity::Metadata::ResourceAccess $resources.instance;

role DSL::Entity::Metadata::Grammar::EntityNames
        does DSL::Shared::Entity::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {


    # It is assumed that metadata types have only alpha-numeric characters.
    regex entity-metadata-name {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ $resources.known-name('MetadataType', $0.Str.lc) }>
    }

    regex entity-data-format-name {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ $resources.known-name('DataFormat', $0.Str.lc) }>
    }

    regex entity-data-type-name {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ $resources.known-name('DataType', $0.Str.lc) }>
    }

    regex entity-dataset-name {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ $resources.known-name('Dataset', $0.Str.lc) }>
    }
}