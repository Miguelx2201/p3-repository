Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Potencia do
  def main do
    n = 16
    b = 2
    is_power = is_power?(n, b)
    Util.mostrar_mensaje(is_power)
  end

  def is_power?(0, _b), do: false

  def is_power?(1, _b), do: true


  def is_power?(n, b) do
    if rem(n, b) == 0 do
      is_power?(div(n, b), b)
    else
      false
    end
  end

end
Potencia.main()
