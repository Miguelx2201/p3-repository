defmodule Tarea do
  @doc """
  Modulo que gestiona la creación y lectura de Tareas.
  Metodos:
  crear_tarea() -> crea una tarea
  """
  def crear_tarea(titulo, descripcion, fecha_entrega) do
    case parsear_fecha(fecha_entrega) do
      {:ok, fecha} ->
        {:ok, {:tarea, titulo, descripcion, fecha}}

      {:error, _} ->
        {:error, "Fecha inválida. Debe usar el formato YYYY-MM-DD y ser una fecha real."}
    end
  end
  def get_titulo({:tarea, titulo, descripcion, fecha_entrega}), do: titulo
  def get_descripcion({:tarea, titulo, descripcion, fecha_entrega}), do: descripcion
  def get_fecha_entrega({:tarea, titulo, descripcion, fecha_entrega}), do: fecha_entrega
  def mostrar({:tarea, titulo, descripcion, fecha_entrega}) do
    """
    Tarea:#{titulo}.
    Descripcion:#{descripcion}.
    Fecha de entrega:#{fecha_entrega}.

    """
  end
  defp parsear_fecha(fecha_string) do
    fecha_string
    |> Date.from_iso8601()
  end
end
