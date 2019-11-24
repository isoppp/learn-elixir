string = <<105, 115, 111, 112, 112 ,112>>
IO.inspect(string) # isoppp
IO.inspect(string <> <<0>>) # <<105, 115, 111, 112, 112, 112, 0>>
IO.inspect("Café")
IO.inspect("Café" <> <<0>>) # <<67, 97, 102, 195, 169, 0>> 195 and 169 are UTF-8
IO.inspect('Café') # [67, 97, 102, 233] 233 is Unicode codepoint
IO.inspect(?é) # 233 (Unicode codepoint)

# String Functions

IO.inspect(String.length("isoppp")) # 6
IO.inspect(String.replace("isoppp", "p", "q")) # isoqqq
IO.inspect(String.duplicate("Oh! ", 3)) # Oh! Oh! Oh!
IO.inspect(String.split("I am isoppp", " ")) # ["I", "am", "isoppp"]

