#include <stdio.h>
#include <conio.h>
#define vet 20

main()

{
    int cont=0;
    int vetor[vet];
    for (cont=1;cont < 21;cont++)
     {
       printf ("Informe o valor da posi��o %d\n",cont);
       scanf  ("%d",&vetor[cont]);
     }

    printf ("Informe o valor a ser pesquisado\n");
    int pesq=0,posicao=0;
    scanf  ("%d",&pesq);

    for (cont=1;cont < 21;cont++)
     {
         if (vetor[cont] == pesq)  posicao = pesq;
     }

    if (posicao != 0) {printf("O valor foi encontrado\n"); printf("O valor esta na posi��o %d\n",posicao);}
    else printf("O valor n�o foi encontrado");
    getch();
}
