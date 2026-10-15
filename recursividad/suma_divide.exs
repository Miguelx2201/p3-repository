defmodule SumaDivideVenceras do
  def main do
    IO.puts(suma(5))
  end
  #Metodo publico con el cual se llama a esa funcion recursiva.
  def suma(n) when n >= 0 do
    suma_rango(1, n)
  end

  #Validacion inicio mayor que fin, la suma seria 0
  defp suma_rango(inicio, fin) when inicio > fin, do: 0

  #Validacion si el inicio es igual al fin, la suma seria el numero en si mismo.
  defp suma_rango(inicio, fin) when inicio == fin, do: inicio

  #Funcion principal, halla la mitad y llama a la funcion recursiva de la mitad hacia abajo y luego de la mitad hacia arriba
  #posteriormente suma ambos resultados.
  defp suma_rango(inicio, fin) do
    medio = div(inicio + fin, 2)

    # Dividir: resolvemos la mitad izquierda y derecha independientemente
    suma_izquierda = suma_rango(inicio, medio)
    suma_derecha = suma_rango(medio + 1, fin)

    # Vencer: sumamos los dos resultados
    suma_izquierda + suma_derecha
  end
end
SumaDivideVenceras.main()
