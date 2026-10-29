defmodule Sensores do
  def main do
    IO.puts("Proceso principal: #{inspect(self())}")
    IO.puts("Iniciando programa de sensores...")

    #PID: identificador de proceso.
    #Spawn es un hilo "virtual" de elixir.
    #Tareas que se ejecutan en paralelo
    pid1 = spawn(fn -> leer_sensor("Humedad") end)
    pid2 = spawn(fn -> leer_sensor("Temperatura") end)

    IO.puts("Leyendo sensores...")
    IO.inspect(pid1)
    IO.inspect(pid2)
    Process.sleep(4000)
    IO.puts("Finalizando programa de sensores...")
  end

  def leer_sensor(nombre) do
    Process.sleep(1000)
    IO.puts("Leyendo sensor: #{nombre}")
  end
end

Sensores.main()
