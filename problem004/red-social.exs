Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule RedSocial do
  @moduledoc """
  Modulo que representa una red social que desea validar nombres de usuario
  V1.0
  Autor: Juan Miguel Gutierrez Vargas
  10 de Septiembre del 2026
  """
  def main do
    "Ingrese su nombre de usuario: "
    |> Util.ingresar(:texto)
    |> String.trim()
    |> String.length()
    |> es_valido?()
    |> generar_mensaje()
    |> Util.mostrar_mensaje_java()
  end
  defp es_valido?(longitud) do
    longitud >= 5
  end

  defp generar_mensaje(true) do
      "Nombre de usuario valido"
  end
  defp generar_mensaje(false) do
    "Nombre de usuario muy corto, debe tener al menos 5 caracteres."
  end
end

RedSocial.main()
