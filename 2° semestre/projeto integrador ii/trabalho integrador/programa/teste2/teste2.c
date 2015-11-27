 #include<stdio.h>
 #include<conio.h>
 #include<stdlib.h>
 #include<string.h>

//-------------------------------
   struct tipo_de_flores
   {
       char nome[10],cor[10];
       int registro,ativo;
   } tipo;
//-------------------------------
   typedef  struct
   {
       char rua[20],bairro[20],cidade[20],estado[2],cep[10];
       int num;
   } endereco;
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
      char nome[20],telefone[20],rg[10],cpf[10],cnpj[10];
      int dia_data,mes_data,ano_data,registro,pessoa,ativo;
      endereco ender;
  } cliente;
//--------------------------------
 struct fornecedores
 {
     char nome[20],telefone[20],rg[10],cpf[10],cnpj[10],tipo_f_oferecida[10];
     int dia_data,mes_data,ano_data,registro,pessoa,ativo;
     endereco endere;
 } fornecedor;
//--------------------------------
   int escolha_menu,escolha_1,escolha_2,escolha_3,cont;              //Area de declaração de variaveis globais....
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
//*###################################### Tipo de flores ---------------------
//cadastro de tipo de flores

//--------------------------------
 void cadastro_de_tipo_de_flores()
 {

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
           tipo.registro= tipo.registro + 1; // numero de registro adicionado altomaticamente
           tipo.ativo = 1; // colocação do cadastro para ativo
           printf ("Numero de registro da flor = %d\n",tipo.registro);
           printf ("ativo %d",tipo.ativo);
           printf ("-------------------------\n");
           fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
           cadastro_sucesso();

           printf ("\nDeseja cadastrar mais flores? (S/N) ");
           scanf  ("%c",&teste);
           system ("cls");
       }
       while (toupper(teste) == 'S');

   }
 //-------------------------------
 // visualização do tipo de flores geral
   void visualizar_tipo_de_flores_geral()
   {
       int existe=0;
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
        printf ("tipo ativo %d\n",tipo.ativo);
        if (tipo.ativo == 1)
        {
           existe= 1; // variavel de localização ativa
           printf ("Nome: %s\n",tipo.nome);
           printf ("Cor : %s\n",tipo.cor);
           printf ("Numero de registro: %d\n",tipo.registro);
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
      int reg,existe=0; // viariavel local de comparação com o numero de registro
      printf ("Informe o numero de registro da flor: ");
      scanf  ("%d",&reg);
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
         if (tipo.registro == reg) // verificação do arquivo compativel
         {
         if (tipo.ativo == 1) // verificação se o arquivo esta ativo ou foi excluido
         {
           existe= 1; // variavel de localizaçãoa ativa
           printf ("Nome: %s\n",tipo.nome);
           printf ("Cor : %s\n",tipo.cor);
           printf ("Numero de registro: %d\n",tipo.registro);
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
          if (tipo.registro == reg)
          {
              existe= 1; // variavel de localização ativa
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
              alterado_sucesso(); // alteração com sucesso
          }
      }
      erro_nao_cadastrado(existe);// verificação da variavel de localização ativa para determinar ou não relatorio de erro
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
          if (tipo.registro == reg)
          {
              existe= 1; // variavel de localização ativa
              fseek (arq_t_flores,sizeof(tipo) * (contador_tipo_de_flores -1),SEEK_SET);
              fflush (stdin);
              tipo.ativo= 0; // mudança para arquivo excluido
              fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
              fseek  (arq_t_flores,sizeof(tipo) * contador_tipo_de_flores, SEEK_SET);
              excluido_sucesso();
           }
          if (tipo.registro > reg) // nova organização dos cadastros para as posições anteriores
          {
              fseek (arq_t_flores,sizeof(tipo) * (contador_tipo_de_flores - 1),SEEK_SET);
              tipo.registro= tipo.registro - 1;
              fwrite (&tipo,sizeof(tipo),1,arq_t_flores);
              fseek (arq_t_flores,sizeof(tipo) * contador_tipo_de_flores, SEEK_SET);
          }

      }
      erro_nao_cadastrado(existe); // verificação da variavel de localização ativa para gerar ou não relatorio de erro
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
           printf ("Informe o endereço do cliente: \n");
           printf ("Rua:");
           gets   (cliente.ender.rua);
           fflush (stdin);
           printf ("Numero: ");
           scanf  ("%d",&cliente.ender.num);
           fflush (stdin);
           printf ("Cidade: ");
           gets   (cliente.ender.cidade);
           fflush (stdin);
           printf ("bairro: ");
           gets   (cliente.ender.bairro);
           fflush (stdin);
           printf ("Estado (UF): ");
           gets   (cliente.ender.estado);
           fflush (stdin);
           printf ("CEP: ");
           gets   (cliente.ender.cep);
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
               printf ("Mês: ");
               scanf  ("%d",&cliente.mes_data);
               printf ("Ano: ");
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
           cliente.registro= cliente.registro + 1; // cadastro de numero de registro
           cliente.ativo= 1; // colocação do cliente como ativo
           printf ("Numero de registro do cliente = %d\n",cliente.registro);
           printf ("-------------------------\n");
           fwrite (&cliente,sizeof(cliente),1,arq_clientes);
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
      while (fread(&cliente,sizeof(cliente),1,arq_clientes))
      {
    if (cliente.ativo == 1) // verificação do arquivo se esta ativo ou foi excluido
       {
          existe= 1; // variavel de localização ativa
          printf ("Nome: %s\n",cliente.nome);
          printf ("Endereço ---------------\n");
          printf ("Rua: %s\n",cliente.ender.rua);
          printf ("Numero: %d\n",cliente.ender.num);
          printf ("Bairro: %\n",cliente.ender.bairro);
          printf ("Cidade: %s\n",cliente.ender.cidade);
          printf ("Estado (UF): %s\n",cliente.ender.estado);
          printf ("CEP: %s\n",cliente.ender.cep);
          printf ("-------------------------\n");
          printf ("Telefone: %s\n",cliente.telefone);
          if (cliente.pessoa == 1)
          {
              printf ("CPF: %s\n",cliente.cpf);
              printf ("RG: %s\n",cliente.rg);
              printf ("Data de nascimeto -------------\n");
            }
          else {printf ("CNPJ: %s\n",cliente.cnpj);
                 printf ("Data de criação -------------\n");}
          printf ("Dia: %d, ",cliente.dia_data);
          printf ("Mês: %d, ",cliente.mes_data);
          printf ("Ano: %d\n",cliente.ano_data);
          printf ("Numero de registro: %d\n",cliente.registro);

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
      while (fread(&cliente,sizeof(cliente),1,arq_clientes))
      {
       if (cliente.ativo == 1) // verificação do arquivo se esta ativo ou foi excluido
       {
       if (cliente.registro == num)
       {
          existe= 1; // variavel de localização ativa
          printf ("Nome: %s\n",cliente.nome);
          printf ("Endereço ---------------\n");
          printf ("Rua: %s\n",cliente.ender.rua);
          printf ("Numero: %d\n",cliente.ender.num);
          printf ("Bairro: %\n",cliente.ender.bairro);
          printf ("Cidade: %s\n",cliente.ender.cidade);
          printf ("Estado (UF): %s\n",cliente.ender.estado);
          printf ("CEP: %s\n",cliente.ender.cep);
          printf ("-------------------------\n");
          printf ("Telefone: %s\n",cliente.telefone);
          if (cliente.pessoa == 1)
          {
              printf ("CPF: %s\n",cliente.cpf);
              printf ("RG: %s\n",cliente.rg);
              printf ("Data de nascimeto -------------\n");
            }
          else {printf ("CNPJ: %s\n",cliente.cnpj);
                 printf ("Data de criação -------------\n");}
          printf ("Dia: %d, ",cliente.dia_data);
          printf ("Mês: %d, ",cliente.mes_data);
          printf ("Ano: %d\n",cliente.ano_data);
          printf ("Numero de registro: %d\n",cliente.registro);

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
      int reg,contador_tipo_de_flores=0,existe=0;
      printf ("informe o numero de registro do cliente a ser alterada: ");
      scanf  ("%d",&reg);
      arq_clientes= fopen ("Clientes.txt","r+b");
      while (fread(&cliente,sizeof(cliente),1,arq_clientes))
      {
          ++contador_tipo_de_flores;
          if (cliente.registro == reg)
          {
              existe= 1; // variavel de localização ativa
              fseek (arq_clientes,sizeof(cliente) * (contador_tipo_de_flores -1),SEEK_SET);
              fflush (stdin);
              printf ("Informe o novo nome de %s: ",cliente.nome);
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
               printf ("Informe o novo CNPJ da empresa: ");
               gets   (cliente.cnpj);
           }
           else {fflush (stdin);
                 printf ("Informe o novo RG do clinte: ");
                 gets   (cliente.rg);
                 fflush (stdin);
                 printf ("Informe o novo CPF do cliente: ");
                 gets   (cliente.cpf);
                 }
           fflush (stdin);
           printf ("Informe o novo endereço do cliente: \n");
           printf ("Rua:");
           gets   (cliente.ender.rua);
           fflush (stdin);
           printf ("Numero: ");
           scanf  ("%d",&cliente.ender.num);
           fflush (stdin);
           printf ("Cidade: ");
           gets   (cliente.ender.cidade);
           fflush (stdin);
           printf ("bairro: ");
           gets   (cliente.ender.bairro);
           fflush (stdin);
           printf ("Estado (UF): ");
           gets   (cliente.ender.estado);
           fflush (stdin);
           printf ("CEP: ");
           gets   (cliente.ender.cep);
           fflush (stdin);
           printf ("Informeo novo telefone do cliente: ");
           gets   (cliente.telefone);
           fflush (stdin);
           // verificação do tipo de pessoa para dat de nasc/criação
           if (cliente.pessoa == 2)
           {
               printf ("Informe a nova data de criação da empresa: \n");
               printf ("Dia: ");
               scanf  ("%d",&cliente.dia_data);
               printf ("Mês: ");
               scanf  ("%d",&cliente.mes_data);
               printf ("Ano: ");
               scanf  ("%d",&cliente.ano_data);
               printf ("\n");
           }
           else
           {
                 printf ("Informe a nova data de nascimento do cliente: \n");
                 printf ("Dia: ");
                 scanf  ("%d",&cliente.dia_data);
                 printf (", Mês: ");
                 scanf  ("%d",&cliente.mes_data);
                 printf (", Ano: ");
                 scanf  ("%d",&cliente.ano_data);
                 printf ("\n");
            }
              fflush (stdin);
              fwrite (&cliente,sizeof(cliente),1,arq_clientes);
              fseek  (arq_clientes,sizeof(cliente) * contador_tipo_de_flores, SEEK_SET);
              alterado_sucesso();
          }
      }
      erro_nao_cadastrado(existe); // verificação da variavel de localização ativa para gerar ou não relatorio de erro
  }
//--------------------------------
  void exclusao_cadastro_clientes()
  {
      int reg,contador_tipo_de_flores=0,existe=0;
      char cert;
      printf ("informe o numero de registro do cliente a ser excluido: ");
      scanf  ("%d",&reg);
      arq_clientes= fopen ("Clientes.txt","r+b");
      while (fread(&cliente,sizeof(cliente),1,arq_clientes))
      {
          ++contador_tipo_de_flores;
          if (cliente.registro == reg)
          {
              fflush (stdin);
              printf ("Tem ceteza que deseja excluir %s? (S/N)",cliente.nome);
              scanf  ("%c",&cert); // certeza de exclusão de arquivo
              fflush (stdin);
              if (toupper(cert) == 'S')
              {
              existe= 1; // variavel de localização ativa
              fseek (arq_clientes,sizeof(cliente) * (contador_tipo_de_flores -1),SEEK_SET);
              cliente.ativo= 0;
              fflush (stdin);
              fwrite (&cliente,sizeof(cliente),1,arq_clientes);
              fseek  (arq_clientes,sizeof(cliente) * contador_tipo_de_flores, SEEK_SET);
              alterado_sucesso();
              }
          }
      }
      erro_nao_cadastrado(existe); // verificação da variavel de localização ativa para gerar ou não relatoro de erro
  }
//--------------------------------
//*****************************************************************************************
//-------------------------------
// Fornecedores
//-------------------------------
 void fornecedor_revisao_existe_t_flores(char tipo_requerido[10],int *contem)
 {
       int existe=0;
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
        if (strcmp(strupr(tipo_requerido),strupr(tipo.nome))== 0)
        //if (strupt(tipo_requerido) == strupr(tipo.nome))
        {
        if (tipo.ativo == 1)
        {
           existe= 1; // variavel de localização ativa
           printf ("Nome: %s\n",tipo.nome);
           printf ("Cor : %s\n",tipo.cor);
           printf ("Numero de registro: %d\n",tipo.registro);
           printf ("---------------------\n");
           getch();
        }
       }
       }
       erro_nao_disponivel(existe); // vai verificar a variavel de localização ativa se o arquivo foi encontrada para determinar ou não relatorio de erro
       if (existe == 1) {*contem= 1;}
       fclose (arq_t_flores);

 }
//-------------------------------
  void cadastrar_forncedores()
  {
    char teste;
    fseek (arq_fornecedores,0, SEEK_END);
       do
       {
           fflush (stdin);
           printf ("Informe o nome do fornecedor: ");
           gets   (fornecedor.nome);
           fflush (stdin);
           printf ("O fornecedor %s é pessoa\n",fornecedor.nome);
           printf (" 1- Fisica\n");
           printf (" 2- Juridica\n");
           scanf  ("%d",&fornecedor.pessoa);
           fflush (stdin);

           // 1- Fisica
           // 2- Juridica
           //------------- verificação de pessoa fisica/juridica
           if (fornecedor.pessoa == 2)
           {
               fflush (stdin);
               printf ("Informe o CNPJ da empresa: ");
               gets   (cliente.cnpj);
           }
           else {fflush (stdin);
                 printf ("Informe o RG do fornecedor: ");
                 gets   (fornecedor.rg);
                 fflush (stdin);
                 printf ("Informe o CPF do fornecedor: ");
                 gets   (fornecedor.cpf);
                 }
           fflush (stdin);
           printf ("Informe o endereço do fornecedor: \n");
           printf ("Rua:");
           gets   (fornecedor.endere.rua);
           fflush (stdin);
           printf ("Numero: ");
           scanf  ("%d",&fornecedor.endere.num);
           fflush (stdin);
           printf ("Cidade: ");
           gets   (fornecedor.endere.cidade);
           fflush (stdin);
           printf ("bairro: ");
           gets   (fornecedor.endere.bairro);
           fflush (stdin);
           printf ("Estado (UF): ");
           gets   (fornecedor.endere.estado);
           fflush (stdin);
           printf ("CEP: ");
           gets   (fornecedor.endere.cep);
           fflush (stdin);
           printf ("Informeo telefone do fornecedor: ");
           gets   (fornecedor.telefone);
           fflush (stdin);
           // verificação do tipo de pessoa para dat de nasc/criação
           if (fornecedor.pessoa == 2)
           {
               printf ("Informe a data de criação da empresa: \n");
               printf ("Dia: ");
               scanf  ("%d",&fornecedor.dia_data);
               fflush (stdin);
               printf ("Mês: ");
               scanf  ("%d",&fornecedor.mes_data);
               fflush (stdin);
               printf ("Ano: ");
               scanf  ("%d",&fornecedor.ano_data);
               fflush (stdin);
               printf ("\n");
           }
           else
           {
                 printf ("Informe o data de nascimento do fornecedor: \n");
                 printf ("Dia: ");
                 scanf  ("%d",&fornecedor.dia_data);
                 fflush (stdin);
                 printf (", Mês: ");
                 scanf  ("%d",&fornecedor.mes_data);
                 printf (", Ano: ");
                 fflush (stdin);
                 scanf  ("%d",&fornecedor.ano_data);
                 fflush (stdin);
                 printf ("\n");
            }
            int contem=0; //variavel de conteudo booleano//
            printf ("Informe o tipo de flor oferecidas pelo %s: ",fornecedor.nome);
            gets   (fornecedor.tipo_f_oferecida);
            fflush (stdin);
            fornecedor_revisao_existe_t_flores(fornecedor.tipo_f_oferecida,&contem);//verificação da existencia do tipo de flor digitado
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
           fornecedor.registro= fornecedor.registro + 1; // cadastro de numero de registro
           fornecedor.ativo= 1; // colocação do cliente como ativo
           printf ("Numero de registro do fornecedor = %d\n",fornecedor.registro);


           printf ("-------------------------\n");
           fwrite (&fornecedor,sizeof(fornecedor),1,arq_fornecedores);
           cadastro_sucesso();

           printf ("\nDeseja realizar mais cadastros de fornecedores? (S/N) ");
           scanf  ("%c",&teste);
           system ("cls");
       }
       while (toupper(teste) == 'S');

  }
//-------------------------------
  void visualizar_cadastro_de_fornecedores_geral()
  {
      int existe=0;
       //arq_fornecedores= fopen ("","r+b");
       while (fread(&fornecedor,sizeof(fornecedor),1,arq_fornecedores))
       {
        //printf ("tipo ativo %d\n",fornecedor.ativo);
        printf ("----------------------------\n"); // não retire essa linha pq eu não sei como mas sem elea o programa não funciona ....
        if (fornecedor.ativo == 1)
        {
           existe= 1; // variavel de localização ativa
           printf ("Nome: %s\n",fornecedor.nome);
           printf ("Endereço ---------------\n");
           printf ("Rua: %s\n",fornecedor.endere.rua);
           printf ("Numero: %d\n",fornecedor.endere.num);
           printf ("Bairro: %\n",fornecedor.endere.bairro);
           printf ("Cidade: %s\n",fornecedor.endere.cidade);
           printf ("Estado (UF): %s\n",fornecedor.endere.estado);
           printf ("CEP: %s\n",fornecedor.endere.cep);
           printf ("-------------------------\n");
           printf ("Telefone: %s\n",fornecedor.telefone);
           if (fornecedor.pessoa == 1)
           {
               printf ("CPF: %s\n",fornecedor.cpf);
               printf ("RG: %s\n",fornecedor.rg);
               printf ("Data de nascimeto -------------\n");
             }
           else {printf ("CNPJ: %s\n",fornecedor.cnpj);
                 printf ("Data de criação -------------\n");}
           printf ("Dia: %d, ",fornecedor.dia_data);
           printf ("Mês: %d, ",fornecedor.mes_data);
           printf ("Ano: %d\n",fornecedor.ano_data);
           printf ("Numero de registro: %d\n",fornecedor.registro);
           printf ("Tipo de flor Oferecida: %s\n",fornecedor.tipo_f_oferecida);

           printf ("*********************************\n\n");
           getch();
         }
        }
        erro_nao_disponivel(existe); // vai verificar a variavel de localização ativa se o arquivo foi encontrada para determinar ou não relatorio de erro
        //fclose (arq_t_flores);
        system ("cls");
  }

//-------------------------------

void visualizar_cadastro_de_fornecedores_especifico()
  {
       int existe=0,num;
       printf ("Informe o numero de registro do cadastro a ser visualizado: ");
       scanf  ("%d",&num);
       //arq_fornecedores= fopen ("","r+b");
       while (fread(&fornecedor,sizeof(fornecedor),1,arq_fornecedores))
       {
        //printf ("tipo ativo %d\n",fornecedor.ativo);
        if (fornecedor.ativo == 1)
        {
         if (fornecedor.registro == num)
         {
           printf ("----------------------------\n");
           existe= 1; // variavel de localização ativa
           printf ("Nome: %s\n",fornecedor.nome);
           printf ("Endereço ---------------\n");
           printf ("Rua: %s\n",fornecedor.endere.rua);
           printf ("Numero: %d\n",fornecedor.endere.num);
           printf ("Bairro: %\n",fornecedor.endere.bairro);
           printf ("Cidade: %s\n",fornecedor.endere.cidade);
           printf ("Estado (UF): %s\n",fornecedor.endere.estado);
           printf ("CEP: %s\n",fornecedor.endere.cep);
           printf ("-------------------------\n");
           printf ("Telefone: %s\n",fornecedor.telefone);
           if (fornecedor.pessoa == 1)
           {
               printf ("CPF: %s\n",fornecedor.cpf);
               printf ("RG: %s\n",fornecedor.rg);
               printf ("Data de nascimeto -------------\n");
             }
           else {printf ("CNPJ: %s\n",fornecedor.cnpj);
                 printf ("Data de criação -------------\n");}
           printf ("Dia: %d, ",fornecedor.dia_data);
           printf ("Mês: %d, ",fornecedor.mes_data);
           printf ("Ano: %d\n",fornecedor.ano_data);
           printf ("Numero de registro: %d\n",fornecedor.registro);
           printf ("Tipo de flor Oferecida: %s\n",fornecedor.tipo_f_oferecida);

           printf ("*********************************\n\n");
           getch();
         }
        }
        }
        erro_nao_disponivel(existe); // vai verificar a variavel de localização ativa se o arquivo foi encontrada para determinar ou não relatorio de erro
        //fclose (arq_t_flores);
        system ("cls");
  }
//-------------------------------
  void alterar_cadastro_de_fornecedores()
  {
    int num,existe=0,contador=0;
    printf ("Informe o numero de registro do cadastro a ser alterado: ");
    scanf  ("%d",&num);
    while (fread(&fornecedor,sizeof(fornecedor),1,arq_fornecedores))
    {
      if (fornecedor.registro == num)
      {
          if (fornecedor.ativo == 1);
          {
              existe= 1; // variavel de localização ativa
              fseek (arq_fornecedores,sizeof(fornecedor) * (contador -1),SEEK_SET);
              fflush (stdin);

              printf ("Informe o novo nome de %s: ",fornecedor.nome);
              gets   (fornecedor.nome);
              fflush (stdin);
              printf ("O fornecedor %s é pessoa\n",fornecedor.nome);
              printf (" 1- Fisica\n");
              printf (" 2- Juridica\n");
              scanf  ("%d",&fornecedor.pessoa);
              fflush (stdin);

              //printf ()
              fwrite (&fornecedor,sizeof(fornecedor),1,arq_fornecedores);
              fseek  (arq_fornecedores,sizeof(fornecedor) * contador, SEEK_SET);
              alterado_sucesso(); // alteração com sucesso
          }
      }
    }
  }
//-------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------
  // Menus//

  //Menu tipo de flores
  //------------------------------

  void menu_tipo_de_flores()
  {
      arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
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
                                  case 5:{
                                      exclusao_tipo_de_flores();
                                      break;}
                              }
                         system ("cls");
                        } while (escolha_1 != 0);
    fclose (arq_t_flores);
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
  }
//---------------------------------
// menu fornecedores

   void menu_fornecedores()
   {
     system ("cls");
     arq_fornecedores= fopen ("Fornecedores.txt","r+b");
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

            case 5: break;
        }
       system ("cls");
     } while (escolha_3 != 0);

     fclose (arq_fornecedores);
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
              case 4: break;
              case 0: break;


          }
    } while (escolha_menu != 0);
  }
