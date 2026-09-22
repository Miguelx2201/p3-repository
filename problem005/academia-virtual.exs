Code.require_file("../utilities/util.ex", __DIR__)
alias Util

defmodule AcademiaVirtual do
  @moduledoc """
  This module handles the main functionality of the Academia Virtual application.
  It interacts with the user to gather necessary information and validates it.
  """

  @doc """
  The main function of Academia Virtual. It prompts the user for input and
  performs validation. Based on the validation result, it shows either a message
  or an error.
  """
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

  @doc """
  This private function validates the user's credentials, age, and number of failed attempts.
  It checks each condition and returns an error message if any condition fails.
  """
  defp validacion_acceso(nombre, edad, credenciales_validas, n_intentos_fallidos) do
    cond do
      (res = verificar_credenciales(credenciales_validas)) != :ok -> res
      (res = verificar_edad(edad)) != :ok -> res
      (res = verificar_intentos(n_intentos_fallidos)) != :ok -> res
      true -> {:ok, "Acceso concedido a #{nombre}"}
    end
  end

  @doc """
  This private function checks if the user's credentials are valid.
  It returns :ok if the credentials are valid, or an error message if they are not.
  """
  defp verificar_credenciales(credenciales_validas) do
    if credenciales_validas do
      :ok
    else
      {:error, "Sus credenciales no son válidas."}
    end
  end

  @doc """
  This private function checks if the user's age is valid.
  It returns :ok if the user is at least 18 years old, or an error message if they are not.
  """
  defp verificar_edad(edad) do
    if edad >= 18 do
      :ok
    else
      {:error, "Su cuenta tiene una restricción por edad."}
    end
  end

  @doc """
  This private function checks if the user has exceeded the number of failed attempts.
  It returns :ok if the user has not exceeded the limit, or an error message if they have.
  """
  defp verificar_intentos(n_intentos_fallidos) do
    if n_intentos_fallidos < 3 do
      :ok
    else
      {:error, "Su cuenta se encuentra bloqueada."}
    end
  end
end

AcademiaVirtual.main()
