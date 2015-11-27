#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

 main()
{
 int cont=0,num=0,m25=0,m50=0,m75=0,m100=0;

 while (num>=0)
 {
   cont= cont++;
   printf("Informe o numero %d\n",cont);
   scanf ("%d",&num);

   if (num<0)   break;
   else if (num<26) m25= m25++;
        else if (num<51) m50= m50++;
             else if (num<76) m75= m75++;
                  else if (num<101) m100= m100++;
 };

 printf ("\nContem %d numeros entre 0 e 25",m25);
 printf ("\nContem %d numeros entre 26 e 50",m50);
 printf ("\nContem %d numeros entre 51 e 75",m75);
 printf ("\nContem %d numeros entre 76 e 100",m100);

 getch();
}
