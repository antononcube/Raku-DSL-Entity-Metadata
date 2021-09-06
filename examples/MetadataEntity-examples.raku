use lib './lib';
use lib '.';
use DSL::Entity::Metadata;
use DSL::Entity::Metadata::ResourceAccess;

#my DSL::Entity::Metadata::ResourceAccess $resource.instance;
#
#my DSL::Entity::Metadata::ResourceAccess $resource2.instance;
#
#say 'Number of resource objects:', $resource.getNumberOfInstances();

my $pCOMMAND = DSL::Entity::Metadata::Grammar;

#use Grammar::Tracer;

say $pCOMMAND.parse('datte time', rule => 'metadata-entity-command');

say $pCOMMAND.parse('date time', rule => 'metadata-entity-command', actions => DSL::Entity::Metadata::Actions::WL::System).made;
#
#say $pCOMMAND.parse('u n human rights swedish', rule => 'dataset-entity-command');
#
#say $pCOMMAND.parse('un human rights swedish', rule => 'dataset-entity-command');
#
#say $pCOMMAND.parse('united nations human rights swedish', rule => 'dataset-entity-command');
#
#say $pCOMMAND.parse('foster city', rule => 'dataset-entity-command');

#say $pCOMMAND.parse('bike store');
#
#say $pCOMMAND.parse('datasets');
#
#say $pCOMMAND.parse('XML');

#say "=" x 60;
#
#
my @testCommands = (
'Foster City',
'Titanic',
'time series',
'numerical',
'star schema',
'bike store'
);


my @targets = ('WL-Entity', 'WL-System');

for @testCommands -> $c {
    say "=" x 30;
    say $c;
    for @targets -> $t {
        say '-' x 30;
        say $t;
        say '-' x 30;
        my $start = now;
        my $res = ToMetadataEntityCode($c, $t);
        say "time:", now - $start;
        say $res;
    }
}
