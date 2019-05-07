#include <iostream>
#define N 5  //Numero de columnas
#define M 4  //Numero de filas
#define Size 1  //tamaño de cada elemento


int main() {
  int M1[5*4]{1,2,3,4,5,
              6,7,8,9,0,
              0,2,4,6,8,
              1,3,5,7,9};
  std::cout<<"PRACTICA 4. PRINCIPIOS DE COMPUTADORES\n"
             "Imprimir la traspuesta de una matriz\n";
  int i(0),cont(0),ini(1);
  do{
    std::cout<<M1[i]<<"\t";
    i+=(Size*N);
    cont++;
    if(cont>=M){
      std::cout<<"\n";
      cont=0;
      i=ini*Size;
      ini++;
    }
  }while (ini<=N);
  return 0;
}