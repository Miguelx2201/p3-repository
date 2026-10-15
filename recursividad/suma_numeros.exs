defmodule SumaNumeros do
  def main do
    IO.puts(suma_recursiva(5))
  end

  # Función pública que expone la interfaz original (aridad 1)
  def suma_recursiva(n) when n >= 0 do
    suma_cola(n, 0)
  end

  # Funciones privadas con el acumulador (aridad 2)
  # Caso base: cuando llegamos a 0, devolvemos el acumulador acumulado
  defp suma_cola(0, acc) do
    acc
  end

  # Caso recursivo: la llamada a suma_cola es lo ÚLTIMO que se ejecuta
  defp suma_cola(n, acc) when n > 0 do
    suma_cola(n - 1, acc + n)
  end

  # Tarea: Optimizar suma_recursiva usando recursividad de cola. Opcional: Estudiar divide y venceras.
end
SumaNumeros.main()
