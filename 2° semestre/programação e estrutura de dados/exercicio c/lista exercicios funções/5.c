 #include<stdio.h>
 #include<conio.h>
 #include<stdlib.h>

  float func (int salario,int reajuste,char cd2[])
  {
      float final=0;
      if (cd2[1] == 'c') {final= salario + (salario/100*reajuste);}
      else {final= salario - (salario/100*reajuste);}

      return final;
  }

 main()
 {
     printf ("Informe o saldo\n");
     int sal=0,reaj=0;
     char cd[1];
     scanf  ("%d",&sal);
     printf ("Informe o reajuste\n");
     scanf  ("%d",&reaj);
     printf ("Seré um credito 'C' ou um debito 'D' ?\n");
     scanf  ("%c",&cd);
     //printf ("%c aa",cd);

     printf ("O novo saldo é %.2f",func(sal,reaj,cd));
     getch();
 }
