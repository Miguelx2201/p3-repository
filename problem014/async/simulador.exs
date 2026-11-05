Code.require_file("transportadora.exs", __DIR__)
Code.require_file("../../utilities/util.ex", __DIR__)

defmodule Simulador do
  def main do
    transportadoras =  inicializar_transportadoras()

    {nombre, peso_paq, distancia} = ingresar_datos_cliente()

    tareas = Enum.map(transportadoras, fn transportadora ->
      Task.async(fn -> Transportadora.realizar_cotizacion(transportadora, nombre, peso_paq, distancia) end)
    end)

    resultados = Enum.map(tareas, fn tarea ->
      Task.await(tarea)
    end)

    generar_mensaje(resultados) |> IO.puts()
  end

  def ingresar_datos_cliente do
    nombre = "Ingrese su nombre: " |> Util.ingresar(:texto)
    peso = "Ingrese el peso del paquete: " |> Util.ingresar(:entero)
    distancia = "Ingrese la distancia a la que va a enviar el paquete: " |> Util.ingresar(:entero)
    {nombre, peso, distancia}
  end

  def generar_mensaje(resultado) do
    resultado_ordenado = Enum.sort_by(resultado, fn {_transportadora, _cliente, tarifa} -> tarifa end, :asc)

    {transportadora, cliente, tarifa_total} = List.first(resultado_ordenado)

    "¡Hola #{cliente}, se le recomienda utilizar la empresa #{transportadora}, con dicha empresa su envío resulta en #{tarifa_total}"
  end

  def inicializar_transportadoras do
    transportadora_andina = Transportadora.iniciar("Andina", 8000, 1200, 90, 3000)
    transportadora_cafetera = Transportadora.iniciar("Cafetera", 7000, 1000, 100, 1000)
    transportadora_express = Transportadora.iniciar("Express", 10000, 1500, 80, 2000)
    [transportadora_andina, transportadora_cafetera, transportadora_express]
  end
end
Simulador.main()
