defmodule Util do

  def mostrar_mensaje(mensaje) do
    System.cmd("python3", ["mostrar_dialogo.py", mensaje])
  end
  def mostrar_mensaje_java(mensaje) do
    System.cmd("java",["-cp", ".", "Mensaje", mensaje])
  end

end
