defmodule DocsandtestsTest do
  use ExUnit.Case
  doctest Docsandtests

  setup_all do
    {:ok, %{name: "isoppp"}}
  end

  test "greets to isoppp", state do
    """
    state is like...
    ..%{
      async: false,
      case: DocsandtestsTest,
      describe: nil,
      describe_line: nil,
      file: "PATH",
      line: 9,
      module: DocsandtestsTest,
      name: "isoppp",
      registered: %{},
      test: :"test greets to isoppp",
      test_type: :test
    }

    """
    assert Docsandtests.greet("isoppp") === "Hi, isoppp"
    refute Docsandtests.greet("isoppp") === ""
    assert Docsandtests.greet(state[:name]) === "Hi, #{state[:name]}"
  end

  import ExUnit.CaptureIO
  test "outputs Hello World" do
    assert capture_io(fn -> IO.puts("Hello World") end) == "Hello World\n"
  end
end
