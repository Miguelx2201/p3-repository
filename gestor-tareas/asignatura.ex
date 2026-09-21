defmodule Asignatura do
  @doc """
  Agrega una asignatura, recibe como parametro el mapa de asignaturas actuales, y el nombre de la nueva asignatura.
  Como llave (key) asigna el nombre de la asignatura
  Como valor crea una lista vacia, en esta lista vacia es en la que se agregaran las tareas.
  """
  def crear_asignatura(asignaturas, nombre_asignatura) do
    Map.put_new(asignaturas, nombre_asignatura, [])
  end

  def eliminar_asignatura(asignaturas, nombre_asignatura) do
    Map.delete(asignaturas, nombre_asignatura)
  end
  @doc """
  Agrega una tarea al inicio de la lista, para ello se usa el operador | para dejar la nueva tarea al inicio.
  Asi reducimos la complejidad computacional.
  El metodo va recibir nuestra lista de asignaturas, el nombre de la asignatura a la que le queremos añadir la tarea, y la propia tarea.
  Luego usando Map.update() vamos a pasar nuestro mapa de asignaturas, como llave el nombre de la asignatura, establecemos como valor por defecto una lista que solo contiene esa tarea, y una funcion anonima que lo que hace es recibir la lista de tareas, y agregar nuestra nueva tarea al inicio.
  """
  def agregar_tarea(asignaturas, nombre_asignatura, tarea) do
    Map.update(asignaturas, nombre_asignatura, [tarea], fn tareas -> [tarea | tareas] end)
  end
  @doc """
  Elimina una tarea obteniendola en base a su tiulo.
  El metodo va recibir el mapa de asignaturas, el nombre de la asignatura y el titulo de la tarea que queremos borrar.
  Con Map.update() pasaremos nuestro mapa de asignaturas, el nombre de la asignatura (key) y establecemos como valor por defecto una lista vacia, luego pasamos una
  funcion anonima que recibe la lista de tareas, y a esa lista le aplica Enum.reject() que nos va devolver la misma lista excluyendo el valor que cumpla con la con
  la condición de que su titulo sea igual al titulo de la tarea que queremos eliminar. Esto nos retornara la misma lista de tareas exceptuando aquella lista
  con el titulo que buscamos eliminar.
  """
  def eliminar_tarea(asignaturas, nombre_asignatura, titulo_tarea) do
    titulo_tarea_down = String.downcase(titulo_tarea)
    update_tareas(asignaturas, nombre_asignatura, fn tareas ->
    Enum.reject(tareas, fn tarea -> String.downcase(Tarea.get_titulo(tarea)) == titulo_tarea_down end)
   end)
  end

  defp update_tareas(asignaturas, nombre_asignatura, update_fun) do
    Map.update(asignaturas, nombre_asignatura, [], update_fun)
  end


  @doc """
  Lista las tareas de manera ordenada segun su fecha de entrega.
  """
  def listar_tareas_ordenadas(asignaturas) do
    asignaturas
    |> Map.values()
    |> List.flatten()
    |> Enum.sort_by(&Tarea.get_fecha_entrega/1, Date)
  end

  def listar_asignaturas(asignaturas) do
    Map.keys(asignaturas)
  end

end
