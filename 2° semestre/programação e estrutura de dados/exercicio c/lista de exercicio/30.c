
 #include<stdio.h>
 #include<conio.h>
 #define vet 10


 main()


 {
   int cont;
   int vetor[vet];
   for (cont=0;cont<10;cont++)
     {
        printf ("Informe o valor\n");
        scanf  ("%d",&vetor[cont]);
       }
       int dentro = 0,fora = 0;

   for (cont=1;cont<10;cont++)
   {
    if ((vetor[cont] >= 10) && (vetor[cont] <= 20))   dentro = dentro + 1;
    else fora = fora + 1;
   }

    printf ("\n%d Numeros estão dentro do intervalo",dentro);
    printf ("\n%d Numeros estão fora do intervalo",fora);

    getch();
  }
