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
    #mensaje
    # |> IO.gets()
    # |> String.trim()
    # |> String.to_integer()
    input = mensaje
    |> IO.gets()
    |> String.trim()

    case Integer.parse(input) do
      {number, ""} ->
        #IO.log("El entero es: #{number}")
        number

      {number, _rest} ->
        IO.puts("Advertencia: sobró texto no numérico: #{inspect(_rest)}")
        number

      :error ->
        IO.puts("No es un entero válido. Inténtalo de nuevo.")
        ingresar(mensaje, :entero)
    end
  end

end
