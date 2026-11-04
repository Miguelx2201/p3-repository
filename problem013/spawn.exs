defmodule Spawn do
  def main do
    IO.puts("Iniciando el proceso principal...")
    principal_pid = self()

    spawn(fn ->
      loop(principal_pid)
    end)

    spawn(fn ->
      IO.puts("Iniciando el proceso hijo 1 de la suma de dos numeros...")
      suma = sumar_numeros(1,10)
      send(principal_pid, {:suma_resultado, suma})
      IO.puts("Finalizando el proceso hijo 1 de la suma de dos numeros...")
    end)

    spawn(fn ->
      IO.puts("Iniciando el proceso hijo 2 de la multiplicación de dos numeros...")
      resultado = multiplicar_numeros(5,4)
      send(principal_pid, {:multiplicacion_resultado, resultado})
      IO.puts("Finalizando el proceso hijo 2 de la multiplicación de dos numeros...")
    end)

    spawn(fn ->
      IO.puts("Iniciando el proceso hijo 3 de la suma de dos numeros...")
      palindroma = verificar_palindroma("radar")
      send(principal_pid, {:es_palindroma, palindroma})
      IO.puts("Finalizando el proceso hijo 3 de la suma de dos numeros...")
    end)

    spawn(fn ->
      Process.sleep(6000)
      send(principal_pid, {:terminar})
    end)


    IO.puts("Finalizando el proceso principal...")
  end

  def loop(principal_pid) do
    receive do
        {:suma_resultado, suma} ->
          IO.puts("El resultado de la suma es #{suma}")
          loop(principal_pid)
        {:multiplicacion_resultado, resultado} ->
          IO.puts("El resultado de la multiplicacion es #{resultado}")
          loop(principal_pid)
        {:es_palindroma, palindroma} ->
          IO.puts("La es palindroma? #{palindroma}")
          loop(principal_pid)
        {:terminar} ->
          IO.puts("Finalizando la espera de mensajes...")
          :ok
    end
  end

  def sumar_numeros(a, b) do
    a+b
  end

  def multiplicar_numeros(a, b) do
    a*b
  end

  def verificar_palindroma(cadena) do
    cadena == String.reverse(cadena)
  end

end
Spawn.main()
