
 #include<stdio.h>
 #include<conio.h>

 main()
 {
   int num=0,cont,soma=0;
   printf ("Informe o numero");
   scanf  ("%d",&num);
   int vetor[num];

   for (cont=1;cont<num;cont++)
   {
    vetor[0] = 0;
    if ((num % cont) == 0) vetor[cont] = cont;
    else vetor[cont] = 0;
    }

   for (cont=1;cont<num;cont++)
     soma= soma + vetor[cont];

    printf ("%d",soma);
   if (soma == num) printf("O numero é perfeito");
   else printf ("O numero não é perfeito");

   getch();

 }
