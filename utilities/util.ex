# utilities/util.ex

defmodule Util do
  # ruta absoluta a la carpeta "utilities/"
  @base Path.expand(__DIR__)

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
    IO.puts(:standard_error, mensaje)
  end

  def ingresar_texto_java(mensaje) do
    {texto, _code} = System.cmd("java", ["-cp", @base, "Texto", mensaje])
    texto
  end

  # :texto es un atomo (constante) con el mismo nombre
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :boolean) do
    mensaje =
      mensaje
      |> IO.gets()
      |> String.trim()
      |> String.downcase()
      |> String.to_atom()

    if mensaje == :si do
      true
    else
      false
    end
  end

  def ingresar(mensaje, :entero) do
    ingresar(mensaje, &String.to_integer/1, :entero)
  end

  def ingresar(mensaje, :real) do
    ingresar(mensaje, &parse_float/1, :real)
  end

  defp parse_float(str) do
    case Float.parse(str) do
      {num, ""} -> num
      _ -> raise ArgumentError, "Entrada no válida: #{str}"
    end
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

  def formatter_booleano(bool) do
    if bool do
      "SI"
    else
      "NO"
    end
  end
end
