use lib './lib';
use lib '.';
use DSL::Entity::Metadata;
use Test;

##===========================================================
## Data formats
##===========================================================

my $pCOMMAND = DSL::Entity::Metadata::Grammar;
$pCOMMAND.set-resources(DSL::Entity::Metadata::resource-access-object());

plan 8;

## 1
ok $pCOMMAND.parse('integer 16', rule => 'data-format-entity-command'), 'time series';

## 2
ok $pCOMMAND.parse('Integer16', rule => 'data-format-entity-command'), 'TimeSeries';

## 3
ok $pCOMMAND.parse('XML', rule => 'data-format-entity-command'), 'multi dimensional';

## 4
ok $pCOMMAND.parse('xml', rule => 'data-format-entity-command'), 'multidimensional';

## 5
ok $pCOMMAND.parse('raw json', rule => 'data-format-entity-command'), 'multi-dimensional';

## 5
ok $pCOMMAND.parse('RawJSON', rule => 'data-format-entity-command'), 'MultiDimensional';

## 7
ok $pCOMMAND.parse('bzip 2', rule => 'data-format-entity-command'), 'categorical';

## 8
ok $pCOMMAND.parse('BZIP2', rule => 'data-format-entity-command'), 'numerical';


done-testing;
