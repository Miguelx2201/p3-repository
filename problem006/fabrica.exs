Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Fabrica do
  @moduledoc """
  Modulo que determina si un cliente de la fabrica de Fernando puede recibir el descuento por su numero de cedula.
  V1.0
  Autor: Juan Miguel Gutierrez Vargas
  17 Septimebre 2026
  """
  def main() do
    mensaje =
    "Ingrese su numero de cedula: "
    |> Util.ingresar(:entero)
    |> recibe_descuento?()
    |> generar_mensaje()
    Util.mostrar_mensaje_java(mensaje)
  end

  defp recibe_descuento?(cedula) do
    if( rem(cedula, 1991) == 0) do
      true
    else
      false
    end
  end
  defp generar_mensaje(bool) do
    if( bool) do
      "Si puede acceder al descuento."
    else
      "No puede acceder al descuento"
    end
  end
end

Fabrica.main()
