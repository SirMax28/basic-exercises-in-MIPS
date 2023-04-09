    .data
    mensaje1: .asciiz "Ingrese el limite para la sucesion de Fibonacci (maximo 8): "
    mensaje2: .asciiz "\nLa sucesion de Fibonacci hasta el limite que ingresaste es => "

    .text
    .globl main

main:
    # Imprimir mensaje para ingresar el limite
    li $v0, 4
    la $a0, mensaje1
    syscall

    # Leer el limite ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0 # $t0 guarda el limite ingresado

    # Inicializar los primeros dos terminos de la sucesion de Fibonacci
    li $t1, 0
    li $t2, 1

    # Imprimir la sucesion de Fibonacci hasta el limite ingresado
    li $v0, 4
    la $a0, mensaje2
    syscall

    # Imprimir el primer termino de la sucesion de Fibonacci
    move $a0, $t1
    li $v0, 1
    syscall

    # Imprimir el segundo termino de la sucesion de Fibonacci
    move $a0, $t2
    li $v0, 1
    syscall

    # Calcular y imprimir los siguientes terminos de la sucesion de Fibonacci
    li $t3, 2 # $t3 lleva la cuenta de los terminos calculados

    #Iniciamos un Loop
    loop:
        add $t4, $t1, $t2 # Calcular el siguiente termino de la sucesion
        move $t1, $t2 # Actualizar $t1 al valor de $t2
        move $t2, $t4 # Actualizar $t2 al valor calculado
        move $a0, $t4 # Imprimir el termino calculado
        li $v0, 1
        syscall

        addi $t3, $t3, 1 # Actualizar la cuenta de terminos calculados
        bne $t3, $t0, loop # Saltar al loop si no se han calculado $t0 terminos

        # Finalizamos el Programa
        li $v0, 10
        syscall

