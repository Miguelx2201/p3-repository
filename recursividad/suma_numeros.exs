defmodule SumaNumeros do
  def main do
    IO.puts(suma_recursiva(5))
  end

  def suma_recursiva(0) do
    0
  end
  def suma_recursiva(n) when n > 0 do
    n + suma_recursiva(n - 1)
  end

  # Tarea: Optimizar suma_recursiva usando recursividad de cola. Opcional: Estudiar divide y venceras.
end
SumaNumeros.main()
"""

1. R=1000 - Z=0 - C=0
2. R=1000 - Z=0 - C=0
3. R=0101 - Z=0 - C=1
4. R=1111 - Z=0 - C=0
5. R=0000 - Z=1 - C=1
6. R=0000 - Z=1 - C=1

Preguntas:
1. Debe ser de 4 a 1, recibe 4 y solo puede salir 1 segun el opcode
2. Invertimos los bits de B y mandamos 1 a Cin para que se convierta en el inverso
3. La compuerta NOR ya que solo va dar 1 cuando todos (R1,R2,R3,R4) sean 0
"""
