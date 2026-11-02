defmodule PizzeriaSpawn do
  def preparar_pizza(cliente, tiempo_ms) do
    pid_cliente = self()

    # spawn crea un proceso hijo independiente
    spawn(fn ->
      IO.puts("[Proceso #{inspect(self())}] Iniciando pizza de #{cliente}...")
      Process.sleep(tiempo_ms) # Simula el tiempo en el horno
      IO.puts("[Proceso #{inspect(self())}] Pizza de #{cliente} lista!")

      # Enviamos la respuesta al proceso principal
      send(pid_cliente, {:pizza_lista, cliente})
    end)
  end

  def pedir_pizzas do
    pedidos = [
      {"Juan", 7000},
      {"Maria", 1000},
      {"Carlos", 4500}
    ]

    IO.puts("--- INICIANDO PEDIDOS CON SPAWN ---")

    # Lanza todos los procesos en paralelo/concurrencia
    Enum.each(pedidos, fn {cliente, tiempo} ->
      preparar_pizza(cliente, tiempo)
    end)

    # Recolectamos los mensajes devueltos por los procesos hijos
    recolectar_pizzas(length(pedidos))
  end

  defp recolectar_pizzas(0), do: IO.puts("¡Todos los pedidos entregados!")
  defp recolectar_pizzas(pendientes) do
    receive do
      {:pizza_lista, cliente} ->
        IO.puts("Entregando pizza a #{cliente}")
        recolectar_pizzas(pendientes - 1)
    end
  end
end

PizzeriaSpawn.pedir_pizzas()
