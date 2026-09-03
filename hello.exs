IO.puts("Hello World")
IO.puts("Ahora con pipeline:")
"Hello World" |>IO.puts()

IO.puts(String.ends_with?(String.upcase("Hello World"), "ORLD"))

"Hello World"
|> String.upcase()
|> String.ends_with?("ORLD")
|> IO.puts()
