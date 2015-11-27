
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#define vet 25
//#define vetb 25
//#define vetc 25
//#define vetd 25
main()

{ int cont;
  float veta[vet];
  float vetb[vet];
  float vetc[vet];

  for (cont = 1;cont< 26;cont++)
   {
     printf ("\nInforme o valor do vetor A poisção %d\n",cont);
     scanf  ("%f",&veta[cont]);
     printf ("\nInforme o valor do vetor B posição %d\n",cont);
     scanf  ("%f",&vetb[cont]);
     vetc[cont] = veta[cont] + vetb[cont];
     system("cls");
    };

    int mult=0;
    printf ("\nInforme a variavel a ser multiplicada para o vetor C");
    scanf  ("%d",&mult);

  for (cont = 1;cont<26; cont++)
   {
    printf ("\nVetor A posição %d = %f , Vetor B posição %d = %f",cont,veta[cont],cont,vetb[cont]);
    printf ("\nVetor C posição %d = %f",cont,vetc[cont]);
    printf ("\nVetor D posição %d = %f",cont,(vetc[cont] * mult));
   }
 getch();
}
