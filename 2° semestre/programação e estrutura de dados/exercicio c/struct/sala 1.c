#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>

struct funcionario
{
    char nome[50];
    float salario;
} func;

main()
{
    FILE *arq_func;
    int cont_func;

    arq_func= fopen ("Lista_de_Nomes.Douglas","r+b");
    if (arq_func == NULL)
    {
        arq_func= fopen ("Lista_de_Nomes.Douglas","w+b");
    }
    for (cont_func=1;cont_func<5; cont_func++)//laco para gravação do arquivo;
    {
      fflush (stdin);

      printf ("Informe o nome:  ");
      gets   (func.nome);
      //scanf  ("%s",&func.nome);//atribuiçãoo
      printf ("Informe o salario: ");//atribuição
      scanf  ("%f",&func.salario);

      fwrite (&func, sizeof(func), 1, arq_func);
    }

    fclose(arq_func);//fechando o arquivo;

    arq_func = fopen("Lista_de_Nomes.Douglas","r+b");
     system("cls");

    while (fread(&func, sizeof(func),1,arq_func))
    {
        printf ("Nome.....: %s\n",func.nome);
        printf ("Salario..: %2.f\n",func.salario);
        printf (".............\n");

    }
    getch();

    fseek (arq_func, 00 ,SEEK_SET);

    int cont_sal_1000=0,cont_sal_1000_2500=0,cont_sal_5000=0;

    while (fread(&func,sizeof (func),1,arq_func))
    {
        if (func.salario < 1000) ++cont_sal_1000;//++ antes da variavel aq é a mesma coisa q depois;
   else if (func.salario < 2500) ++cont_sal_1000_2500;
   else if (func.salario < 5000) ++cont_sal_5000;

        //soma_sal_antes_aum += func.salario;

        if (func.salario < 800)
        {
            func.salario= func.salario * 1.15; // o 1.15 é a soma dos 15% no salario;
            fseek(arq_func, sizeof(func)*(cont_func-1),SEEK_SET); // o valor do ponteiro esta sendo reposicionado para q fique na posição  certa ou seja - 1;
            fwrite(&func, sizeof(func),1,arq_func);

        }
    }
}
