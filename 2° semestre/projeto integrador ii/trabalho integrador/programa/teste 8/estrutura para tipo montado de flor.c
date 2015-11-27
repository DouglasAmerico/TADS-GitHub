//********************************************** seleções *****************************************************************************************
//--------------------------------
     void selecionar_flores(int *tip,char nome_tipo[20])
    {
      arq_tipo_de_flores= fopen ("Tipo de Flores.txt","r+b");

      printf ("Selecione o tipo de flor a ser integrada: \n\n");
      visualizar_tipo_de_flores_geral();
      printf ("Informe o numero de registro do tipo requerido,\n caso não seje encontrado informe 0 e cadstre-o: ");
      scanf  ("%d",& *tip);
      fflush (stdin);
      if (tip == 0)
      {
          cadastrar_de_tipo_de_flores();
          printf ("Agora continue seu cadastro de cor montada\n");
          getch  ();
          system ("cls");
          printf ("Informe o numero de registro do tipo requerido,\n caso não seje encontrado informe 0 e cadstre-o: ");
          scanf  ("%d",&tip);
          fflush (stdin);
      }
      else while (fread(&flor,sizeof(flor),1,arq_tipo_de_flores))
            {
                if (*tip == flor.registro)
                {
                    //tipo= flor.tipo;
                    strcpy (nome_tipo,flor.tipo);
                }
            }

        fclose (arq_tipo_de_flores);
    }
//-------------------------------
  void selecionar_cores(int *cor, char nome_cor[20])
  {
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
          printf ("Informe o numero de registro da cor requerida, \n caso não seja encontrado informe 0 e cadastre-a: ");
          scanf  ("%d",& *cor);
          fflush (stdin);
      }
      else while (fread(&cores,sizeof(cores),1,arq_cor_de_flores))
            {
                if (cor == cores.registro)
                {
                    strcpy (nome_cor,cores.cor);
                }
            }

      fclose (arq_cor_de_flores);
  }


//--------------------------------
//*********************************************** cor montada *****************************************************************************************
//--------------------------------
  void montar_flor()
  {
      int tip=0,cor=0,numero_de_registro=0;
      char nome_tipo[20],nome_cor[20];

      fflush (stdin);
      arq_mont_tipo= fopen ("Tipo Montados.txt","r+b");
      while (fread(&mont,sizeof(mont),1,arq_mont_tipo))
        {
            if (mont.registro != 0)
            {numero_de_registro= mont.registro;}
        }
      fclose (arq_mont_tipo);

      arq_mont_tipo= fopen ("Tipo Montados.txt","r+b");
      fseek (arq_mont_tipo,0,SEEK_END);

      strcpy ("teste",nome_tipo);  // inicialização da string

      selecionar_flores(&tip,nome_tipo);

      strcpy(mont.tipo,nome_tipo);
      mont.num_tipo= tip;
      printf ("Tipo: %s\n",mont.tipo);
      printf ("Reg Tipo: %d\n",mont.num_tipo);
      getch  ();
//--------
      strcpy ("teste",nome_cor);
      selecionar_cores(&cor,nome_cor);
      strcpy (mont.cor,nome_cor);
      mont.num_cor= cor;
      printf ("Cor: %s\n",mont.cor);
      printf ("Reg Cor: %d\n",mont.num_cor);

//-------
      mont.ativo=0;
      printf ("Defina um numero de estoque minimo para esse tipo de montado de flor: ");
      scanf  ("%d",&mont.numero_minimo);
      fflush (stdin);
      mont.quantidade=0;
      mont.registro= numero_de_registro + 1;
      printf ("Numero de registro do cadastro montado: %d\n",mont.registro);
      //visuazar_
      //  acrescentar a visualização geral de tipo e cor
      // depois colocar uma leitura da registro
      // depois registrar o nome;
      fwrite (&mont,sizeof(mont),1,arq_mont_tipo);
      cadastro_sucesso();

      fclose (arq_mont_tipo);
  }
//--------------------------------
