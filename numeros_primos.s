.data
	msg1: .asciiz"\nDigite um numero inteiro: "
	msg2: .asciiz" e primo\n"
	msg3: .asciiz"Número invalido"
.text
main:
	###################
	#PREPARAR MENSAGEM#
	###################
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	############
	#LER N($t0)#
	############
	
	li $v0, 5
	syscall
	move $t0, $v0
	ble $t0, 100000, Valido
	j Invalido
	Valido:
	#######################
	#for C = 1, C<=N, C++ #
	#######################
	
	#C = $t1
	
	li $t1, 1
	
	#Inicio do for
	forC:
	
	#t = $t2
	add $t2, $zero, 0
	
	#Inicio do segundo for
	#i = $t3
	add $t3, $zero, 1
	
	forI:
	rem $t4, $t1, $t3
	beq $t4, 0, tMais
	cont:
	add $t3, $t3, 1
	ble $t3, $t1, forI
	
	beq $t2, 2, mostraPrimo
	contP:
	add $t1, $t1, 1
	ble $t1, $t0, forC
	j final
	
	#t++
	tMais:
	add $t2, $t2, 1
	j cont
	
	#mostrar que é Primo
	mostraPrimo:
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall
	j contP
	
	Invalido:
	li $v0, 4
	la $a0, msg3
	syscall
	j main
	
	final: