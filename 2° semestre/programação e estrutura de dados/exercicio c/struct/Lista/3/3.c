#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

struct funcionarios
{
    char nome[20],est_civ,sexo,cidade[20],uf[2];
    int matricula,salario,num_dep;
}func;

main()
{
   int mat;
   FILE *arq_func;
   arq_func= fopen ("3Funcionarios.txt","r+b");
   if (arq_func == NULL)
   {
       arq_func= fopen ("3Funcionarios.txt","w+b");
   }
  do
   {
      printf ("Informe o numero da matricula: ");
      scanf  ("%d",&mat);
      if (mat == 0) {break;}
      if (mat != 0) {func.matricula= mat;}
      //printf ("%d -- %d ++",func.matricula,mat);
      fflush (stdin);
      printf ("Informe o nome dos funcionario: ");
      gets   (func.nome);
      fflush (stdin);
      printf ("Informe o estado civil (C/S): ");
      scanf  ("%c",&func.est_civ);
      fflush (stdin);
      printf ("Informe o sexo do  funcionario (M/F): ");
      scanf  ("%c",&func.sexo);
      fflush (stdin);
      printf ("Informe o UF: ");
      scanf  ("%s",&func.uf);
      fflush (stdin);
      printf ("Informe o salario do funcionario: ");
      scanf  ("%d",&func.salario);
      fflush (stdin);
      printf ("Informe o numero de dependentes doo funcionario: ");
      scanf  ("%d",&func.num_dep);
      fflush (stdin);
      getch();
      system ("cls");

      fwrite (&func, sizeof(func),1,arq_func);
   }
   while (mat != 0);

   fclose (arq_func);
/*
   printf ("%c estado_civil\n",toupper(func.est_civ));
   printf ("%s salario\n",func.uf);
   printf ("%d uf\n\n",func.salario);
   getch();  */

   arq_func= fopen("3Funcionarios.txt","r+b");

   while (fread(&func,sizeof(func),1,arq_func))
   {
       //func.uf= strupr(func.uf);
       if ((toupper(func.est_civ) == 'C')  && (func.salario > 1500) && (func.uf == "sp"))
       {
           printf ("Nome: %s\n",func.nome);
           printf ("Numero de matricula: %d\n",func.matricula);
           if (toupper(func.est_civ) == 'C') {printf ("Estado Civil: Casado\n");}
           else printf ("Estado civil: Solteiro\n");
           if (toupper(func.sexo) == 'M') {printf ("Sexo: Masculino\n");}
           else printf ("Sexo: Feminino\n");
           printf ("UF: %s\n",func.uf);
           printf ("Salario: %d\n",func.salario);
           printf ("N° de Dependentes: %d\n",func.num_dep);
           getch();
       }
   }
   fclose (arq_func);
   getch();
}
