use v6;

use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;

use DSL::Entity::Metadata::Grammar::EntityNames;

grammar DSL::Entity::Metadata::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::Entity::Metadata::Grammar::EntityNames {
    # TOP
    regex TOP {
        <pipeline-command> |
        <metadata-entity-command> |
        <dataset-entity-command> |
        <data-type-entity-command> }

    regex metadata-entity-command { <entity-metadata-name> }

    regex data-type-entity-command { <entity-data-type-name> }

    regex dataset-entity-command { <entity-dataset-name> }
}

