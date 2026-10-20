defmodule ListaMayores do
 def main do
  lista = [1, 8, 3, 4, 5]
  lista_filtrada = filtrar_lista(lista, 3)
  IO.inspect(lista_filtrada)
 end

 def filtrar_lista([], _pivote) do
  []
 end

 def filtrar_lista(lista, pivote) do
   filtrar_lista(lista, pivote, [])
 end

 defp filtrar_lista([], _pivote, lista_acc) do
   lista_acc |> Enum.reverse()
 end

 defp filtrar_lista([head | tail], pivote, lista_acc) when head > pivote do
   filtrar_lista(tail, pivote, [head | lista_acc])
 end

 defp filtrar_lista([_head | tail], pivote, lista_acc) do
   filtrar_lista(tail, pivote, lista_acc)
 end
end

ListaMayores.main()
