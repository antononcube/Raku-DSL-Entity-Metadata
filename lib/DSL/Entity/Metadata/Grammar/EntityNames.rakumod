use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Entity::Metadata::ResourceAccess;

my DSL::Entity::Metadata::ResourceAccess $resources.instance;

role DSL::Entity::Metadata::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    token name-punct-char { '-' | '.' | '+' | '#' }

    regex entity-name-part {
        [ <.alnum> | <.name-punct-char> ]+ | <.alnum>
    }

    regex wbpl { <!after [ <alnum> | <name-punct-char> ]> <?before [ <alnum> | <name-punct-char> ]> }

    regex wbpr { <?after [ <alnum> | <name-punct-char> ]> <!before [ <alnum> | <name-punct-char> ]> }

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