## Lists (Linked List)
# The head is the list’s first element, while the tail is a list containing the remaining elements.
## https://elixirschool.com/en/lessons/basics/collections/

IO.inspect([1.23, :atom, "ABC"]) # [1.23, :atom, "ABC"]
list = [1, 2, 3]
IO.inspect([0 | list]) # O(1) [0, 1, 2, 3]
IO.inspect(list ++ [4]) # O(n) [1, 2, 3, 4]

[head | tail] = list
IO.inspect(head) # 1 O(1)
IO.inspect(hd list) # 1 O(1)
IO.inspect(tail) # [2, 3] O(n)
IO.inspect(tl list) # [2, 3] O(n)

IO.inspect([3, 5, 2] -- [3, 2]) # [5]
IO.inspect([3, 5.0, 2] -- [3, 5, 2]) # [5.0]
IO.inspect([3, 5.0, 2] -- [3, 5.0, 2]) # []

## Tuples
## Tuples are similar to lists, but are stored contiguously in memory. This makes accessing their length fast but modification expensive; the new tuple must be copied entirely to memory.
## https://elixirschool.com/en/lessons/basics/collections/
IO.inspect({1.23, :atom, "ABC"}) # {1.23, :atom, "ABC"}

## Keyword Lists
## keyword lists are most commonly used to pass options to functions.
## https://elixirschool.com/en/lessons/basics/collections/

IO.inspect([foo: "bar", bar: "baz"]) # [foo: "bar", bar: "baz"]
IO.inspect([{:foo, "bar"}, {:bar, "baz"}]) # [foo: "bar", bar: "baz"]
kl1 = [foo: "bar", bar: "baz", foo: "baz", bar: "foo"]
IO.inspect(kl1) # [foo: "bar", bar: "baz", foo: "baz", bar: "foo"]
IO.inspect(kl1[:foo]) # "bar"
IO.inspect(kl1[:bar]) # "baz"

## Maps
IO.inspect(%{:foo => "bar", :bar => "baz"}) # %{bar: "baz", foo: "bar"}
IO.inspect(%{:foo => "bar", :bar => "baz", :foo => "baz", bar: "foo"}) # %{bar: "foo", foo: "baz"}
map = %{foo: "bar", bar: "baz"}
IO.inspect(%{map | bar: "bar"}) # %{bar: "bar", foo: "bar"}
IO.inspect(Map.put(map, :hello, "world")) # %{bar: "baz", foo: "bar", hello: "world"}

key = "foo"
IO.inspect(%{key => "bar"}) # %{"foo" => "bar"}
IO.inspect(%{key => "bar"}[key]) # "bar"
IO.inspect(%{key => "bar"}[:foo]) # nil
IO.inspect(%{key => "bar"}["foo"]) # "bar"

IO.inspect(%{key => "bar"} === %{:foo => "bar"}) # false
IO.inspect(%{foo: "bar"} === %{:foo => "bar"}) # true (only use atom as a key)

