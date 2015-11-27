#include <conio.h>
#include <stdio.h>
#include <stdlib.h>

int encontra_maior()
{
     int num, cont, maior;
     printf("Entre com uma quantidade indeterminada de numeros inteiros positivos (ultimo numero = 0)\n");
     scanf("%d", &num);
     cont = 0;
     while (num != 0) 
     {
         ++cont;
         if (cont == 1) maior = num;
         else if (num > maior) maior = num;
         
         scanf("%d", &num);
     }
     return(maior);
}     

main()
{
      int maior;
      maior = encontra_maior();
      printf("\nMaior dos numeros -> %d\n", maior);
      getch();
}
