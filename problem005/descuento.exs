Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Descuento do
  def main do
    "Ingrese el monto de la compra: $"
    |> Util.ingresar(:real)
    |> calcular_precio()
    |> generar_mensaje()
    |> Util.mostrar_mensaje_java()
  end
  #Metodo usando cond -> 1 clausula
  # defp calcular_precio(precio) do
  #   cond do
  #     precio < 50000 -> precio
  #     precio < 100000 -> precio*0.95
  #     precio < 500000 -> precio*0.9
  #     precio > 500000 -> precio*0.85
  #   end
  # end
  #Metodo usando guardas (when) -> 4 clausulas
  defp calcular_precio(precio) when precio < 50000, do: precio*1
  defp calcular_precio(precio) when precio < 100000, do: precio*0.95
  defp calcular_precio(precio) when precio < 500000, do: precio*0.9
  defp calcular_precio(precio) when precio >= 500000, do: precio*0.85

  defp generar_mensaje(precio) do
    "El precio final de la compra es de #{Util.formatter(precio)}"
  end
end

Descuento.main()
