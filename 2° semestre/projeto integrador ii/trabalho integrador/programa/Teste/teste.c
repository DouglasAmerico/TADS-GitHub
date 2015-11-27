 #include<stdio.h>
 #include<conio.h>
 #include<stdlib.h>
 #include<string.h>

//-------------------------------
   struct tipo_de_flores
   {
       char nome[10],cor[10];
   } tipo;
//-------------------------------
 struct estoque
 {
     char tipo[10],cor[10];
     int data_entrada[3],data_saida[3];
     float preco_pre_definido;
 } st_estoque;
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
   FILE *arq_estoque;
   void criar2()
   {
       arq_estoque= fopen ("Estoque.txt","r+b");
       if (arq_estoque == NULL) {arq_estoque= fopen ("Estoque.txt","w+b");}
   }
//--------------------------------
//cadastro de tipo de flores
 void cadastro_de_tipo_de_flores()
 {
     arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
     fseek (arq_t_flores
            ,0, SEEK_END);
       do
       {
           fflush (stdin);
           printf ("Informe o nome da flor: ");
           gets   (tipo.nome);
           fflush (stdin);
           printf ("Informe a cor da flor %s: ",tipo.nome);
           gets   (tipo.cor);
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
       printf ("---\n");
       getch();
       arq_t_flores= fopen ("Tipo_de_flores.txt","r+b");
       while (fread(&tipo,sizeof(tipo),1,arq_t_flores))
       {
           printf ("Nome: %s\n",tipo.nome);
           printf ("Cor : %s\n",tipo.cor);
           printf ("---------------------\n");
           getch();

       }
       fclose (arq_t_flores);
   }
//--------------------------------

 main()
 {
   printf ("     ******************* - Arranjos de Flores - *******************\n");
   printf ("     --------------------------------------------------------------\n\n");
   printf ("     Informe qual a opção a sera realizada:\n");
   printf ("      1- Tipo de Flores: ------------------\n");
   printf ("      2- Clientes: ------------------------\n");
   printf ("      3- Fornecedores: --------------------\n");
   printf ("      0- Sair: ----------------------------\n");

   criar_tipo_flor();
   //criar2();

   scanf  ("%d",&escolha_menu);
   system ("cls");
   switch (escolha_menu)
   {

                              case 1:
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
                                  case 1:
                                  cadastro_de_tipo_de_flores();
                                  system ("cls");
                                  break;

                                  case 2:
                                  visualizar_tipo_de_flores_geral();
                                  system ("cls");
                                  break;

                                  case 3:break;
                                  case 4:break;
                                  case 5:break;

                                  case 0:
                                  system ("cls");
                                  main();
                              }
                        } while (escolha_1 != 0);


                            case 2:
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
                                 switch (escolha_2);
                                 {
                                     case 11:
                                     printf ("Hello word\n");
                                     getch();
                                     break;

                                     case 22: break;
                                     case 3: break;
                                     case 4: break;
                                     case 5: break;
                                 }
                            } while (escolha_2 != 0);
                            break;

                            case 0: break;
    }
  getch();
 }
