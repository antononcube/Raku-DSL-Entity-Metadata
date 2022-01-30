
=begin pod

=head1 DSL::Entity::Metadata

C<DSL::Entity::Metadata> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify metadata.

=head1 Synopsis

    use DSL::Entity::Metadata;
    my $rcode = ToMetadataEntityCode('ScreeningEvent');

=end pod

unit module DSL::Entity::Metadata;

use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Shared::Utilities::MetaSpecsProcessing;

use DSL::Entity::Metadata::Grammar;
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

my Str %targetToSeparator{Str} =
        "Julia"            => "\n",
        "Julia-DataFrames" => "\n",
        "R"                => " ;\n",
        "R-base"           => " ;\n",
        "Raku"             => " ;\n",
        "Raku-Ecosystem"   => " ;\n",
        "Mathematica"      => " \\[DoubleLongRightArrow]\n",
        "WL"               => " \\[DoubleLongRightArrow]\n",
        "WL-System"        => " \\[DoubleLongRightArrow]\n",
        "Bulgarian"        => "\n";

my Str %targetToSeparator2{Str} = %targetToSeparator.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::').Str => $_.value.Str }).Hash;
%targetToSeparator = |%targetToSeparator , |%targetToSeparator2;


#-----------------------------------------------------------
sub has-semicolon (Str $word) {
    return defined index $word, ';';
}

#-----------------------------------------------------------
proto ToMetadataEntityCode(Str $command, Str $target = 'tidyverse' ) is export {*}

multi ToMetadataEntityCode ( Str $command where not has-semicolon($command), Str $target = 'WL' ) {

    die 'Unknown target.' unless %targetToAction{$target}:exists;

    my $match = DSL::Entity::Metadata::Grammar.parse($command.trim, actions => %targetToAction{$target} );
    die 'Cannot parse the given command.' unless $match;
    return $match.made;
}

multi ToMetadataEntityCode ( Str $command where has-semicolon($command), Str $target = 'WL' ) {

    my $specTarget = get-dsl-spec( $command, 'target');

    $specTarget = $specTarget ?? $specTarget<DSLTARGET> !! $target;

    die 'Unknown target.' unless %targetToAction{$specTarget}:exists;

    my @commandLines = $command.trim.split(/ ';' \s* /);

    @commandLines = grep { $_.Str.chars > 0 }, @commandLines;

    my @cmdLines = map { ToMetadataEntityCode($_, $specTarget) }, @commandLines;

    @cmdLines = grep { $_.^name eq 'Str' }, @cmdLines;

    return @cmdLines.join( %targetToSeparator{$specTarget} ).trim;
}
