# ~c / ~C character list
IO.inspect(~c/1 + 2 = #{1 + 2}/) # '1 + 2 = 3'
IO.inspect(~C/1 + 2 = #{1 + 2}/) # '1 + 2 = \#{1 + 2}'

# ~r / ~R regex
IO.inspect(~r/#{1+2}/) # ~r/3/
IO.inspect(~R/#{1+2}/) # ~r/\#{1+2}/
IO.inspect("isoppp" =~ ~r/Isoppp/) # false
IO.inspect("isoppp" =~ ~r/Isoppp/i) # true
IO.inspect(Regex.split(~r/p/, "isoppp")) # ["iso", "", "", ""]

# ~s / ~S string
IO.inspect(~s/Hi, 123 #{String.upcase("isoppp")}/) # "Hi, 123 ISOPPP"
IO.inspect(~S/Hi, 123 #{String.upcase("isoppp")}/) # "Hi, 123 \#{String.upcase(\"isoppp\")}"

# ~w / ~W word list
IO.inspect(~w/Hi, 123 #{String.upcase("isoppp")}/) # ["Hi,", "123", "ISOPPP"]
IO.inspect(~W/Hi, 123 #{String.upcase("isoppp")}/) # ["Hi,", "123", "\#{String.upcase(\"isoppp\")}"]

# ~N NativeDateTime
IO.inspect(NaiveDateTime.from_iso8601("2010-04-17 14:00:00")) # {:ok, ~N[2010-04-17 14:00:00]}
IO.inspect(~N[2010-04-17 14:00:00]) # ~N[2010-04-17 14:00:00]

# creating sigils

defmodule MySigils do
  def sigil_h(string, []), do: "Hi, #{string}" # accepts only 1 character.
end

defmodule Example do
  import MySigils

  def say_hi, do: IO.inspect(~h/isoppp/)
end

Example.say_hi # "Hi, isoppp"
