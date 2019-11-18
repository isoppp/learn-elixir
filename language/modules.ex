defmodule First do
#  @derive{Inspect, only: [:name, :mail]}
  @derive{Inspect, except: [:card_number]}
  defstruct name: "First", mail: "foo@bar.com", card_number: "12345678"
  @greeting "Hi"

  def say_hi do
    IO.puts("#{@greeting}, First")
  end
end

defmodule First.Second do
  def say_hi do
    IO.puts("Hi, First.Second")
  end

  def say_first_struct do
    first = %First{}
    IO.inspect first # #First<mail: "foo@bar.com", name: "First", ...>

    first = %First{name: "isoppp"}
    IO.inspect first # #First<mail: "foo@bar.com", name: "isoppp", ...>
  end
end

defmodule First.Third do
  import First.Second
#  import First.Second, only: [say_first_struct: 1]
#  import First.Second, except: [say_hi: 1]
#  import First.Second, only: :functions
#  import First.Second, only: :macros
#  require First.Second # only import macros from First.Second

  def say_hi do
    IO.puts("Hi, First.Third")
    IO.inspect(say_first_struct)
  end
end

defmodule Second.Second do
  def say_hi do
    IO.puts("Hi, Second.Second")
  end
end

defmodule Alias do
  alias Second.Second, as: Dummy
  alias First.Third
  alias First.{Second}

  def say_hi do
    Third.say_hi
    Dummy.say_hi
  end

  def say_first_struct do
    Second.say_first_struct
  end
end

First.say_hi
First.Second.say_hi
First.Second.say_first_struct

Alias.say_hi
Alias.say_first_struct
