Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Correo do
  @moduledoc """
  Modulo que representa la necesidad de una universidad al crear correos para sus estudiantes.
  V1.0
  Autor: Juan Miguel Gutierrez Vargas
  Fecha: 10 Septiembre 2026
  """
  def main() do
      nombre = "Ingrese su nombre: "
      |> Util.ingresar(:texto)
      |> String.downcase()
      |> String.trim()
      apellido = "Ingrese su apellido: "
      |> Util.ingresar(:texto)
      |> String.downcase()
      |> String.trim()
      construir_correo(nombre, apellido)
      |> generar_mensaje()
      |> Util.mostrar_mensaje_java()
  end

  defp construir_correo(nombre, apellido) do
    "#{nombre}.#{apellido}@uniquindio.edu.co"
  end

  defp generar_mensaje(correo) do
    "Su correo es #{correo}."
  end
end

Correo.main()
