#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

struct veiculo
{
  char  vei_placa[10];
  char  vei_marca[20];
  char  vei_modelo[15];
  int   vei_ano;
  float vei_preco;       
} carro;

main()
 
{
 char opcao;
 int cont_vei, cont_vei_v, cont_ano_m5;
 float preco_tot = 0, perc_ano_m5;
 FILE *arq_vei;

 cont_vei = cont_ano_m5 = cont_vei_v = 0;
 arq_vei = fopen("dados.dat", "rb");
 if (arq_vei == NULL)
 {
   arq_vei = fopen("dados.dat", "wb");
 }

 do
  {
    system("cls");
    
    printf("DIGITE A PLACA DO VEICULO....: ");
    scanf("%s", &carro.vei_placa);
    printf("DIGITE A MARCA DO VEICULO....: ");
    scanf("%s", &carro.vei_marca);
    strupr(carro.vei_marca);
    printf("DIGITE O MODELO DO VEICULO...: ");
    scanf("%s", &carro.vei_modelo);
    strupr(carro.vei_modelo);
    printf("DIGITE O ANO DE FABRICACAO...: ");
    scanf("%d", &carro.vei_ano);
    printf("DIGITE O PRECO DO VEICULO....: ");
    scanf("%f", &carro.vei_preco);

    fflush(stdin); 

    fwrite(&carro, sizeof(carro), 1, arq_vei);

    printf("DESEJAR CADASTRAR OUTRO VEICULO? DIGITE (S)SIM OU (N)NAO: ");
    scanf("%c", &opcao);

  } while (toupper(opcao) == 'S');

  fclose(arq_vei);

  arq_vei = fopen("dados.dat", "rb");
  while (fread(&carro, sizeof(carro), 1, arq_vei))
  {
    if (strcmp(carro.vei_marca, "VOLKSWAGEN") == 0) cont_vei_v++;
    if (2013 - carro.vei_ano < 5) cont_ano_m5++;
    preco_tot += carro.vei_preco;
    cont_vei++;
  };

  perc_ano_m5 = (float(cont_ano_m5) / cont_vei) * 100;

  printf("\n");
  printf("Quantidade de Veiculos Cadastrados         -> %d \n"   , cont_vei); 
  printf("Total de Veiculos da Marca VOLKSWAGEN      -> %d \n"   , cont_vei_v);
  printf("Percentual de Veiculos com Menos de 5 anos -> %.2f \n" , perc_ano_m5);
  printf("Valor Medio dos Veiculos                   -> %.2f \n" , preco_tot / cont_vei); 

  getch();
}
