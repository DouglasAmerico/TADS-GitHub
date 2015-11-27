#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

main()
{
      system("cls");
      
      float altura_chico, altura_ze;
      int anos = 0;
      
      altura_chico = 1.50;
      altura_ze    = 1.10;
      
      do
      {
       ++anos;
       altura_chico = altura_chico + 0.02;
       altura_ze    = altura_ze    + 0.03;
       
      } while (altura_ze < altura_chico);
      
      printf("%d anos para que a altura de Ze seja maior que a de Chico", anos);
      
      getch();
}
      
