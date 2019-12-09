import Config

config :friends, Friends.Repo,
  database: "ecto",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5433"

config :friends, ecto_repos: [Friends.Repo]
