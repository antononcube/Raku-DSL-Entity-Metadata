
=begin pod

=head1 DSL::Entity::Metadata

C<DSL::Entity::Metadata> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify metadata.

=head1 Synopsis

    use DSL::Entity::Metadata;
    my $rcode = ToMetadataEntityCode('ScreeningEvent');

=end pod

unit module DSL::Entity::Metadata;

use DSL::Shared::Utilities::CommandProcessing;

use DSL::Entity::Metadata::Grammar;
use DSL::Entity::Metadata::ResourceAccess;

use DSL::Entity::Metadata::Actions::Raku::System;
use DSL::Entity::Metadata::Actions::WL::Entity;
use DSL::Entity::Metadata::Actions::WL::System;

use DSL::Entity::Metadata::Actions::Bulgarian::Standard;

#-----------------------------------------------------------
my %targetToAction =
        "Mathematica"      => DSL::Entity::Metadata::Actions::WL::System,
        "Raku"             => DSL::Entity::Metadata::Actions::Raku::System,
        "Raku-System"      => DSL::Entity::Metadata::Actions::Raku::System,
        "WL"               => DSL::Entity::Metadata::Actions::WL::System,
        "WL-System"        => DSL::Entity::Metadata::Actions::WL::System,
        "WL-Entity"        => DSL::Entity::Metadata::Actions::WL::Entity,
        "Bulgarian"        => DSL::Entity::Metadata::Actions::Bulgarian::Standard;

my %targetToAction2{Str} = %targetToAction.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::').Str => $_.value }).Hash;
%targetToAction = |%targetToAction , |%targetToAction2;

#| Target to separators rules
my Str %targetToSeparator{Str} = DSL::Shared::Utilities::CommandProcessing::target-separator-rules();

#-----------------------------------------------------------
my DSL::Entity::Metadata::ResourceAccess $resourceObj;

#| Get the resources access object.
our sub get-entity-resources-access-object() is export { return $resourceObj; }

#-----------------------------------------------------------
#| Named entity recognition for metadata. (proto)
proto ToMetadataEntityCode(Str $command, Str $target = 'WL-System', | ) is export {*}

#| Named entity recognition for metadata
multi ToMetadataEntityCode( Str $command, Str $target = 'WL-System', *%args ) {

    my $pCOMMAND = DSL::Entity::Metadata::Grammar;
    $pCOMMAND.set-resources(get-entity-resources-access-object());

    my $ACTOBJ = %targetToAction{$target}.new(resources => get-entity-resources-access-object());

    DSL::Shared::Utilities::CommandProcessing::ToWorkflowCode( $command,
                                                               grammar => $pCOMMAND,
                                                               actions => $ACTOBJ,
                                                               separator => %targetToSeparator{$target},
                                                               |%args )
}

#-----------------------------------------------------------
$resourceObj := BEGIN {
    my DSL::Entity::Metadata::ResourceAccess $obj .= new;
    $obj.ingest-resource-files();
    $obj
}