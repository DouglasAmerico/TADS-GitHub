#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>

struct registro
{
   char desc[20],fabricante[20];
   int  id,ano,preco,quantidade;

} reg;
//----------------------
  FILE *arquivo;
  void criar()
  {
     arquivo= fopen("8Registro.txt","r+b");
     if (arquivo==NULL) {arquivo= fopen("8Registro.txt","w+b");}
  }
//----------------------
void abrir()
{
    arquivo= fopen("8Registro.txt","r+b");
}
//----------------------
void fechar()
{
    fclose(arquivo);
}
//----------------------
 void menu()
 {
     printf ("          ####### TUDO BARATO Ltda #######\n");
     printf ("------------------------------------------------------\n\n");
 }
//----------------------
main()
{
  menu();
  int quant;
  criar();

  do
  {
      printf ("Informe o numero de identificação da peça: ");
      scanf  ("%d",&quant);
      fflush(stdin);
      if (quant == 0) {system ("cls");break;}
      reg.id= quant;
      fflush(stdin);
      printf ("Informe a descrição da peça: ");
      gets   (reg.desc);
      fflush(stdin);
      printf ("Informe o fabricante: ");
      gets   (reg.fabricante);
      fflush(stdin);
      printf ("Informe o ano de fabricação: ");
      scanf  ("%d",&reg.ano);
      fflush(stdin);
      printf ("Informe o Preço Unitario: ");
      scanf  ("%d",&reg.preco);
      fflush(stdin);
      printf ("Informea quantidade disponivel: ");
      scanf  ("%d",&reg.quantidade);
      fflush(stdin);
      printf ("----------------------------------------\n");
      getch  ();
      system ("cls");
      menu();

      fwrite (&reg,sizeof(reg),1,arquivo);
  }
  while (quant != 0);
  fechar();

  abrir();
  int fab_2009=0,mais_1000=0,somatorio=0,cara=0,barata;
  barata= reg.preco;
  while (fread(&reg,sizeof(reg),1,arquivo))
  {
      if (reg.ano == 2009) {++fab_2009;}
      if (reg.preco > 1000) {++mais_1000;}
      if (((reg.id % 2)== 1) || (reg.preco > 30)) {somatorio= somatorio + reg.preco;}
      if (reg.preco > cara) {cara= reg.preco;}
      if (reg.preco < barata) {barata= reg.preco;}
  }
  fechar();

  printf ("- Foram fabricadas %d peças em 2009\n\n",fab_2009);
  printf ("- Contem %d peças mais caras que 1000 reias\n\n",mais_1000);
  printf ("- A soma dos preços de peças com 'Id' impar\n\n");
  printf ("ou mais caro que 30 reais é %d\n\n",somatorio);
  printf ("- %d é o presço mais caro\n\n",cara);
  printf ("- %d é o preço mais barato\n\n",barata);
  getch  ();
}
