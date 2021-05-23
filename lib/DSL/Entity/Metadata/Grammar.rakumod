use v6;

use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;

use DSL::Entity::Metadata::Grammar::EntityNames;

grammar DSL::Entity::Metadata::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::Entity::Metadata::Grammar::EntityNames {
    # TOP
    rule TOP {
        <pipeline-command> |
        <metadata-entity-command> |
        <dataset-entity-command>
    }

    rule metadata-entity-command { <entity-metadata-name> }

    rule dataset-entity-command { <entity-dataset-name> }
}

