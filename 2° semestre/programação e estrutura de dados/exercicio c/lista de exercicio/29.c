
#include <stdio.h>
#include <conio.h>
#define vetor 10

main()


{
  int cont,maior=0,posicao=0;
  int q[vetor];
  for (cont=0;cont<10;cont++)
   {
       printf ("Entre com o valor\n");
       scanf  ("%d",q[cont]);
       if (q[cont] <= 0) { printf ("Somente numeros positivos\n");
                           scanf  ("%d",q[cont]);};

       if (q[cont] > maior)  { maior = q[cont] ;
                               posicao = cont; };

   }

       printf ("O maior elemento é o %d e ocupa a %d posiçãoo",maior,posicao);
       getch();
}
