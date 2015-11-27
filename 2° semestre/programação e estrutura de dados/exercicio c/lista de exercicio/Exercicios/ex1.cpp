

   #include <stdio.h>
   #include <conio.h>

   main()

   {

   float  salario,perc,total;

   printf ("\nInforme o salario anual");

   scanf  ("%f",&salario);
   printf ("\nInforme o percentual de reazuste");

   scanf  ("%f",&perc);

   total = salario + (salario/100*perc);

   printf ("\n%.2f",total);

   getch();

     }
