
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void sub(float *media,int *menor)
 {
     int cont=0,valor=0;
     for (cont=0;cont<50;cont++)
      {
        printf ("\nInforme o %d numero \n",cont+1);
        scanf  ("%d",&valor);
         if (cont==0)  *menor=valor;

         if (valor< *menor)  *menor=valor;
         *media= *media + valor;
         system ("cls");
        }
   }
main()
{
  float media=0;
  int menor=0;
  printf ("Bem vindo ao programa somatorio\n\n");
  sub(&media,&menor);
  media= media/50;
  printf ("A media dos valores é %.2f \n",media);
  printf ("O menor valor é %d ",menor);
  getch();
}
