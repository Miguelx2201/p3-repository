defmodule CSV do

  def escribir_csv(data, file_path, titulos, parser) do

    generar_mensaje_csv(data, parser)
    |> &(titulos <> &1).()
    |> &(File.write(file_path, &1)).()
  end

  def generar_mensaje_csv(data, parser) do
    data
    |> Enum.map(parser)
    |> Enum.join("\n")
  end

  def leer_csv(file_path, parser) do
    File.stream!(file_path)
    |> Enum.drop(1)
    |> Enum.map(parser)
  end
end
