#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define tam 4

void func_duplicata (int vetor_d[tam],int dim)
{
    int cont,cont2;
    for(cont=0;cont<dim;cont++)
    if ((cont % 2) == 0) {
        for (cont2=0;cont2<10;cont2++)
        {
            vetor_d[cont2]= vetor_d[cont2] * 10;
        }
      /*if (vetor_d[cont] == 0) {vetor_d[cont]= 0;}
      else if (vetor_d[cont] == 1) {vetor_d[cont]= 10;}
      else if (vetor_d[cont] == 2) {vetor_d[cont]= 20;}
      else if (vetor_d[cont] == 3) {vetor_d[cont]= 30;}
      else if (vetor_d[cont] == 4) {vetor_d[cont]= 40;}
      else if (vetor_d[cont] == 5) {vetor_d[cont]= 50;}
      else if (vetor_d[cont] == 6) {vetor_d[cont]= 60;}
      else if (vetor_d[cont] == 7) {vetor_d[cont]= 70;}
      else if (vetor_d[cont] == 8) {vetor_d[cont]= 80;}
       else if (vetor_d[cont] == 9) {vetor_d[cont]= 90;}*/
                            }
}

void func_definicao(char vetor_c[tam],int vetor_d[tam],int dim)
{
  int cont;
  for (cont=0;cont<dim;cont++)
  {
      if (vetor_c[cont] == '0') {vetor_c[cont]= 0;}
      else if (vetor_c[cont] == '1') {vetor_c[cont]= 1;}
      else if (vetor_c[cont] == '2') {vetor_c[cont]= 2;}
      else if (vetor_c[cont] == '3') {vetor_c[cont]= 3;}
      else if (vetor_c[cont] == '4') {vetor_c[cont]= 4;}
      else if (vetor_c[cont] == '5') {vetor_c[cont]= 5;}
      else if (vetor_c[cont] == '6') {vetor_c[cont]= 6;}
      else if (vetor_c[cont] == '7') {vetor_c[cont]= 7;}
      else if (vetor_c[cont] == '8') {vetor_c[cont]= 8;}
      else if (vetor_c[cont] == '9') {vetor_c[cont]= 9;}
  }
}

main()
{
    printf ("Informe o numero\n");
    int vetor_d[tam],cont=0,num=0;
    char vetor_c[tam];
    for (cont=0;cont<tam;cont++)
    {
        scanf ("%s",&vetor_c[cont]);
    }
  //func_definicao(vetor_c,vetor_d,tam); //transformação de string para inteiro;
  func_duplicata(vetor_d,tam); //transformação das posições pares, de unidedes para desenas;

  vetor_d[1]= vetor_d[1] + vetor_d[2]; //primeiros termo separado;
  vetor_d[2]= vetor_d[3] + vetor_d[4]; //segundo termo separado;
  vetor_d[3]= vetor_d[1] + vetor_d[2]; //Soma dos termos;
  vetor_d[4]= vetor_d[3] * vetor_d[3]; //Elevação ao quadrado;


  getch();
}
