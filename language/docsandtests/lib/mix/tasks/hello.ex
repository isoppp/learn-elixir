defmodule Mix.Tasks.Hello do
  use Mix.Task

  @shortdoc "When help command is running, this doc is going to show"
  #  like this
  #  mix hello                 # When help command is running, this doc is going to show
  def run (_) do
    IO.puts("Hello")
  end
end
