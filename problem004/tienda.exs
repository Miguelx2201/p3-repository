Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Tienda do
  @moduledoc """
  Modulo que representa los descuentos que le hace una tienda a sus clientes.
  V1.0
  Autor: Juan Miguel Gutierrez Vargas
  10 de Septiembre de 2026
  """
  def main do
    descuento_estudiante = crear_descuento(20)
    descuento_empleado = crear_descuento(35)
    precio_estudiante = descuento_estudiante.(50000)
    precio_empleado = descuento_empleado.(50000)
    "Descuento estudiante: #{Util.formatter(precio_estudiante)}\nDescuento empleado: #{Util.formatter(precio_empleado)}"
    |> Util.mostrar_mensaje_java()
  end
  def crear_descuento(descuento) do
    fn precio -> precio - (precio*descuento/100) end
  end
end

Tienda.main()
