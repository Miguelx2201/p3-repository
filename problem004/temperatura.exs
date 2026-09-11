Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Temperatura do
  @moduledoc """
  Modulo que representa una app convertora de temperaturas de Celsius a Farenhait
  V1.0
  Autor: Juan Miguel Gutierrez Vargas
  10 de Septiembre del 2026
  """
  def main do
    "Ingrese la temperatura (C°) que desea convertir: "
    |> Util.ingresar(:entero)
    |> convertir_temperatura()
    |> generar_mensaje()
    |> Util.mostrar_mensaje_java()
  end

  defp convertir_temperatura(celsius) do
    celsius * 9 / 5 + 32
  end

  defp generar_mensaje(resultado) do
    "La temperatura en Fahrenheit (F°) es: #{resultado}"
  end

end
Temperatura.main()
