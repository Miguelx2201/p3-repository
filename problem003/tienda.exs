Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Tienda do
  @moduledoc """
  Modulo que representa una tienda y un programa para calcular la devuelta de un pedido conociendo su valor total y el dinero entregado por el cliente
  V1.0
  Autor: Juan Miguel Gutierrez Vargas
  Fecha: 8 Septiembre 2026
  """

  @doc """
  Metodo principal para iniciar la aplicación
  """
  def main do
    valor_total = "Ingrese el total a pagar: " |> Util.ingresar(:entero)
    valor_entegado = "Ingrese el dinero entregado por el cliente: " |> Util.ingresar(:entero)
    calcular_devuelta(valor_total, valor_entegado)
    |> generar_mensaje()
    |> Util.mostrar_mensaje_java()

  end

  @doc """
  Metodo para calcular la devuelta.
  """
  defp calcular_devuelta(valor_total, valor_entregado) do
    valor_entregado - valor_total
  end

  @doc """
  Metodo para generar el mensaje
  """
  defp generar_mensaje(devuelta) do
    "Tiene que devolver: $ #{devuelta}"
  end

end

Tienda.main()
