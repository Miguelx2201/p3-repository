Code.require_file("../../utilities/util.ex", __DIR__)
alias Util

defmodule Cookie do
  @longitud_llave 128
  def main() do
    :crypto.strong_rand_bytes(@longitud_llave)
    |> Base.encode64()
    |> Util.mostrar_mensaje()
  end
end

Cookie.main()
