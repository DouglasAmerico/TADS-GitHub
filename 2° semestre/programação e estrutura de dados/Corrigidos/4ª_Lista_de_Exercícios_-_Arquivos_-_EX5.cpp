#include <conio.h>
#include <stdio.h>
#include <stdlib.h>

struct funcionario
{
  char  nome[50];
  float salario;
} func;

main()
{
   FILE *arq_func;
   int cont_func                    , cont_func_sal_menor_1000, 
       cont_func_sal_entre_1000_2500, cont_func_sal_maior_5000;
   float soma_sal_antes_aumento, soma_sal_depois_aumento;
   
   arq_func = fopen("func.dat", "r+b");
   if (arq_func == NULL) arq_func = fopen("func.dat", "w+b");
   
   for (cont_func = 1; cont_func <= 5; ++cont_func)
   {
      printf("Entre com o Nome do Funcionario......: ");
      scanf("%s", &func.nome);
      printf("Entre com o Salario do Funcionario...: ");
      scanf("%f", &func.salario);
      
      printf("-----------------------------------------\n");
      
      fwrite(&func, sizeof(funcionario), 1, arq_func);
   }
   
   fclose(arq_func);
   
   system("cls");
   
   printf("Apresentando os Registros do Arquivo\n");
   printf("====================================\n");
   
   arq_func = fopen("func.dat", "r+b");
   while (fread(&func, sizeof(funcionario), 1, arq_func))
   {
      printf("Nome    -> %s\n"  , func.nome);
      printf("Salario -> %.2f\n", func.salario);
      printf("-------------------------------\n");
   }
   
   getch();
   
   fseek(arq_func, 0, SEEK_SET);
   
   cont_func                     = 0;
   cont_func_sal_menor_1000      = 0;
   cont_func_sal_entre_1000_2500 = 0;
   cont_func_sal_maior_5000      = 0;
   soma_sal_antes_aumento        = 0;
   soma_sal_depois_aumento       = 0;
   while (fread(&func, sizeof(funcionario), 1, arq_func))
   {
      ++cont_func;

      if      (func.salario < 1000) ++cont_func_sal_menor_1000;
      else if (func.salario <=2500) ++cont_func_sal_entre_1000_2500;
      else if (func.salario > 5000) ++cont_func_sal_maior_5000;
      
      soma_sal_antes_aumento += func.salario;

      if (func.salario < 800)
      {
         fseek(arq_func, sizeof(funcionario) * (cont_func - 1), SEEK_SET); 
         func.salario *= 1.15;
         fwrite(&func, sizeof(funcionario), 1, arq_func);
         fseek(arq_func, sizeof(funcionario) * cont_func, SEEK_SET); 
      }
      
      soma_sal_depois_aumento += func.salario;
   }
   
   fclose(arq_func);
   
   system("cls");
   
   printf("Apresentando os Registros Regravados do Arquivo\n");
   printf("===============================================\n");
      
   arq_func = fopen("func.dat", "r+b");
   while (fread(&func, sizeof(funcionario), 1, arq_func))
   {
      printf("Nome    -> %s\n", func.nome);
      printf("Salario -> %.2f", func.salario);
      printf("\n----------------------------\n");
   }
   
   getch();

   system("cls");

   printf("Quantidade de funcionarios com salario menor que 1000    -> %d\n", cont_func_sal_menor_1000);
   printf("Quantidade de funcionarios com salario entre 1000 e 2500 -> %d\n", cont_func_sal_entre_1000_2500);
   printf("Quantidade de funcionarios com salario maior que 5000    -> %d\n", cont_func_sal_maior_5000);

   printf("Soma Salarios Antes do Aumento  -> %.2f\n", soma_sal_antes_aumento);
   printf("Soma Salarios Depois do Aumento -> %.2f\n", soma_sal_depois_aumento);

   cont_func_sal_menor_1000      = 0;
   cont_func_sal_entre_1000_2500 = 0;
   cont_func_sal_maior_5000      = 0;


   getch();
}        
