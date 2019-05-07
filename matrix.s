# PRACTICA 4. PRINCIPIO DE COMPUTADORES.
# programa que imprime la traspuesta de la mariz
# La matriz tiene dimension mxn

m = 2	# numero de filas de m1
n = 2	    # numero de columnas de  m1
size = 4	# tamano de cada elemento


# HAY QUE PONER UN ESPACIO DETRAS DE CADA COMA EN LA DEF DE VECTORES Y MATRICES
			.data
m1:			.word	1, 3
            .word   4, 5
titulo:     .asciiz "PRACTICA 4. PRINCIPIOS DE COMPUTADORES\nImprimir la traspuesta de una matriz\n"
diagonal:     .asciiz "\nImprimir la diagonal de una matriz\n"
tabulador:  .asciiz "\t"
saltolinea: .asciiz "\n"

			.text
main:
		#Para facilidad de correccion incluye el pseudocodigo que has utilizado
		#include <iostream>
        #define N 5  //Numero de columnas
        #define M 4  //Numero de filas
        #define Size 1  //tamaño de cada elemento
        #
        #titulo:     .asciiz "PRACTICA 4. PRINCIPIOS DE COMPUTADORES\nImprimir la traspuesta de una matriz\n"
        #int main() {
        #  int M1[N*M]{1,2,3,4,5,
        #              6,7,8,9,0,
        #              0,2,4,6,8,
        #              1,3,5,7,9};
        #  std::cout<<"PRACTICA 4. PRINCIPIOS DE COMPUTADORES\n"
        #             "Imprimir la traspuesta de una matriz\n";
        #  int i(0),cont(0),ini(1);
        #  do{
        #    std::cout<<M1[i]<<"\t";
        #    i+=(Size*N);
        #    cont++;
        #    if(cont>=M){
        #      std::cout<<"\n";
        #      cont=0;
        #      i=ini*Size;
        #      ini++;
        #    }
        #  }while (ini<=N);
        #  return 0;
        #}
		#
		###################################
		#   Y lo que significa cada registro
		#
		#   C++ --> Ensamblador
		#   i       $t0     iterador de la matriz
		#   cont    $t1     contador de filas
		#   ini     $t2     contador de columnas
        #
		#Utilizo variables temporales que solo se emplearan para los calculos,
		# no pretendo guardar ningun valor de ellas
		#
		#Variables auxiliares para Ensmablador
		#   $t3     auxiliar para calculos
		#   $s0     m
		#   $s1     n
		#   $s2     size
		#   $s3     constante size*N
		#
	    ###################################
		# INTRODUCE AQUI TU CODIGO

		li $v0,4        #Mostramos el texto inicial
		la $a0,titulo
		syscall

		#Inicializamos las variables
		la $t0,m1    #Inicializamos i a la direcion de la matriz
		li $t1,0    #Inicializamos cont a 0
		li $t2,1    #Inicializamos ini a 1
		la $t3,m1   #Inicializamos con la direcion de la matriz
		li $s0,m    #Cargamos las constante m
		li $s1,n    #Cargamos las constante n
		li $s2,size #Cargamos las constante size
		move $s3,$s2 #Copiamos size
		mul $s3,$s3,$s1    #Guardamos en s1 size*n



		do:                 #Creamos la etiqueta do para los saltos del bucle
		    lw $a0,0($t0)   #Mostramos el valor de la matriz
		    li $v0,1
		    syscall

		    li $v0,4        #Imprimimos un tabulador
            la $a0,tabulador
            syscall

            add $t0,$t0,$s3 #Incrementamos i en funcion de size*n


		    add $t1,$t1,1   #Incrementamos en una unidad el contador de filas

		    blt $t1,$s0,fin_if #Si cont es < que M salta a fin_if

                li $v0,4        #Imprimimos un salto de linea
                la $a0,saltolinea
                syscall

                li $t1,0        #Ponemos el contador de fila a 0

                #Se cambia el valor de i por el de ini
                mul $t4,$t2,$s2   #Multiplicamos  size por ini
                add $t0,$t3,$t4   #guardamos en i la direcionde la matriz inical mas ini

                add $t2,$t2,1   #Se incrementa ini en 1 unidad

		    fin_if:
        ble $t2,$s1,do #Si ini es <= que N salta a do


        la $t0,m1
        li $t1,0    #Inicializamos cont a 0

        bne $s1,$s0, fin
        doo:
            lw $a0,0($t0)   #Mostramos el valor de la matriz
            li $v0,1
            syscall
            add $t0,$t0,$s3 #Incrementamos i en funcion de size*n
            add $t0,$t0,$s2
            add $t1,$t1,1
            ble $t1,$s1,doo

        fin:



		
		######################################
		#Responde a las cuestiones planteadas
		#
		#No he calculado el desplazamiento de cada helemento he iterado con el desplazamiento realizando asi muchas
		#menos intruciones
		#
		#No se me ocurre otra mejora para el codigo aparte de la planteada, quizas pedir los datos por teclado,
		#pero en ese caso seria completamente diferente la practica y el manejo de memoria ya que tendría que ser
		#memoria pre reservada que probablemente sea sobre dimencionada o memoria dinamica
		#
		######################################
	    # salida del sistema
        li	$v0,10
        syscall
			
