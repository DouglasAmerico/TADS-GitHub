#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<string.h>
#include<windows.h>

//***********************************************************************************
// variaveis globais

 int escolha_menu,escolha_1,escolha_2,escolha_3,escolha_4,escolha_5,escolha_6,escolha_7,escolha_saida,teste;
//***********************************************************************************
// structs
//---------------------------
struct flor_montada
{
    char tipo[20],cor[20];
    int num_tipo,num_cor,registro,quantidade,numero_minimo,ativo;
} mont;

struct cor
  {
    char cor[20];
    int registro,ativo;
  } cores;

  struct flores
  {
      char tipo[20];
      int registro,ativo;
      //cores cor;
  } flor;
//---------------------------
struct
{
    char login[20],sen[20];
} senha;

//-------------------------------
  typedef struct
  {
      int num_reg_fornecedor,num_reg_cliente; // estruct de criação do numero de registro de clientes e fornecedores
  } num_registro;
//--------------------------------
   typedef  struct
   {
       char rua[20],bairro[20],cidade[20],estado[2],cep[10],num[5];
   } endereco;
//-------------------------------
 struct pes
 {
     char nome[20],telefone[20],rg[10],cpf[10],cnpj[10],tipo_f_oferecida[10];
     int dia_data,mes_data,ano_data,pessoa,ativo,reg_tipo_f_oferecida[50];
     num_registro registro;
     endereco ender;
 } pessoa;
//------------------------------
 struct arranjos
 {
     char tipo_montada[50][20],cor_montada[50][20];
     int registro,reg_f_montada[50],quantidade[50],ativo;
 } arranjo;

//------------------------------
 struct vendas
 {
    char cliente[20],nome_tipo[50][20],nome_cor[50][20];
    int registro,reg_arranjo[50],quantidade[50],reg_cliente;
 } venda;
//------------------------------
 struct compras
 {
    char fornecedor[20],nome_tipo[50][20],nome_cor[50][20];
    int registro,reg_arranjo[50],quantidade[50],reg_fornecedor;
 } compra;
//------------------------------
//*******************************************************************************************************************
//     arquivos
//---------------------------

FILE *arq_senha;
int criar_senha()
{
  int contador;
  arq_senha= fopen ("Senha.txt","r+b");
  contador=0;
  if (arq_senha == NULL)
  {
      contador= 1;
  }
  return contador;
}
//--------------------------
 FILE *arq_tipo_de_flores;
 void criar_tipo_flores()
 {
     arq_tipo_de_flores= fopen ("Tipo de Flores.txt","r+b");
     if (arq_tipo_de_flores == NULL)
     {
         arq_tipo_de_flores = fopen ("Tipo de Flores.txt","w+b");
     }
 }
 //-------------------------
 FILE *arq_cor_de_flores;
 void criar_cor_flores()
 {
     arq_cor_de_flores= fopen ("Cor de Flores.txt","r+b");
     if (arq_cor_de_flores == NULL)
     {
         arq_cor_de_flores== fopen ("Cor de Flores.txt","w+b");
     }
 }
 //-------------------------
 FILE *arq_mont_tipo;
 void criar_mont_tipo()
 {
     arq_mont_tipo= fopen ("Tipos Montados.txt","r+b");
     if (arq_mont_tipo == NULL)
     {
         arq_mont_tipo= fopen ("Tipos Montados.txt","w+b");
     }
 }
 //--------------------------
 FILE *arq_clientes;
 void criar_clientes()
 {
     arq_clientes= fopen ("Clientes.txt","r+b");
     if (arq_clientes == NULL)
     {
         arq_clientes= fopen ("Clientes.txt","w+b");
     }
 }
 //-----------------------------
  FILE *arq_fornecedores;
  void criar_fornecedores()
  {
      arq_fornecedores= fopen ("Fornecedores.txt","r+b");
      if (arq_fornecedores == NULL)
      {
          arq_fornecedores= fopen ("Fornecedores.txt","w+b");
      }
  }
 //-----------------------------
  FILE *arq_arranjos;
  void criar_arranjos()
  {
      arq_arranjos= fopen ("Arranjos.txt","r+b");
      if (arq_arranjos == NULL)
      {
          arq_arranjos= fopen ("Arranjos.txt","w+b");
      }
  }
 //-----------------------------
  FILE *arq_compra;
  void criar_compra()
  {
      arq_compra= fopen ("Compras.txt","r+b");
      if (arq_compra == NULL)
      {
          arq_compra= fopen ("Compras.txt","w+b");
      }
  }

 //-----------------------------
 FILE *arq_venda;
 void criar_vemda()
 {
     arq_venda= fopen ("Vendas.txt","r+b");
     if (arq_venda == NULL)
     {
         arq_venda= fopen ("Vendas.txt","w+b");
     }
 }
 //-----------------------------

//********************************************************************************************************
//    campos das senhas
//--------------------------

  void criar_senha_2()
  {
      if (arq_senha == NULL)
      {
          arq_senha = fopen ("Senha.txt","w+b");
      }
  }
//--------------------------
void criar_login ()
{
  arq_senha= fopen ("Senha.txt","r+b");

  printf ("Informe o nome de login: ");
  gets   (senha.login);
  fflush (stdin);
  printf ("Informe a senha: ");
  gets   (senha.sen);
  fflush (stdin);
  fwrite (&senha,sizeof(senha),1,arq_senha);

  fclose (arq_senha);
}
//--------------------------
  int altenticar_login(char l[20],char s[20])
  {
      int num= 1;

      arq_senha= fopen ("Senha.txt","r+b");
      while (fread(&senha,sizeof(senha),1,arq_senha))
      {
        if (strcmpi(senha.login,l)== 0)
        {
            if (strcmpi(senha.sen,s)== 0)
            {
                num = 0;
            }
        }
      }

      fclose (arq_senha);
      return num;
  }

//--------------------------------
// mensagens de erro e mensagens de aviso
 void erro_nao_disponivel(int num)
 {
     if (num == 1)
     {
     printf ("Arquivos não disponiveis\n");
     getch  ();}
 }

 void erro_nao_cadastrado(int num)
 {
     if (num == 1)
     {
     printf ("Arquivo não cadastrado\n");
     getch  ();}
 }

 void cadastro_sucesso()
 {
     printf ("Seu cadastro foi realizado com sucesso!\n");
     getch  ();
 }

 void excluido_sucesso()
 {
     printf ("Seu cadastro foi excluido com secesso!\n");
     getch  ();
 }

 void alterado_sucesso()
 {
     printf ("\nSeu cadastro foi alterado com sucesso!\n");
     getch  ();
 }

//--------------------------------
//******************************************************* flores ***************************************************
//--------------------------------

  void cadastrar_de_tipo_de_flores()
  {
    int numero_de_registro=0;

    arq_tipo_de_flores= fopen ("Tipo de Flores.txt","r+b");
    while (fread(&flor,sizeof(flor),1,arq_tipo_de_flores))
    {
        if (flor.registro != 0)
        {numero_de_registro= flor.registro;}
    }
    fclose (arq_tipo_de_flores);

    arq_tipo_de_flores= fopen ("Tipo de Flores.txt","r+b");
    fseek (arq_tipo_de_flores,0, SEEK_END);

        fflush (stdin);
        printf ("Informe o tipo de flor a ser cadastrada: ");
        gets   (flor.tipo);
        fflush (stdin);
        flor.ativo= 0;
        flor.registro= numero_de_registro + 1;

        printf ("Numero de registro %d\n",flor.registro);
        fwrite (&flor,sizeof(flor),1,arq_tipo_de_flores);
        cadastro_sucesso();
        fflush (stdin);

    fclose (arq_tipo_de_flores);
  }
//--------------------------------
 void visualizar_tipo_de_flores_geral()
 {
     int existe=1;
     arq_tipo_de_flores= fopen ("Tipo de Flores.txt","r+b");

     while (fread(&flor,sizeof(flor),1,arq_tipo_de_flores))
     {
         if (flor.ativo == 0)
         {
             existe= 0;
             printf ("Tipo:____ %s\n",flor.tipo);
             printf ("Registro: %d\n",flor.registro);
             printf ("--------------------------\n");
             getch  ();
         }
     }
    erro_nao_disponivel(existe);
    fclose (arq_tipo_de_flores);
 }
//--------------------------------
void visualizar_tipo_de_flores_especifica(int x,char nome_tipo[20])
{
     int num,existe=1;
     if (x == 0)
     {
     printf ("Infomre o numero de registro do tipo procurado:");
     scanf  ("%d",&num);
     }
     else {num=x;}
     arq_tipo_de_flores= fopen ("Tipo de Flores.txt","r+b");

     while (fread(&flor,sizeof(flor),1,arq_tipo_de_flores))
     {
         if (flor.ativo == 0)
         {
             if (flor.registro == num)
             {
                if (x != 0)
                {
                    strcpy(nome_tipo,flor.tipo);
                }
                existe =0;
                printf ("Tipo:____ %s\n",flor.tipo);
                printf ("Registro: %d\n",flor.registro);
                printf ("--------------------------\n");
                getch  ();
             }
         }
     }
     erro_nao_cadastrado(existe);
     fclose (arq_tipo_de_flores);
}
//--------------------------------
 void alteracao_de_tipo_de_flores()
 {
     int reg=0,contador=0,existe=1;
     printf ("Informe o nuumero deregistro do tipo a ser alterado:");
     scanf  ("%d",&reg);
     fflush (stdin);

     arq_tipo_de_flores= fopen ("Tipo de Flores.txt","r+b");

                                    while (fread(&flor,sizeof(flor),1,arq_tipo_de_flores))
                                       {
                                           if (flor.registro == reg)
                                            {
                                                if (flor.ativo == 0)
                                                {
                                                    existe= 0;
                                                    ++contador;
                                                    fseek  (arq_tipo_de_flores,sizeof(flor) * (contador - 1), SEEK_SET);
                                                    fflush (stdin);
                                                    printf ("Informe o novo tipo de %s: ",flor.tipo);
                                                    gets   (flor.tipo);
                                                    fflush (stdin);
                                                    fwrite (&flor,sizeof(flor),1,arq_tipo_de_flores);
                                                    fseek  (arq_tipo_de_flores,sizeof(flor) * contador, SEEK_SET);
                                                    alterado_sucesso();
                                                }
                                            }
                                        }
     //-----------------
     erro_nao_cadastrado(existe);
     fclose (arq_tipo_de_flores);
 }
//--------------------------------

  void exclusao_tipo_de_flores()
  {

     int reg=0,contador=0,existe=1;
     printf ("Informe o numero deregistro do tipo a ser excluido: ");
     scanf  ("%d",&reg);
     fflush (stdin);

     arq_tipo_de_flores= fopen ("Tipo de Flores.txt","r+b");

                                    while (fread(&flor,sizeof(flor),1,arq_tipo_de_flores))
                                       {
                                           if (flor.registro == reg)
                                            {
                                                if (flor.ativo == 0)
                                                {
                                                    existe= 0;
                                                    ++contador;
                                                    fseek  (arq_tipo_de_flores,sizeof(flor) * (contador - 1), SEEK_SET);
                                                    fflush (stdin);
                                                    flor.ativo= 1;
                                                    fflush (stdin);
                                                    fwrite (&flor,sizeof(flor),1,arq_tipo_de_flores);
                                                    fseek  (arq_tipo_de_flores,sizeof(flor) * contador, SEEK_SET);
                                                    excluido_sucesso();                                                }
                                            }
                                        }
     //-----------------
     erro_nao_cadastrado(existe);
     fclose (arq_tipo_de_flores);
  }
//--------------------------------
//************************************* cor a ser selecionada *********************************************
//--------------------------------
  void cadastrar_cor_a_ser_selecionada()
  {
      int numero_de_registro=0;

    arq_cor_de_flores= fopen ("Cor de Flores.txt","r+b");
    while (fread(&cores,sizeof(cores),1,arq_cor_de_flores))
    {
        if (cores.registro != 0)
        {numero_de_registro= cores.registro;}
    }
    fclose (arq_cor_de_flores);

    arq_cor_de_flores= fopen ("Cor de Flores.txt","r+b");
    fseek (arq_cor_de_flores,0, SEEK_END);

        fflush (stdin);
        printf ("Informe o cor da flor a ser cadastrada: ");
        gets   (cores.cor);
        fflush (stdin);
        cores.ativo= 0;
        cores.registro= numero_de_registro + 1;

        printf ("Numero de registro %d\n",cores.registro);
        fwrite (&cores,sizeof(cores),1,arq_cor_de_flores);
        cadastro_sucesso();
        fflush (stdin);

    fclose (arq_cor_de_flores);
  }
//--------------------------------
  void visualizar_cor_geral()
  {
      int existe=1;
      arq_cor_de_flores= fopen("Cor de Flores.txt","r+b");

      while (fread(&cores,sizeof(cores),1,arq_cor_de_flores))
      {
          if (cores.ativo == 0)
          {
              existe=0;
              printf ("Cor :______________ %s \n",cores.cor);
              printf ("Numero de registro: %d \n",cores.registro);
              printf ("------------------------------------\n");
              getch  ();
          }
      }

      erro_nao_disponivel(existe);
      fclose (arq_cor_de_flores);
  }

//--------------------------------
 void visualizar_cor_especifica(int x,char nome_cor[20])
   {
      int existe=1,reg=0;
      if (x == 0)
      {
        printf ("Informe o numero de registro dacor a ser visualizada: ");
        scanf  ("%d",&reg);
      }
      else {reg= x;}

      arq_cor_de_flores= fopen("Cor de Flores.txt","r+b");

      while (fread(&cores,sizeof(cores),1,arq_cor_de_flores))
      {
        if (cores.registro == reg)
         {
          if (cores.ativo == 0)
          {
              if (x != 0)
              {
                  strcpy (nome_cor,cores.cor);
              }
              existe=0;
              printf ("Cor :______________ %s \n",cores.cor);
              printf ("Numero de registro: %d \n",cores.registro);
              printf ("------------------------------------\n");
              getch  ();
          }
        }
      }

      erro_nao_disponivel(existe);
      fclose (arq_cor_de_flores);
  }

//--------------------------------
//********************************************** seleções *****************************************************************************************
//--------------------------------
     void selecionar_flores(int *tip,char nome_tipo[20])
    {    }
//-------------------------------
  void selecionar_cores(int *cor, char nome_cor[20])
  {     }
//--------------------------------
//*********************************************** cor montada *****************************************************************************************
//--------------------------------
  void montar_flor()
  {
      int tip=0,cor=0,numero_de_registro=0;
      char nome_tipo[20],nome_cor[20];

      fflush (stdin);
      arq_mont_tipo= fopen ("Tipos Montados.txt","r+b");
      while (fread(&mont,sizeof(mont),1,arq_mont_tipo))
        {
            if (mont.registro != 0)
            {numero_de_registro= mont.registro;}
        }
      fclose (arq_mont_tipo);

      arq_mont_tipo= fopen ("Tipos Montados.txt","r+b");
      fseek (arq_mont_tipo,0,SEEK_END);

      //----------------------

      arq_tipo_de_flores= fopen ("Tipo de Flores.txt","r+b");

      printf ("Selecione o tipo de flor a ser integrada: \n\n");
      visualizar_tipo_de_flores_geral();
      printf ("Informe o numero de registro do tipo requerido,\n caso não seje encontrado informe 0 e cadstre-o: ");
      scanf  ("%d",&tip);
      fflush (stdin);
      if (tip == 0)
      {
          cadastrar_de_tipo_de_flores();
          printf ("\nAgora continue seu cadastro de cor montada\n");
          getch  ();
          system ("cls");
          visualizar_tipo_de_flores_geral();
          printf ("Informe o numero de registro do tipo requerido,\n caso não seje encontrado informe 0 e cadstre-o: ");
          scanf  ("%d",&tip);
          fflush (stdin);
      }
      else {
             visualizar_tipo_de_flores_especifica(tip,nome_tipo);
                }
        fclose (arq_tipo_de_flores);

      //---------------------
      arq_cor_de_flores= fopen ("Cor de Flores.txt","r+b");

      printf ("\n---------------------------\n\n");
      printf ("Selecione a cor da flor a ser integrada: \n\n");
      visualizar_cor_geral();
      printf ("Informe o numero de registro da cor requerida, \n caso não seja encontrado informe 0 e cadastre-a: ");
      scanf  ("%d",&cor);
      fflush (stdin);
      if (cor == 0)
      {
          cadastrar_cor_a_ser_selecionada();
          printf ("Agora continue seu cadastro de cor montada\n");
          getch  ();
          system ("cls");
          visualizar_cor_geral();
          printf ("Informe o numero de registro da cor requerida, \n caso não seja encontrado informe 0 e cadastre-a: ");
          scanf  ("%d",&cor);
          fflush (stdin);
      }
      else {
                visualizar_cor_especifica(cor,nome_cor);
                }
      fclose (arq_cor_de_flores);
      //---------------------

      strcpy(mont.tipo,nome_tipo);
      mont.num_tipo= tip;
//--------
      strcpy (mont.cor,nome_cor);
      mont.num_cor= cor;
//-------
      mont.ativo=0;
      printf ("Defina um numero de estoque minimo para esse tipo de montado de flor: ");
      scanf  ("%d",&mont.numero_minimo);
      fflush (stdin);
      mont.quantidade=0;
      mont.registro= numero_de_registro + 1;
      printf ("Numero de registro do cadastro montado: %d\n",mont.registro);

      fwrite (&mont,sizeof(mont),1,arq_mont_tipo);
      cadastro_sucesso();

      fclose (arq_mont_tipo);
  }
//--------------------------------

 void visualizar_flor_montada_geral()
 {
   int existe=1;
   arq_mont_tipo= fopen ("Tipos Montados.txt","r+b");

   while (fread(&mont,sizeof(mont),1,arq_mont_tipo))
   {
       if (mont.ativo == 0)
       {
           existe=0;
           printf ("Tipo:_______________ %s\n",mont.tipo);
           printf ("Reg. Tipo:__________ %d\n",mont.num_tipo);
           printf ("Cor:________________ %s\n",mont.cor);
           printf ("Reg. Cor:___________ %d\n",mont.num_cor);
           printf ("Num. Minimo:________ %d\n",mont.numero_minimo);
           printf ("Quant. em estoque:__ %d\n",mont.quantidade);
           printf ("Regsitro T. Montado: %d\n",mont.registro);
           printf ("--------------------------\n\n");
           getch  ();
       }
   }
   erro_nao_cadastrado(existe);
   fclose (arq_mont_tipo);
 }
 //-------------------------------
 void visualizar_flor_montada_especifica(int x,char nome_tipo[20],char nome_cor[20])
 {
   int reg=0,existe=1;
   if (x == 0)
   {
        printf ("Informe o numero de registro da flor montada a ser visualizada: ");
        scanf   ("%d",&reg);
   }
   else {reg= x;}
   arq_mont_tipo= fopen ("Tipos Montados.txt","r+b");

   while (fread(&mont,sizeof(mont),1,arq_mont_tipo))
   {
     if (mont.registro == reg)
     {
       if (mont.ativo == 0)
       {
           if (x != 0)
           {
               strcpy(nome_tipo,mont.tipo);
               strcpy(nome_cor,mont.cor);
               existe=0;
           }
           else {
                    existe=0;
                    printf ("Tipo:_______________ %s\n",mont.tipo);
                    printf ("Reg. Tipo:__________ %d\n",mont.num_tipo);
                    printf ("Cor:________________ %s\n",mont.cor);
                    printf ("Reg. Cor:___________ %d\n",mont.num_cor);
                    printf ("Num. Minimo:________ %d\n",mont.numero_minimo);
                    printf ("Quant. em estoque:__ %d\n",mont.quantidade);
                    printf ("Regsitro T. Montado: %d\n",mont.registro);
                    printf ("--------------------------\n\n");
                    getch  ();
                }
        }
     }
   }

   erro_nao_disponivel(existe);
   fclose (arq_mont_tipo);
 }
 //-------------------------------
 void alterar_flor_montada()
 {

 }
 //-------------------------------
 void excluir_flor_montada()
 {

 }
//--------------------------------
//****************************************************** arrajos **********************************************
//--------------------------------
void cadastrar_arranjos()
{
   int cont=0,reg_arranjo=0,reg_flor_mont=0;
   char nome_tipo[20],nome_cor[20];

   arq_arranjos= fopen ("Arranjos.txt","r+b");

   while (fread(&arranjo,sizeof(arranjo),1,arq_arranjos))
   {
       if(arranjo.registro != 0)
       {reg_arranjo= arranjo.registro;}
   }

   fclose (arq_arranjos);
   //---------------
   arq_arranjos= fopen ("Arranjos.txt","r+b");
   fseek (arq_arranjos,0, SEEK_END);

   printf ("Selecione a flor montada a ser adicionada ao arranjo:\n\n");
   visualizar_flor_montada_geral();
   do {
        fflush (stdin);
        printf ("Informe o numero de registro da flor montada a ser selecionada,\n caso não achou a q queria informe 0:\n");
        scanf  ("%d",&reg_flor_mont);
        fflush (stdin);
        visualizar_flor_montada_especifica(reg_flor_mont,nome_tipo,nome_cor);
   //-------------
        cont= reg_arranjo;
        arranjo.reg_f_montada[cont]= reg_flor_mont;
        strcpy(arranjo.tipo_montada[cont],nome_tipo);
        strcpy(arranjo.cor_montada[cont],nome_cor);
   //-------------
        printf ("reg:  %d\n",arranjo.reg_f_montada[cont]);
        printf ("nome: %s\n",arranjo.tipo_montada[cont]);
        printf ("cor:  %s\n\n",arranjo.cor_montada[cont]);

   //-------------
        printf ("Informe a quantidade em unidades da flor %s, no arranjo: ",arranjo.tipo_montada);
        scanf  ("%d",&arranjo.quantidade);
        fflush (stdin);

        printf ("Deseja acrescentar mais flores ao arranjo? (S/N)\n");
        scanf  ("%c",&teste);
        fflush (stdin);
        ++cont;
   } while (toupper(teste) == 'S');

   arranjo.ativo= 0;
   arranjo.registro= reg_arranjo +1;
   printf ("Numero de registro: %d\n",arranjo.registro);
   fwrite (&arranjo,sizeof(arranjo),1,arq_arranjos);

   fclose (arq_arranjos);
}

//-------------------------------
void visualizar_arranjos_geral()
{
  int cont=0,registro_ja_visualizado=0,existe=1;
  arq_arranjos= fopen ("Arranjos.txt","r+b");

  while (fread(&arranjo,sizeof(arranjo),1,arq_arranjos))
  {
      if (arranjo.ativo == 0)
      {
          if (registro_ja_visualizado == 0)
           { printf ("Num. Registro __________%d\n\n",arranjo.registro);
             registro_ja_visualizado=1;
           }
          existe=0;
          printf ("Tipo ___________________%s\n",arranjo.tipo_montada[cont]);
          printf ("Cor:  __________________%s\n",arranjo.cor_montada[cont]);
          printf ("Num. Reg. Flor Montada: %d\n",arranjo.reg_f_montada[cont]);
          printf ("Quantidade: ____________%d\n",arranjo.quantidade[cont]);
          printf ("----------------------------\n\n");
          getch  ();
      }
   ++cont;
   erro_nao_disponivel(existe);
  }

  fclose (arq_arranjos);
}
//-------------------------------
 void visualizar_arranjos_especificos(int x,char nome_tipo[20],char nome_cor[20],int *numero_registro_flor_montada,int *quantidade_arranjo)
{
  int cont=0,reg=0,registro_ja_visualizado=0,existe=1;
  if (x == 0)
      {
        printf ("Informe o numerro de registro do arranjo a ser visualizado: ");
        scanf  ("%d",&reg);
      }
  else {reg= x;}

  arq_arranjos= fopen ("Arranjos.txt","r+b");

  while (fread(&arranjo,sizeof(arranjo),1,arq_arranjos))
  {
    if (arranjo.registro == reg)
    {
      if (arranjo.ativo == 0)
      {
          if (x != 0)
          {
              strcpy (nome_tipo,arranjo.tipo_montada[cont]);
              strcpy (nome_cor,arranjo.cor_montada[cont]);
              *numero_registro_flor_montada= arranjo.reg_f_montada[cont];
              *quantidade_arranjo= arranjo.quantidade[cont];
              existe=0;
          }
          else {
                    if (registro_ja_visualizado == 0)
                    { printf ("Num. Registro __________%d\n\n",arranjo.registro);
                      registro_ja_visualizado=1;
                    }
                    existe=0;
                    printf ("Tipo ___________________%s\n",arranjo.tipo_montada[cont]);
                    printf ("Cor:  __________________%s\n",arranjo.cor_montada[cont]);
                    printf ("Num. Reg. Flor Montada: %d\n",arranjo.reg_f_montada[cont]);
                    printf ("Quantidade: ____________%d\n",arranjo.quantidade[cont]);
                    printf ("----------------------------\n\n");
                    getch  ();
                }
      }
    }
   ++cont;
   erro_nao_cadastrado(existe);
  }

  fclose (arq_arranjos);
}

//-------------------------------
 void alterar_arranjos()
 {

 }
//-------------------------------
  void excluir_arranjos()
  {

  }
//-------------------------------
//************************************* clientes **********************************************************
//-------------------------------

  void cadastro_de_clientes()
  {
     int tipo,esc,numero_de_registro=0;

     arq_clientes= fopen ("Clientes.txt","r+b");
     while (fread(&pessoa,sizeof(pessoa),1,arq_clientes))
     {
         if (pessoa.registro.num_reg_cliente != 0)
         {numero_de_registro= pessoa.registro.num_reg_cliente;}
     }
     fclose (arq_clientes);

     arq_clientes= fopen ("Clientes.txt","r+b");
     fseek (arq_clientes,0, SEEK_END);


           fflush (stdin);
           printf ("Informe o nome do cliente: ");
           gets   (pessoa.nome);
           fflush (stdin);
           printf ("O cliente %s é pessoa\n",pessoa.nome);
           printf (" 1- Fisica\n");
           printf (" 2- Juridica\n");
           scanf  ("%d",&pessoa.pessoa);
           fflush (stdin);

           // 1- Fisica
           // 2- Juridica
           //------------- verificação de pessoa fisica/juridica
           if (pessoa.pessoa == 2)
           {
               fflush (stdin);
               printf ("Informe o CNPJ da empresa: ");
               gets   (pessoa.cnpj);
           }
           else {fflush (stdin);
                 printf ("Informe o RG do clinte: ");
                 gets   (pessoa.rg);
                 fflush (stdin);
                 printf ("Informe o CPF do cliente: ");
                 gets   (pessoa.cpf);
                 }
           fflush (stdin);
           printf ("Informe o endereço do cliente: \n");
           printf ("Rua:");
           gets   (pessoa.ender.rua);
           fflush (stdin);
           printf ("Numero: ");
           gets   (pessoa.ender.num);
           fflush (stdin);
           printf ("Cidade: ");
           gets   (pessoa.ender.cidade);
           fflush (stdin);
           printf ("bairro: ");
           gets   (pessoa.ender.bairro);
           fflush (stdin);
           printf ("Estado (UF): ");
           gets   (pessoa.ender.estado);
           fflush (stdin);
           printf ("CEP: ");
           gets   (pessoa.ender.cep);
           fflush (stdin);
           printf ("Informeo telefone do cliente: ");
           gets   (pessoa.telefone);
           fflush (stdin);

           // verificação do tipo de pessoa para dat de nasc/criação

           if (pessoa.pessoa == 2)
           {
               printf ("Informe a data de criação da empresa: \n");
               printf ("Dia: ");
               scanf  ("%d",&pessoa.dia_data);
               printf ("Mês: ");
               scanf  ("%d",&pessoa.mes_data);
               printf ("Ano: ");
               scanf  ("%d",&pessoa.ano_data);
               printf ("\n");
           }
           else
           {
                 printf ("Informe o data de nascimento do cliente: \n");
                 printf ("Dia: ");
                 scanf  ("%d",&pessoa.dia_data);
                 printf (", Mês: ");
                 scanf  ("%d",&pessoa.mes_data);
                 printf (", Ano: ");
                 scanf  ("%d",&pessoa.ano_data);
                 printf ("\n");
            }

           pessoa.registro.num_reg_cliente= numero_de_registro + 1; // cadastro de numero de registro
           pessoa.ativo= 0; // colocação do cliente como ativo
           printf ("Numero de registro do cliente = %d\n",pessoa.registro.num_reg_cliente);
           printf ("-------------------------\n");
           fwrite (&pessoa,sizeof(pessoa),1,arq_clientes);
           cadastro_sucesso();
           fflush (stdin);

      fclose (arq_clientes);
  }

//--------------------------------
 // visualizar clientes geral
  void visualizar_cadastro_de_clientes_geral()
  {
      int existe=1;
      arq_clientes= fopen ("Clientes.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_clientes))
      {
        if (pessoa.ativo == 0) // verificação do arquivo se esta ativo ou foi excluido
        {
          existe= 0; // variavel de localização ativa
          printf ("Nome:_______ %s\n",pessoa.nome);
          printf ("Endereço ---------------\n");
          printf ("Rua:________ %s\n",pessoa.ender.rua);
          printf ("Numero:_____ %s\n",pessoa.ender.num);
          printf ("Bairro:_____ %s\n",pessoa.ender.bairro);
          printf ("Cidade:_____ %s\n",pessoa.ender.cidade);
          printf ("Estado (UF): %s\n",pessoa.ender.estado);
          printf ("CEP: %s\n",pessoa.ender.cep);
          printf ("-------------------------\n");
          printf ("Telefone:___ %s\n",pessoa.telefone);
          if (pessoa.pessoa == 1)
          {
              printf ("CPF:________ %s\n",pessoa.cpf);
              printf ("RG:_________ %s\n",pessoa.rg);
              printf ("Data de nascimeto -------------\n");
            }
          else {printf ("CNPJ:_______ %s\n",pessoa.cnpj);
                 printf ("Data de criação -------------\n");}
          printf ("Dia: %d, ",pessoa.dia_data);
          printf ("Mês: %d, ",pessoa.mes_data);
          printf ("Ano: %d\n",pessoa.ano_data);
          printf ("Numero de registro: %d\n",pessoa.registro.num_reg_cliente);

          printf ("*********************************\n\n");
          getch  ();
      }
  }
      erro_nao_disponivel(existe);// verificação de variavel de localização ativa para que possa ou não gerar relatorio de erro
      fclose (arq_clientes);
      system ("cls");
  }
//--------------------------------
  void visualizar_cadastro_de_clientes_especifico (int x,char nome_cliente[20])
  {
      int num,existe=1;
      if (x == 0)
      {
        printf ("Informe o numero de registro do cliente pesquisado: ");
        scanf  ("%d",&num);
      }
      else {num=x;}

      arq_clientes= fopen ("Clientes.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_clientes))
      {
       if (pessoa.ativo == 0) // verificação do arquivo se esta ativo ou foi excluido
       {
       if (pessoa.registro.num_reg_cliente == num)
       {
          if (x != 0)
          {
              strcpy (nome_cliente,pessoa.nome);
          }
          else {
                existe= 0; // variavel de localização ativa
                printf ("Nome: %s\n",pessoa.nome);
                printf ("Endereço ---------------\n");
                printf ("Rua: %s\n",pessoa.ender.rua);
                printf ("Numero: %s\n",pessoa.ender.num);
                printf ("Bairro: %s\n",pessoa.ender.bairro);
                printf ("Cidade: %s\n",pessoa.ender.cidade);
                printf ("Estado (UF): %s\n",pessoa.ender.estado);
                printf ("CEP: %s\n",pessoa.ender.cep);
                printf ("-------------------------\n");
                printf ("Telefone: %s\n",pessoa.telefone);
                if (pessoa.pessoa == 1)
                {
                    printf ("CPF: %s\n",pessoa.cpf);
                    printf ("RG: %s\n",pessoa.rg);
                    printf ("Data de nascimeto -------------\n");
                }
                else {  printf ("CNPJ: %s\n",pessoa.cnpj);
                        printf ("Data de criação -------------\n");}
                        printf ("Dia: %d, ",pessoa.dia_data);
                        printf ("Mês: %d, ",pessoa.mes_data);
                        printf ("Ano: %d\n",pessoa.ano_data);
                        printf ("Numero de registro: %d\n",pessoa.registro.num_reg_cliente);

                        printf ("*********************************\n\n");
                        getch  ();
                    }

                }
            }
      }
      erro_nao_cadastrado(existe); // verificação  de variavel de localização ativa para gerar ou não relatorio de erro
      fclose (arq_clientes);
      system ("cls");
  }
//--------------------------------
  void alterar_cadastro_de_clientes()
  {
      int reg,contador=0,existe=0;
      printf ("informe o numero de registro do cliente a ser alterada: ");
      scanf  ("%d",&reg);
      arq_clientes= fopen ("Clientes.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_clientes))
      {
        if (pessoa.ativo == 0)
        {
          ++contador;
          if (pessoa.registro.num_reg_cliente == reg)
          {
              existe= 1; // variavel de localização ativa
              fseek (arq_clientes,sizeof(pessoa) * (contador -1),SEEK_SET);
              fflush (stdin);
              printf ("Informe o novo nome de %s: ",pessoa.nome);
              gets   (pessoa.nome);
              fflush (stdin);
              printf ("O cliente %s é pessoa\n",pessoa.nome);
           printf (" 1- Fisica\n");
           printf (" 2- Juridica\n");
           scanf  ("%d",&pessoa.pessoa);
           fflush (stdin);

           // 1- Fisica
           // 2- Juridica
           //------------- verificação de pessoa fisica/juridica
           if (pessoa.pessoa == 2)
           {
               fflush (stdin);
               printf ("Informe o novo CNPJ da empresa: ");
               gets   (pessoa.cnpj);
           }
           else {fflush (stdin);
                 printf ("Informe o novo RG do clinte: ");
                 gets   (pessoa.rg);
                 fflush (stdin);
                 printf ("Informe o novo CPF do cliente: ");
                 gets   (pessoa.cpf);
                 }
           fflush (stdin);
           printf ("Informe o novo endereço do cliente: \n");
           printf ("Rua:");
           gets   (pessoa.ender.rua);
           fflush (stdin);
           printf ("Numero: ");
           scanf  ("%d",&pessoa.ender.num);
           fflush (stdin);
           printf ("Cidade: ");
           gets   (pessoa.ender.cidade);
           fflush (stdin);
           printf ("bairro: ");
           gets   (pessoa.ender.bairro);
           fflush (stdin);
           printf ("Estado (UF): ");
           gets   (pessoa.ender.estado);
           fflush (stdin);
           printf ("CEP: ");
           gets   (pessoa.ender.cep);
           fflush (stdin);
           printf ("Informeo novo telefone do cliente: ");
           gets   (pessoa.telefone);
           fflush (stdin);
           // verificação do tipo de pessoa para dat de nasc/criação
           if (pessoa.pessoa == 2)
           {
               printf ("Informe a nova data de criação da empresa: \n");
               printf ("Dia: ");
               scanf  ("%d",&pessoa.dia_data);
               printf ("Mês: ");
               scanf  ("%d",&pessoa.mes_data);
               printf ("Ano: ");
               scanf  ("%d",&pessoa.ano_data);
               printf ("\n");
           }
           else
           {
                 printf ("Informe a nova data de nascimento do cliente: \n");
                 printf ("Dia: ");
                 scanf  ("%d",&pessoa.dia_data);
                 printf (", Mês: ");
                 scanf  ("%d",&pessoa.mes_data);
                 printf (", Ano: ");
                 scanf  ("%d",&pessoa.ano_data);
                 printf ("\n");
            }
              fflush (stdin);
              fwrite (&pessoa,sizeof(pessoa),1,arq_clientes);
              fseek  (arq_clientes,sizeof(pessoa) * contador, SEEK_SET);
              alterado_sucesso();
          }
        }
      }
      erro_nao_cadastrado(existe); // verificação da variavel de localização ativa para gerar ou não relatorio de erro
      fclose (arq_clientes);
  }
//--------------------------------
  void exclusao_cadastro_clientes()
  {
      int reg,contador=0,existe=0;
      char cert;
      printf ("informe o numero de registro do cliente a ser excluido: ");
      scanf  ("%d",&reg);
      arq_clientes= fopen ("Clientes.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_clientes))
      {
          ++contador;
          if (pessoa.registro.num_reg_cliente == reg)
          {
              fflush (stdin);
              printf ("Tem ceteza que deseja excluir %s? (S/N)",pessoa.nome);
              scanf  ("%c",&cert); // certeza de exclusão de arquivo
              fflush (stdin);
              if (toupper(cert) == 'S')
              {
              existe= 1; // variavel de localização ativa
              fseek (arq_clientes,sizeof(pessoa) * (contador -1),SEEK_SET);
              pessoa.ativo= 0;
              fflush (stdin);
              fwrite (&pessoa,sizeof(pessoa),1,arq_clientes);
              fseek  (arq_clientes,sizeof(pessoa) * contador, SEEK_SET);
              alterado_sucesso();
              }
          }
          if (pessoa.registro.num_reg_cliente > reg) // nova organização dos cadastros para as posições anteriores
          {
              fseek (arq_clientes,sizeof(pessoa) * (contador - 1),SEEK_SET);
              pessoa.registro.num_reg_cliente= pessoa.registro.num_reg_cliente - 1;
              fwrite (&pessoa,sizeof(pessoa),1,arq_clientes);
              fseek (arq_clientes,sizeof(pessoa) * contador, SEEK_SET);
          }
      }
      erro_nao_cadastrado(existe); // verificação da variavel de localização ativa para gerar ou não relatoro de erro
      fclose (arq_clientes);
  }

//--------------------------
//******************************************** fornecedores **************************************************
//--------------------------
  void cadastrar_fornecedores()
  {
     int tipo,esc,numero_de_registro=0,cont=0;

     arq_fornecedores= fopen ("Fornecedores.txt","r+b");
     while (fread(&pessoa,sizeof(pessoa),1,arq_clientes))
     {
         if (pessoa.registro.num_reg_fornecedor != 0)
         {numero_de_registro= pessoa.registro.num_reg_fornecedor;}
     }
     fclose (arq_fornecedores);

     arq_fornecedores= fopen ("Fornecedores.txt","r+b");
     fseek (arq_fornecedores,0, SEEK_END);


           fflush (stdin);
           printf ("Informe o nome do fornecedor: ");
           gets   (pessoa.nome);
           fflush (stdin);
           printf ("O cliente %s é pessoa\n",pessoa.nome);
           printf (" 1- Fisica\n");
           printf (" 2- Juridica\n");
           scanf  ("%d",&pessoa.pessoa);
           fflush (stdin);

           // 1- Fisica
           // 2- Juridica
           //------------- verificação de pessoa fisica/juridica
           if (pessoa.pessoa == 2)
           {
               fflush (stdin);
               printf ("Informe o CNPJ da empresa: ");
               gets   (pessoa.cnpj);
           }
           else {fflush (stdin);
                 printf ("Informe o RG do fornecedor: ");
                 gets   (pessoa.rg);
                 fflush (stdin);
                 printf ("Informe o CPF do fornecedor: ");
                 gets   (pessoa.cpf);
                 }
           fflush (stdin);
           printf ("Informe o endereço do fornecedor: \n");
           printf ("Rua:");
           gets   (pessoa.ender.rua);
           fflush (stdin);
           printf ("Numero: ");
           gets   (pessoa.ender.num);
           fflush (stdin);
           printf ("Cidade: ");
           gets   (pessoa.ender.cidade);
           fflush (stdin);
           printf ("bairro: ");
           gets   (pessoa.ender.bairro);
           fflush (stdin);
           printf ("Estado (UF): ");
           gets   (pessoa.ender.estado);
           fflush (stdin);
           printf ("CEP: ");
           gets   (pessoa.ender.cep);
           fflush (stdin);
           printf ("Informeo telefone do fornecedor: ");
           gets   (pessoa.telefone);
           fflush (stdin);

           // verificação do tipo de pessoa para dat de nasc/criação

           if (pessoa.pessoa == 2)
           {
               printf ("Informe a data de criação da empresa: \n");
               printf ("Dia: ");
               scanf  ("%d",&pessoa.dia_data);
               printf ("Mês: ");
               scanf  ("%d",&pessoa.mes_data);
               printf ("Ano: ");
               scanf  ("%d",&pessoa.ano_data);
               printf ("\n");
           }
           else
           {
                 printf ("Informe o data de nascimento do fornecedor: \n");
                 printf ("Dia: ");
                 scanf  ("%d",&pessoa.dia_data);
                 printf (", Mês: ");
                 scanf  ("%d",&pessoa.mes_data);
                 printf (", Ano: ");
                 scanf  ("%d",&pessoa.ano_data);
                 printf ("\n");
            }

           printf ("Selecione a flor pretendida\n");
           visualizar_tipo_de_flores_geral();
           printf ("Informe o numero de registro da cor desejada, \n caso não encontre informe 0 para cadastra-lo: \n");
           fflush (stdin);
//-----------------
           scanf ("%d",&pessoa.reg_tipo_f_oferecida[cont]);
           fflush (stdin);

            if (pessoa.reg_tipo_f_oferecida[cont] == 0)
            {
              cadastrar_de_tipo_de_flores();
              printf ("Agora continue seu cadastro de fornecedor\n");
              getch  ();
              system ("cls");
              visualizar_tipo_de_flores_geral();
              printf ("Informe o numero de registro da cor desejada, \n caso não encontre informe 0 para cadastra-lo: \n");
              scanf  ("%d",&pessoa.reg_tipo_f_oferecida);
              fflush (stdin);
             }

           printf ("Deseja selecionar outra? (S/N)");
           scanf  ("%c",&teste);
           for (cont=1;cont<50;cont++)
           {

             if (toupper(teste) == 'S')
             {
                fflush (stdin);
                scanf ("%d",&pessoa.reg_tipo_f_oferecida[cont]);
                fflush (stdin);
                printf ("Deseja selecionar outra? (S/N)");
                scanf  ("%c",&teste);
             }
             else {pessoa.reg_tipo_f_oferecida[cont]= 0;}
           }

           pessoa.registro.num_reg_fornecedor= numero_de_registro + 1; // cadastro de numero de registro
           pessoa.ativo= 0; // colocação do fornecedor como ativo
           printf ("Numero de registro do fornecedor = %d\n",pessoa.registro.num_reg_fornecedor);
           printf ("-------------------------\n");
           fwrite (&pessoa,sizeof(pessoa),1,arq_fornecedores);
           cadastro_sucesso();
           fflush (stdin);

      fclose (arq_fornecedores);
  }
 //--------------------------
   void visualizar_fornecedores_geral()
   {
      int existe=1,cont=0;
      arq_fornecedores= fopen ("Fornecedores.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_fornecedores))
      {
        if (pessoa.ativo == 0) // verificação do arquivo se esta ativo ou foi excluido
        {
          existe= 0; // variavel de localização ativa
          printf ("Nome:_______ %s\n",pessoa.nome);
          printf ("Endereço ---------------\n");
          printf ("Rua:________ %s\n",pessoa.ender.rua);
          printf ("Numero:_____ %s\n",pessoa.ender.num);
          printf ("Bairro:_____ %s\n",pessoa.ender.bairro);
          printf ("Cidade:_____ %s\n",pessoa.ender.cidade);
          printf ("Estado (UF): %s\n",pessoa.ender.estado);
          printf ("CEP: %s\n",pessoa.ender.cep);
          printf ("-------------------------\n");
          printf ("Telefone:___ %s\n",pessoa.telefone);
          if (pessoa.pessoa == 1)
          {
              printf ("CPF:________ %s\n",pessoa.cpf);
              printf ("RG:_________ %s\n",pessoa.rg);
              printf ("Data de nascimeto -------------\n");
            }
          else {printf ("CNPJ:_______ %s\n",pessoa.cnpj);
                 printf ("Data de criação -------------\n");}
          printf ("Dia: %d, ",pessoa.dia_data);
          printf ("Mês: %d, ",pessoa.mes_data);
          printf ("Ano: %d\n",pessoa.ano_data);
          printf ("--------------------\n");
          for (cont=0;cont<50;cont++)
          {
            if (pessoa.reg_tipo_f_oferecida[cont] != 0)
            {
                printf ("Reg. Flor Disponibilizada %d: %d\n",cont+1,pessoa.reg_tipo_f_oferecida[cont]);
            }
          }
          printf ("--------------------\n");
          printf ("Numero de registro: %d\n",pessoa.registro.num_reg_fornecedor);

          printf ("*********************************\n\n");
          getch  ();
      }
  }
      erro_nao_disponivel(existe);// verificação de variavel de localização ativa para que possa ou não gerar relatorio de erro
      fclose (arq_fornecedores);
      system ("cls");

   }
//---------------------------
 void visualizar_fornecedores_especifico(int x,char nome_fornecedor[20])
   {
      int existe=1,cont=0,reg=0;
      if (x== 0)
      {
          printf ("Informe o numero de registro do fornecedor a ser visulizado: ");
          scanf  ("%d",&reg);
      }
      else {reg= x;}

      arq_fornecedores= fopen ("Fornecedores.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_fornecedores))
      {
        if (pessoa.ativo == 0) // verificação do arquivo se esta ativo ou foi excluido
        {
        if (reg == pessoa.registro.num_reg_fornecedor)
        {
            if (x != 0)
            {
                strcpy(nome_fornecedor,pessoa.nome);
            }
           else {
                    existe= 0; // variavel de localização ativa
                    printf ("Nome:_______ %s\n",pessoa.nome);
                    printf ("Endereço ---------------\n");
                    printf ("Rua:________ %s\n",pessoa.ender.rua);
                    printf ("Numero:_____ %s\n",pessoa.ender.num);
                    printf ("Bairro:_____ %s\n",pessoa.ender.bairro);
                    printf ("Cidade:_____ %s\n",pessoa.ender.cidade);
                    printf ("Estado (UF): %s\n",pessoa.ender.estado);
                    printf ("CEP: %s\n",pessoa.ender.cep);
                    printf ("-------------------------\n");
                    printf ("Telefone:___ %s\n",pessoa.telefone);
                    if (pessoa.pessoa == 1)
                    {
                        printf ("CPF:________ %s\n",pessoa.cpf);
                        printf ("RG:_________ %s\n",pessoa.rg);
                        printf ("Data de nascimeto -------------\n");
                    }
                    else {printf ("CNPJ:_______ %s\n",pessoa.cnpj);
                            printf ("Data de criação -------------\n");}
                    printf ("Dia: %d, ",pessoa.dia_data);
                    printf ("Mês: %d, ",pessoa.mes_data);
                    printf ("Ano: %d\n",pessoa.ano_data);
                    printf ("--------------------\n");
                    for (cont=0;cont<50;cont++)
                    {
                        if (pessoa.reg_tipo_f_oferecida[cont] != 0)
                        {
                            printf ("Reg. Flor Disponibilizada %d: %d\n",cont+1,pessoa.reg_tipo_f_oferecida[cont]);
                        }
                    }
                    printf ("--------------------\n");
                    printf ("Numero de registro: %d\n",pessoa.registro.num_reg_fornecedor);

                    printf ("*********************************\n\n");
                    getch  ();
           }
        }
      }
  }
      erro_nao_disponivel(existe);// verificação de variavel de localização ativa para que possa ou não gerar relatorio de erro
      fclose (arq_fornecedores);
      system ("cls");

   }
 //------------------------
   void alterar_cadasstro_fornecedores()
   {

   }
 //--------------------------
   void excluir_cadastro_fornecedores()
   {

   }
//--------------------------
//************************************* vendas ***********************************************************
//-------------------------------
void cadastrar_venda()
{
    int arranjo=0,registro_venda=0,numero_registro_flor_montada=0,cont=0,contador=0,quantidade_arranjo=0,reg_cliente=0;
    char nome_cor[20],nome_flor[20],nome_cliente[20];

  arq_venda= fopen ("Vendas.txt","r+b");

  while (fread(&venda,sizeof(venda),1,arq_venda))
  {
      registro_venda= venda.registro;
  }

  fclose (arq_venda);
//-----------------
  arq_venda= fopen ("Vendas.txt","r+b");
  fseek (arq_venda, 0 ,SEEK_END);

  fflush (stdin);
  printf ("Selecione o(s) arranjo(s) a para ser(em) cadastrado(s): \n");
  visualizar_arranjos_geral();
  do {
        printf ("Informe o numero do registro a ser cadastrado,\ncaso não encontre o que queria informe 0:");
        scanf  ("%d",&arranjo);
        fflush (stdin);
        if (arranjo == 0)
        {
          cadastrar_arranjos();
          system ("cls");
          printf ("Continue com seu cadastro de venda...\n\n");
          printf ("Informe o numero do registro a ser cadastrado,\ncaso não encontre o que queria informe 0:");
          scanf  ("%d",&arranjo);
          fflush (stdin);
        }
        visualizar_arranjos_especificos(arranjo,nome_flor,nome_cor,&numero_registro_flor_montada,&quantidade_arranjo);
  //---------
        strcpy(venda.nome_tipo[cont],nome_flor);
        strcpy(venda.nome_cor[cont],nome_cor);
        venda.reg_arranjo[cont]= arranjo;
  //---------
        printf ("\nTipo: %s\n",venda.nome_tipo[cont]);
        printf ("Cor:    %s\n",venda.nome_cor[cont]);


        printf ("Registro do arranjo: %d\n\n",venda.reg_arranjo[cont]);

        //----------------
         arq_mont_tipo= fopen ("Tipos Montados.txt","r+b");

         while (fread(&mont,sizeof(mont),1,arq_mont_tipo))
         {
             if (mont.registro == numero_registro_flor_montada)
             {
                 if ((mont.quantidade - quantidade_arranjo)>0)
                 {
                   ++contador;
                   fseek  (arq_mont_tipo,sizeof(mont) * (contador - 1), SEEK_SET);
                   fflush (stdin);
                   mont.quantidade= mont.quantidade - quantidade_arranjo;
                   fwrite (&mont,sizeof(mont),1,arq_mont_tipo);
                   fseek  (arq_mont_tipo,sizeof(mont) * contador, SEEK_SET);
                 }
                 else { printf ("Não existe flores suficientes no estoque, adicione novas depois tente novamente\n");
                        getch ();
                        break;
                       }
             }
         }

         fclose (arq_mont_tipo);
        //----------------
        printf ("Deseja adicionar mais algum arranjo na venda? (S/N):");
        scanf  ("%c",&teste);
        fflush (stdin);
        ++cont;
  } while (toupper(teste)== 'S');
  //--------------
  printf ("Selecione o cliente que está fazendo o pedido:\n");
  visualizar_cadastro_de_clientes_geral();
  printf ("Informe o numero de registro do clientes,\n se o cliente ainda não esta cadastrado iforme 0:");
  scanf  ("%d",&reg_cliente);
  if (reg_cliente == 0)
  {
      cadastro_de_clientes();
      printf ("\n Agora continue seu cadastro de venda\n");
      visualizar_cadastro_de_clientes_geral();
      printf ("Informe o numero de registro do clientes,\n se o cliente ainda não esta cadastrado iforme 0:");
      scanf  ("%d",&reg_cliente);
  }
  else {
          visualizar_cadastro_de_clientes_especifico(reg_cliente,nome_cliente);
         }
   strcpy(venda.cliente,nome_cliente);
   venda.reg_cliente= reg_cliente;

  venda.registro= registro_venda + 1;
  printf ("\nNumero de registro da venda: %d\n",venda.registro);
  fwrite (&venda,sizeof(venda),1,arq_venda);
  cadastro_sucesso();
  close (arq_venda);
}
//-------------------------------
 void visualizar_venda_especifica()
 {
     printf ("Entrou\n");
     getch  ();

   int parte_ja_visualizada=0,cont=0,existe=1;

   arq_venda= fopen ("Vendas.txt","r+b");

   while (fread(&venda,sizeof(venda),1,arq_venda))
   {
     if (parte_ja_visualizada == 0)
      {
       printf ("Cliente: __________%s\n",venda.cliente);
       printf ("Reg. Cliente: _____%d\n",venda.reg_cliente);
       printf ("Registro da venda: %d\n\n",venda.registro);
       getch  ();
       parte_ja_visualizada=1;
      }
       existe=0;
      if (venda.quantidade[cont] != 0)
      {
       printf ("Tipo Flor: ________%s\n",venda.nome_tipo[cont]);
       printf ("Cor Flor: _________%s\n",venda.nome_cor[cont]);
       printf ("Reg. Arranjo: _____%d\n",venda.reg_arranjo[cont]);
       printf ("Quantidade: _______%d\n",venda.quantidade[cont]);
       printf ("-----------------------\n");
       getch  ();
      }
    ++cont;
   }
   erro_nao_cadastrado(existe);
   fclose (arq_venda);
 }
//-------------------------------
//*********************************** compra ************************************************************
//-------------------------------
  void cadastar_compra()
  {
          int arranjo=0,registro_compra=0,numero_registro_flor_montada=0,cont=0,contador=0,quantidade_arranjo=0,reg_fornecedor=0;
          char nome_cor[20],nome_flor[20],nome_fornecedor[20];

          arq_compra= fopen ("Compra.txt","r+b");

        while (fread(&compra,sizeof(compra),1,arq_compra))
        {
            registro_compra= compra.registro;
        }

        fclose (arq_compra);
//-----------------
 arq_compra= fopen ("Compra.txt","r+b");

  fseek (arq_compra, 0 ,SEEK_END);

  fflush (stdin);
  printf ("Selecione o(s) arranjo(s) a para ser(em) adicionado(s) ao estoque: \n");
  visualizar_arranjos_geral();
  do {
        printf ("Informe o numero do registro a ser adicionado,\ncaso não encontre o que queria informe 0:");
        scanf  ("%d",&arranjo);
        fflush (stdin);
        if (arranjo == 0)
        {
          cadastrar_arranjos();
          system ("cls");
          printf ("Continue com seu cadastro de compra...\n\n");
          printf ("Informe o numero do registro a ser adicionado,\ncaso não encontre o que queria informe 0:");
          scanf  ("%d",&arranjo);
          fflush (stdin);
        }
        visualizar_arranjos_especificos(arranjo,nome_flor,nome_cor,&numero_registro_flor_montada,&quantidade_arranjo);
  //---------
        strcpy(compra.nome_tipo[cont],nome_flor);
        strcpy(compra.nome_cor[cont],nome_cor);
        compra.reg_arranjo[cont]= arranjo;
  //---------
        printf ("\nTipo: %s\n",compra.nome_tipo[cont]);
        printf ("Cor:    %s\n",compra.nome_cor[cont]);

        printf ("Registro do arranjo: %d\n\n",compra.reg_arranjo[cont]);

        //----------------
         arq_mont_tipo= fopen ("Tipos Montados.txt","r+b");

         while (fread(&mont,sizeof(mont),1,arq_mont_tipo))
         {
             if (mont.registro == numero_registro_flor_montada)
             {
                   ++contador;
                   fseek  (arq_mont_tipo,sizeof(mont) * (contador - 1), SEEK_SET);
                   fflush (stdin);
                   mont.quantidade= mont.quantidade + quantidade_arranjo;
                   fwrite (&mont,sizeof(mont),1,arq_mont_tipo);
                   fseek  (arq_mont_tipo,sizeof(mont) * contador, SEEK_SET);

            }
         }

         fclose (arq_mont_tipo);
        //----------------
        printf ("Deseja adicionar mais algum arranjo na compra? (S/N):");
        scanf  ("%c",&teste);
        fflush (stdin);
        ++cont;
  } while (toupper(teste)== 'S');

  //--------------
  printf ("Selecione o fornecedor que forneceu o pedido:\n");
  visualizar_fornecedores_geral();
  printf ("Informe o numero de registro do fornecedor,\n se o fornecedor ainda não esta cadastrado informe 0:");
  scanf  ("%d",&reg_fornecedor);
  if (reg_fornecedor == 0)
  {
      cadastrar_fornecedores();
      printf ("\n Agora continue seu cadastro de compra\n");
      visualizar_fornecedores_geral();
      printf ("Informe o numero de registro do clientes,\n se o cliente ainda não esta cadastrado iforme 0:");
      scanf  ("%d",&reg_fornecedor);
  }
  else {
          visualizar_fornecedores_especifico(reg_fornecedor,nome_fornecedor);
         }
  strcpy(compra.fornecedor,nome_fornecedor);
  compra.reg_fornecedor= reg_fornecedor;
  compra.registro= registro_compra + 1;


  printf ("Nome:   %s\n",compra.fornecedor);
  printf ("Reg:    %d\n",compra.reg_fornecedor);
  getch  ();

  printf ("\nNumero de registro da compra: %d\n",compra.registro);
  fwrite (&compra,sizeof(compra),1,arq_compra);
  cadastro_sucesso();
  close (arq_compra);
  }
//-------------------------------
 void visualizar_compra_especifica()
 {

 }

//-------------------------------
// ******************************************** menus *********************************************************
//--------------------------
void menu_tipo_de_flores()
  {
      int aux1=0,aux2=0;
      char nome_tipo[20],nome_cor[20];
      system ("cls");
      do {
                              printf ("     **************** - Tipo e cores de Flores - ****************\n");
                              printf ("     ----------------------------------------------------------\n\n");
                              printf ("     Informe qual a opção a sera realizada:    ------\n");
                              printf ("     1- Cadastro de tipo de flores: -----------------\n");
                              printf ("     2- Cadastrar cores de flores: ------------------\n");
                              printf ("     3- Visualização dos cadastros geral tipo: ------\n");
                              printf ("     4- Visualização dos cadastros especifico tipo: -\n");
                              printf ("     5- Visualização dos cadastros geral cor: -------\n");
                              printf ("     6- Visualização dos cadastros especifico cor: --\n");
                              printf ("     7- Alteração de cadastros de tipos: ------------\n");
                              printf ("     8- Exclusão de cadastros de tipos: -------------\n\n");

                              printf ("     0- Retornar ao Menu Principal: -----------------\n");

                              scanf ("%d",&escolha_1);
                              switch (escolha_1)
                              {
                                  case 1: {
                                                do
                                                {
                                                    cadastrar_de_tipo_de_flores();
                                                    fflush (stdin);
                                                    printf ("Deseja cadastrar mais tipos? (S/N)");
                                                    scanf  ("%c",&teste);
                                                    system ("cls");
                                                } while (toupper(teste) == 'S');
                                                break;
                                            }


                                  case 2:{
                                            do {
                                                    cadastrar_cor_a_ser_selecionada();
                                                    fflush (stdin);
                                                    printf ("Deseja cadastrar mais cores? (S/N)");
                                                    scanf  ("%c",&teste);
                                                    system ("cls");
                                            } while (toupper(teste) == 'S');
                                           break;
                                          }

                                  case 3:{
                                           system ("cls");
                                           visualizar_tipo_de_flores_geral();
                                           break;
                                         }

                                  case 4:{
                                           system ("cls");
                                           visualizar_tipo_de_flores_especifica(aux1,nome_tipo);
                                           break;
                                          }

                                  case 5:{
                                           system ("cls");
                                           visualizar_cor_geral();
                                           break;
                                          }

                                  case 6:{
                                           system ("cls");
                                           visualizar_cor_especifica(aux2,nome_cor);
                                           break;
                                           }

                                  case 7:{ alteracao_de_tipo_de_flores();
                                             break;
                                            }

                                  case 8: { exclusao_tipo_de_flores();
                                            break;
                                            }
                              }
                         system ("cls");
                        } while (escolha_1 != 0);
  }
//------------------------------------
  void menu_tipo_montado()
  {
      int aux=0;
      char nome_tipo[20],nome_cor[20];
      system ("cls");
      do {
            printf ("     ********************* - Tipo Montado - *********************\n");
            printf ("     ----------------------------------------------------------\n\n");
            printf ("     Informe qual a opção a sera realizada:  \n");
            printf ("     1- Montar uma flor: --------------------\n");
            printf ("     2- Visulaizar flor montada geral: ------\n");
            printf ("     3- Visualizar flor montada especificos: \n");
            printf ("     4- Alterar cadastro de flor montada: ---\n");
            printf ("     5- Excluir cadastro de flor montada: ---\n\n");
            printf ("     0- Retornar ao menu principal: ---------\n");
            scanf  ("%d",&escolha_2);

            switch (escolha_2)
            {
                case 1:{
                           do {
                                montar_flor();
                                printf ("Deseja montar mais flores? (S/N)");
                                scanf  ("%c",&teste);
                                system ("cls");
                               } while (toupper(teste)== 'S');
                         break;
                            }

                case 2: {
                           system ("cls");
                           visualizar_flor_montada_geral();
                           break;
                            }
                case 3: {
                           system ("cls");
                           visualizar_flor_montada_especifica(aux,nome_tipo,nome_cor);
                           break;
                            }
                case 4: {
                            alterar_flor_montada();
                            break;
                            }
                case 5: {
                        excluir_flor_montada();
                        break;
                            }
            }
            system("cls");
            }while (escolha_2 != 0);
  }
//------------------------------------
  void menu_clientes()
  {
     int aux=0;
     char nome_cliente[20];
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

          scanf  ("%d",&escolha_3);
          switch (escolha_3)
          {
               case 1:{
                        do{
                              cadastro_de_clientes();
                              fflush (stdin);
                              printf ("Deseja cadastrar mais clientes? (S/N)");
                              scanf  ("%c",&teste);
                              system ("cls");
                           } while (toupper(teste) == 'S');
                        break;
                       }

                case 2:{
                         system ("cls");
                         visualizar_cadastro_de_clientes_geral();
                         break;}

                case 3:{
                         system ("cls");
                         visualizar_cadastro_de_clientes_especifico(aux,nome_cliente);
                         break;}

                case 4:{ alterar_cadastro_de_clientes();
                         break;}

                case 5:{ exclusao_cadastro_clientes();
                         break;}
           }
          system ("cls");
        } while (escolha_3 != 0);
  }
//---------------------------------
// menu fornecedores
//---------------------------------
   void menu_fornecedores()
   {
       int aux=0;
       char nome_fornecedor[20];
        system ("cls");
        do{
              printf ("     ********************* - Fornecedores - *********************\n");
              printf ("     ----------------------------------------------------------\n\n");
              printf ("     Informe qual a opção a sera realizada:  \n");
              printf ("     1- Cadastrar Fornecedores: -----------------\n");
              printf ("     2- Visulaizar Fornecedores geral: ----------\n");
              printf ("     3- Visualizar Fornecedores especificos: ----\n");
              printf ("     4- Alterar cadastro de Fornecedores: -------\n");
              printf ("     5- Excluir cadastro de Fornecedores: -------\n\n");
              printf ("     0- Retornar ao menu principal: -------------\n");

              scanf  ("%d",&escolha_4);
              switch (escolha_4)
              {
                  case 1:{
                          do{
                              cadastrar_fornecedores();
                              fflush (stdin);
                              printf ("Deseja cadastrar mais clientes? (S/N)");
                              scanf  ("%c",&teste);
                              system ("cls");
                             } while (toupper(teste) == 'S');
                             break;
                          }

                  case 2:{
                            visualizar_fornecedores_geral();
                            break;
                            }

                  case 3:{  visualizar_fornecedores_especifico(aux,nome_fornecedor);
                            break;
                            }

                  case 4:{}

                  case 5:{}
              }
              system ("cls");
            } while (escolha_4 != 0);
   }
//---------------------------------
  void menu_arranjos()
  {
      int aux=0,numero_registro_flor_montada=0,quantidade_arranjo=0;
      char nome_tipo[20],nome_cor[20];
      system ("cls");
      do{
              printf ("     *********************** - Arranjos - ***********************\n");
              printf ("     ----------------------------------------------------------\n\n");
              printf ("     Informe qual a opção a sera realizada:  \n");
              printf ("     1- Cadastrar Arranjos: -----------------\n");
              printf ("     2- Visulaizar Arranjos geral: ----------\n");
              printf ("     3- Visualizar Arranjos especificos: ----\n");
              printf ("     4- Alterar cadastro de Arranjos: -------\n");
              printf ("     5- Excluir cadastro de Arranjos: -------\n\n");
              printf ("     0- Retornar ao menu principal: ---------\n");
              scanf  ("%d",&escolha_5);
              switch (escolha_5)
              {
                  case 1:{
                            do{
                              cadastrar_arranjos();
                              fflush (stdin);
                              printf ("\nDeseja cadastrar mais Arranjos? (S/N)");
                              scanf  ("%c",&teste);
                              system ("cls");
                            } while (toupper(teste) == 'S');
                            break;
                         }
                 case 2:{
                            visualizar_arranjos_geral();
                            break;
                            }
                 case 3:{
                            visualizar_arranjos_especificos(aux,nome_tipo,nome_cor,&numero_registro_flor_montada,&quantidade_arranjo);
                            break;
                            }
                 case 4: {
                            alterar_arranjos();
                            break;
                            }
                 case 5: {
                            excluir_arranjos();
                            break;
                            }
              }

                system ("cls");
            } while (escolha_5 != 0);
  }

//---------------------------------
 void menu_compras()
 {
     system ("cls");
     do {
              printf ("     ************************ - Compras - ***********************\n");
              printf ("     ----------------------------------------------------------\n\n");
              printf ("     Informe qual a opção a sera realizada:  \n");
              printf ("     1- Realizar uma compra: -----------------\n");
              printf ("     2- Visulaizar Compra especifica: --------\n\n");
              printf ("     0- Retornar ao menu principal: ----------\n");

              scanf  ("%d",&escolha_6);
              switch (escolha_6)
              {
                  case 1: {
                            do{
                              cadastar_compra();
                              fflush (stdin);
                              printf ("\nDeseja cadastrar mais Arranjos? (S/N)");
                              scanf  ("%c",&teste);
                              system ("cls");
                            } while (toupper(teste) == 'S');
                            break;
                            }

                  case 2: {
                            visualizar_compra_especifica();
                            break;
                            }
              }

           system ("cls");
          } while (escolha_6 != 0);
 }
//---------------------------------
 void menu_vendas()
 {
     system ("cls");
     do {
              printf ("     ************************* - Vendas - ***********************\n");
              printf ("     ----------------------------------------------------------\n\n");
              printf ("     Informe qual a opção a sera realizada:  \n");
              printf ("     1- Registra uma Venda: ------------------\n");
              printf ("     2- Visulaizar venda especifica: ---------\n\n");
              printf ("     0- Retornar ao menu principal: ----------\n");

              scanf  ("%d",&escolha_6);
              switch (escolha_6)
              {
                  case 1: { cadastrar_venda();
                            break;
                            }

                  case 2: {
                            visualizar_venda_especifica();
                            break;
                            }
              }

           system ("cls");
          } while (escolha_6 != 0);
 }
//---------------------------------
//---------------------------------
// menu principal
//---------------------------------
  void menu_principal(int *cont,int *ok)
  {
              char login[20],sen[20];

              system ("cls");
              *cont=3;
              printf ("                     Seja bem vindo ao sistema !!!\n");
              getch  ();
              system ("cls");
              do {
                    printf ("     ********************** - Loja de Flores - **********************\n");
                    printf ("     --------------------------------------------------------------\n\n");
                    printf ("     Informe qual a opção a sera realizada:\n");
                    printf ("      1- Tipo e cores de Flores: ----------\n");
                    printf ("      2- Tipos Montados: ------------------\n");
                    printf ("      3- Clientes: ------------------------\n");
                    printf ("      4- Arranjos: ------------------------\n");
                    printf ("      5- Fornecedores: --------------------\n");
                    printf ("      6- Compra: --------------------------\n");
                    printf ("      7- Venda: ---------------------------\n\n");
                    printf ("      0- Sair: ----------------------------\n");


                    scanf ("%d",&escolha_menu);
                    switch (escolha_menu)
                    {
                        case 1:{
                                 criar_tipo_flores();
                                 criar_cor_flores();
                                 menu_tipo_de_flores(); // submenu
                                 break;
                                }
                        case 2:{
                                 criar_mont_tipo();
                                 menu_tipo_montado();
                                 break;
                                    }


                        case 3:{ criar_clientes(); // criação do arquivo se for nescessario
                                 system ("cls");
                                 printf ("Para ter acesso a esse recurso digite novamente seu login e senha\n\n");

                                 fflush (stdin);
                                 printf ("         Informe o login: ");
                                 gets   (login);
                                 fflush (stdin);
                                 printf ("         Informe a senha: ");
                                 gets   (sen);
                                 fflush (stdin);
                                 altenticar_login(login,sen);

                                if (altenticar_login(login,sen) == 0)
                                  {
                                    menu_clientes(); // submenu
                                   }
                                 else {printf ("Login e senha não compativeis\nretorne ao menu e tente novamente...");
                                        getch();
                                        system ("cls");
                                        break;}
                                 break;
                                 }

                        case 4:{
                                 criar_arranjos();
                                 menu_arranjos();
                                 break;
                                    }


                        case 5:{
                                 criar_fornecedores();
                                 system ("cls");
                                 printf ("Para ter acesso a esse recurso digite novamente seu login e senha\n\n");

                                 fflush (stdin);
                                 printf ("         Informe o login: ");
                                 gets   (login);
                                 fflush (stdin);
                                 printf ("         Informe a senha: ");
                                 gets   (sen);
                                 fflush (stdin);
                                 altenticar_login(login,sen);

                                if (altenticar_login(login,sen) == 0)
                                  {
                                      printf ("Funcionou\n");  // recolocar o menu fornecedores para funcionar totalmente ...
                                      menu_fornecedores(); // submenu
                                   }
                                 else {printf ("Login e senha não compativeis\nretorne ao menu e tente novamnete");
                                        getch();
                                        system ("cls");
                                        break;}

                                 break;
                                }

                        case 6:{
                                 criar_compra();
                                 system ("cls");
                                 printf ("Para ter acesso a esse recurso digite novamente seu login e senha\n\n");

                                 fflush (stdin);
                                 printf ("         Informe o login: ");
                                 gets   (login);
                                 fflush (stdin);
                                 printf ("         Informe a senha: ");
                                 gets   (sen);
                                 fflush (stdin);
                                 altenticar_login(login,sen);

                                if (altenticar_login(login,sen) == 0)
                                  {
                                     menu_compras(); // submenu
                                   }
                                 else {printf ("Login e senha não compativeis\nretorne ao menu e tente novamnete");
                                        getch();
                                        system ("cls");
                                        break;}

                                 break;
                                    }

                        case 7:{
                                 criar_vemda();
                                 system ("cls");
                                 printf ("Para ter acesso a esse recurso digite novamente seu login e senha\n\n");

                                 fflush (stdin);
                                 printf ("         Informe o login: ");
                                 gets   (login);
                                 fflush (stdin);
                                 printf ("         Informe a senha: ");
                                 gets   (sen);
                                 fflush (stdin);
                                 altenticar_login(login,sen);

                                if (altenticar_login(login,sen) == 0)
                                  {
                                    menu_vendas(); // submenu
                                   }
                                 else {printf ("Login e senha não compativeis\nretorne ao menu e tente novamnete");
                                        getch();
                                        system ("cls");
                                        break;}

                                 break;
                                    }

                        case 0: {*ok=0;
                                    break;
                                }

                        default:{
                                    system("cls");
                                    printf ("          Numero incompativel, finalizando o sistema em modo de segurança... \n");

                                    *ok=1;
                                    getch();
                                    escolha_menu=0;
                                  }

                    }
                } while (escolha_menu != 0);
  }
//---------------------------------
// main
//---------------------------------
main()
{
    int cont=0,ok=0;;
    char sen[20],login[20];

    criar_senha();

    if (criar_senha() == 1)
    {
        criar_senha_2();
        criar_login();
        menu_principal(&cont,&ok);
    }
    else if (criar_senha() == 0)
    {

      do
      {
          printf ("         Informe o login: ");
          gets   (login);
          fflush (stdin);
          printf ("         Informe a senha: ");
          gets   (sen);
          fflush (stdin);
          altenticar_login(login,sen);

          if (altenticar_login(login,sen) == 0)
          {
             menu_principal(&cont,&ok);
            }

 //--------------------------------------------------
 // caso a senha esteje incorreta


          else {
                    printf ("Senha incorreta\n\n");
                    //printf ("Tente novamente\n\n");
                    ++cont;
                    getch  ();
                    system ("cls");
                    printf ("           Selecione uma alternativa:\n");
                    printf ("           1- Tentar novamente\n");
                    printf ("           2- Redefinir a senha\n");
                    printf ("           3- Fechar o  programa\n");
                    scanf  ("%d",&escolha_saida);
                    fflush (stdin);

                    switch (escolha_saida)
                    {
                        case 1: {break;}
                        case 2:{
                                   printf ("Informe o login antigo: ");
                                   gets   (login);
                                   fflush (stdin);
                                   printf ("Informe a senha antiga: ");
                                   gets   (sen);
                                   fflush (stdin);
                                   altenticar_login(login,sen);
                                   int contador_nova_senha=0;

                                   if (altenticar_login(login,sen) == 0)
                                   {
                                       arq_senha= fopen ("Senha.txt","r+b");

                                       while (fread(&senha,sizeof(senha),1,arq_senha))
                                       {
                                            ++contador_nova_senha;
                                            fseek  (arq_senha,sizeof(senha) * (contador_nova_senha - 1), SEEK_SET);
                                            fflush (stdin);
                                            printf ("\nInforme o novo login: ");
                                            gets   (senha.login);
                                            fflush (stdin);
                                            printf ("Informe a nova senha: ");
                                            gets   (senha.sen);
                                            fflush (stdin);
                                            fwrite (&senha,sizeof(senha),1,arq_senha);
                                            fseek  (arq_senha,sizeof(senha) * contador_nova_senha, SEEK_SET);
                                       }

                                       fclose (arq_senha);
                                       printf ("\nRedirecionando ao Menu Principal\n");
                                       getch  ();
                                       menu_principal(&cont,&ok);
                                   }
                                   else {printf ("Senha não conpativel\n");
                                         getch  ();
                                            }
                                }
                        case 3: {cont=3;ok=2;}
                    }

                }

      } while (cont != 3);
    }
  system ("cls");
  //------------

  if (ok == 0) {printf ("                     Obrigado por usar o sistema !!!\n");}
  else if (ok == 2) {printf ("                     Obrigado por tentar usar o sistema !!!\n");}
  else printf ("                     --------------------------------- \n");
  getch  ();
}
