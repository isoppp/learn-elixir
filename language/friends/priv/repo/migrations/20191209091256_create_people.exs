defmodule Friends.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:perople) do
      add :name, :string, null: false
      add :age, :integer, default: 0
    end
  end
end
