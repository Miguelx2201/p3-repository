Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Punto2 do
  def main do
    vuelos = [
      %{
        codigo: "AV201",
        aerolinea: "Avianca",
        origen: "BOG",
        destino: "MDE",
        duracion: 45,
        precio: 180_000,
        pasajeros: 120,
        disponible: true
      },
      %{
        codigo: "LA305",
        aerolinea: "Latam",
        origen: "BOG",
        destino: "CLO",
        duracion: 55,
        precio: 210_000,
        pasajeros: 98,
        disponible: true
      },
      %{
        codigo: "AV410",
        aerolinea: "Avianca",
        origen: "MDE",
        destino: "CTG",
        duracion: 75,
        precio: 320_000,
        pasajeros: 134,
        disponible: false
      },
      %{
        codigo: "VV102",
        aerolinea: "Viva Air",
        origen: "BOG",
        destino: "BAQ",
        duracion: 90,
        precio: 145_000,
        pasajeros: 180,
        disponible: true
      },
      %{
        codigo: "LA512",
        aerolinea: "Latam",
        origen: "CLO",
        destino: "CTG",
        duracion: 110,
        precio: 480_000,
        pasajeros: 76,
        disponible: false
      },
      %{
        codigo: "AV330",
        aerolinea: "Avianca",
        origen: "BOG",
        destino: "CTG",
        duracion: 135,
        precio: 520_000,
        pasajeros: 155,
        disponible: true
      },
      %{
        codigo: "VV215",
        aerolinea: "Viva Air",
        origen: "MDE",
        destino: "BOG",
        duracion: 50,
        precio: 130_000,
        pasajeros: 190,
        disponible: true
      },
      %{
        codigo: "LA620",
        aerolinea: "Latam",
        origen: "BOG",
        destino: "MDE",
        duracion: 145,
        precio: 390_000,
        pasajeros: 112,
        disponible: true
      },
      %{
        codigo: "AV505",
        aerolinea: "Avianca",
        origen: "CTG",
        destino: "BOG",
        duracion: 120,
        precio: 440_000,
        pasajeros: 143,
        disponible: false
      },
      %{
        codigo: "VV340",
        aerolinea: "Viva Air",
        origen: "BAQ",
        destino: "BOG",
        duracion: 85,
        precio: 160_000,
        pasajeros: 175,
        disponible: true
      }
    ]

    filtrar_vuelos_disponibles(vuelos)
    calculo_pasajeros_por_aerolinea(vuelos)
    formatear_vuelos(vuelos)
    filtrar_vuelos_precio_menor_aplicar_descuento(vuelos, 400_000)
    filtrar_aerolineas_vuelos_duracion(vuelos)
    calcular_rutas_mas_rentables(vuelos, 3)
  end

  defp filtrar_vuelos_disponibles(vuelos) do
    vuelos_disponibles = Enum.filter(vuelos, fn vuelo -> vuelo.disponible end)
    codigos_vuelos = Enum.map(vuelos_disponibles, fn vuelo -> vuelo.codigo end) |> Enum.sort()
    IO.inspect(codigos_vuelos)
  end

  defp calculo_pasajeros_por_aerolinea(vuelos) do
    aerolineas = Enum.map(vuelos, fn vuelo -> vuelo.aerolinea end) |> Enum.uniq()

    pasajeros_por_aerolinea =
      Enum.map(aerolineas, fn aerolinea ->
        vuelos_aerolinea = Enum.filter(vuelos, fn vuelo -> vuelo.aerolinea == aerolinea end)

        total_pasajeros =
          Enum.reduce(vuelos_aerolinea, 0, fn vuelo, suma -> suma + vuelo.pasajeros end)

        {aerolinea, total_pasajeros}
      end)

    IO.inspect(pasajeros_por_aerolinea)
  end

  defp formatear_vuelos(vuelos) do
    cadenas =
      Enum.map(vuelos, fn vuelo ->
        "#{vuelo.codigo} - #{vuelo.origen} -> #{vuelo.destino}: #{div(vuelo.duracion, 60)}h #{cond do
          rem(vuelo.duracion, 60) < 10 -> "0#{rem(vuelo.duracion, 60)}m"
          true -> "#{rem(vuelo.duracion, 60)}m"
        end}"
      end)

    IO.inspect(cadenas)
  end

  defp filtrar_vuelos_precio_menor_aplicar_descuento(vuelos, precio) do
    vuelos_filtrados =
      Enum.filter(vuelos, fn vuelo -> vuelo.precio < precio end)
      |> Enum.sort_by(fn vuelo -> vuelo.precio end)

    tuplas_vuelos =
      Enum.map(vuelos_filtrados, fn vuelo ->
        {
          "#{vuelo.codigo}",
          "#{vuelo.origen}-#{vuelo.destino}",
          "#{(vuelo.precio * 0.9) |> Util.formatter()}"
        }
      end)

    IO.inspect(tuplas_vuelos)
  end

  defp clasificar_vuelos_por_duracion(vuelos) do
    Enum.map(vuelos, fn vuelo ->
      clasificacion =
        cond do
          vuelo.duracion < 60 -> :corto
          vuelo.duracion >= 60 and vuelo.duracion <= 120 -> :medio
          vuelo.duracion > 120 -> :largo
        end

      Map.put(vuelo, :clasificacion, clasificacion)
    end)
  end

  defp filtrar_aerolineas_vuelos_duracion(vuelos) do
    aerolineas = Enum.map(vuelos, fn vuelo -> vuelo.aerolinea end) |> Enum.uniq()
    vuelos_clasificados = clasificar_vuelos_por_duracion(vuelos)

    aerolineas_todo_tipo_vuelos =
      Enum.filter(aerolineas, fn aerolinea ->
        vuelos_clasificados_aerolinea =
          Enum.filter(vuelos_clasificados, fn vuelo -> vuelo.aerolinea == aerolinea end)

        tipos_vuelos_aerolinea =
          Enum.map(vuelos_clasificados_aerolinea, fn vuelo -> vuelo.clasificacion end)

        Enum.member?(tipos_vuelos_aerolinea, :corto) and
          Enum.member?(tipos_vuelos_aerolinea, :medio) and
          Enum.member?(tipos_vuelos_aerolinea, :largo)
      end)

    IO.inspect(aerolineas_todo_tipo_vuelos)
  end
  defp calcular_rutas_mas_rentables(vuelos, n) do
    Enum.map(vuelos, fn vuelo -> {"#{vuelo.origen}-#{vuelo.destino}", vuelo.precio * vuelo.pasajeros} end)
    |> Enum.group_by(fn {ruta, _} -> ruta end, fn {_, ingreso} -> ingreso end)
    |> Enum.map(fn {ruta, ingresos} -> {ruta, Enum.sum(ingresos)} end)
    |> Enum.sort_by(fn {_, ingresos} -> ingresos end, :desc)
    |> Enum.take(n)
    |> IO.inspect()
  end
end

Punto2.main()
