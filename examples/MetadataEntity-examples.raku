
use DSL::Entity::Metadata;
use DSL::Entity::Metadata::ResourceAccess;

use Pretty::Table;
use Data::Reshapers;

#
#my DSL::Entity::Metadata::ResourceAccess $resource2.instance;
#
#say 'Number of resource objects:', $resource.getNumberOfInstances();

my $pCOMMAND = DSL::Entity::Metadata::Grammar;

$pCOMMAND.set-resources(DSL::Entity::Metadata::resource-access-object());

#use Grammar::Tracer;

say $pCOMMAND.parse('datte time', rule => 'metadata-entity-command');

say $pCOMMAND.parse('date time',
        rule => 'metadata-entity-command',
        actions => DSL::Entity::Metadata::Actions::WL::System.new(resources=>DSL::Entity::Metadata::resource-access-object())
        ).made;
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


my @targets = ('WL-Entity', 'WL-System', 'Raku::System');

my @tbl =
        gather {
            for @testCommands -> $c {
                for @targets -> $t {
                    my $start = now;
                    my $res = ToMetadataEntityCode($c, $t);
                    my $timing = now - $start;
                    take %( command => $c, target => $t, :$timing, parsed => $res)
                }
            }
        };

say to-pretty-table(@tbl.sort({ -$_<timing> }));
