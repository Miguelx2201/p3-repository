defmodule Inventario do
  def main do
    inventario = cargar_inventario()
    valor_total_inventario = calcular_valor_total_inventario(inventario)
    productos_sin_stock = filtrar_productos_sin_stock(inventario)
    accesorios_ordenados = accesorios_ordenados_por_precio(inventario)
    producto_mas_caro = encontrar_producto_mas_caro(inventario)
    producto_mas_barato = encontrar_producto_mas_barato(inventario)
    productos_agrupados_categoria = agrupar_productos_por_categoria(inventario)
  end

  defp cargar_inventario do
    [
      %{id: 1, nombre: "Teclado mecánico", precio: 180_000, stock: 12, categoria: "Periféricos"},
      %{id: 2, nombre: "Mouse inalámbrico", precio: 75000, stock: 0, categoria: "Periféricos"},
      %{id: 3, nombre: "Monitor 24\"", precio: 620_000, stock: 5, categoria: "Pantallas"},
      %{id: 4, nombre: "Cable HDMI", precio: 25000, stock: 40, categoria: "Accesorios"},
      %{id: 5, nombre: "Base para portátil", precio: 90000, stock: 0, categoria: "Accesorios"},
      %{id: 6, nombre: "Audífonos", precio: 150_000, stock: 8, categoria: "Accesorios"},
      %{id: 7, nombre: "Monitor 27\"", precio: 950_000, stock: 3, categoria: "Pantallas"}
    ]
  end
  defp calcular_valor_total_inventario(inventario) do
    Enum.reduce(inventario, 0, fn producto, total -> total + (producto.precio * producto.stock) end)
  end
  defp filtrar_productos_sin_stock(inventario) do
    Enum.filter(inventario, fn producto -> producto.stock == 0 end)
  end
  defp accesorios_ordenados_por_precio(inventario) do
    Enum.filter(inventario, fn producto -> producto.categoria == "Accesorios" end)
    |> Enum.sort_by(fn producto -> producto.precio end, :asc)
  end
  defp encontrar_producto_mas_caro(inventario) do
    caro = Enum.max_by(inventario, fn producto -> producto.precio end)
    {:mas_caro, caro.nombre, caro.precio}
  end
  defp encontrar_producto_mas_barato(inventario) do
    barato = Enum.min_by(inventario, fn producto -> producto.precio end)
    {:mas_barato, barato.nombre, barato.precio}
  end
  defp agrupar_productos_por_categoria(inventario) do
    Enum.group_by(inventario, fn producto -> producto.categoria end, fn producto -> producto.nombre end)
  end
end

Inventario.main()
