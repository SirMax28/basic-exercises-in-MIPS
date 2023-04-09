.data
mensaje1: .asciiz "Ingresa el primer numero: "
mensaje2: .asciiz "Ingresa el segundo numero: "
mensaje3: .asciiz "Ingresa el tercer numero: "
resultado: .asciiz "El numero menor es => "

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
  move $t0, $v0 # Guardamos el primer numero en $t0

  # Se solicita al usuario el segundo numero
  li $v0, 4
  la $a0, mensaje2
  syscall

  # Leemos el segundo numero
  li $v0, 5
  syscall
  move $t1, $v0 # Guardar el segundo numero en $t1

  # Se solicita el tercer numero
  li $v0, 4
  la $a0, mensaje3
  syscall

  # Guardamos el tercer numero
  li $v0, 5
  syscall
  move $t2, $v0  # Guardar el tercer numero en $t2


  # Ahora hacemos la evaluación para encontrar el numero manor
  move $t3, $t0           # Inicializar $t3 para hacer las comparaciones con el primer numero
  #blt nos sirve para hacer las comparaciones (branch if less than)
  blt $t1, $t3, set_min   # En caso de que el segundo numero sea menor que el primero, se actualiza su posicion como primero 
  move $t1, $t3           # De lo contrario, el numero menor sigue siendo el primer numero

set_min:
  blt $t2, $t1, actualizar_menor  # Si el tercer número (t2) es menor que el número menor actual (ya sea t0 o t1), actualizar el numero menor
  j imprimir_menor                # De lo contrario, imprimir el numero menor actual (pues t2 sera el menor).

#nos sirve para actualizar la posicion del numero menor en cada momento
actualizar_menor:
  move $t1, $t2     # Actualizar el numero menor
  j imprimir_menor


# Ahora imprimir el Resultado por Pantalla
imprimir_menor:
  li $v0, 4
  la $a0, resultado
  syscall

  move $a0, $t1
  li $v0, 1
  syscall

  # Salir del Programa
  li $v0, 10
  syscall
