#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

struct funcionario
{
  int   matricula;
  char  nome[50];
  float salario;
  char  estado_civil[20];
  char  sexo;
  int   numero_dependentes;
  char  cidade[50];
  char  uf[2];
} func;

main()

{
 int cont_func = 0;
 FILE *arq_func;

 arq_func = fopen("dados.dat", "rb");
 if (arq_func == NULL)
 {
   arq_func = fopen("dados.dat", "wb");
 }

 printf("DIGITE A MATRICULA DO FUNCIONARIO: ");
 scanf("%d", &func.matricula);
   
 do 
 {
   printf("DIGITE O NOME DO FUNCIONARIO.....: ");
   scanf("%s", &func.nome); 
   printf("DIGITE O VALOR DO SALARIO........: ");
   scanf("%f", &func.salario);
   printf("DIGITE O ESTADO CIVIL............: ");
   scanf("%s", &func.estado_civil);
   printf("DIGITE O SEXO....................: ");
   scanf("%s", &func.sexo);
   printf("DIGITE O NUMERO DE DEPENDENTES...: ");
   scanf("%d", &func.numero_dependentes);
   printf("DIGITE A CIDADE ONDE RESIDE......: ");
   scanf("%s", &func.cidade); 
   printf("DIGITE A UF DA CIDADE............: ");
   scanf("%s", &func.uf); 

   // -----------------------------------------------------
   // Função para Converter String em MAIÚSCULO (strupr())
   // -----------------------------------------------------
   
   strupr(func.nome);
   strupr(func.estado_civil);
   func.sexo = toupper(func.sexo);
   strupr(func.cidade);
   strupr(func.uf);
   
   fwrite(&func, sizeof(func), 1, arq_func);

   system("cls");

   printf("DIGITE A MATRICULA DO FUNCIONARIO: ");
   scanf("%d", &func.matricula);
 } while (func.matricula != 0);

 fclose(arq_func);

 arq_func = fopen("dados.dat", "rb");
 
 while (fread(&func, sizeof(func), 1, arq_func))
 {
    printf("%d\n", func.matricula);
    getch();
 };

 while (fread(&func, sizeof(func), 1, arq_func))
 {
    ++cont_func;
    
    if ((func.salario                > 1500) &&
        (toupper(func.estado_civil) == "C" ) &&
        (strcmp(func.uf, "SP")      == 0   ))
    {
      system("cls");
      
      printf("NOME DO FUNCIONARIO   -> %s\n"  , func.nome);
      printf("SALARIO               -> %.2f\n", func.salario);
      printf("ESTADO CIVIL          -> %s\n"  , func.estado_civil);
      printf("SEXO                  -> %c\n"  , func.sexo);
      printf("NUMERO DE DEPENDENTES -> %d\n"  , func.numero_dependentes);
      printf("CIDADE                -> %s\n"  , func.cidade);
      printf("UF                    -> %s\n"  , func.uf);
      
      getch();
    }
 };

 fclose(arq_func);
  
 getchar();
}
