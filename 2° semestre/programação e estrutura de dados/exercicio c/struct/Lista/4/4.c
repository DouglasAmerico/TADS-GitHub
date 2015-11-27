#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>

typedef struct
{
    char nome[20],estado[10],regiao[10];
    int populacao;
} cad2;

//-----------------------
FILE *arq_cad;
  cad2 cad;
void criar()
{
  arq_cad= fopen ("4Cadastro.txt","r+b");
    if (arq_cad == NULL)
    {
        arq_cad= fopen ("4Cadastro.txt","w+b");
    }
    fclose(arq_cad);
}
//-----------------------
void abrir()
{
 arq_cad= fopen ("4Cadastro.txt","r+b");
}
//-----------------------
void fechar()
{
    fclose (arq_cad);
}
//-----------------------
void cadastrar()
{
    fflush (stdin);
    printf ("Informe o nome do municipio: ");
    gets   (cad.nome);

    fflush (stdin);
    printf ("Informe o estado do municipio %s: ",cad.nome);
    gets   (cad.estado);
    strupr(cad.estado);

    fflush (stdin);
    printf ("Informe região do pais que se encontra: ");
    gets   (cad.regiao);

    fflush (stdin);
    printf ("Informe a população de %s: ",cad.nome);
    scanf  ("%d",&cad.populacao);

    fseek  (arq_cad,0,SEEK_END);
    fwrite (&cad, sizeof(cad2),1,arq_cad);

    getch();
    system ("cls");
  }
//-----------------------

void goias()
{
   //printf ("%s++",cad.estado);
   while (fread(&cad,sizeof(cad2),1,arq_cad))
   {
       //fseek (arq_cad,0, SEEK_END);
       if (strcmp(cad.estado, "GOIAS") == 0)
       {
           printf ("Nome: %s\n\n",cad.nome);
           getch();

       }
       //else {break;}
       break;
   }
}
//-----------------------

void calc_m_abitantes(int *maior)
{
   // printf ("Entrou no calc\n");
    while (fread(&cad,sizeof(cad2),1,arq_cad))
    {
      if (cad.populacao > *maior) {*maior= cad.populacao;}
    }

    //printf ("saio do calc\n");
}
//-----------------------

void mais_ab(int mai)
{
    //printf ("Entro nos abitantes\n");
       while (fread(&cad,sizeof(cad2),1,arq_cad))
    {
        if (cad.populacao == mai)
        {
            printf ("Nome: %s\n",cad.nome);
            printf ("Estado: %s\n",cad.estado);
            printf ("Região: %s\n",cad.regiao);
            printf ("População: %d\n\n",cad.populacao);
            getch();
        }
    }
//printf ("Saio dos abitantes\n");
}
//-----------------------

main()
{
    char quest[8],comp[8];
    //comp = ("xy234786");
    printf ("Informe a senha de acesso: ");
    gets (quest);
    //printf ("%s-%s",quest,comp);
    if (strcmp(quest, "xy234786") == 0){

  system ("cls");
  int maior=0,num,cont;
  printf ("\nQuantos municipios deseja Informar: ");
  scanf ("%d",&num);
  system ("cls");

  //variaveis
  char nome_maior[20],estado_maior[20],regiao_maior[10];
  int populacao_maior;
  criar();

  abrir();
  for (cont=0;cont<num;cont++)
  { cadastrar(); }
  fechar();

  abrir(); goias(); fechar();

  abrir(); calc_m_abitantes(&maior); fechar();

  abrir(); mais_ab(maior); fechar();
}
else {printf ("\n Senha incorreta");}
getch();
}
