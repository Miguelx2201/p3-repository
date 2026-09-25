Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule Notas do
  def main do
    estudiantes =  [
      %{nombre: "Juan", nota: 3.4},
      %{nombre: "María", nota: 4.5},
      %{nombre: "Pedro", nota: 2.3},
      %{nombre: "Ana", nota: 5.0},
      %{nombre: "Luis", nota: 3.9},
      %{nombre: "Sofía", nota: 2.8},
      %{nombre: "Carlos", nota: 4.2},
      %{nombre: "Valentina", nota: 3.1},
      %{nombre: "Diego", nota: 2.5},
      %{nombre: "Camila", nota: 4.8}
    ]
    promedio = calcular_promedio(estudiantes)
    estudiantes_promedio = contar_estudiantes_promedio(estudiantes, promedio)
    notas_extremos = encontrar_notas_extremos(estudiantes)
    estudiantes_informe = generar_informe(estudiantes)
    generar_reporte(promedio, estudiantes_promedio, notas_extremos, estudiantes_informe)
    |> Util.mostrar_mensaje()
  end
  defp calcular_promedio(estudiantes) do
    lista_notas = Enum.map(estudiantes, fn estudiante -> estudiante.nota end)
    Enum.sum(lista_notas) / length(lista_notas)
  end
  defp contar_estudiantes_promedio(estudiantes, promedio) do
    mayor = Enum.count(estudiantes, fn estudiante -> estudiante.nota > promedio end)
    menor = Enum.count(estudiantes, fn estudiante -> estudiante.nota < promedio end)
    {mayor, menor}
  end
  defp encontrar_notas_extremos(estudiantes) do
    lista_notas = Enum.map(estudiantes, fn estudiante -> estudiante.nota end)
    {Enum.min(lista_notas), Enum.max(lista_notas)}
  end
  defp generar_informe(estudiantes) do
    lista_notas = Enum.map(estudiantes, fn estudiante -> estudiante.nota end)
    aprobados = Enum.count(lista_notas, fn nota -> nota >= 3.0 end)
    reprobados = Enum.count(lista_notas, fn nota -> nota < 3.0 end)
    {aprobados, reprobados}
  end
  defp generar_reporte(promedio, {mayor, menor}, {min_nota, max_nota}, {aprobados, reprobados}) do
    """
    Promedio de notas: #{Util.formatter(promedio)}
    Estudiantes con nota mayor al promedio: #{mayor}
    Estudiantes con nota menor al promedio: #{menor}
    Nota mínima: #{Util.formatter(min_nota)}
    Nota máxima: #{Util.formatter(max_nota)}
    Estudiantes aprobados: #{aprobados}
    Estudiantes reprobados: #{reprobados}
    """
  end
end

Notas.main()
