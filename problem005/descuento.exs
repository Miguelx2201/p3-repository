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

  defp calcular_precio(precio) do
    unless precio > 50000 do
      precio
    else unless precio > 100000 do
      precio*0.95
    else unless precio > 500000 do
      precio*0.9
    else
      precio*0.85
    end
    end
    end
  end

  defp generar_mensaje(precio) do
    "El precio final de la compra es de #{Util.formatter(precio)}"
  end
end

Descuento.main()
