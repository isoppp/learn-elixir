# Friends

- `mix ecto.gen.migration MIGRATION_NAME`
- `mix ecto.migrate`

### one to many relationships

- add `:resouce_model_id, references(:resource)` to migration(many)
- add `has_many :resources Resouce.Module` to model(one)
- add `blongs_to :resource, Resource.Module` to model(many)

### one to one relationships

- add `:resource_id, references(:resource)` to migration
- add `create unique_index(:resouces, [:resource_id])`
- add `has_one :resouce Resouce.Module` to model
- add `belongs_to :resource, Resource.Module` to model

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `friends` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:friends, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/friends](https://hexdocs.pm/friends).

