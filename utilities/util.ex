# utilities/util.ex

defmodule Util do
  @base Path.expand(__DIR__)  # ruta absoluta a la carpeta "utilities/"

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def mostrar_mensaje_python(mensaje) do
    System.cmd("python3", [Path.join(@base, "mostrar_dialogo.py"), mensaje])
  end

  def mostrar_mensaje_java(mensaje) do
    System.cmd("java", ["-cp", @base, "Mensaje", mensaje])
  end

  def mostrar_error(mensaje) do
    mensaje
    |> IO.puts(:standard_error)
  end

  def ingresar_texto_java(mensaje) do
    {texto, _code} = System.cmd("java", ["-cp", @base, "Texto", mensaje])
    texto
  end

  def ingresar(mensaje, :texto) do # :texto es un atomo (constante) con el mismo nombre
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    ingresar(mensaje, &String.to_integer/1 , :entero)
  end
  def ingresar(mensaje, :real) do
    ingresar(mensaje, &String.to_float/1 , :real)
  end

  def ingresar(mensaje, parser, tipo) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un #{tipo}\n"
        |> mostrar_error()

      mensaje
      |> ingresar(parser, tipo)
    end
  end

  def formatter(valor) do
    :erlang.float_to_binary(valor, decimals: 2)
  end
end
