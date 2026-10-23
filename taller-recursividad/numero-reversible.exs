Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule NumeroReversible do
  def main do
    numero = 36
    es_reversible = es_reversible?(numero)
    Util.mostrar_mensaje(es_reversible)
  end

  def es_reversible?(numero) do
    if numero_valido?(numero) do
      es_reversible?(numero, numero, 0)
    else
      {:error, "El numero debe ser un entero positivo."}
    end
  end

  defp numero_valido?(numero) do
    if numero > 0 && numero |> is_integer(), do: true, else: false
  end

  defp es_reversible?(numero, aux, reverse) do
    if aux > 0 do
      new_reverse = (reverse*10) + rem(aux, 10)
      new_aux = aux |> div(10)
      es_reversible?(numero, new_aux, new_reverse)
    else
      numero + reverse
      |> solo_digitos_impares?()
    end
  end

  defp solo_digitos_impares?(numero) when numero > 0 do
    if rem(numero, 10) == 1 do
      solo_digitos_impares?(div(numero,10))
    else
      false
    end
  end

  defp solo_digitos_impares?(numero) when numero == 0 do
    true
  end
end
NumeroReversible.main()
