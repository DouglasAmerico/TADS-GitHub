#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#define DIM 6

void le_vetor (int v[], int tam)
{
     int i;
     for (i = 0; i<tam; i++)
     {
         printf("%d = ? ", i);
         scanf("%d", &v[i]);
     }
}

void imprime_vetor (int v[], int tam)
{
     int i;
     for (i = 0; i < tam; i++)
         printf("%d = %d\n", i, v[i]);
}



void inverte_vetor (int v[], int tam)
{
     int i, temp;
     for (i=0; i < tam / 2; i++){
         temp           = v[i];
         v[i]           = v[tam - i - 1];
         v[tam - i - 1] = temp;
     }
}

main()
{
  int v[DIM];
  le_vetor      (v, DIM);
  printf("\nImprimindo o vetor na ordem em que foi lido\n");
  imprime_vetor (v, DIM);
  inverte_vetor (v, DIM);
  printf("\nImprimindo o vetor depois que foi invertido pela funcao\n");
  imprime_vetor (v, DIM);
  getch();
}

