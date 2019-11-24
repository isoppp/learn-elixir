# List
for x <- [1, 2, 3], do: IO.puts(x) #1 2 3

# Keyword list
for {k, v} <- [a: "b", c: "d"], do: IO.inspect([k, v]) # [:a, "b"] [:c, "d"]

# Map
for {k, v} <- %{a: "b", c: "d"}, do: IO.inspect([k, v]) # [:a, "b"] [:c, "d"]

# Binary
for <<c <- "hello">>, do: IO.inspect(<<c>>) # "h" "e" "l" "l" "o"

# multiple generator
for x <- [1, 2, 3], y <- [10, 20, 30] do
  IO.inspect(x + y) # 11 21 31 12 22 32 13 23 33
end

# Filter
import Integer
for x <- 1..10, is_even(x), rem(x, 3) == 0, do: IO.inspect(x) # 6

foo = for x <- [1, 2, 3], y <- [10, 20, 30], into: [], do: {x |> Integer.to_string |> String.to_atom, y}
IO.inspect(foo) # ["1": 10, "1": 20, "1": 30, "2": 10, "2": 20, "2": 30, "3": 10, "3": 20, "3": 30]
IO.inspect(foo[:"1"]) # 10

bar = for c <- [72, 101, 108, 108, 111], into: "", do: <<c>>
IO.inspect(bar) # Hello
