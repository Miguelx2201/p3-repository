defmodule Listas do
  def main do
    lista1 = [1, 2, 3, 4, 5] #Head: 1 Tail:[2, 3, 4, 5]
    lista2 = [2, 3, 4, 5] #Head: 2 Tail:[3, 4, 5]
    lista3 = [3, 4, 5] #Head: 3 Tail:[4, 5]
    lista4 = [4, 5] #Head: 4 Tail:[5]
    lista5 = [5] #Head: 5 Tail:[]
    lista6 = [] #Head: nil Tail: nil

    sumar = sumar_lista(lista1)
    IO.puts(sumar)
  end

  #Caso base.
  def sumar_lista([]) do
    0
  end
  def sumar_lista([head | tail]) do
    head + sumar_lista(tail)
  end
end
Listas.main()
