defmodule DocsandtestsTest do
  use ExUnit.Case
  doctest Docsandtests

  test "greets the world" do
    assert Docsandtests.hello() == :world
  end
end
