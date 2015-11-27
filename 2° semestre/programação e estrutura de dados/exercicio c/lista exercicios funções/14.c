
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void func (int *funcionarios,int *reaj,float *t_sal_a,float *t_sal_d,float *media)
{
int cont=0;
   for (cont=0;cont< *funcionarios;cont++)
   {
    system ("cls");
    printf ("Infrome o numero da matriculado funcionario\n");
    int num=0,mat=0,sal=0;
    char nome[10];
    float reajuste=0;

    scanf ("%d",&mat);
    printf ("Informe o nome do funcionário\n");
    scanf ("%c",&nome);
    printf ("Informe o salario do funcionario\n");
    scanf ("%d",&sal);
    printf ("Informe o numero de filhos do %c",nome);
    scanf ("%d",&num);

    *t_sal_a= *t_sal_a + sal;
    reajuste= sal + (sal/100* *reaj);
    *t_sal_d= *t_sal_d + reajuste;
    *media= *media + num;
   };
}

main()
{
 int reaj=0,funcionarios=0;
 printf ("Informe quantos funcionarios serão lidos\n",funcionarios);

 float t_sal_a=0,t_sal_d=0,media=0;
 scanf ("%d",&funcionarios);
 printf ("Informe o percentual de reajuste dos salarios\n");
 scanf ("%d",&reaj);

 func (&funcionarios,&reaj,&t_sal_a,&t_sal_d,&media);

 printf ("O total dos salrio antes é %2.f \n",t_sal_a);
 printf ("O total dos salario reajustador é %2.f \n",t_sal_d);
 printf ("A media do numero de filhos é de %2.f Porcento\n",(media/funcionarios));

}
