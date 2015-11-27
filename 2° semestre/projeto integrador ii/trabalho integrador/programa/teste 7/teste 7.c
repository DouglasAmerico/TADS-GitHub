 #include<stdio.h>
 #include<conio.h>
 #include<stdlib.h>
 #include<string.h>

//-------------------------------
   typedef struct
   {
       char nome[20];
       int registro_cor;
   } cores;
//-------------------------------
   struct tipo_de_flores
   {
       char nome[10];
       int registro_tipo,ativo;
       cores cor;
   } tipo;
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
 struct st_estoque
 {
     char tipo[10],cor[10],fornecedor[20];
     int data_entrada[3],data_saida[3],quantidade_duzias,quantidade_unidade,valor_pago,estoque_mim,registro;
     float preco_pre_definido;
 } estoque;
//-------------------------------
 struct pessoas
 {
     char nome[20],telefone[20],rg[10],cpf[10],cnpj[10],tipo_f_oferecida[10];
     int dia_data,mes_data,ano_data,pessoa,ativo;
     num_registro registro;
     endereco ender;
 } pessoa;
//--------------------------------
//--------------------------------
   int escolha_menu,escolha_1,escolha_2,escolha_3,escolha_4,escolha_5,escolha_6,cont;              //Area de declaração de variaveis globais....
   char teste;
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
//--------------------------------
// mensagens de erro e mensagens de aviso
 void erro_nao_disponivel(int num)
 {
     if (num == 0)
     {
     printf ("Arquivos não disponiveis\n");
     getch  ();}
 }

 void erro_nao_cadastrado(int num)
 {
     if (num == 0)
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
void escolha_da_cor()
 {
     arq_t_flores= fopen("Tipo de Flores.txt","r+b");
     while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
     {
         printf ("Cor: %s\n",tipo.cor.nome);
         printf ("Numero de registro: %d\n",tipo.cor.registro_cor);
         printf ("---------------------\n");
         getch  ();
         printf ("\n");
     }
     fclose (arq_t_flores);
 }
//*###################################### Tipo de flores ---------------------
//cadastro de tipo de flores

//--------------------------------
 void cadastro_de_tipo_de_flores()
 {
    arq_t_flores= fopen ("Tipo de flores.txt","r+b");
     fseek (arq_t_flores,0, SEEK_END);
       do
       {
           fflush (stdin);
           printf ("Informe o nome da flor: ");
           gets   (tipo.nome);
           fflush (stdin);
           printf ("Confira qual cor é a desejada e informe o seu numero de registro.\n");
           escolha_da_cor();
           printf ("Informe o numero de registro, caso não encontrada a cor desejada informe 0: ");
           scanf  ("%d",&tipo.cor.registro_cor);

           fflush (stdin);
           tipo.registro_tipo= tipo.registro_tipo + 1; // numero de registro adicionado altomaticamente
           tipo.ativo = 1; // colocação do cadastro para ativo
           printf ("Numero de registro da flor = %d\n",tipo.registro_tipo);
           printf ("ativo %d",tipo.ativo);
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
       int existe=0,num;
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
        num= tipo.cor.registro_cor;
        printf ("tipo ativo %d\n",tipo.ativo);
        if (tipo.ativo == 1)
        {
           existe= 1; // variavel de localização ativa
           printf ("Nome: %s\n",tipo.nome);
           while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
           {
              if (tipo.cor.registro_cor == num)
              {
                  printf ("Cor : %s\n",tipo.cor.nome);
              }
           }
           printf ("Numero de registro: %d\n",tipo.registro_tipo);
           printf ("---------------------\n");
           getch();
        }
       }
       erro_nao_disponivel(existe); // vai verificar a variavel de localização ativa se o arquivo foi encontrada para determinar ou não relatorio de erro
       fclose (arq_t_flores);
       system ("cls");
   }
//--------------------------------
// visualização de tipo de flores especifica
  void visualizar_tipo_de_flores_especifica()
  {
      int reg,existe=0,num; // viariavel local de comparação com o numero de registro
      printf ("Informe o numero de registro da flor: ");
      scanf  ("%d",&reg);
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
         num= tipo.cor.registro_cor;
         if (tipo.registro_tipo == reg) // verificação do arquivo compativel
         {
         if (tipo.ativo == 1) // verificação se o arquivo esta ativo ou foi excluido
         {
           existe= 1; // variavel de localizaçãoa ativa
           printf ("Nome: %s\n",tipo.nome);
           while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
           {
              if (tipo.cor.registro_cor == num)
              {
                  printf ("Cor : %s\n",tipo.cor.nome);
              }
           }
           printf ("Numero de registro: %d\n",tipo.registro_tipo);
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
      int reg,contador_tipo_de_flores=0,existe=0;
      printf ("informe o numero de registro da flor a ser alterada: ");
      scanf  ("%d",&reg);
      arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
      while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
      {
          ++contador_tipo_de_flores;
          if (tipo.registro_tipo == reg)
          {
              existe= 1; // variavel de localização ativa
              fseek (arq_t_flores,sizeof(tipo) * (contador_tipo_de_flores -1),SEEK_SET);
              fflush (stdin);
              printf ("Informe o novo nome de %s: ",tipo.nome);
              gets   (tipo.nome);
              fflush (stdin);
              escolha_da_cor();
              printf ("Informe a nova cor: ");
              scanf  ("%d",&tipo.cor.registro_cor);
              fflush (stdin);
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
     int reg,contador_tipo_de_flores=0,existe=0;
      printf ("informe o numero de registro da flor a ser excluida: ");
      scanf  ("%d",&reg);
      arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
      while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
      {
          ++contador_tipo_de_flores;
          if (tipo.registro_tipo == reg)
          {
              existe= 1; // variavel de localização ativa
              fseek (arq_t_flores,sizeof(tipo) * (contador_tipo_de_flores -1),SEEK_SET);
              fflush (stdin);
              tipo.ativo= 0; // mudança para arquivo excluido
              fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
              fseek  (arq_t_flores,sizeof(tipo) * contador_tipo_de_flores, SEEK_SET);
              excluido_sucesso();
           }
          if (tipo.registro_tipo > reg) // nova organização dos cadastros para as posições anteriores
          {
              fseek (arq_t_flores,sizeof(tipo) * (contador_tipo_de_flores - 1),SEEK_SET);
              tipo.registro_tipo= tipo.registro_tipo - 1;
              fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
              fseek (arq_t_flores,sizeof(tipo) * contador_tipo_de_flores, SEEK_SET);
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
           pessoa.ativo= 1; // colocação do cliente como ativo
           printf ("Numero de registro do cliente = %d\n",pessoa.registro.num_reg_cliente);
           printf ("-------------------------\n");
           fwrite (&pessoa,sizeof(pessoa),1,arq_clientes);
           cadastro_sucesso();

           printf ("Deseja cadastrar mais clientes? (1-Sim/2-Não) ");
           //
           scanf  ("%d",&esc);
           if (esc == 1) {teste= 'S';}
           else {teste= 'N';}

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
    if (pessoa.ativo == 1) // verificação do arquivo se esta ativo ou foi excluido
       {
          existe= 1; // variavel de localização ativa
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
      erro_nao_disponivel(existe);// verificação de variavel de localização ativa para que possa ou não gerar relatorio de erro
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
       if (pessoa.ativo == 1) // verificação do arquivo se esta ativo ou foi excluido
       {
       if (pessoa.registro.num_reg_cliente == num)
       {
          existe= 1; // variavel de localização ativa
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
//--------------------------------
//*****************************************************************************************************
// Verificações
//-------------------------------
 void revisao_existe_t_flores(char tipo_requerido[10],char cor_requerida[10],int *contem)
 {
       int existe=0;
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
        switch (*contem)
        {
            case 0: {
                      if (strcmp(strupr(tipo_requerido),strupr(tipo.nome))== 0)
                       {
                          if (tipo.ativo == 1)
                           {
                                existe= 1; // variavel de localização ativa
                                printf ("Nome: %s\n",tipo.nome);
                                printf ("Numero de registro: %d\n",tipo.registro_tipo);
                                printf ("---------------------\n");
                                getch();
                            }
                        }
                      break; }
            case 2: {
                      if (strcmp(strupr(tipo_requerido),strupr(tipo.nome))== 0)
                       {
                         if (tipo.ativo == 1)
                          {
                              if (strcmpi(cor_requerida,tipo.cor.registro_cor)== 0)
                              {
                                existe= 1; // variavel de localização ativa
                                printf ("Nome: %s\n",tipo.nome);
                                printf ("Numero de registro: %d\n",tipo.registro_tipo);
                                printf ("---------------------\n");
                                getch();
                              }
                          }
                        }
                      break;}
        }
       }
       erro_nao_disponivel(existe); // vai verificar a variavel de localização ativa se o arquivo foi encontrada para determinar ou não relatorio de erro
       if (existe == 1) {*contem=1;}
       else {*contem=0;}
       fclose (arq_t_flores);

 }
//-------------------------------
   void revisao_existe_fornecedor(char fornecedor_requerido[20],int *contem)
   {
       int existe=0;
       arq_fornecedores= fopen("fornecedores.txt","r+b");
       while (fread(&pessoa,sizeof(pessoa),1,arq_fornecedores))
       {
           if (strcmpi(fornecedor_requerido,estoque.fornecedor)== 0)
           {
               if (pessoa.ativo == 1)
               {
                   existe= 1;
                   printf ("Nome: %s\n",pessoa.nome);
                   printf ("Registro: %d\n",pessoa.registro);
                   getch  ();
               }
           }
       }
       erro_nao_disponivel(existe);
       if (existe == 1) {*contem= 1;}
       fclose (arq_fornecedores);
   }
//-------------------------------
//*****************************************************************************************
//-------------------------------
// Fornecedores
//-------------------------------
  void cadastrar_forncedores()
  {
    int tipo,esc;
    char teste;

     arq_fornecedores= fopen("Fornecedores.txt","r+b");
     fseek (arq_fornecedores,0, SEEK_END);
       do
       {
           fflush (stdin);
           printf ("Informe o nome do fornecedor: ");
           gets   (pessoa.nome);
           fflush (stdin);
           printf ("O fornecedor %s é pessoa\n",pessoa.nome);
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
               fflush (stdin);
               printf ("Mês: ");
               scanf  ("%d",&pessoa.mes_data);
               fflush (stdin);
               printf ("Ano: ");
               scanf  ("%d",&pessoa.ano_data);
               fflush (stdin);
               printf ("\n");
           }
           else
           {
                 printf ("Informe o data de nascimento do fornecedor: \n");
                 printf ("Dia: ");
                 scanf  ("%d",&pessoa.dia_data);
                 fflush (stdin);
                 printf (", Mês: ");
                 scanf  ("%d",&pessoa.mes_data);
                 fflush (stdin);
                 printf (", Ano: ");
                 scanf  ("%d",&pessoa.ano_data);
                 fflush (stdin);
                 printf ("\n");
            }

            int contem=0; //variavel de conteudo booleano//
            printf ("Informe o tipo de flor oferecidas pelo %s: ",pessoa.nome);
            fflush (stdin);
            gets   (pessoa.tipo_f_oferecida);
            fflush (stdin);
            revisao_existe_t_flores(pessoa.tipo_f_oferecida,pessoa.tipo_f_oferecida,&contem);//verificação da existencia do tipo de flor digitado
            if (contem == 0)
            {
                system ("cls");
                printf ("O tipo de flor especificada não esta cadastrado.\n");
                printf ("\nVocê será dirido ao campo de cadastro de tipo de flores.\n");

                printf ("\nCadastre a flor requerida e atem continue o cadastro de fornecedor.\n");
                criar_tipo_flor();
                cadastro_de_tipo_de_flores();
                printf ("\nRetomeo cadastro do fornecedor\n\n");
            }

            // numer de registro
           pessoa.registro.num_reg_fornecedor= pessoa.registro.num_reg_fornecedor + 1; // cadastro de numero de registro
           pessoa.ativo= 1; // colocação do cliente como ativo
           printf ("Numero de registro do fornecedor = %d\n",pessoa.registro.num_reg_fornecedor);
           printf ("-------------------------\n");
           fwrite (&pessoa,sizeof(pessoa),1,arq_fornecedores);
           cadastro_sucesso();

           printf ("Deseja cadastrar mais fornecedores? (S/N) ");
           //
           fflush (stdin);
           scanf  ("%c",&teste);
           fflush (stdin);
           system ("cls");
           fclose (arq_fornecedores);

       }
       while (toupper(teste) == 'S');

  }

//-------------------------------
  void visualizar_cadastro_de_fornecedores_geral()
  {
      int existe=0;
      arq_fornecedores= fopen("Fornecedores.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_fornecedores))
      {
    if (pessoa.ativo == 1) // verificação do arquivo se esta ativo ou foi excluido
       {
          existe= 1; // variavel de localização ativa
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
          printf ("Numero de registro: %d\n",pessoa.registro.num_reg_fornecedor);
          printf ("Tipo de flor Oferecida: %s\n",pessoa.tipo_f_oferecida);

          printf ("*********************************\n\n");
          getch  ();
      }
  }
      erro_nao_disponivel(existe);// verificação de variavel de localização ativa para que possa ou não gerar relatorio de erro

      system ("cls");
      fclose (arq_fornecedores);
  }

//-------------------------------

void visualizar_cadastro_de_fornecedores_especifico()
  {
       int num,existe=0;
      printf ("Informe o numero de registro do fornecedor a ser pesquisado: ");
      scanf  ("%d",&num);

      arq_fornecedores= fopen("Fornecedores.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_fornecedores))
      {
       if (pessoa.ativo == 1) // verificação do arquivo se esta ativo ou foi excluido
       {
       if (pessoa.registro.num_reg_fornecedor == num)
       {
          existe= 1; // variavel de localização ativa
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
          printf ("Numero de registro: %d\n",pessoa.registro.num_reg_fornecedor);
          printf ("Tipo de flor Oferecida: %s\n",pessoa.tipo_f_oferecida);

          printf ("*********************************\n\n");
          getch  ();
        }
       }
      }
      erro_nao_cadastrado(existe); // verificação  de variavel de localização ativa para gerar ou não relatorio de erro
      fclose (arq_fornecedores);
      system ("cls");
  }
//-------------------------------
  void alterar_cadastro_de_fornecedores()
  {
    int reg,contador=0,existe=0;
      printf ("informe o numero de registro do fornecedor a ser alterada: ");
      scanf  ("%d",&reg);
      arq_fornecedores= fopen("Fornecedores.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_fornecedores))
      {
          ++contador;
        if (pessoa.ativo == 1)
        {
          if (pessoa.registro.num_reg_fornecedor == reg)
          {
              existe= 1; // variavel de localização ativa
              fseek (arq_fornecedores,sizeof(pessoa) * (contador -1),SEEK_SET);
              fflush (stdin);
              printf ("Informe o novo nome de %s: ",pessoa.nome);
              gets   (pessoa.nome);
              fflush (stdin);
              printf ("O fornecedor %s é pessoa\n",pessoa.nome);
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
                 printf ("Informe o novo RG do fornecedor: ");
                 gets   (pessoa.rg);
                 fflush (stdin);
                 printf ("Informe o novo CPF do fornecedor: ");
                 gets   (pessoa.cpf);
                 }
           fflush (stdin);
           printf ("Informe o novo endereço do fornecedor: \n");
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
           printf ("Informeo novo telefone do fornecedor: ");
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
                 printf ("Informe a nova data de nascimento do fornecedor: \n");
                 printf ("Dia: ");
                 scanf  ("%d",&pessoa.dia_data);
                 printf (", Mês: ");
                 scanf  ("%d",&pessoa.mes_data);
                 printf (", Ano: ");
                 scanf  ("%d",&pessoa.ano_data);
                 printf ("\n");
            }
              fflush (stdin);
              int contem=0; //variavel de conteudo booleano//
              printf ("Informe o novo tipo de flor oferecidas pelo %s: ",pessoa.nome);
              gets   (pessoa.tipo_f_oferecida);
              fflush (stdin);
              revisao_existe_t_flores(pessoa.tipo_f_oferecida,pessoa.tipo_f_oferecida,&contem);//verificação da existencia do tipo de flor digitado
              if (contem == 0)
              {
                 system ("cls");
                 printf ("O tipo de flor especificada não esta cadastrado.\n");
                 printf ("\nVocê será dirido ao campo de cadastro de tipo de flores.\n");

                 printf ("\nCadastre a flor requerida e depois continue o cadastro de fornecedor.\n");
                 criar_tipo_flor();
                 cadastro_de_tipo_de_flores();
                 printf ("\nRetomeo cadastro do fornecedor\n\n");
              }

              fwrite (&pessoa,sizeof(pessoa),1,arq_fornecedores);
              fseek  (arq_fornecedores,sizeof(pessoa) * contador, SEEK_SET);
              alterado_sucesso();
          }
      }
      }
      erro_nao_cadastrado(existe); // verificação da variavel de localização ativa para gerar ou não relatorio de erro
      fclose (arq_fornecedores);
  }
//-------------------------------
  void exclusao_cadastro_fornecedores()
  {
      int reg,contador=0,existe=0;
      char cert;
      printf ("informe o numero de registro do fornecedor a ser excluido: ");
      scanf  ("%d",&reg);
      arq_fornecedores= fopen("Fornecedores.txt","r+b");
      while (fread(&pessoa,sizeof(pessoa),1,arq_fornecedores))
      {
          ++contador;
          if (pessoa.registro.num_reg_fornecedor == reg)
          {
              fflush (stdin);
              printf ("Tem ceteza que deseja excluir %s? (S/N)",pessoa.nome);
              scanf  ("%c",&cert); // certeza de exclusão de arquivo
              fflush (stdin);
              if (toupper(cert) == 'S')
              {
              existe= 1; // variavel de localização ativa
              fseek (arq_fornecedores,sizeof(pessoa) * (contador -1),SEEK_SET);
              pessoa.ativo= 0;
              fflush (stdin);
              fwrite (&pessoa,sizeof(pessoa),1,arq_fornecedores);
              fseek  (arq_fornecedores,sizeof(pessoa) * contador, SEEK_SET);
              alterado_sucesso();
              }
          }
          if (pessoa.registro.num_reg_fornecedor > reg) // nova organização dos cadastros para as posições anteriores
          {
              fseek (arq_fornecedores,sizeof(pessoa) * (contador - 1),SEEK_SET);
              pessoa.registro.num_reg_fornecedor= pessoa.registro.num_reg_fornecedor - 1;
              fwrite (&pessoa,sizeof(pessoa),1,arq_fornecedores);
              fseek (arq_fornecedores,sizeof(pessoa) * contador, SEEK_SET);
          }
      }
      erro_nao_cadastrado(existe); // verificação da variavel de localização ativa para gerar ou não relatoro de erro
      fclose (arq_fornecedores);
  }
//-------------------------------
//*****************************************************************************************************************
// Estoque
//-------------------------------
// cadastro de entrada de estoque
  void cadastrar_entrada_de_estoque()
  {
      char test;
      system ("cls");
      arq_estoque= fopen("Estoque.txt","r+b");
      do
      {
        fflush (stdin);
        printf ("Informe o tipo de flor a ser adicionado no estoque:");
        gets   (estoque.tipo);
        fflush (stdin);
        printf ("Informe a cor da %s a ser adicionada no estoque:",estoque.tipo);
        gets   (estoque.cor);
        fflush (stdin);
        int contem=2;
        revisao_existe_t_flores(estoque.tipo,estoque.cor,&contem);//verificação da existencia do tipo de flor digitado
        if (contem == 0)
              {
                 system ("cls");
                 printf ("O tipo de flor especificada não esta cadastrado.\n");
                 printf ("\nVocê será dirido ao campo de cadastro de tipo de flores.\n");

                 printf ("\nCadastre a flor requerida e depois continue o cadastro de fornecedor.\n");
                 criar_tipo_flor();
                 cadastro_de_tipo_de_flores();
                 printf ("\nRetomeo cadastro do fornecedor\n\n");
              }
        printf ("Informe a quantidade de duzias de %s que serão recebidas:",estoque.tipo);
        scanf  ("%d",&estoque.quantidade_duzias);
        fflush (stdin);
        estoque.quantidade_unidade= estoque.quantidade_duzias * 12;
        fflush (stdin);
        printf ("Informe o fornecedor que esta fornecendo as flores:");
        gets   (estoque.fornecedor);
        fflush (stdin);
        contem= 0;
        revisao_existe_fornecedor(estoque.fornecedor,&contem);
        if (contem == 0)
        {
            system ("cls");
            printf ("O fornecedor especificado não esta cadastrado.\n");
            printf ("\nVocê será redirecionado ao campo de cadastro de fornecedor.\n");
            printf ("\nCadastre o fornecedor requuerido e depois continue o cadastro de entrada de esoque.\n");
            criar_fornecedores();
            cadastrar_forncedores();
            printf ("\nRetorne o cadastro de entrada de estoque\n\n");
        }
        fflush (stdin);
        printf ("Informe o valor pago por duzia:");
        scanf  ("%d",&estoque.valor_pago);
        fflush (stdin);
        printf ("Informe o estoque minimo de duzias de flores:");
        scanf ("%d",&estoque.estoque_mim);
        fflush (stdin);
        printf ("Informe a data de entrada das flores:\n");
        printf ("Dia: ");
        scanf  ("%d",&estoque.data_entrada[1]);
        fflush (stdin);
        printf ("Mês: ");
        scanf  ("%d",&estoque.data_entrada[2]);
        fflush (stdin);
        printf ("Ano: ");
        scanf  ("%d",&estoque.data_entrada[3]);
        estoque.registro= estoque.registro + 1;
        printf ("Numero de registro: %d\n",estoque.registro);
        printf ("Deseja cadastrar mais registros de entrada de estoque? (S?N)");
        fflush (stdin);
        scanf  ("%c",&teste);
        fwrite (&estoque,sizeof(estoque),1,arq_estoque);

      } while (toupper(teste) == 'S');
      fclose (arq_estoque);
  }
//-------------------------------
  void visualizar_cadastro_de_entrada_de_estoque_geral()
  {
      arq_estoque= fopen ("Estoque.txt","r+b");
      while (fread(&estoque,sizeof(estoque),1,arq_estoque))
      {
          printf ("Tipo: %s\n",estoque.tipo);
          printf ("");
      }

      fclose (arq_estoque);
  }
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
                              printf ("     Informe qual a opção a sera realizada:  \n");
                              printf ("     1- Cadastro de tipo de flores: ----------\n");
                              printf ("     2- Visualização dos cadastros geral: ----\n");
                              printf ("     3- Visualização dos cadastros especifica:\n");
                              printf ("     4- Aletração de cadastros: --------------\n");
                              printf ("     5- Exclusão de cadastros: ---------------\n\n");
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
                                  case 5:{
                                      exclusao_tipo_de_flores();
                                      break;}
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
                                 printf ("     5- Excluir cadastro de clientes: -------\n\n");
                                 printf ("     0- Retornar ao menu principal: ---------\n");

                                 scanf ("%d",&escolha_2);
                                 switch (escolha_2)
                                 {
                                     case 1:{
                                     cadastro_de_clientes();
                                     break;}

                                     case 2:
                                     {
                                         visualizar_cadastro_de_clientes_geral();
                                         break;}

                                     case 3: {
                                         visualizar_cadastro_de_clientes_especifico ();
                                         break;}

                                     case 4: {
                                         alterar_cadastro_de_clientes();
                                         break;}

                                     case 5: {
                                         exclusao_cadastro_clientes();
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
        printf ("     5- Excluir cadastro: -----------------\n\n");
        printf ("     0- Retornar ao menu principal: -------\n");

        scanf  ("%d",&escolha_3);
        switch (escolha_3)
        {
            case 1: {
                cadastrar_forncedores();
                break;}
            case 2: {
                visualizar_cadastro_de_fornecedores_geral();
                break;}

            case 3: {
                visualizar_cadastro_de_fornecedores_especifico();
                break;}

            case 4: {
                alterar_cadastro_de_fornecedores();
                break;}

            case 5: {
                exclusao_cadastro_fornecedores();
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
          printf ("     5- Excluir cadastro de estoque: ---------\n\n");
          printf ("     0- Retornar o menu principal: -----------\n");

          scanf  ("%d",&escolha_4);
          switch (escolha_4)
          {
              case 1: {
                  cadastrar_entrada_de_estoque();
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
  main()
  {
      do {
          printf ("     ******************* - Arranjos de Flores - *******************\n");
          printf ("     --------------------------------------------------------------\n\n");
          printf ("     Informe qual a opção a sera realizada:\n");
          printf ("      1- Tipo de Flores: ------------------\n");
          printf ("      2- Clientes: ------------------------\n");
          printf ("      3- Fornecedores: --------------------\n");
          printf ("      4- Estoque: -------------------------\n\n");
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


