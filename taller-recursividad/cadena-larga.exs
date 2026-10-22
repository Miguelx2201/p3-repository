Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule CadenaLarga do
  def main do
    lista = ["robinson", "arias", "profe", "calidad"]
    mas_larga = obtener_cadena_mas_larga(lista)
    Util.mostrar_mensaje(mas_larga)
  end

  def obtener_cadena_mas_larga([]) do
    {:error, "La lista esta vacía"}
  end

  def obtener_cadena_mas_larga([head]) do
    head
  end

  def obtener_cadena_mas_larga(lista) do
    longitud = length(lista)
    pivote = div(longitud, 2)
    {lista_izq, lista_der} = Enum.split(lista, pivote)

    mayor_izq = obtener_cadena_mas_larga(lista_izq)
    mayor_der = obtener_cadena_mas_larga(lista_der)

    if String.length(mayor_izq) > String.length(mayor_der), do: mayor_izq, else: mayor_der
  end
end
CadenaLarga.main()
