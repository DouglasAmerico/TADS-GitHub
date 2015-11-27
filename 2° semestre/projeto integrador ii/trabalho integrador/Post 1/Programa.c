 #include<stdio.h>
 #include<conio.h>
 #include<stdlib.h>
 #include<string.h>

//-------------------------------
   struct tipo_de_flores
   {
       char nome[10],cor[10];
       int registro;
   } tipo;
//-------------------------------
 struct estoque
 {
     char tipo[10],cor[10];
     int data_entrada[3],data_saida[3];
     float preco_pre_definido;
 } st_estoque;
//--------------------------------
  struct clientes
  {
      char nome[20],endereco[20],telefone[10],rg[10],cpf[10],cnpj[10];
      int dia_data,mes_data,ano_data,registro,pessoa;
  } cliente;
//--------------------------------
   int escolha_menu,escolha_1,escolha_2,escolha_3,cont;              //Area de declaração de variaveis globais....
   char teste;
//---------------------------------------------------

   FILE *arq_t_flores;
   void criar_tipo_flor()
   {
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       if (arq_t_flores == NULL) {arq_t_flores= fopen ("Tipo_de_flores.txt","w+b");}
       fclose(arq_t_flores);
   }
//--------------------------------
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
//--------------------------------
   FILE *arq_estoque;
   void criar_estoque()
   {
       arq_estoque= fopen ("Estoque.txt","r+b");
       if (arq_estoque == NULL) {arq_estoque= fopen ("Estoque.txt","w+b");}
       fclose (arq_estoque);
   }
//--------------------------------

//*###################################### Tipo de flores ---------------------
//cadastro de tipo de flores

//--------------------------------
 void cadastro_de_tipo_de_flores()
 {
     arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
     fseek (arq_t_flores,0, SEEK_END);
       do
       {
           fflush (stdin);
           printf ("Informe o nome da flor: ");
           gets   (tipo.nome);
           fflush (stdin);
           printf ("Informe a cor da flor %s: ",tipo.nome);
           gets   (tipo.cor);
           fflush (stdin);
           tipo.registro= tipo.registro + 1;
           printf ("Numero de registro da flor = %d\n",tipo.registro);
           printf ("-------------------------\n");
           fwrite (&tipo,sizeof(tipo),1,arq_t_flores);

           printf ("Deseja cadastrar mais flores? (S/N) ");
           scanf  ("%c",&teste);
           system ("cls");
       }
       while (toupper(teste) == 'S');
       fclose (arq_t_flores);
   }
 //-------------------------------
 // visualização do tipo de flores geral
   void visualizar_tipo_de_flores_geral()
   {
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
           printf ("Nome: %s\n",tipo.nome);
           printf ("Cor : %s\n",tipo.cor);
           printf ("Numero de registro: %d\n",tipo.registro);
           printf ("---------------------\n");
           getch();

       }
       fclose (arq_t_flores);
       system ("cls");
   }
//--------------------------------
// visualização de tipo de flores especifica
  void visualizar_tipo_de_flores_especifica()
  {
      int reg; // viariavel local de comparação co o numero de registro
      printf ("Informe o numero de registro da flor: ");
      scanf  ("%d",&reg);
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
         if (tipo.registro == reg)
         {
           printf ("Nome: %s\n",tipo.nome);
           printf ("Cor : %s\n",tipo.cor);
           printf ("Numero de registro: %d\n",tipo.registro);
           printf ("---------------------\n");
           getch();
         }
       }
       fclose (arq_t_flores);
       system ("cls");
  }
//--------------------------------
// alteração de tipo de flores
  void alteracao_de_tipo_de_flores()
  {
      int reg,contador_tipo_de_flores=0;
      printf ("informe o numero de registro da flor a ser alterada: ");
      scanf  ("%d",&reg);
      arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
      while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
      {
          ++contador_tipo_de_flores;
          if (tipo.registro == reg)
          {
              fseek (arq_t_flores,sizeof(tipo) * (contador_tipo_de_flores -1),SEEK_SET);
              fflush (stdin);
              printf ("Informe o novo nome de %s: ",tipo.nome);
              gets   (tipo.nome);
              fflush (stdin);
              printf ("Informe a nova cor: ");
              gets   (tipo.cor);
              fflush (stdin);
              fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
              fseek  (arq_t_flores,sizeof(tipo) * contador_tipo_de_flores, SEEK_SET);
          }
      }
  }
//--------------------------------
//************************************* clientes
//-------------------------------
  void cadastro_de_clientes()
  {
     int tipo;
     char test;
     arq_clientes= fopen ("Clientes.txt","r+b");
     fseek (arq_clientes,0, SEEK_END);
       do
       {
           fflush (stdin);
           printf ("Informe o nome do cliente: ");
           gets   (cliente.nome);
           fflush (stdin);
           printf ("O cliente %s é pessoa\n",cliente.nome);
           printf (" 1- Fisica\n");
           printf (" 2- Juridica\n");
           scanf  ("%d",&cliente.pessoa);
           fflush (stdin);

           // 1- Fisica
           // 2- Juridica
           //------------- verificação de pessoa fisica/juridica
           if (cliente.pessoa == 2)
           {
               fflush (stdin);
               printf ("Informe o CNPJ da empresa: ");
               gets   (cliente.cnpj);
           }
           else {fflush (stdin);
                 printf ("Informe o RG do clinte: ");
                 gets   (cliente.rg);
                 fflush (stdin);
                 printf ("Informe o CPF do cliente: ");
                 gets   (cliente.cpf);
                 }
           fflush (stdin);
           printf ("Informe o endereço do cliente: ");
           gets   (cliente.endereco);
           fflush (stdin);
           printf ("Informeo telefone do cliente: ");
           gets   (cliente.telefone);
           fflush (stdin);
           // verificação do tipo de pessoa para dat de nasc/criação
           if (cliente.pessoa == 2)
           {
               printf ("Informe a data de criação da empresa: \n");
               printf ("Dia: ");
               scanf  ("%d",&cliente.dia_data);
               printf (", Mês: ");
               scanf  ("%d",&cliente.mes_data);
               printf (", Ano: ");
               scanf  ("%d",&cliente.ano_data);
               printf ("\n");
           }
           else
           {
                 printf ("Informe o data de nascimento do cliente: \n");
                 printf ("Dia: ");
                 scanf  ("%d",&cliente.dia_data);
                 printf (", Mês: ");
                 scanf  ("%d",&cliente.mes_data);
                 printf (", Ano: ");
                 scanf  ("%d",&cliente.ano_data);
                 printf ("\n");
            }
            // numer de registro
           cliente.registro= cliente.registro + 1;
           printf ("Numero de registro do cliente = %d\n",cliente.registro);
           printf ("-------------------------\n");
           fwrite (&cliente,sizeof(cliente),1,arq_clientes);

           printf ("Deseja cadastrar mais clientes? (S/N) ");
           scanf  ("%c",&test);
           system ("cls");
       } while (toupper(test) == 'S');
      fclose (arq_clientes);
  }

//--------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------
  // Menus//

  //Menu tipo de flores
  //------------------------------

  void menu_tipo_de_flores()
  {
      system ("cls");
      do {
                              printf ("     ******************* - Tipo de Flores - *******************\n");
                              printf ("     ----------------------------------------------------------\n\n");
                              printf ("     Informe qual a opção a sera realizada:  \n");
                              printf ("     1- Cadastro de tipo de flores: ----------\n");
                              printf ("     2- Visualização dos cadastros geral: ----\n");
                              printf ("     3- Visualização dos cadastros especifica:\n");
                              printf ("     4- Aletração de cadastros: --------------\n");
                              printf ("     5- Exclusão de cadastros: ---------------\n");
                              printf ("     0- Retornar ao Menu Principal: ----------\n");

                              scanf ("%d",&escolha_1);
                              switch (escolha_1)
                              {
                                  case 1:{
                                  cadastro_de_tipo_de_flores();
                                  break;
                                  }

                                  case 2:{
                                  visualizar_tipo_de_flores_geral();
                                  break;
                                  }

                                  case 3:{
                                  visualizar_tipo_de_flores_especifica();
                                  break;
                                  }
                                  case 4:{
                                   alteracao_de_tipo_de_flores();
                                  break;}
                                  case 5:break;
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
                                 printf ("     5- Excluir cadastro de clientes: -------\n");
                                 printf ("     0- Retornar ao menu principal: ---------\n");

                                 scanf ("%d",&escolha_2);
                                 switch (escolha_2)
                                 {
                                     case 1:{
                                     cadastro_de_clientes();
                                     break;}

                                     case 2: break;
                                     case 3: break;
                                     case 4: break;
                                     case 5: break;
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
         printf ("Hello Word");
         getch();
        escolha_3=0;
     } while (escolha_3 != 0);
     system ("cls");
   }
//---------------------------------
  main()
  {
      do {
          printf ("     ******************* - Arranjos de Flores - *******************\n");
          printf ("     --------------------------------------------------------------\n\n");
          printf ("     Informe qual a opção a sera realizada:\n");
          printf ("      1- Tipo de Flores: ------------------\n");
          printf ("      2- Clientes: ------------------------\n");
          printf ("      3- Fornecedores: --------------------\n");
          printf ("      0- Sair: ----------------------------\n");

          scanf ("%d",&escolha_menu);
          switch (escolha_menu)
          {
              case 1:{
               criar_tipo_flor(); // crição do arquivo se for nescessario
               menu_tipo_de_flores(); // submenu
               break;
                         }

              case 2:{
                criar_clientes(); // criação do arquivo se for nescessario
                menu_clientes(); // submenu
                break;
                      }

              case 3:{
                       menu_fornecedores();
                       break;
                      }
              case 4: break;
              case 0: break;


          }
    } while (escolha_menu != 0);
  }
