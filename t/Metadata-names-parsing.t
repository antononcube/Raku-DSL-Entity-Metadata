use lib './lib';
use lib '.';
use DSL::Entity::Metadata;
use Test;

##===========================================================
## Country names
##===========================================================

my $pCOMMAND = DSL::Entity::Metadata::Grammar;

my DSL::Entity::Metadata::ResourceAccess $resourceObj.instance;

plan 8;

## 1
ok $pCOMMAND.parse('u n human rights swedish', rule => 'dataset-entity-command'), 'u n human rights swedish';

## 2
ok $pCOMMAND.parse('UNHumanRightsSwedish', rule => 'dataset-entity-command'), 'UNHumanRightsSwedish';

## 3
ok $pCOMMAND.parse('mark twain authorship', rule => 'dataset-entity-command'), 'mark twain authorship';

## 4
ok $pCOMMAND.parse('MarkTwainAuthorship', rule => 'dataset-entity-command'), 'MarkTwainAuthorship';

## 5
ok $pCOMMAND.parse('date time', rule => 'metadata-entity-command'), 'date time';

## 6
ok $pCOMMAND.parse('DateTime', rule => 'metadata-entity-command'), 'DateTime';

## 7
ok $pCOMMAND.parse('accounting service', rule => 'metadata-entity-command'), 'accounting service';

## 8
ok $pCOMMAND.parse('AccountingService', rule => 'metadata-entity-command'), 'AccountingService';

done-testing;
