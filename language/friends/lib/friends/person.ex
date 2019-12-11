defmodule Friends.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :name, :string
    field :age, :integer, default: 0
  end

  @fictional_names ["Black Panther", "Wonder Woman", "Spiderman"]
  def validate_fictional_name(changeset) do
    name = get_field(changeset, :name)

    if name in @fictional_names do
      changeset
    else
      add_error(changeset, :name, "is not a superhero")
    end
  end

  def set_name_if_anonymous(changeset) do
    name = get_field(changeset, :name)

    if is_nil(name) do
      put_change(changeset, :name, "Anonymous")
    else
      changeset
    end
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 2)
    |> validate_fictional_name()
  end

  def registration_changeset(struct, params) do
    struct
    |> cast(params, [:name, :age])
    |> set_name_if_anonymous()
  end
end

# Changeset cast/4 change/2

# iex> Ecto.Changeset.cast(%Friends.Person{name: "Bob"}, %{"name" => "Jack"}, [:name, :age])
# %Ecto.Changeset<
#   action: nil,
#   changes: %{name: "Jack"},
#   errors: [],
#   data: %Friends.Person<>,
#   valid?: true
# >
#
# iex> Ecto.Changeset.cast(%Friends.Person{name: "Bob"}, %{"name" => "Jack"}, [])
# %Ecto.Changeset<action: nil, changes: %{}, errors: [], data: %Friends.Person<>, valid?: true>
#
# iex> Ecto.Changeset.change(%Friends.Person{name: "Bob"}, %{"name" => ""})
# %Ecto.Changeset<
#   action: nil,
#   changes: %{name: nil},
#   errors: [],
#   data: %Friends.Person<>,
#   valid?: true
# >

# another validators

# validate_acceptance/3
# validate_change/3 & /4
# validate_confirmation/3
# validate_exclusion/4 & validate_inclusion/4
# validate_format/4
# validate_number/3
# validate_subset/4

# changeset example

# iex> Friends.Person.changeset(%Friends.Person{}, %{"name" => ""})
# %Ecto.Changeset<
#  action: nil,
#  changes: %{},
#         errors: [name: {"can't be blank", [validation: :required]}],
#                                                         data: %Friends.Person<>,
# valid?: false
# >

# registration example

# iex(5)> Friends.Person.registration_changeset(%Friends.Person{}, %{})
# #Ecto.Changeset<
#   action: nil,
#   changes: %{name: "Anonymous"},
#   errors: [],
#   data: #Friends.Person<>,
#   valid?: true
# >
