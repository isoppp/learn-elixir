defmodule Docsandtests do
  @moduledoc """
  This is document for a module
  """

  @doc """
  This is document for function.
  You can confirm using `h Docsandtests.greet`

  ## Parameters

    - name: String that represents the name of the person.

  ## Examples
  iex> Docsandtests.greet("isoppp")
  "Hi, isoppp"

  # iex> Docsandtests.greet("isoppp")
  # "This is failed in test!"
  """
  @spec greet(String.t()) :: String.t() # for statically analyze code
  def greet(name) do
    "Hi, " <> name
  end
end
