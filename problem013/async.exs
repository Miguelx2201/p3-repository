defmodule Async do
  def main do
    tarea1 = Task.async(fn -> sumar_numeros(1,10) end)
    tarea2 = Task.async(fn -> multiplicar_numeros(5,4) end)
    tarea3 = Task.async(fn -> verificar_palindroma("radar") end)

    # lista_tareas = [tarea1, tarea2, tarea3]

    # resultados = Enum.map(lista_tareas, fn tarea -> Task.await(tarea) end)
    # IO.inspect(resultados)
    result1 = Task.await(tarea1)
    result2 = Task.await(tarea2)
    result3 = Task.await(tarea3)

    IO.puts("Resultado suma: #{result1}")
    IO.puts("Resultado multiplicación: #{result2}")
    IO.puts("Resultado verificar palindroma: #{result3}")
  end

  def sumar_numeros(a, b) do
    a+b
  end

  def multiplicar_numeros(a, b) do
    a*b
  end

  def verificar_palindroma(cadena) do
    cadena == String.reverse(cadena)
  end
end
Async.main()
