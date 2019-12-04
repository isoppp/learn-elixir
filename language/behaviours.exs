defmodule Behavior do
  defmodule Monster do
    @callback init(state :: term) :: {:ok, new_state ::term} | {:error, reason :: term}
    @callback attack(state :: term, args:: term) :: no_return()
  end

  defmodule Slime do
    @behaviour Monster

    def init(state) do
      {:ok, state}
    end

    def attack(state, args) do
      IO.inspect(state)
      IO.inspect(args)
    end
  end

  defmodule Dragon do
    @behaviour Monster
    """
    get following warnings:

    warning: function attack/2 required by behaviour Behavior.Monster is not implemented (in module Behavior.Dragon)
      behaviours.exs:20: Behavior.Dragon (module)

    warning: function init/1 required by behaviour Behavior.Monster is not implemented (in module Behavior.Dragon)
      behaviours.exs:20: Behavior.Dragon (module)
    """
  end
end

Behavior.Slime.init(%{name: "Slime"})
|> Behavior.Slime.attack("args")
