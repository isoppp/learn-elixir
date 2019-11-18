# Pipe Operator
IO.inspect(div(String.length(to_string(100)), 1)) # 3
IO.inspect(100 |> to_string |> String.length |> div(1)) # 3
