defmodule Numero do
  def main do
    lista = [2, 4, 5, 2, 6, 7, 3, 10]
    mayor = obtener_mayor(lista)
    IO.puts(mayor)
  end

  def obtener_mayor([]) do
    {:error, "La lista esta vacía"}
  end

  def obtener_mayor([head | tail]) do
    obtener_mayor(tail, head)
  end

  defp obtener_mayor([], mayor) do
    mayor
  end

  defp obtener_mayor([head | tail], mayor) when head > mayor do
    obtener_mayor(tail, head)
  end
  defp obtener_mayor([head | tail], mayor) do
      obtener_mayor(tail, mayor)
  end
end

Numero.main()
