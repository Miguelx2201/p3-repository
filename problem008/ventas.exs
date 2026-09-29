Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Ventas do
  def main do
    ventas = cargar_ventas()
    productos_categoria = filtrar_productos_por_categoria(ventas, "Bebidas")
    nombres_productos = nombrar_productos(ventas)
    categorias_vendidas = categorias_vendidas_unicas(ventas)
    ventas_por_categoria = ventas_por_categoria(ventas)
    ventas_por_categoria_reduce = ventas_por_categoria_reduce(ventas)
    IO.inspect(ventas_por_categoria_reduce)
  end

  defp cargar_ventas do
    [
      %{producto: "Café", categoria: "Bebidas", cantidad: 3},
      %{producto: "Té", categoria: "Bebidas", cantidad: 1},
      %{producto: "Jugo", categoria: "Bebidas", cantidad: 6},
      %{producto: "Pan", categoria: "Panadería", cantidad: 5},
      %{producto: "Croissant", categoria: "Panadería", cantidad: 2},
      %{producto: "Torta", categoria: "Panadería", cantidad: 1},
      %{producto: "Galleta", categoria: "Panadería", cantidad: 3}
    ]
  end
  defp filtrar_productos_por_categoria(ventas, categoria) do
    Enum.filter(ventas, fn venta -> venta.categoria == categoria end)
  end
  defp nombrar_productos(ventas) do
    Enum.map(ventas, &(&1.producto))
  end
  defp categorias_vendidas_unicas(ventas) do
    Enum.map(ventas, fn venta -> venta.categoria end)
    |> Enum.uniq()
  end
  defp agrupar_productos_por_categoria(ventas) do
    Enum.group_by(ventas, fn venta -> venta.categoria end, fn venta -> venta.producto end)
  end
  defp ventas_por_categoria(ventas) do
    Enum.group_by(ventas, fn venta -> venta.categoria end, fn venta -> venta.cantidad end)
    |> Enum.map(fn {categoria, cantidades} -> {categoria, Enum.sum(cantidades)} end)
  end
  defp ventas_por_categoria_reduce(ventas) do
    Enum.reduce(ventas, %{}, fn venta, acomulador ->
      Map.update(acomulador, venta.categoria, venta.cantidad, fn cantidad -> cantidad + venta.cantidad end)
    end)
  end
end

Ventas.main()
