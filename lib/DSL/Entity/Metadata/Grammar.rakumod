use DSL::Entity::Metadata::Grammar::EntityNames;
use DSL::Entity::Metadata::ResourceAccess;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Roles::ErrorHandling;
use DSL::Entity::Metadata::ResourceAccess;
use DSL::Shared::Entity::Grammar::EntityNames;

grammar DSL::Entity::Metadata::Grammar
        does DSL::Entity::Metadata::Grammar::EntityNames
        does DSL::Shared::Entity::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand
        does DSL::Shared::Roles::ErrorHandling {

    my DSL::Entity::Metadata::ResourceAccess $resources;

    method get-resources(--> DSL::Entity::Metadata::ResourceAccess) { return $resources; }
    method set-resources(DSL::Entity::Metadata::ResourceAccess $obj) { $resources = $obj; }

    # TOP
    regex TOP {
        <pipeline-command> |
        <metadata-entity-command> |
        <dataset-entity-command> |
        <data-type-entity-command> |
        <data-format-entity-command> }

    regex data-format-entity-command { <entity-data-format-name> }

    regex data-type-entity-command { <entity-data-type-name> }

    regex dataset-entity-command { <entity-dataset-name> }

    regex metadata-entity-command { <entity-metadata-name> }
}

