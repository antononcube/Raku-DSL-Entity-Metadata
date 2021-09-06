use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Shared::Utilities::MetaSpecsProcessing;
use DSL::Shared::Entity::ResourceAccess;

class DSL::Entity::Metadata::ResourceAccess
        is DSL::Shared::Entity::ResourceAccess {
    #-----------------------------------------------------------
    # OVERRIDE-START
    #-----------------------------------------------------------

    ##========================================================
    ## Data
    ##========================================================
    my Hash %nameToEntityID{Str};
    my Hash %childIDToParentID{Str};
    my Set %knownNames{Str};
    my Set %knownNameWords{Str};

    ##========================================================
    ## BUILD
    ##========================================================
    # We create a lexical variable in the class block that holds our single instance.
    my DSL::Entity::Metadata::ResourceAccess $instance = Nil;

    my Int $numberOfInstances = 0;

    method getNumberOfInstances() { $numberOfInstances }

    my Int $numberOfMakeCalls = 0;

    method getNumberOfMakeCalls() { $numberOfMakeCalls }

    method new {!!!}

    submethod instance {

        $instance = DSL::Entity::Metadata::ResourceAccess.bless unless $instance;

        if $numberOfInstances == 0 {
            $instance.make()
        }

        $numberOfInstances += 1;

        $instance
    }

    #| Override the parent class function in order to call
    #| DSL::Shared::Entity::ResourceAccess.make()
    #| with the correct file names.
    method get-resource-files( --> Hash) {
        my @fileNames = <DataFormat Dataset DataType MetadataType>;
        my %resources = @fileNames Z=> @fileNames.map({ $_ ~  'NameToEntityID_EN.csv' });
        %resources = %resources.map({ $_.key => %?RESOURCES{$_.value} });
        return %resources;
    }

    #-----------------------------------------------------------
    # OVERRIDE-END
    #-----------------------------------------------------------


    ##========================================================
    ## Access
    ##========================================================

    #-----------------------------------------------------------
    method sub-type-to-type-id(Str:D $class, Str:D $phrase, Bool :$warn = False) {

    }

    #-----------------------------------------------------------
    method dataset-name-to-category-id(Str:D $class, Str:D $phrase, Bool :$warn = False) {

    }

}
