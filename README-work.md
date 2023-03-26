# Raku DSL::Entity::Metadata

Raku grammar and role for metadata entities (types, names, or dataset names.)
Used in packages, like, 
["DSL::English::DataAcquisitionWorkflows"](https://github.com/antononcube/Raku-DSL-English-DataAcquisitionWorkflows), 
[AAr1].

------

## Installation

From Zef ecosystem:

```
zef install DSL::Entity::Metadata
```

From GitHub:

```
zef install https://github.com/antononcube/Raku-DSL-Entity-Metadata.git
```

------

## Examples

Here are examples of recognizing different types of data acquisition related specifications:

```perl6
use DSL::Entity::Metadata;
use DSL::Entity::Metadata::Grammar;
my $pCOMMAND = DSL::Entity::Metadata::Grammar;
$pCOMMAND.set-resources(DSL::Entity::Metadata::resource-access-object());

say $pCOMMAND.parse('DateTime');
```

```perl6
say $pCOMMAND.parse('time series');
```

```perl6
say $pCOMMAND.parse('Titanic');
```

------

## References

### Metadata

[SO1] https://www.schema.org.

### Datasets

[VAB1] Vincent Arel-Bundock,
[Rdatasets](https://github.com/vincentarelbundock/Rdatasets/),
(2020),
[GitHub/vincentarelbundock](https://github.com/vincentarelbundock/).

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

### Packages 

[AAp1] Anton Antonov,
[DSL::English::DataAcquisitionWorkflows Raku package](https://github.com/antononcube/Raku-DSL-English-DataAcquisitionWorkflows),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp2] Anton Antonov,
[DSL::Shared Raku package](https://github.com/antononcube/Raku-DSL-Shared),
(2020),
[GitHub/antononcube](https://github.com/antononcube).

[AAp3] Anton Antonov,
[DSL::Entity::Geographics Raku package](https://github.com/antononcube/Raku-DSL-Entity-Geographics),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp4] Anton Antonov,
[DSL::Entity::Jobs Raku package](https://github.com/antononcube/Raku-DSL-Entity-Jobs),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp5] Anton Antonov,
[DSL::Entity::Foods Raku package](https://github.com/antononcube/Raku-DSL-Entity-Foods),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp6] Anton Antonov,
[Data::ExampleDatasets Raku package](https://github.com/antononcube/Raku-Data-ExampleDatasets),
(2021),
[GitHub/antononcube](https://github.com/antononcube).


### Videos

[AAv1] Anton Antonov,
["FOSDEM2022 Multi language Data Wrangling and Acquisition Conversational Agents (in Raku)"](https://www.youtube.com/watch?v=3OUkSa-5vEk&t=2665s),
(2022),
[Anton Antonov's YouTube channel](https://www.youtube.com/@AAA4Predoction).   
([Dedicated FOSDEM 2022 page](https://archive.fosdem.org/2022/schedule/event/dataaquisition/).)

