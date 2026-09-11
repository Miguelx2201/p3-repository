Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Envios do
  @moduledoc """
  Modulo que representa una empresa de envios
  V1.0
  Autor: Juan Miguel Gutierrez Vargas
  Fecha: 10 Septiembre 2026
  """
  def main do
    nombre_emisor = "Ingrese su nombre: " |> Util.ingresar(:texto)
    nombre_destinatario = "Ingrese el nombre del destinatario: " |> Util.ingresar(:texto)
    direccion_destinatario = "Ingrese la direccion del destinatario: " |> Util.ingresar(:texto)
    generar_mensaje(nombre_emisor, nombre_destinatario, direccion_destinatario)
    |> Util.mostrar_mensaje_java()
  end

  defp generar_mensaje(nombre_emisor, nombre_destinatario, direccion_destinatario) do
    "El paquete a nombre de #{nombre_emisor} quedo registrado para ser entregado a #{nombre_destinatario} en la direccion #{direccion_destinatario}"
  end
end

Envios.main()
