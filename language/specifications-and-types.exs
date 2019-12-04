defmodule Greet do
  defstruct greet: nil, name: nil
  # @typep ... private
  # @opaque ... ??? type is public but structure is private

  @typedoc """
    The type represents Greet struct with :greet as String.t() and :name as String.t().
  """
  @type t :: %Greet{greet: String.t(), name: String.t()}
end

defmodule SpecAndType do
  @spec say_hi(String.t()) :: :ok
  def say_hi(name) do
    text = "Hi, #{name}"
    IO.puts(text)
  end

  @spec say_hi(Greet.t(), integer) :: :ok
  def say_hi(%Greet{greet: greet, name: name}, age) do
    text = "#{greet}, #{name}: #{age}"
    IO.puts(text)
  end

  def check do
    say_hi(%Greet{greet: "Good morning", name: "isoppp"}, 100)
  end
end

SpecAndType.say_hi("isoppp")
IO.inspect(SpecAndType.say_hi(1)) # this line doesn't cause error
IO.inspect(SpecAndType.check)
