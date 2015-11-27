 #include <stdio.h>
 #include <conio.h>

 main()

 {
   printf ("Informe o numero de pessoas\n");
   int pessoas = 0;
   float homem = 0,mulher = 0,m_menor=0,h_maior=0;

   scanf      ("%d",&pessoas);

   homem    = (pessoas/100*40);
   mulher   = (pessoas/100*60);

   m_menor = (mulher/100*80);
   h_maior = (homem/100*20);

   printf ("\n%2f Mulheres menores de idade\n",m_menor);
   printf ("%2
           f Homens maiores de idade\n",h_maior);

   getch();
 }

