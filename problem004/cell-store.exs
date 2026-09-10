Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule CellStore do
  def main do
    valor_producto = "Ingrese el valor del producto: $"
    |> Util.ingresar(:real)

    porcentaje_descuento = "Ingrese el descuento del producto: %"
    |> Util.ingresar(:real)

    valor_descuento = calcularDescuento(valor_producto, porcentaje_descuento)

    valor_total = calcularTotal(valor_producto, valor_descuento)

    generarMensaje(valor_total, valor_descuento)
    |> Util.mostrar_mensaje_java()
  end

  defp calcularDescuento(valor_producto, porcentaje_descuento) do
    valor_producto * porcentaje_descuento
  end

  defp calcularTotal(valor_producto, valor_descuento) do
    valor_producto - valor_descuento
  end

  defp generarMensaje(valor_total, valor_descuento) do
    valor_total = valor_total |> Float.round(1) |> Util.formatter()
    valor_descuento = valor_descuento |> Float.round(1) |> Util.formatter()

    "El descuento aplicado es de $#{valor_descuento}\n
    Su total a pagar es de $#{valor_total}"
  end

end

CellStore.main()
