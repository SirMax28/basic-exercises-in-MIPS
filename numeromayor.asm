.data
mensaje1: .asciiz "Ingrese el primer numero: "
mensaje2: .asciiz "Ingrese el segundo numero: "
mensaje3: .asciiz "Ingrese el tercer numero: "
resultado: .asciiz "El numero mayor es: "

.text
.globl main

main:
  # Se solicita al usuario el primer numero
  li $v0, 4
  la $a0, mensaje1
  syscall

  # Leemos el primer número del usuario
  li $v0, 5
  syscall
  move $t0, $v0            # Guardar el primer numero en $t0

  # Se solicita al usuario el segundo numero
  li $v0, 4
  la $a0, mensaje2
  syscall

  # Leemos el segundo número
  li $v0, 5
  syscall
  move $t1, $v0             # Guardar el segundo numero en $t1

  # Pedimos al usuario el tercer numero
  li $v0, 4
  la $a0, mensaje3
  syscall

  # leemos el tercer numero
  li $v0, 5
  syscall
  move $t2, $v0               # Guardar el tercer número en $t2

  # Ahora hacemos la evaluacion para encontrar el numero mayor
  move $t3, $t0               # Inicializar $t3 con el primer número (t0)

  #bgt nos sirve para hacer las comparaciones (branch if greater than)
  bgt $t1, $t3, set_max       # En caso de que el segundo numero sea mayor que el primero, se actualiza como nuevo numero mayor
  move $t1, $t3               # De lo contrario, el numero mayor sigue siendo el primer numero

set_max:
  bgt $t2, $t1, actualizar_max      # Si el tercer numero (t2) es mayor que el número mayor actual (ya sea t0 o t1), actualizar el número mayor
  j imprimir_max                    # De lo contrario, imprimir el número mayor actual (se concluye que t1 será el mayor)

actualizar_max:
  move $t1, $t2                     # Actualizar el numero mayor
  j imprimir_max

# Se imprime el numero mayor en la pantalla
imprimir_max:
  #Se imprime el mensaje
  li $v0, 4
  la $a0, resultado
  syscall
  
  #Se imprime el entero
  move $a0, $t1
  li $v0, 1
  syscall

  # Terminar el programa
  li $v0, 10
  syscall
