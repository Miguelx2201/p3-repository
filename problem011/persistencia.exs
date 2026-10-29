Code.require_file("desarrollador.exs")
Code.require_file("csv.exs")
defmodule Persistencia do

  @nombre_archivo "data.csv"
  @titulos "nombre, pais, rol, experiencia, salario, lider\n"

  def guardar_desarrollador(data, :csv) do
    CSV.escribir_csv(data, @nombre_archivo, @titulos, &Desarrollador.convertir_desarrollador_linea/1)
  end

  def cargar_desarrollador(:csv) do
    CSV.leer_csv(@nombre_archivo, &Desarrollador.convertir_linea_desarrollador/1)
  end

end
