#include <conio.h>
#include <stdio.h>
#include <stdlib.h>

void encontra_media_menor(float *p_media, int *p_menor)
{
     int soma, cont, num, menor;
     float m;
     printf("Entre com 5 numeros inteiros\n");
     soma = 0;
     for (cont = 1; (cont <= 5); ++cont)
     {
         scanf("%d", &num);
         if (cont == 1) menor = num;
         else if (num < menor) menor = num;
         soma += num;
     }
     m = (float)soma / 5;
     *p_media = m;
     *p_menor = menor;
}     

main()
{
      float media;
      int menor;
      encontra_media_menor(&media, &menor);
      printf("\nMedia dos 5 numeros -> %.2f\n", media);
      printf("\nMenor dos 5 numeros -> %d\n"  , menor);
      getch();
}
