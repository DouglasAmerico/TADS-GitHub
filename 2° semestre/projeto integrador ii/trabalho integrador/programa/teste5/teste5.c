 #include<stdio.h>
 #include<conio.h>       //bibliotecas
 #include<stdlib.h>
 #include<string.h>
//------------------------------
//**************************************************************************8
//------------------------------
// structs
//------------------------------
  typedef struct
  {
      char cor[10];
      int registro;
  } cor_flor;
//------------------------------
   struct tipo_de_flores
   {
       char nome[10];
       int cor_num_registro,registro,ativo;
       cor_flor cor;
   } tipo;
//------------------------------
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
 struct st_estoque
 {
     char tipo[10],cor[10],fornecedor[20];
     int data_entrada[3],data_saida[3],quantidade_duzias,quantidade_unidade,valor_pago,estoque_mim,registro;
     float preco_pre_definido;
 } estoque;
//-------------------------------
 struct pessoas
 {
     char nome[20],telefone[20],rg[10],cpf[10],cnpj[10];
     int dia_data,mes_data,ano_data,pessoa,ativo,num_registro_tipo_de_flor_oferecida;
     num_registro registro;
     endereco ender;
 } pessoa;
//--------------------------------
//--------------------------------
   int escolha_menu,escolha_1,escolha_2,escolha_3,escolha_4,escolha_5,escolha_6,cont,existe=0;              //Area de declaração de variaveis globais....
   char teste;
//---------------------------------------------------
//************************************************************************************************************
//---------------------------------------------------
// criação dos arquivos
//---------------------------------------------------

   FILE *arq_t_flores; // arquivo tipo de flores
   void criar_tipo_flor()
   {
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       if (arq_t_flores == NULL) {arq_t_flores= fopen ("Tipo_de_flores.txt","w+b");}
       fclose(arq_t_flores);
   }
//--------------------------------
   FILE *arq_clientes;  // arquivo de clientes
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
   FILE *arq_estoque;  // arquivo de estooque
   void criar_estoque()
   {
       arq_estoque= fopen ("Estoque.txt","r+b");
       if (arq_estoque == NULL) {arq_estoque= fopen ("Estoque.txt","w+b");}
       fclose (arq_estoque);
   }
//--------------------------------
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
//---------------------------------
//***********************************************************************************************************
//---------------------------------
// mensagens de erro e aviso
//---------------------------------
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
 //----------------------------------
 //*********************************************************************************************************
 //----------------------------------
 // verificações e escolhas
 //----------------------------------
  void escolha_da_cor_tipo_de_flor()
  {
      arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
      while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
           printf ("Cor : %s\n",tipo.cor.cor);
           printf ("Numero de registro: %d\n",tipo.cor.registro);
           printf ("---------------------\n");
           getch();
       }
      fclose (arq_t_flores);
  }
//-----------------------------------
//***********************************************************************************************************
//-----------------------------------
// **********************tipo de flores******************************8
//-------------------------------------
// cadastro de tipo de flor "cor"
  void cadastrar_tipo_de_flor_cor()
  {
     arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
     fseek (arq_t_flores,0, SEEK_END);
     do
     {
         fflush (stdin);
         printf ("Informe a cor:");
         gets   (tipo.cor.cor);
         fflush (stdin);
         tipo.cor.registro++;
         fflush (stdin);
         printf ("Numero de registro : %d\n",tipo.cor.registro);
         printf ("-----------------------\n");
         fwrite (&tipo,sizeof(tipo),1,arq_t_flores);

         printf ("Deseja cadastar mais cores? (S/N)");
         fflush (stdin);
         scanf  ("%c",&teste);
     } while (toupper(teste) == 'S');
     fclose (arq_t_flores);
     system ("cls");
  }
//-----------------------------------
// cadastro de tipo de flores
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
           tipo.registro= tipo.registro + 1;
           tipo.ativo = 0; // colocação do cadastro para ativo
           printf ("Selecione a cor a ser cadastrada:\n\n");
           escolha_da_cor_tipo_de_flor();
           printf ("\nInforme o numero de registro da cor:");
           scanf  ("%d",&tipo.cor_num_registro);
           printf ("Numero de registro da flor = %d\n",tipo.registro);
           printf ("-------------------------\n");
           fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
           cadastro_sucesso();

           printf ("\nDeseja cadastrar mais flores? (S/N) ");
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
       existe=0;
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
        printf ("tipo ativo %d\n",tipo.ativo);
        if (tipo.ativo == 0)
        {
           existe= 0; // variavel de localização ativa
           printf ("Nome: %s\n",tipo.nome);
           printf ("Cor : %s\n",tipo.cor.cor);
           printf ("Numero de registro do tipo: %d\n",tipo.registro);
           printf ("Numero de registro da cor:  %d\n",tipo.cor.registro);
           printf ("---------------------\n");
           getch();
        }
       }
       erro_nao_cadastrado(existe); // vai verificar a variavel de localização ativa se o arquivo foi encontrada para determinar ou não relatorio de erro
       fclose (arq_t_flores);
       system ("cls");
   }
//--------------------------------
// visualização de tipo de flores especifica
  void visualizar_tipo_de_flores_especifica()
  {
      int reg;// viariavel local de comparação com o numero de registro
      existe=0;
      printf ("Informe o numero de registro da flor: ");
      scanf  ("%d",&reg);
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
         if (tipo.registro == reg) // verificação do arquivo compativel
         {
         if (tipo.ativo == 0) // verificação se o arquivo esta ativo ou foi excluido
         {
           existe= 0; // variavel de localizaçãoa ativa
           printf ("Nome: %s\n",tipo.nome);
           printf ("Cor : %s\n",tipo.cor.cor);
           printf ("Numero de registro do tipo: %d\n",tipo.registro);
           printf ("Numero de registro da cor:  %d\n",tipo.cor.registro);
           printf ("---------------------\n");
           getch();
           }
         }
       }
       erro_nao_cadastrado(existe); // verificação da variavel de localização ativa para determinar ou não relatorio de erro
       fclose (arq_t_flores);
       system ("cls");
  }
//--------------------------------
// alteração de tipo de flores
  void alteracao_de_tipo_de_flores()
  {
      int reg,contador_tipo_de_flores=0;
      existe=0;
      printf ("informe o numero de registro da flor a ser alterada: ");
      scanf  ("%d",&reg);
      arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
      while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
      {
          ++contador_tipo_de_flores;
          if (tipo.registro == reg)
          {
              existe= 0; // variavel de localização ativa
              fseek (arq_t_flores,sizeof(tipo) * (contador_tipo_de_flores -1),SEEK_SET);
              fflush (stdin);
              printf ("Informe o novo nome de %s: ",tipo.nome);
              gets   (tipo.nome);
              fflush (stdin);
              printf ("Selecione a nova cor a ser cadastrada:\n\n");
              escolha_da_cor_tipo_de_flor();
              printf ("\nInformr a nova cor de %s: ",tipo.nome);
              gets   (tipo.cor_num_registro);
              fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
              fseek  (arq_t_flores,sizeof(tipo) * contador_tipo_de_flores, SEEK_SET);
              alterado_sucesso(); // alteração com sucesso
          }
      }
      erro_nao_cadastrado(existe);// verificação da variavel de localização ativa para determinar ou não relatorio de erro
      fclose (arq_t_flores);
  }
//--------------------------------
  void exclusao_tipo_de_flores()
  {
     int reg,contador_tipo_de_flores=0;
     char result;
     existe=0;
      printf ("informe o numero de registro da flor a ser excluida: ");
      scanf  ("%d",&reg);
      arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
      while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
      {
          ++contador_tipo_de_flores;
          if (tipo.registro == reg)
          {
             if (tipo.registro == reg)
              {
                printf ("Deseja excluir mesmo excluir %s? (S/N)");
                fflush (stdin);
                scanf  ("%c",&result);
                if (toupper(result)== 'S')
                {
                    existe= 0; // variavel de localização ativa
                    fseek (arq_t_flores,sizeof(tipo) * (contador_tipo_de_flores -1),SEEK_SET);
                    fflush (stdin);
                    tipo.ativo= 1; // mudança para arquivo excluido
                    fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
                    fseek  (arq_t_flores,sizeof(tipo) * contador_tipo_de_flores, SEEK_SET);
                    excluido_sucesso();
                }
              }
             if (tipo.registro > reg) // nova organização dos cadastros para as posições anteriores
                {
                    printf ("Deseja excluir mesmo excluir %s? (S/N)");
                    fflush (stdin);
                    scanf  ("%c",&result);
                    if (toupper(result)== 'S')
                    {
                        fseek (arq_t_flores,sizeof(tipo) * (contador_tipo_de_flores - 1),SEEK_SET);
                        tipo.registro= tipo.registro - 1;
                        fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
                        fseek (arq_t_flores,sizeof(tipo) * contador_tipo_de_flores, SEEK_SET);
                    }
                }
            }
        }
      erro_nao_cadastrado(existe); // verificação da variavel de localização ativa para gerar ou não relatorio de erro
      fclose (arq_t_flores);
  }
//--------------------------------
//************************************* clientes
//-------------------------------
  void cadastro_de_clientes()
  {
     int tipo,esc;

     arq_clientes= fopen ("Clientes.txt","r+b");
     fseek (arq_clientes,0, SEEK_END);
       do
       {
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
            // numer de registro
           pessoa.registro.num_reg_cliente= pessoa.registro.num_reg_cliente + 1; // cadastro de numero de registro
           pessoa.ativo= 0; // colocação do cliente como ativo
           printf ("Numero de registro do cliente = %d\n",pessoa.registro.num_reg_cliente);
           printf ("-------------------------\n");
           fwrite (&pessoa,sizeof(pessoa),1,arq_clientes);
           cadastro_sucesso();

           printf ("Deseja cadastrar mais clientes? (S/N) ");
           fflush (stdin);
           scanf  ("%c",&teste);

           system ("cls");

       }
       while (toupper(teste) == 'S');
      fclose (arq_clientes);
  }
//--------------------------------
 // visualizar clientes geral
  void visualizar_cadastro_de_clientes_geral()
  {
      int existe=0;
      arq_clientes= fopen ("Clientes.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_clientes))
      {
    if (pessoa.ativo == 0) // verificação do arquivo se esta ativo ou foi excluido
       {
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
          else {printf ("CNPJ: %s\n",pessoa.cnpj);
                 printf ("Data de criação -------------\n");}
          printf ("Dia: %d, ",pessoa.dia_data);
          printf ("Mês: %d, ",pessoa.mes_data);
          printf ("Ano: %d\n",pessoa.ano_data);
          printf ("Numero de registro: %d\n",pessoa.registro.num_reg_cliente);

          printf ("*********************************\n\n");
          getch  ();
      }
  }
      erro_nao_cadastrado(existe);// verificação de variavel de localização ativa para que possa ou não gerar relatorio de erro
      fclose (arq_clientes);
      system ("cls");
  }
//--------------------------------
  void visualizar_cadastro_de_clientes_especifico ()
  {
      int num,existe=0;
      printf ("Informe o numero de registro do cliente pesquisado: ");
      scanf  ("%d",&num);

      arq_clientes= fopen ("Clientes.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_clientes))
      {
       if (pessoa.ativo == 0) // verificação do arquivo se esta ativo ou foi excluido
       {
       if (pessoa.registro.num_reg_cliente == num)
       {
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
          else {printf ("CNPJ: %s\n",pessoa.cnpj);
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
          ++contador;
          if (pessoa.registro.num_reg_cliente == reg)
          {
              existe= 0; // variavel de localização ativa
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
              existe= 0; // variavel de localização ativa
              fseek (arq_clientes,sizeof(pessoa) * (contador -1),SEEK_SET);
              pessoa.ativo= 1;
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

//--------------------------------------
//***********************************************************************************************************8
//-------------------------------------
//-------------------------------
//******************************************************************************************************************
//--------------------------------
  // Menus//

  //Menu tipo de flores
  //------------------------------

  void menu_tipo_de_flores()
  {
      //arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
      system ("cls");
      do {
                              printf ("     ******************* - Tipo de Flores - *******************\n");
                              printf ("     ----------------------------------------------------------\n\n");
                              printf ("     Informe qual a opção a sera realizada:    \n");
                              printf ("     1- Cadastro de tipo de flores: -----------\n");
                              printf ("     2- Cadastrar cores a serem selecionadas: -\n");
                              printf ("     3- Visualização dos cadastros geral: -----\n");
                              printf ("     4- Visualização dos cadastros especifica: \n");
                              printf ("     5- Aletração de cadastros: ---------------\n");
                              printf ("     6- Exclusão de cadastros: ----------------\n");
                              printf ("     0- Retornar ao Menu Principal: -----------\n");

                              scanf ("%d",&escolha_1);
                              switch (escolha_1)
                              {
                                  case 1:{
                                  cadastro_de_tipo_de_flores();
                                  break;
                                  }

                                  case 2:{
                                  cadastrar_tipo_de_flor_cor();
                                  break;
                                          }

                                  case 3:{
                                  visualizar_tipo_de_flores_geral();
                                  break;
                                         }

                                  case 4:{
                                   visualizar_tipo_de_flores_especifica();
                                  break;
                                          }

                                  case 5:{
                                      alteracao_de_tipo_de_flores();
                                      break;
                                          }
                                  case 6: {
                                       exclusao_tipo_de_flores();
                                       break;
                                            };
                              }
                         system ("cls");
                        } while (escolha_1 != 0);
    //fclose (arq_t_flores);
  }
//---------------------------------
// menu clientes

  void menu_clientes()
  {
      system ("cls");
      //arq_clientes= fopen ("Clientes.txt","r+b");
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
                                     //cadastro_de_clientes();
                                     break;}

                                     case 2:
                                     {
                                       //  visualizar_cadastro_de_clientes_geral();
                                         break;}

                                     case 3: {
                                         //visualizar_cadastro_de_clientes_especifico ();
                                         break;}

                                     case 4: {
                                         //alterar_cadastro_de_clientes();
                                         break;}

                                     case 5: {
                                         //exclusao_cadastro_clientes();
                                         break;}
                                  }
                system ("cls");
                } while (escolha_2 != 0);
        //fclose (arq_clientes);
  }
//---------------------------------
// menu fornecedores

   void menu_fornecedores()
   {
     system ("cls");
     //arq_fornecedores= fopen ("Fornecedores.txt","r+b");
     do
     {
        printf ("     ********************** - Fornecedores - **********************\n");
        printf ("     --------------------------------------------------------------\n\n");
        printf ("     Informe qual a opção a sera realizada:\n");
        printf ("     1- Cadastrar fornecedor: -------------\n");
        printf ("     2- Visualizar fornecedor geral: ------\n");
        printf ("     3- Visualizar fornecedor especifico: -\n");
        printf ("     4- Alterar cadastro: -----------------\n");
        printf ("     5- Excluir cadastro: -----------------\n");
        printf ("     0- Retornar ao menu principal: -------\n");

        scanf  ("%d",&escolha_3);
        switch (escolha_3)
        {
            case 1: {
                //cadastrar_forncedores();
                break;}
            case 2: {
                //visualizar_cadastro_de_fornecedores_geral();
                break;}

            case 3: {
                //visualizar_cadastro_de_fornecedores_especifico();
                break;}

            case 4: {
                //alterar_cadastro_de_fornecedores();
                break;}

            case 5: {
                //exclusao_cadastro_fornecedores();
                break;}
        }
       system ("cls");
     } while (escolha_3 != 0);

     //fclose (arq_fornecedores);
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
          printf ("     5- Excluir cadastro de estoque: ---------\n");
          printf ("     0- Retornar o menu principal: -----------\n");

          scanf  ("%d",&escolha_4);
          switch (escolha_4)
          {
              case 1: {
                 // cadastrar_entrada_de_estoque();
                  break;}

              case 2: break;
              case 3: break;
              case 4: break;
              case 5: break;
          }
        system ("cls");
      } while (escolha_4 != 0);
  }
//---------------------------------
//*********************************main*************************

main()
{
  do {
          printf ("     ******************* - Arranjos de Flores - *******************\n");
          printf ("     --------------------------------------------------------------\n\n");
          printf ("     Informe qual a opção a sera realizada:\n");
          printf ("      1- Tipo de Flores: ------------------\n");
          printf ("      2- Clientes: ------------------------\n");
          printf ("      3- Fornecedores: --------------------\n");
          printf ("      4- Estoque: -------------------------\n");
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
                       criar_fornecedores();
                       menu_fornecedores();
                       break;
                      }
              case 4: {
                  criar_estoque();
                  menu_estoque();
                  break;}
              case 0: break;


          }
    } while (escolha_menu != 0);
}
