#======== if / unless

if 1 === 1 do
  IO.puts("foo") # foo
end

if 1 === 1 do
  IO.puts("foo")
else
  IO.puts("bar") # bar
end

if nil do
  IO.puts("nil?") # false
end

if 0 do
  IO.puts("0!") # true / 0!
end

if "" do
  IO.puts("empty?") # true / empty?
end

unless nil do
  IO.puts("foo") # foo
end


#======== case

case {:ok, "hi"} do
  {:ok, result} -> IO.puts(result)
  # "hi"
  {:error} -> IO.puts("error!")
  _ -> IO.puts("like default?")
end

case {:hi, "hi"} do
  {:ok, result} -> IO.puts(result)
  {:error} -> IO.puts("error!")
  _ -> IO.puts("like default?") # "like default?"
end

case {:error} do
  {:ok, result} -> IO.puts(result)
  {:error} -> IO.puts("error!")
  _ -> IO.puts("like default?") # "like default?"
end

foo = "bar"

case "bar" do
  ^foo -> IO.puts("foo!") # "foo!"
  foo -> IO.puts("not bar") # "not bar"
end

case "baz" do
  ^foo -> IO.puts("foo!")
  foo -> IO.puts("not bar") # "not bar"
end

case {"Hello", "World"} do
  {s1, _} when s1 === "Hello" ->
    IO.puts("Hello World!") # Hello World!
  _ ->
    IO.puts("Hi!")
end

case {"foo", "World"} do
  {s1, _} when s1 === "Hello" ->
    IO.puts("Hello World!")
  _ ->
    IO.puts("Hi!") # Hi!
end

#======== cond
cond do
  1 + 2 === 0 ->
    IO.puts("oops...")
  true ->
    IO.puts("default...?") # default...?
end

cond do
  1 + 2 === 0 ->
    IO.puts("oops...")
  1 + 3 === 4 ->
    IO.puts("match") # match
  true ->
    IO.puts("default...?")
end

#======== with TODO

fruits = %{orange: "orange", grape: "purple"}
with {:ok, first} <- Map.fetch(fruits, :orange),
    do: IO.puts(first) # orange

with {:ok, first} <- Map.fetch(fruits, :orange),
     {:ok, last} <- Map.fetch(fruits, :grape),
    do: IO.puts("#{first} and #{last}") # orange and purple

with {:ok, first} <- Map.fetch(fruits, :foo)
  do
    IO.puts(first)
  else
    _ -> IO.puts("_") # _
  end

with {:ok, first} <- Map.fetch(fruits, :foo)
  do
    IO.puts(first)
  else
    :error -> IO.puts("error") # error
    _ -> IO.puts("_")
  end








