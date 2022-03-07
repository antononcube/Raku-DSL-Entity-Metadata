use lib './lib';
use lib '.';
use DSL::Entity::Metadata;
use Test;

##===========================================================
## Data types
##===========================================================

my $pCOMMAND = DSL::Entity::Metadata::Grammar;
$pCOMMAND.set-resources(DSL::Entity::Metadata::resource-access-object());

plan 8;

## 1
ok $pCOMMAND.parse('time series', rule => 'data-type-entity-command'), 'time series';

## 2
ok $pCOMMAND.parse('TimeSeries', rule => 'data-type-entity-command'), 'TimeSeries';

## 3
ok $pCOMMAND.parse('multi dimensional', rule => 'data-type-entity-command'), 'multi dimensional';

## 4
ok $pCOMMAND.parse('multidimensional', rule => 'data-type-entity-command'), 'multidimensional';

## 5
ok $pCOMMAND.parse('multi-dimensional', rule => 'data-type-entity-command'), 'multi-dimensional';

## 5
ok $pCOMMAND.parse('MultiDimensional', rule => 'data-type-entity-command'), 'MultiDimensional';

## 7
ok $pCOMMAND.parse('categorical', rule => 'data-type-entity-command'), 'categorical';

## 8
ok $pCOMMAND.parse('numerical', rule => 'data-type-entity-command'), 'numerical';


done-testing;
