## Generating documents

- add 

```elixir
    [
        {:earmark, "~> 1.2", only: :dev},
        {:ex_doc, "~> 0.19", only: :dev}
    ]
```

- `mix deps.get`
- `mix docs`
