Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Vocales do
  def main do
    cadena = "Hola Mundo"
    n_vocales = contar_vocales(cadena)
    n_vocales1 = contar_vocales1(cadena)
    Util.mostrar_mensaje("#{n_vocales} \n#{n_vocales1}")
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

  def contar_vocales1(cadena) do
    cadena |> String.downcase() |> contar_vocales1(0)
  end

  defp contar_vocales1("", count) do
    count
  end

  defp contar_vocales1(cadena, count) do
    vocales = ["a", "e", "i", "o", "u"]

    head = cadena |> String.first()
    tail = cadena |> String.slice(1..-1//1)
    if head in vocales do
      contar_vocales1(tail, count + 1)
    else
      contar_vocales1(tail, count)
    end
  end
end
Vocales.main()
