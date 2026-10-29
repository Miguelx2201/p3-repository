Code.require_file("../utilities/util.ex", __DIR__)
alias Util
Code.require_file("../problem011/desarrollador.exs", __DIR__)
Code.require_file("../problem011/persistencia.exs", __DIR__)

defmodule GestionDesarrolladores do
  def main do
    "Ingrese los datos del desarrollador que desea ingresar."
    |> Desarrollador.ingresar_desarrollador()
    |> Desarrollador.to_string()
    |> Util.mostrar_mensaje()

  end

  def main1 do
    "Ingrese los datos de los desarrolladores que desea ingresar."
    |> Desarrollador.ingresar_desarrollador(:desarrolladores)
    |> Persistencia.guardar_desarrollador(:csv)


    "Desarrolladores guardados correctamente."
    |> Util.mostrar_mensaje()
  end

end
GestionDesarrolladores.main1()
