#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void func (int *hab,int *m_sal,float *media_sal,float *media_fil,float *perc)
{
    int cont=0,salario=0,num=0;
   for (cont=0;cont< *hab;cont++)
   {
     printf ("Informe o salario\n");
     scanf ("%d",&salario);
     printf ("Informe o numero de filhos\n");
     scanf ("%d",&num);
     system ("cls");


     *media_sal= *media_sal + salario;
     *media_fil= *media_fil + num;
     if (salario > *m_sal) *m_sal= salario;
     if (salario <= 650) *perc= *perc + 1;
   }
}

main()
{
    printf ("Informe a quantidade de habitantes\n");
    int hab=0,m_sal=0;
    float media_sal=0,media_fil=0,perc=0;
    scanf ("%d",&hab);
    system ("cls");

    func (&hab,&m_sal,&media_sal,&media_fil,&perc);
    printf ("A média do salario da populaçao é %2.f\n",media_sal/hab);
    printf ("A media do numero de filhos é %2.f\n",media_fil/hab);
    printf ("O maior salario é %d\n",m_sal);
    printf ("O percentual de pessoas com salario ate 650RS é %.2f porcento\n",perc*100/hab);
    getch();
}
