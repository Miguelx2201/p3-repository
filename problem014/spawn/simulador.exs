Code.require_file("transportadora.exs", __DIR__)
Code.require_file("../../utilities/util.ex", __DIR__)


defmodule Simulador do
  def main do
    pid_main = self()
    pids = [pid_andina, pid_cafetera, pid_express] = inicializar_transportadoras()

    {nombre, peso_paq, distancia} = ingresar_datos_cliente()

    send(pid_andina, {:cotizar, nombre, peso_paq, distancia, pid_main})
    send(pid_cafetera, {:cotizar, nombre, peso_paq, distancia, pid_main})
    send(pid_express, {:cotizar, nombre, peso_paq, distancia, pid_main})

    # Guardamos las 3 respuestas secuencialmente 
    resultado =
      Enum.map(1..3, fn _ ->
        receive do
          {:cotizacion, nombre_transportadora, nombre_cliente, tarifa_total} ->
            {nombre_transportadora, nombre_cliente, tarifa_total}
        end
      end)

    # Enviamos la señal de cierre a los procesos receptores
    Enum.each(pids, fn pid -> send(pid, {:terminar}) end)

    generar_mensaje(resultado) |> IO.puts()
  end

  def inicializar_transportadoras do
    pid_andina = Transportadora.iniciar("Andina", 8000, 1200, 90, 3000)
    pid_cafetera = Transportadora.iniciar("Cafetera", 7000, 1000, 100, 1000)
    pid_express = Transportadora.iniciar("Express", 10000, 1500, 80, 2000)

    [pid_andina, pid_cafetera, pid_express]
  end

  def ingresar_datos_cliente do
    nombre = "Ingrese su nombre: " |> Util.ingresar(:texto)
    peso = "Ingrese el peso del paquete: " |> Util.ingresar(:entero)
    distancia = "Ingrese la distancia a la que va a enviar el paquete: " |> Util.ingresar(:entero)
    {nombre, peso, distancia}
  end

  def generar_mensaje(resultado) do
    resultado_ordenado = Enum.sort_by(resultado, fn {_nombre, _cliente, tarifa} -> tarifa end, :asc)

    {nombre_transportadora, nombre_cliente, tarifa_total} = List.first(resultado_ordenado)

    "¡Hola #{nombre_cliente}, se le recomienda utilizar la empresa #{nombre_transportadora}, con dicha empresa su envío resulta en #{tarifa_total}"
  end
end

Simulador.main()
