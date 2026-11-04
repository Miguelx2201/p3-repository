defmodule Transportadora do
  def iniciar(nombre_transportadora, tarifa_base, valor_kg, valor_km, tiempo_respuesta) do
    IO.puts("Iniciando transportadora #{nombre_transportadora}...")

    # Capturamos el PID retornado por spawn
    pid = spawn(fn -> esperar_cotizacion(nombre_transportadora, tarifa_base, valor_kg, valor_km, tiempo_respuesta) end)

    pid
  end

  defp esperar_cotizacion(nombre_transportadora, tarifa_base, valor_kg, valor_km, tiempo_respuesta) do
    receive do
      {:cotizar, nombre_cliente, peso_paq, distancia, pid_main} ->
        IO.puts("¡Se recibió una solicitud de cotización para #{nombre_cliente} en #{nombre_transportadora}!")
        tarifa_total = tarifa_base + (peso_paq * valor_kg) + (distancia * valor_km)
        IO.puts("¡La transportadora #{nombre_transportadora} está trabajando para tener su cotización lo más pronto posible!")

        Process.sleep(tiempo_respuesta) # Corregido Process
        send(pid_main, {:cotizacion, nombre_transportadora, nombre_cliente, tarifa_total})
        IO.puts("¡#{nombre_cliente} ya realizamos tu cotización desde #{nombre_transportadora}!")

        esperar_cotizacion(nombre_transportadora, tarifa_base, valor_kg, valor_km, tiempo_respuesta)

      {:terminar} ->
        IO.puts("¡Proceso de cotización de la empresa #{nombre_transportadora} ha finalizado!")
    end
  end
end
