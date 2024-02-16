
role DSL::Entity::Metadata::Grammar::EntityNames {

    # It is assumed that metadata types have only alpha-numeric characters.
    regex entity-metadata-name {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ self.get-resources().known-name('MetadataType', $0.Str.lc) }>
    }

    regex entity-data-format-name {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ self.get-resources().known-name('DataFormat', $0.Str.lc) }>
    }

    regex entity-data-type-name {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ self.get-resources().known-name('DataType', $0.Str.lc) }>
    }

    regex entity-dataset-name {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ self.get-resources().known-name('Dataset', $0.Str.lc) }>
    }
}