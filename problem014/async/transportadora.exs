defmodule Transportadora do
  defstruct nombre_transportadora: "", tarifa_base: 0, valor_kg: 0, valor_km: 0, tiempo_respuesta: 0

  def iniciar(nombre_transportadora, tarifa_base, valor_kg, valor_km, tiempo_respuesta) do
    IO.puts("Iniciando transportadora #{nombre_transportadora}...")
    %Transportadora{nombre_transportadora: nombre_transportadora, tarifa_base: tarifa_base, valor_kg: valor_kg, valor_km: valor_km, tiempo_respuesta: tiempo_respuesta}
  end

  def realizar_cotizacion(transportadora, nombre_cliente, peso_paq, distancia) do
    IO.puts("¡Se recibió una solicitud de cotización para #{nombre_cliente} en #{transportadora.nombre_transportadora}!")
    Process.sleep(transportadora.tiempo_respuesta)
    IO.puts("¡#{nombre_cliente} ya realizamos tu cotización desde #{transportadora.nombre_transportadora}!")
    tarifa_total = transportadora.tarifa_base + (peso_paq * transportadora.valor_kg) + (distancia * transportadora.valor_km)
    {transportadora.nombre_transportadora, nombre_cliente, tarifa_total}
  end
end
