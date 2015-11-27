
#include<stdio.h>
#include<stdlib.h>
#include<conio.h>

#define dim 2

typedef struct //funcionario
{
    char nome[20];
    float sal;
} func;
//-------------------------
    FILE *arq_func;
    func funcionario;
    int q_menor_1000,q_menor_2500,q_maior_5000,soma_sal_antes;
    float soma_sal_depois;
//-------------------------
void criar()
{
    arq_func= fopen("5Func.txt","r+b");
    if (arq_func == NULL) {arq_func= fopen ("5Func.txt","w+b");}
    fclose (arq_func);
}
//-------------------------
void abrir()
{
    arq_func= fopen("5Func.txt","r+b");
}
//------------------------
void fechar()
{
    fclose (arq_func);
}
//------------------------
void cadastrar()
{
    fflush (stdin);
    printf ("Informeo nome do  funcinário: ");
    gets   (funcionario.nome);
    fflush (stdin);
    printf ("Informe o salario: ");
    scanf  ("%f",&funcionario.sal);
    printf ("------------------------------\n");
    fwrite (&funcionario,sizeof(func),1,arq_func);
}

//-----------------------
void verificar()
{
  while (fread(&funcionario,sizeof(func),1,arq_func))
  {
    if (funcionario.sal < 1000) {++q_menor_1000;}
    else if (funcionario.sal < 2500) {++q_menor_2500;}
    else if (funcionario.sal > 5000) {++q_maior_5000;}
  }
}
//-----------------------
void aumentar()
{
    int cont=0;
    while (fread(&funcionario,sizeof(func),1,arq_func))
    {
    ++cont;
    soma_sal_antes= soma_sal_antes + funcionario.sal;
    if (funcionario.sal < 800)
    {
         fseek(arq_func, sizeof(func) * (cont - 1), SEEK_SET);
         funcionario.sal= funcionario.sal + (funcionario.sal/100*15);
         fwrite(&funcionario, sizeof(func), 1, arq_func);
         fseek(arq_func, sizeof(func) * cont, SEEK_SET);
    }
    soma_sal_depois= soma_sal_depois + funcionario.sal;
}
}
//-----------------------
void reg1()
{
  printf ("\nApresentação dos Registros:\n");
  printf ("---------------------------\n\n");
}
//-----------------------
void reg2()
{
   printf ("\nApresentação dos Registros Alterados:\n");
   printf ("-----------------------------------\n\n");
}
//-----------------------
void apresentar()
{
   while (fread(&funcionario,sizeof(func),1,arq_func))
   {
       printf ("Nome:    %s",funcionario.nome);
       printf ("Salario: %.2f",funcionario.sal);
       getch();
   }
}
//-----------------------
void apresentar_total()
{
    printf ("---------------------------------------------------------------\n");
    printf ("Existem %d funcionarios que ganham menos que 1000\n",q_menor_1000);
    printf ("Existem %d funcionarios que ganham mais de 1000 e menos de 2500\n",q_menor_2500);
    printf ("existem %d funcionarios que ganham mais de 5000\n\n",q_maior_5000);
    printf ("---------------------------------------------------------------\n");
    getch();
    printf ("O total dos salarios dos funcionarios é: %.2f\n",soma_sal_antes);
    printf ("O total dos salarios dos funcionarios depois do reajuste é: %.2f\n",soma_sal_depois);
    printf ("---------------------------------------------------------------\n");
}
//-----------------------
main()
{
    int cont;
    criar();

    abrir();
    for (cont=0;cont<dim;cont++)
    {cadastrar();}
    fechar();

    system ("cls");

    reg1();
    abrir(); apresentar(); fechar();
    //system ("cls");
    fseek(arq_func, 0, SEEK_SET);
    abrir(); verificar(); fechar();
    abrir(); aumentar(); fechar();
    reg2();
    abrir(); apresentar(); fechar();

    abrir(); apresentar_total(); fechar();
    getch();
}
