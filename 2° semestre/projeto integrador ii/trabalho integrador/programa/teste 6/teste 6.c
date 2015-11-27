#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<string.h>

//***********************************************************************************
// variaveis globais

 int escolha_menu,escolha_1,escolha_2,escolha_3,escolha_4,escolha_5,escolha_6;
//***********************************************************************************
// criação dos arquivos
//-------------------------------------
//-------------------------------------
//  clientes
 FILE *arq_clientes;
 void criar_clientes()
 {
     arq_clientes= fopen ("Clientes.txt","r+b");
     if (arq_clientes == NULL)
     {
         arq_clientes= fopen ("Clientes.txt","w+b");
     }
    fclose (arq_clientes);
 }
//-------------------------------------
  FILE *arq_estoque;
  void criar_estoque()
  {
     arq_estoque= fopen ("Estoque.txt","r+b");
     if (arq_estoque == NULL)
     {
         arq_estoque= fopen ("Estoque.txt","w+b");
     }
    fclose (arq_estoque);
  }
//----------------------------------------
 FILE *arq_fornecedores;
 void criar_fornecedores()
 {
     arq_fornecedores= fopen ("Fornecedores.txt","r+b");
     if (arq_fornecedores == NULL)
     {
         arq_fornecedores= fopen ("Fornecedores.txt","w+b");
     }
    fclose (arq_fornecedores);
 }
//----------------------------------------
// tipo de flores
  FILE *arq_t_flores;
  void criar_tipo_flor()
  {
      arq_t_flores= fopen ("Flores.txt","r+b");
      if (arq_t_flores == NULL)
      {
          arq_t_flores= fopen ("Flores.txt","w+b");
      }
    fclose (arq_t_flores);
  }

 //--------------------------------------
 FILE *arq_cor_flor;
 void criar_cor_flor()
 {
     arq_cor_flor= fopen ("Cor Flor.txt","r+b");
     if (arq_cor_flor == NULL)
     {
         arq_cor_flor= fopen ("Cor Flor.txt","w+b");
     }
    fclose (arq_cor_flor);
 }
//***********************************************************************************
// structs

typedef struct
{
  char cpf[10],rg[10];
  int  data_de_nascimento[3];
} fisica;

typedef struct
{
   char cnpj[20];
   int data_de_criacao[3];
} juridica;

typedef struct
{
  char rua[20],bairro[20],cidade[20],estado_uf[2],cep[20];
  int numero;
} endereco;

struct pessoa
{
   char nome[20],telefone_comercial[20],telefone_para_recados[20],celular[20];
   int registro_cliente,registro_fornecedor;
   juridica jur;
   fisica   fis;
   endereco end;
} pessoas;

struct cor_flor
{
  char cor[20];
  int registro;
} cor;

struct tipo_de_flores
{
  char tipo[20];
  int  registro,registro_da_cor;
} flor;

struct est
{
  int tipo_flor,cor_flor,fornecedor;
  int data_entrada[3],data_saida[3],quantidade_duzias,quantidade_unidades,valor_pago,estoque_minimo,registro;
} estoque;
//***********************************************************************************
// opções escolha e verificaações
 void escolha_da_cor(int *contem)
 {
     arq_cor_flor= fopen("Cor Flor.txt","r+b");
     while (fread(&cor,sizeof(cor),1,arq_cor_flor))
     {
         printf ("Cor: %s\n",cor.cor);
         printf ("Numero de registro: %d\n",cor.registro);
         printf ("---------------------\n");
         getch  ();
     }
     fclose (arq_cor_flor);
 }
 //--------------------------------
 void cadastro_sucesso()
 {
     printf ("Seu cadastro foi realizado com sucesso!\n");
 }

// Tipo de Flores *******************************************************************
//----------------------------------
// Tipo de Flores


  void cadastrar_cor_a_ser_selecionada()
  {
     arq_cor_flor= fopen ("Cor Flor.txt","r+b");
     fseek (arq_cor_flor,0,SEEK_END);
     char teste;
     do
     {
       fflush (stdin);
       printf ("Informe o nome da cor: ");
       gets   (cor.cor);

       cor.registro= cor.registro + 1;
       printf ("Numero de registro: %d\n",cor.registro);
       cadastro_sucesso();
       printf ("-------------------\n");
       fwrite (&cor,sizeof(cor),1,arq_cor_flor);

       printf ("Deseja cadastrar uma nova cor: (S/N)");
       scanf  ("%c",&teste);
       system ("cls");
     } while (toupper(teste) == 'S');
     fclose (arq_cor_flor);
  }
//---------------------------------------
  void cadastro_de_tipo_de_flores()
  {
    arq_t_flores= fopen ("Flores.txt","r+b");
    fseek (arq_t_flores,0,SEEK_END);
    char teste;
    int contem=0;
    do
    {
        fflush (stdin);
        printf ("Informe o tipo da flor: ");
        gets   (flor.tipo);
        fflush (stdin);
        ++flor.registro;
        printf ("Selecione a cor desejada:\n");
        escolha_da_cor(&contem);
        printf ("\nCaso a cor pretendida não for encontrada digite 0 na informação abaixo:\n");
        printf ("Informe o numero de registro da cor deseja:\n");
        scanf  ("%d",&flor.registro_da_cor);
        if (flor.registro_da_cor == 0)
          {
              system ("cls");
              cadastrar_cor_a_ser_selecionada();
              system ("cls");
              escolha_da_cor(&contem);
              printf ("Informe o numero de registro da cor deseja:\n");
              scanf  ("%d",&flor.registro_da_cor);
           }

        fflush (stdin);
        printf ("Numero de registro do cadastro: %d\n",flor.registro);
        printf ("Numero de registro da cor: %d\n",flor.registro_da_cor);
        cadastro_sucesso();

        fwrite (&flor,sizeof(flor),1,arq_t_flores);

        printf ("------------------------------\n");
        printf ("Deseja cadastrar outro tipo de flor? (S?N)");
        scanf  ("%c",&teste);
    } while (toupper(teste) == 'S');

    fclose (arq_t_flores);
  }
//----------------------------------
  void visualizar_tipo_de_flores_geral()
  {
    arq_t_flores= fopen("Flores.txt","r+b");
     while (fread(&flor,sizeof(flor),1,arq_t_flores))
     {
         printf ("Tipo: %s\n",flor.tipo);
         printf ("Numero de registro da flor: %d\n",flor.registro_da_cor);
         printf ("Numero de registro do arquivo: %d\n",flor.registro);
         printf ("---------------------\n");
         getch  ();
     }
     fclose (arq_t_flores);
  }
 //---------------------------------
   void visualizar_tipo_de_flores_especifica()
   {
     arq_t_flores= fopen("Flores.txt","r+b");
     int numero;
     printf ("Informe o numero de registro a ser procurado: ");
     scanf  ("%d",&numero);

     while (fread(&flor,sizeof(flor),1,arq_t_flores))
     {
       if (flor.registro == numero)
       {
         printf ("Tipo: %s\n",flor.tipo);
         printf ("Numero de registro da flor: %d\n",flor.registro_da_cor);
         printf ("Numero de registro do arquivo: %d\n",flor.registro);
         printf ("---------------------\n");
         getch  ();
       }
     }
     fclose (arq_t_flores);
   }
 //---------------------------------
   void visualizar_cor_geral()
   {
     int contem=0;
     printf ("To aq\n");
     getch();
     escolha_da_cor(&contem);
   }
  //--------------------------------
    void visualizar_cor_especifica()
    {
        arq_cor_flor= fopen("Cor Flor.txt","r+b");
        int num;
        printf ("Informe o numero de registro da cor a ser procurada: ");
        scanf  ("%d",&num);
        while (fread(&cor,sizeof(cor),1,arq_cor_flor))
         {
           if (cor.registro == num)
           {
                printf ("Cor: %s\n",cor.cor);
                printf ("Numero de registro: %d\n",cor.registro);
                printf ("---------------------\n");
                getch  ();
           }
        }
        fclose (arq_cor_flor);
    }
  //--------------------------------
    void alteracao_de_tipo_de_flores()
    {
      arq_t_flores= fopen ("flores.txt","r+b");
      int cont,numero;
      printf ("informe o numero de registro da flor a ser alterada: ");
      scanf  ("%d",&numero);

      while (fread(&flor,sizeof(flor),1,arq_t_flores))
      {
          ++cont;
          if (flor.registro == numero)
          {
              //existe= 1; // variavel de localização ativa
              fseek (arq_t_flores,sizeof(flor) * (cont -1),SEEK_SET);
              fflush (stdin);
              printf ("Informe o novo nome de %s: ",flor.tipo);
              gets   (flor.tipo);
              fflush (stdin);
              printf ("Informe a nova cor: ");
              scanf  ("%d",&flor.registro_da_cor);
              fflush (stdin);
              fwrite (&flor,sizeof(flor),1,arq_t_flores);
              fseek  (arq_t_flores,sizeof(flor) * cont, SEEK_SET);
              //alterado_sucesso(); // alteração com sucesso
          }
      }
    }
//----------------------------------
    void exclusao_tipo_de_flores()
    {

    }
//-----------------------------------
  void alteracao_cor_de_flor()
  {

  }
//----------------------------------
  void exclusao_cor_de_flor()
  {

  }

// clientes *************************************************************************
//-----------------------------------
  void cadastro_de_clientes()
  {

  }
//-----------------------------------
  void visualizar_cadastro_de_clientes_geral()
  {

  }
 //----------------------------------
   void visualizar_cadastro_de_clientes_especifico()
   {

   }
 //----------------------------------
   void alterar_cadastro_de_clientes()
   {

   }
 //----------------------------------
   void exclusao_cadastro_clientes()
   {

   }
// Fornecedores *********************************************************************
//--------------------------------------
   void cadastrar_forncedores()
   {

   }
//--------------------------------------
   void visualizar_cadastro_de_fornecedores_geral()
   {

   }
 //-------------------------------------
  void visualizar_cadastro_de_fornecedores_especifico()
  {

  }
//-------------------------------------
  void alterar_cadastro_de_fornecedores()
  {

  }
//-------------------------------------
  void exclusao_cadastro_fornecedores()
  {

  }
// Estoque **************************************************************************
//-------------------------------------
  void cadastrar_entrada_de_estoque()
  {

  }
//-------------------------------------
   void visualizar_cadastro_estoque_geral()
   {

   }
//-------------------------------------
   void visualizar_cadastro_estoque_especifica()
   {

   }
//-------------------------------------
   void alterar_cadastro_de_estoque()
   {

   }
   //----------------------------------
   void excluir_cadastro_de_estoque()
   {

   }

// Menus ****************************************************************************
//----------------------

  //Menu tipo de flores
  //------------------------------

  void menu_tipo_de_flores()
  {
      system ("cls");
      do {
                              printf ("     **************** - Tipo e cores de Flores - ****************\n");
                              printf ("     ----------------------------------------------------------\n\n");
                              printf ("     Informe qual a opção a sera realizada:    -----\n");
                              printf ("     1- Cadastro de tipo de flores: ----------------\n");
                              printf ("     2- Cadastrar cores a serem selecionadas: ------\n");
                              printf ("     3- Visualização dos cadastros geral tipo: -----\n");
                              printf ("     4- Visualização dos cadastros especifica tipo: \n");
                              printf ("     5- Visualização dos cadastros geral cor: ------\n");
                              printf ("     6- Visualização dos cadastros especifica cor: -\n");
                              printf ("     7- Alteração de cadastros: --------------------\n");
                              printf ("     8- Exclusão de cadastros: ---------------------\n");
                              printf ("     9- Alteração de cadastros de cores: -----------\n");
                              printf ("     10- Exclusão de cadastros de cores: -----------\n\n");
                              printf ("     0- Retornar ao Menu Principal: ----------------\n");

                              scanf ("%d",&escolha_1);
                              switch (escolha_1)
                              {
                                  case 1:{ cadastro_de_tipo_de_flores();
                                           break;
                                          }

                                  case 2:{ cadastrar_cor_a_ser_selecionada();
                                           break;
                                          }

                                  case 3:{ visualizar_tipo_de_flores_geral();
                                           break;
                                         }

                                  case 4:{ visualizar_tipo_de_flores_especifica();
                                           break;
                                          }

                                  case 5:{ visualizar_cor_geral();
                                           break;
                                          }

                                  case 6:{ visualizar_cor_especifica();
                                           break;
                                           }

                                  case 7:{ alteracao_de_tipo_de_flores();
                                           break;
                                          }
                                  case 8: { exclusao_tipo_de_flores();
                                            break;
                                            }
                                  case 9:{ alteracao_cor_de_flor();
                                           break;}

                                  case 10:{ exclusao_cor_de_flor();
                                            break;}
                              }
                         system ("cls");
                        } while (escolha_1 != 0);
  }
//---------------------------------
// menu clientes

  void menu_clientes()
  {
      system ("cls");
      do {
                                 printf ("     *********************** - Clientes - ***********************\n");
                                 printf ("     ----------------------------------------------------------\n\n");
                                 printf ("     Informe qual a opção a sera realizada:  \n");
                                 printf ("     1- Cadastrar Clientes: -----------------\n");
                                 printf ("     2- Visulaizar clientes geral: ----------\n");
                                 printf ("     3- Visualizar clientes especificos: ----\n");
                                 printf ("     4- Alterar cadastro de clientes: -------\n");
                                 printf ("     5- Excluir cadastro de clientes: -------\n\n");
                                 printf ("     0- Retornar ao menu principal: ---------\n");

                                 scanf ("%d",&escolha_2);
                                 switch (escolha_2)
                                 {
                                     case 1:{ cadastro_de_clientes();
                                              break;}

                                     case 2:{ visualizar_cadastro_de_clientes_geral();
                                              break;}

                                     case 3:{ visualizar_cadastro_de_clientes_especifico();
                                              break;}

                                     case 4:{ alterar_cadastro_de_clientes();
                                              break;}

                                     case 5:{ exclusao_cadastro_clientes();
                                              break;}
                                  }
                system ("cls");
                } while (escolha_2 != 0);
  }
//---------------------------------
// menu fornecedores

   void menu_fornecedores()
   {
     system ("cls");
     do
     {
        printf ("     ********************** - Fornecedores - **********************\n");
        printf ("     --------------------------------------------------------------\n\n");
        printf ("     Informe qual a opção a sera realizada:\n");
        printf ("     1- Cadastrar fornecedor: -------------\n");
        printf ("     2- Visualizar fornecedor geral: ------\n");
        printf ("     3- Visualizar fornecedor especifico: -\n");
        printf ("     4- Alterar cadastro: -----------------\n");
        printf ("     5- Excluir cadastro: -----------------\n\n");
        printf ("     0- Retornar ao menu principal: -------\n");

        scanf  ("%d",&escolha_3);
        switch (escolha_3)
        {
            case 1:{ cadastrar_forncedores();
                     break;}

            case 2:{ visualizar_cadastro_de_fornecedores_geral();
                     break;}

            case 3:{ visualizar_cadastro_de_fornecedores_especifico();
                     break;}

            case 4:{ alterar_cadastro_de_fornecedores();
                     break;}

            case 5:{ exclusao_cadastro_fornecedores();
                     break;}
        }
       system ("cls");
     } while (escolha_3 != 0);
 }
//---------------------------------
// menu estoque
  void menu_estoque()
  {
      system ("cls");
      do
      {
          printf ("     ************************** - Estoque - *************************\n");
          printf ("     --------------------------------------------------------------\n\n");
          printf ("        Informe qual a opção a sera realizada:\n");
          printf ("     1- Cadastar entrada de flores no estoque:\n");
          printf ("     2- Visualizar estoque geral: ------------\n");
          printf ("     3- Visualizar estoque especifico: -------\n");
          printf ("     4- Alterar cadastro de estoque: ---------\n");
          printf ("     5- Excluir cadastro de estoque: ---------\n\n");
          printf ("     0- Retornar o menu principal: -----------\n");

          scanf  ("%d",&escolha_4);
          switch (escolha_4)
          {
              case 1:{ cadastrar_entrada_de_estoque();
                       break;}

              case 2:{ visualizar_cadastro_estoque_geral();
                       break;}

              case 3:{ visualizar_cadastro_estoque_especifica();
                       break;}

              case 4:{ alterar_cadastro_de_estoque();
                       break;}

              case 5:{ excluir_cadastro_de_estoque();
                       break;}
          }
        system ("cls");
      } while (escolha_4 != 0);
  }
//---------------------------------

//***********************************************************************************
// Menu Principal
main()
{
    do {
          printf ("     ********************** - Loja de Flores - **********************\n");
          printf ("     --------------------------------------------------------------\n\n");
          printf ("     Informe qual a opção a sera realizada:\n");
          printf ("      1- Tipo e  cores de Flores: ---------\n");
          printf ("      2- Clientes: ------------------------\n");
          printf ("      3- Fornecedores: --------------------\n");
          printf ("      4- Estoque: -------------------------\n\n");
          printf ("      0- Sair: ----------------------------\n");


          scanf ("%d",&escolha_menu);
          switch (escolha_menu)
          {
              case 1:{ criar_tipo_flor(); // crição do arquivo se for nescessario
                       criar_cor_flor();
                       menu_tipo_de_flores(); // submenu
                       break;
                         }

              case 2:{ criar_clientes(); // criação do arquivo se for nescessario
                       menu_clientes(); // submenu
                       break;
                      }

              case 3:{ criar_fornecedores();
                       menu_fornecedores();
                       break;
                      }
              case 4: { criar_estoque();
                        menu_estoque();
                        break;}

              case 0: break;

              default:{system("cls"); printf ("Vei  vc está querendo fuder o programa FDP? \n"); getch(); escolha_menu=0;}

          }
    } while (escolha_menu != 0);
}
