# integers
IO.puts(1 + 2) # 3
IO.puts(1 - 2) # -1
IO.puts(1 * 2) # 2
IO.puts(2 / 1) # 2.0
IO.puts(div(5,2)) # 3
IO.puts(rem(5,2)) # 0
IO.puts(0b0111) # 7
IO.puts(0x10) # 16

# floats
IO.puts(1.23) # 1.23
# IO.puts(.23) error
IO.puts(1.2e-34) # 1.2e-34 TODO search

# atoms
IO.puts(:foo) # foo
IO.puts(:bar) # bar
IO.puts(:foo === :bar) # false

# booleans

IO.puts(true)
IO.puts(false)
IO.puts(:true) # true
IO.puts(:false) # false
IO.puts(true === :true) # true
IO.puts(-1 || true) # -1
IO.puts(0 || true) # 0
IO.puts(1 || true) # 1
IO.puts(nil || true) # true
IO.puts('' || true) # ''
IO.puts(true && 12) # 12
IO.puts(true and 34) # 34
IO.puts(true or 56) # true
IO.puts(not false) # true
IO.puts(not false) # true
IO.puts(1 == '1') # false
IO.puts(1 != '1') # true
IO.puts(1 == 1.0) # true
IO.puts(1 > 1) # false
IO.puts(1 >= 1) # true

# number < atom < reference < function < port < pid < tuple < map < list < bitstring
IO.puts(0 < :atom) # true
IO.puts(:atom < {0}) # true

# strings
hello = "Hello"
word = "world"
IO.puts("Hello")
IO.puts(hello <> " " <> word <> "!") # Hello world!
IO.puts("Hello #{word}!") # Hello world!
IO.puts("Hello
#{word}") # Hello\nworld
IO.puts("Hello\nisoppp") # Hello\nisoppp
