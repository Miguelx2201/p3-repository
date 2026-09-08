Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Saludo do

  def main do
    "Ingrese el nombre del empleado: "
    |> Util.ingresar(:texto)
    |> generar_mensaje()
    |> Util.mostrar_mensaje_java()
  end

  defp generar_mensaje(nombre) do
    "Bienvenido, #{nombre} a la empresa Once Ltda"
  end

end

Saludo.main()
