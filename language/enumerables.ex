# all?/2
IO.inspect(Enum.all?(["foo", "bar"], fn (s) -> String.length(s) === 3 end)) # true
IO.inspect(Enum.all?(["foo", "hello"], fn (s) -> String.length(s) === 3 end)) # false

# any?/2
IO.inspect(Enum.any?(["foo", "hello"], fn (s) -> String.length(s) === 3 end)) # true

# chunk_every/2
IO.inspect(Enum.chunk_every([1, 2, 3, 4, 5, 6], 2)) # [[1, 2], [3, 4], [5, 6]]
IO.inspect(Enum.chunk_every([1, 2, 3, 4, 5], 2)) # [[1, 2], [3, 4], [5]]

# chunk_by/2
IO.inspect(Enum.chunk_by(["foo", "bar", "baz"], fn (s) -> String.contains?(s, "b") end)) # [["foo"], ["bar", "baz"]]

# map_every/3
IO.inspect(Enum.map_every([1, 2, 3, 4, 5], 2, fn (x) -> x + 100 end)) # [101, 2, 103, 4, 105]

# each/2
Enum.each(["Hello", "World"], fn (s) -> IO.puts(s) end) # Hello / World

# map/2
IO.inspect(Enum.map([1, 2, 3], fn (x) -> x * 15 end)) # [15, 30, 45]

# min/1
IO.inspect(Enum.min([0, 1, 2])) # 0
IO.inspect(Enum.min([:atom, [0, 1, 2]])) # :atom
IO.inspect(Enum.min([], fn -> "Empty" end)) # "Empty" min/2

# max/1
IO.inspect(Enum.max([0, 1, 2])) # 2
IO.inspect(Enum.max([:atom, [0, 1, 2]])) # [0, 1, 2]
IO.inspect(Enum.max([], fn -> "Empty" end)) # "Empty" max/2

# filter/2
IO.inspect(Enum.filter([0, 1, 2, 3], fn (x) -> x > 2 end)) # [3]

# reduce/2 reduce/3
IO.inspect(Enum.reduce([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], fn (x, acc) -> x + acc end)) # 55
IO.inspect(Enum.reduce(["Hello", "World"], "!", fn (s, acc) -> acc <> s end)) # !HelloWorld
IO.inspect(Enum.reduce([10], 5, fn (x, acc) -> x + acc end)) # 15

# sort/1 sort/2
IO.inspect(Enum.sort([3, 1, -1])) # [-1, 1, 3]
IO.inspect(Enum.sort([[hoge: "fuga"], [0, 1, 2]])) # [[0, 1, 2], [hoge: "fuga"]]
IO.inspect(Enum.sort(["hello", "World"])) # ["World", "hello"]
IO.inspect(Enum.sort(["hello", "World"], fn(x,y)-> (x |> String.downcase |> String.to_charlist |> hd) < (y |> String.downcase |> String.to_charlist |> hd) end)) # ["hello", "World"]

# uniq/1
IO.inspect(Enum.uniq([1, 2, 3, 1, 3, 1, 3])) # [1, 2, 3]

# uniq_by/2
IO.inspect(Enum.uniq_by([%{a: "b", b: 111}, %{a: "c", b: 222}, %{a: "b", b: 333}], fn (map) -> map.a end)) # [%{a: "b", b: 111}, %{a: "c", b: 222}]

