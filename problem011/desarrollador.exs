Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Desarrollador do
  defstruct nombre: "", pais: "", rol: "", experiencia: 0, salario: 0, lider: false

  def crear_desarrollador(nombre, pais, rol, experiencia, salario, lider) do
    %Desarrollador{nombre: nombre, pais: pais, rol: rol, experiencia: experiencia, salario: salario, lider: lider}
  end

  def ingresar_desarrollador(mensaje) do
    mensaje
    |> Util.mostrar_mensaje()

    nombre = "Ingrese el nombre del desarrollador: " |> Util.ingresar(:texto)
    pais = "Ingrese el pais del desarrollador: " |> Util.ingresar(:texto)
    rol = "Ingrese el rol del desarrollador: " |> Util.ingresar(:texto)
    experiencia = "Ingrese los años de experiencia del desarrollador: " |> Util.ingresar(:entero)
    salario = "Ingrese el salario del desarrollador: " |> Util.ingresar(:real)
    lider = "Este desarrollador es lider de algun equipo? (SI O NO): " |> Util.ingresar(:boolean)

    crear_desarrollador(nombre, pais, rol, experiencia, salario, lider)
  end

  def ingresar_desarrollador(mensaje, :desarrolladores) do
    mensaje
    |> ingresar_desarrollador([], :desarrolladores)
  end

  defp ingresar_desarrollador(mensaje, desarrolladores, :desarrolladores) do
    ruta = ingresar_desarrollador(mensaje)
    new_desarrolladores = [ruta | desarrolladores]

    continuar = "¿Desea ingresar otro desarrollador? (SI O NO): "
    |> Util.ingresar(:boolean)

    if continuar, do: ingresar_desarrollador(mensaje, new_desarrolladores, :desarrolladores), else: new_desarrolladores
  end

  def to_string(desarrollador) do
    """
    Desarrollador #{desarrollador.nombre}.
    Pais: #{desarrollador.pais}.
    Rol: #{desarrollador.rol}
    Experiencia: #{desarrollador.experiencia} años.
    Salario: #{Util.formatter(desarrollador.salario)}
    Lider: #{Util.formatter_booleano(desarrollador.lider)}.
    """
  end

  def to_string(desarrolladores, :desarrolladores) do
    Enum.map(desarrolladores, fn desarrollador -> Desarrollador.to_string(desarrollador) end)
    |> Enum.join("\n")
  end

  def convertir_desarrollador_linea(desarrollador) do
    "#{desarrollador.nombre},#{desarrollador.pais},#{desarrollador.rol},#{desarrollador.experiencia},#{desarrollador.salario},#{desarrollador.lider}"
  end

  def convertir_linea_desarrollador(linea) do
    [nombre, pais, rol, experiencia, salario, lider] = String.split(linea, ",")
    crear_desarrollador(nombre, pais, rol, String.to_integer(experiencia), String.to_float(salario), lider)
  end
end
