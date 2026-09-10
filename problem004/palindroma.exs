Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Palindroma do
  def main do
    palabra = "Ingrese una palabra: " |> Util.ingresar(:texto)

    es_palindroma = verificarPalindroma(palabra)
    generarMensaje(es_palindroma, palabra)
    |> Util.mostrar_mensaje_java()
  end

  defp verificarPalindroma(palabra) do
    # palabra = palabra |> String.trim() |> String.replace(" ", "") |> String.downcase()
    # inversa = palabra |> String.reverse()
    # palabra == inversa
    palabra
    |> String.downcase()
    |> String.replace(" ", "")
    |> then(fn cadena -> cadena == String.reverse() end)
  end

  defp generarMensaje(es_palindroma, palabra) do
    if(es_palindroma) do
      "La palabra #{palabra} SI es palindroma"
    else
      "La palabra #{palabra} NO es palindroma"
    end
  end
end

Palindroma.main()
