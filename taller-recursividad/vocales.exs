defmodule Vocales do
  def main do
    cadena = "Hola Mundo"
    n_vocales = contar_vocales(cadena)
    IO.puts(n_vocales)
  end

  def contar_vocales(cadena) do
    cadena |> String.downcase() |> String.graphemes()  |> contar_vocales(0)
  end

  defp contar_vocales([], count) do
    count
  end

  defp contar_vocales([head | tail], count) do
    vocales = ["a", "e", "i", "o", "u"]
    if head in vocales do
      contar_vocales(tail, count + 1)
    else
      contar_vocales(tail, count)
    end
  end

end
Vocales.main()
