

#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

main()
{
  int cont=0,cont2=0,vet_q[5];
  char mens[10],vetor[5];
  printf ("Informe a mensagem \n");
  scanf  ("%c",&mens);
  strlen (mens);

  vetor[0] = strlen("a");
  vetor[1] = strlen("e");
  vetor[2] = strlen("i");
  vetor[3] = strlen("o");
  vetor[4] = strlen("u");

  for (cont=0;cont<6;cont++);
   vet_q[cont] = 0;

  for (cont=0;cont<11;cont++)
   {
       for (cont2=0;cont<6;cont++)
        {
         if (mens[cont] == vetor[cont2])  vet_q[cont2] = vet_q[cont2]++;
        };
   };

  for (cont=0;cont<6;cont++)
   printf ("\nExistem %d letras %c na frase",vet_q[cont],vetor[cont]);

  getch();
}

