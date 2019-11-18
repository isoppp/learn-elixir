#======== Anonymous Functions
greet = fn(greeting, name) -> IO.inspect(greeting <> name) end
shorthand = &(IO.inspect(&1 <> &2))
greet.("Hello", "World") # HelloWorld
shorthand.("Hello", "World") # HelloWorld

#======== Pattern Matching

handle_result = fn
  {:ok, result} -> IO.puts(result)
  {:error} -> IO.puts("Error!")
end

handle_result.({:ok, "Great!"}) # Great!
handle_result.({:error}) # Error!
# handle_result.({:error, :ok}) error

#======== Named Functions (probably we need modules and functions at the same time. After that, we need to run above use cases)

defmodule Greeter do
  def greet(greeting, name) do
    IO.puts("#{greeting} #{name}!")
  end

  def say_hi(name), do: IO.puts("Hi, #{name}") # say_hi/1
#  def say_hi(%{name: local_name}), do: IO.puts("Hi, #{local_name}") error
  def say_hi(greeting, name), do: IO.puts("#{greeting}, #{name}") # say_hi/2 That's why we call this format

  def greet2(%{name: local_name} = arg) do # like %{name: local_name} = %{...}
    IO.puts("Hi, #{local_name}")
    IO.inspect(arg)
  end

  def test_private do
    private_fn
  end

  defp private_fn do # defp
    IO.puts("private_fn called!")
  end

  def guard(num) when is_integer(num) do
    IO.inspect(num)
  end

  def default_arg(num \\ 0) do
    IO.inspect(num)
  end

  def default_arg_split(num \\ 111)
  def default_arg_split(num) when is_integer(num) do
    IO.inspect(num)
  end
  #  def default_arg_split .... when ...
end

Greeter.greet("Hello", "World") # Hello World!
Greeter.say_hi("isoppp") # Hi, isoppp
Greeter.say_hi("Good morning", "isoppp") # Good morning, isoppp
Greeter.greet2(%{name: "isoppp"}) # Hi, isoppp %{name: "isoppp"}
Greeter.greet2(%{name: "isoppp", foo: "bar"}) # Hi, isoppp %{foo: "bar", name: "isoppp"}
#Greeter.greet2(%{name_error: "isoppp", foo: "bar"}) # error
#Greeter.private_fn error
Greeter.test_private # private_fn called!
Greeter.guard(1) # 1
#Greeter.guard("1") # error because of gurad (when is_ingeter(num))
Greeter.default_arg # 0 from default value
Greeter.default_arg(2) # 2
Greeter.default_arg_split # 111

