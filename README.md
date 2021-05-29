# Raku DSL::Entity::Metadata

Raku grammar classes for metadata entities (names.)

------

## Installation

```shell
zef install https://github.com/antononcube/Raku-DSL-Shared.git
zef install https://github.com/antononcube/Raku-DSL-Entity-Metadata.git
```

------

## Examples

```perl6
use DSL::Entity::Metadata::Grammar;
my $pCOMMAND = DSL::Entity::Metadata::Grammar;
say $pCOMMAND.parse('DateTime', rule => 'metadata-entity-command');
say $pCOMMAND.parse('covid testing facility', rule => 'metadata-entity-command');
say $pCOMMAND.parse('Place/Residence/ApartmentComplex', rule => 'metadata-entity-command');
```

------

## References

### Metadata

[SO1] https://www.schema.org.

### Datasets

[WRI1]
Wolfram Research (2007), 
[ExampleData](https://reference.wolfram.com/language/ref/ExampleData.html),
(introduced 2007), (updated 2016),
Wolfram Language function.

[WRI2] Wolfram Research, Inc.,
[ExampleData Source Information](https://reference.wolfram.com/language/note/ExampleDataSourceInformation.html).

### Repositories

[SOr1]
Schema.org,
[Schema.org project repository](https://github.com/schemaorg/schemaorg),
(2105-2021),
[GitHub/schemaorg](https://github.com/schemaorg).

[AAr1] Anton Antonov,
[DSL::English::DataAcquisitionWorkflows Raku package](https://github.com/antononcube/Raku-DSL-English-DataAcquisitionWorkflows),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAr2] Anton Antonov,
[DSL::Shared Raku package](https://github.com/antononcube/Raku-DSL-Shared),
(2020),
[GitHub/antononcube](https://github.com/antononcube).

[AAr3] Anton Antonov,
[DSL::Entity::Geographics Raku package](https://github.com/antononcube/Raku-DSL-Entity-Geographics),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAr4] Anton Antonov,
[DSL::Entity::Jobs Raku package](https://github.com/antononcube/Raku-DSL-Entity-Jobs),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAr5] Anton Antonov,
[DSL::Entity::Foods Raku package](https://github.com/antononcube/Raku-DSL-Entity-Foods),
(2021),
[GitHub/antononcube](https://github.com/antononcube).
