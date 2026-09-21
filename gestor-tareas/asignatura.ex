defmodule Asignatura do
  @doc """
  Crea una nueva asignatura y la agrega al mapa de asignaturas. Si la asignatura ya existe, no hace nada.

  ## Parámetros
  - `asignaturas`: Mapa de asignaturas actuales.
  - `nombre_asignatura`: Nombre de la nueva asignatura a crear.

  ## Retorno
  - `map`: Mapa de asignaturas actualizado con la nueva asignatura.
  """
  def crear_asignatura(asignaturas, nombre_asignatura) do
    Map.put_new(asignaturas, nombre_asignatura, [])
  end

  @doc """
  Elimina una asignatura del mapa de asignaturas.

  ## Parámetros
  - `asignaturas`: Mapa de asignaturas actuales.
  - `nombre_asignatura`: Nombre de la asignatura a eliminar.

  ## Retorno
  - `map`: Mapa de asignaturas actualizado sin la asignatura eliminada.
  """
  def eliminar_asignatura(asignaturas, nombre_asignatura) do
    Map.delete(asignaturas, nombre_asignatura)
  end

  @doc """
  Agrega una tarea a una asignatura existente.

  ## Parámetros
  - `asignaturas`: Mapa de asignaturas actuales.
  - `nombre_asignatura`: Nombre de la asignatura a la que se agregará la tarea.
  - `tarea`: Tarea a agregar.

  ## Retorno
  - `map`: Mapa de asignaturas actualizado con la nueva tarea.
  """
  def agregar_tarea(asignaturas, nombre_asignatura, tarea) do
    Map.update(asignaturas, nombre_asignatura, [tarea], fn tareas -> [tarea | tareas] end)
  end

  @doc """
  Elimina una tarea de una asignatura basándose en el título de la tarea.

  ## Parámetros
  - `asignaturas`: Mapa de asignaturas actuales.
  - `nombre_asignatura`: Nombre de la asignatura de la que se eliminará la tarea.
  - `titulo_tarea`: Título de la tarea a eliminar.

  ## Retorno
  - `map`: Mapa de asignaturas actualizado sin la tarea eliminada.
  """
  def eliminar_tarea(asignaturas, nombre_asignatura, titulo_tarea) do
    titulo_tarea_down = String.downcase(titulo_tarea)
    Map.update(asignaturas, nombre_asignatura, [], fn tareas ->
      Enum.reject(tareas, fn tarea -> String.downcase(Tarea.get_titulo(tarea)) == titulo_tarea_down end)
    end)
  end

  @doc """
  Lista todas las tareas de todas las asignaturas, ordenadas por fecha de entrega.

  ## Parámetros
  - `asignaturas`: Mapa de asignaturas.

  ## Retorno
  - `list`: Lista de tareas ordenadas por fecha de entrega.
  """
  def listar_tareas_ordenadas(asignaturas) do
    asignaturas
    |> Map.values()
    |> List.flatten()
    |> Enum.sort_by(&Tarea.get_fecha_entrega/1, Date)
  end

  @doc """
  Lista los nombres de todas las asignaturas.

  ## Parámetros
  - `asignaturas`: Mapa de asignaturas.

  ## Retorno
  - `list`: Lista de nombres de asignaturas.
  """
  def listar_asignaturas(asignaturas) do
    Map.keys(asignaturas)
  end
end
