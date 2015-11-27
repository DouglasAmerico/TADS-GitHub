
 #include<stdio.h>
 #include<conio.h>
 #include<stdlib.h>

 main()

 { int a=50000000,b=7000000,cont=0;
   do
   {
     a= a + (a/100*3);
     b= b + (b/100*2);
     cont= cont++;
     }
   while (a<b);

   printf ("Faram precisos %d anos para a ultrapaçagem",cont);

   getch();
  }
