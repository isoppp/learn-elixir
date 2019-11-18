#======== Match Operator

x = 1 # 1
1 = x # 1
# 2 = x error

list = [1, 2, 3] # [1, 2, 3]
[1, 2, 3] = list # [1, 2, 3]
# [] = list error

[1 | tail] = list
IO.inspect(tail) # [2, 3]

[1 | _] = list
# [1 | unused_tail] = list # warning

{:ok, value} = {:ok, "Foo!"}
IO.inspect(value) # "Foo!"

# {:ok, value} = {:error} # error

#======== Pin Operator
pin = "foo"
^pin = "foo"
# ^pin = "bar" # error

key = "hello"
%{^key => _value} = %{"hello" => "world"}
# %{^key => value} = %{:hello => "world"} # error

default = 1

calc = fn
  (^default, times) -> default * times
  (default, times) -> default * times * -1
end

IO.inspect(calc.(1, 2))
IO.inspect(calc.(2, 2))
