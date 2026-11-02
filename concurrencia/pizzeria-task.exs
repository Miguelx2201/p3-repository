defmodule PizzeriaTask do
  def horneado_sincrono({cliente, tiempo_ms}) do
    IO.puts("[Proceso #{inspect(self())}] Horneando pizza de #{cliente}...")
    Process.sleep(tiempo_ms)
    IO.puts("[Proceso #{inspect(self())}] Pizza de #{cliente} terminada.")
    "Pizza de #{cliente}"
  end

  def pedir_pizzas do
    pedidos = [
      {"Juan", 7000},
      {"Maria", 1000},
      {"Carlos", 4500}
    ]

    IO.puts("--- INICIANDO PEDIDOS CON TASK ASYNC/AWAIT ---")

    # 1. Lanza todos los procesos concurrentemente
    tareas = Enum.map(pedidos, fn pedido ->
      Task.async(fn -> horneado_sincrono(pedido) end)
    end)

    # 2. Espera a que todas las tareas completen su ejecución y recoge los resultados
    resultados = Enum.map(tareas, fn tarea -> Task.await(tarea, 10_000)end)

    IO.puts("Entregas completadas: #{inspect(resultados)}")
    IO.puts("¡Todas las tareas fueron sincronizadas!")
  end
end

PizzeriaTask.pedir_pizzas()
