#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

main()
{
  int c5=5,c1=50,e;
  float s=c5/c1;

   do
   {
     s= s + c5/c1;
     c5= c5 + 5;
     c1= c1 - 1;
   }
   while (c1 != 1);
 printf ("valor de S é %2fO",s);

 getch();
}

