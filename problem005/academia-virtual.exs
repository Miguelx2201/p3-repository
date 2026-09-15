Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule AcademiaVirtual do
  def main do
    nombre = "Ingrese su nombre: " |> Util.ingresar(:texto)
    edad = "Ingrese su edad: " |> Util.ingresar(:entero)
    credenciales_validas = "Ingrese si las credenciales son validas (true o false): " |> Util.ingresar(:boolean)
    n_intentos_fallidos = "Ingrese el numero de intentos fallidos: " |> Util.ingresar(:entero)

    case validacion_acceso(nombre, edad, credenciales_validas, n_intentos_fallidos) do
      {:ok, msg} -> Util.mostrar_mensaje_java(msg)
      {:error, msg} -> Util.mostrar_error(msg)
    end
  end
  defp validacion_acceso(nombre, edad, credenciales_validas, n_intentos_fallidos) do
    cond do
      (res = verificar_credenciales(credenciales_validas)) != :ok -> res
      (res = verificar_edad(edad)) != :ok -> res
      (res = verificar_intentos(n_intentos_fallidos)) != :ok -> res
      true -> {:ok, "Acceso concedido a #{nombre}"}
    end
  end
  defp verificar_credenciales(credenciales_validas) do
    if credenciales_validas do
      :ok
    else
      {:error, "Sus credenciales no son válidas."}
    end
  end

  defp verificar_edad(edad) do
    if edad >= 18 do
      :ok
    else
      {:error, "Su cuenta tiene una restricción por edad."}
    end
  end

  defp verificar_intentos(n_intentos_fallidos) do
    if n_intentos_fallidos < 3 do
      :ok
    else
      {:error, "Su cuenta se encuentra bloqueada."}
    end
  end
end

AcademiaVirtual.main()
