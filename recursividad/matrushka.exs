defmodule Matrushka do
  def main do
    abrir_matrushka(5)
    abrir_matrushka_lista(5)
    |> IO.inspect()
  end
  def abrir_matrushka_lista(1) do
    ["Matriusca 1"]
  end
  def abrir_matrushka_lista(n) do
    ["Matriusca #{n}" | abrir_matrushka(n-1)]
  end

  def abrir_matrushka(0) do
    IO.puts("Termine")
  end
  def abrir_matrushka(n) when n > 0 do
    IO.puts("Abriendo Matrusca #{n}")
    abrir_matrushka(n-1)
    IO.puts("Cerrando Matrusca #{n}")
  end
end
Matrushka.main()
