#include <stdlib.h>
#include <conio.h>
#include <stdio.h>

main()
{
      system("cls");
      
      int num1, num2, num3;
      float media;
      
      printf("Entre com o primeiro numero\n");
      scanf("%d", &num1);
      printf("Entre com o segundo numero\n");
      scanf("%d", &num2);
      printf("Entre com o terceiro numero\n");
      scanf("%d", &num3);
      
      media = (float)(num1 + num2 + num3) / 3;
      
      printf("\n\nMedia dos tres numeros %.2f", media);
      
      getch();
}
      
      
