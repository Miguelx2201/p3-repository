defmodule Util do

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje);
  end

  def mostrar_mensaje_python(mensaje) do
    System.cmd("python3", ["mostrar_dialogo.py", mensaje])
  end
  def mostrar_mensaje_java(mensaje) do
    System.cmd("java",["-cp", ".", "Mensaje", mensaje])
  end

end
