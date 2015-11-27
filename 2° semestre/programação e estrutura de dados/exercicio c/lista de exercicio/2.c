#include<stdio.h>
#include<conio.h>

main()
{
  int vetor[5],cont;
  float soma=0;
  for (cont=1;cont<6;cont++)
   {
       printf ("Informe o %d numero\n",cont);
       scanf  ("%d",&vetor[cont-1]);
       soma= soma + vetor[cont-1];
   };

  soma= soma*25.4;
  printf ("O total de milimetros é %.2f",soma);
}
