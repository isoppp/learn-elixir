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

  def use_png() do
    {:ok, file} = File.open("./example.png", [:write])
    png = :png.create(%{:size => {30, 30}, :mode => {:indexed, 8}, :file => file, :palette => {:rgb, 8, [{255, 123, 0}]}})
    :png.close(png)
    File.close(file)
  end
end
