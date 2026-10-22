Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule NumeroMayor do
  def main do
    lista = [2, 4, 6, 7, 10]
    mayor = obtener_numero_mayor_divide(lista)
    Util.mostrar_mensaje(mayor)
  end

  def obtener_numero_mayor_divide([]) do
    {:error, "La lista esta vacía"}
  end

  def obtener_numero_mayor_divide([head]) do
    head
  end

  def obtener_numero_mayor_divide(lista) do
    longitud = length(lista)
    pivote = div(longitud, 2)
    {lista_izq, lista_der} = Enum.split(lista, pivote)

    mayor_izq = obtener_numero_mayor_divide(lista_izq)
    mayor_der = obtener_numero_mayor_divide(lista_der)

    if mayor_izq > mayor_der, do: mayor_izq, else: mayor_der
  end
end
NumeroMayor.main()
