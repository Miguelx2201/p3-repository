defmodule NumeroPerfecto do
  def main do
    numero = 28
    is_perfect = is_perfect?(numero)
    IO.puts(is_perfect)
  end

  def is_perfect?(0) do
    {:error, "El número debe ser mayor que 0"}
  end

  def is_perfect?(numero) do
    is_perfect?(numero, [], 1)
  end

  defp is_perfect?(numero, acumulador, divisor) when div(numero, 2)+1 > divisor do
    if(rem(numero, divisor) == 0) do
      is_perfect?(numero, [divisor | acumulador], divisor+1)
    else
      is_perfect?(numero, acumulador, divisor+1)
    end
  end

  defp is_perfect?(numero, acumulador, _divisor) do
    suma = acumulador |> Enum.sum()
    if suma == numero, do: true, else: false
  end
end

NumeroPerfecto.main()
