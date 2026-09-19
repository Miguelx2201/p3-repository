Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule App do
  def iniciar do
    bucle_principal(%{})
  end

  def bucle_principal(asignaturas) do
    Util.mostrar_mensaje("""
    \n--- GESTOR DE TAREAS ---
    1. Agregar Asignatura
    2. Eliminar Asignatura
    3. Ver Lista de Asignaturas
    4. Agregar Tarea a Asignatura
    5. Ver Panel de Tareas Ordenadas
    6. Eliminar Tarea Completada
    7. Salir
    """)
    opcion = Util.ingresar("Ingrese la opción que desea realizar: ", :texto) |> String.trim()

    case opcion do
      "1" ->
        nombre_nueva_asignatura = Util.ingresar("Ingrese el nombre de la asignatura: ", :texto) |> String.trim() |> String.capitalize()
        nuevas_asignaturas = Asignatura.crear_asignatura(asignaturas, nombre_nueva_asignatura)
        Util.mostrar_mensaje("La asignatura ha sido creada exitosamente.")
        bucle_principal(nuevas_asignaturas)
      "2" ->
        nombre_asignatura_eliminar = Util.ingresar("Ingrese el nombre de la asignatura que desea eliminar: ", :texto) |> String.trim() |> String.capitalize()
        if(Map.has_key?(asignaturas, nombre_asignatura_eliminar)) do
          nuevas_asignaturas = Asignatura.eliminar_asignatura(asignaturas, nombre_asignatura_eliminar)
          Util.mostrar_mensaje("La asignatura ha sido eliminada satisfactoriamente.")
          bucle_principal(nuevas_asignaturas)
        else
          Util.mostrar_mensaje("La asignatura #{nombre_asignatura_eliminar} no existe.")
          bucle_principal(asignaturas)
        end
      "3" ->
        if(Enum.empty?(asignaturas)) do
          Util.mostrar_mensaje("No hay asignaturas disponibles.")
          bucle_principal(asignaturas)
        else
          Util.mostrar_mensaje("\n==LISTA ASIGNATURAS==")
          Asignatura.listar_asignaturas(asignaturas) |> Enum.each(fn asignatura -> Util.mostrar_mensaje(asignatura)end)
          bucle_principal(asignaturas)
        end
      "4" ->
        nombre_asignatura = Util.ingresar("Ingrese el nombre de la asignatura a la que le desea agregar una tarea: ", :texto) |> String.trim() |> String.capitalize()
        if(Map.has_key?(asignaturas, nombre_asignatura)) do
          titulo_tarea = Util.ingresar("Ingrese el nombre de la tarea: ", :texto) |> String.trim() |> String.capitalize()
          descripcion_tarea = Util.ingresar("Ingrese la descripción de la tarea: ", :texto) |> String.trim() |> String.capitalize()
          fecha_tarea_string = Util.ingresar("Fecha de entrega (YYYY-MM-DD): ", :texto) |> String.trim()
          case Tarea.crear_tarea(titulo_tarea, descripcion_tarea, fecha_tarea_string) do
            {:ok, tarea} ->
              nuevas_asignaturas = Asignatura.agregar_tarea(asignaturas, nombre_asignatura, tarea)
              Util.mostrar_mensaje(" Tarea agregada correctamente.")
              bucle_principal(nuevas_asignaturas)

            {:error, mensaje_error} ->
              Util.mostrar_mensaje(" Error: #{mensaje_error}")
              bucle_principal(asignaturas)
          end
        else
          Util.mostrar_mensaje("La asignatura #{nombre_asignatura} no existe.")
          bucle_principal(asignaturas)
        end
      "5" ->
        Util.mostrar_mensaje("\n===PANEL DE TAREAS ORDENADAS===")
        tareas_ordenadas = Asignatura.listar_tareas_ordenadas(asignaturas)
        if(Enum.empty?(tareas_ordenadas)) do
          Util.mostrar_mensaje("No hay tareas pendientes.")
        else
          Enum.each(tareas_ordenadas, fn tarea -> Util.mostrar_mensaje(Tarea.mostrar(tarea)) end)
        end
        bucle_principal(asignaturas)
      "6" ->
        nombre_asignatura = Util.ingresar("Ingrese el nombre de la asignatura a la que le desea eliminar una tarea: ", :texto) |> String.trim() |> String.capitalize()
        if(Map.has_key?(asignaturas, nombre_asignatura)) do
          titulo_tarea = Util.ingresar("Ingrese el titulo de la tarea que desea eliminar: ", :texto) |> String.trim()
          nuevas_asignaturas = Asignatura.eliminar_tarea(asignaturas, nombre_asignatura, titulo_tarea)
          Util.mostrar_mensaje("La tarea ha sido eliminada satisfactoriamente.")
          bucle_principal(nuevas_asignaturas)
        else
          Util.mostrar_mensaje("La asignatura #{nombre_asignatura} no existe.")
          bucle_principal(asignaturas)
        end
      "7" ->
        Util.mostrar_mensaje("Adios...")
      _ ->
        Util.mostrar_mensaje("Ingrese una opcion valida.")
        bucle_principal(asignaturas)
    end
  end

end
