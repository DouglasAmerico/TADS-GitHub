#include <stdio.h>
#include <stdlib.h>

typedef enum { FALSE, TRUE } bool;
typedef enum { M, F } Sexo;

typedef struct {
	int ident;
	bool ativo;
} Registro;

typedef struct {
	char logradouro[50];
	char numero[10];
	char bairro[50];
	char cidade[50];
} Endereco;

typedef struct {
	Registro reg;
	char nome[50];
	char rg[12];
	char cpf[14];
	char email[100];
	Sexo sexo;
	char nasc[10];
	Endereco endereco;
} Cliente;

typedef struct {
	Registro reg;
	char nome[50];
} Arranjo;

typedef struct {
	Registro reg;
	char nome[50];
} Flor;

FILE *db_cliente;
FILE *db_fonecedor;

Cliente cliente;

bool novo_cliente(Registro reg, char nome[50], char rg[12], char cpf[14], char email[100], Sexo sexo, char nasc[10], Endereco endereco){
	Cliente dados;

	db_cliente = fopen("clientes.db", "r+b");
	if(db_cliente == NULL) db_cliente = fopen("clientes.db", "w+b");

	dados.reg.ativo = TRUE;
	strcpy(dados.nome, nome);
	strcpy(dados.rg, rg);
	strcpy(dados.cpf, cpf);
	strcpy(dados.email, email);
	dados.sexo = sexo;
	strcpy(dados.nasc, nasc);
	dados.endereco = endereco;

	fseek(db_cliente, 0, SEEK_END);
	fwrite(&cliente, sizeof(cliente), 1, db_cliente);

	fclose(db_cliente);
	return TRUE;

}

int main(){

	db_cliente = fopen("clientes.db", "r+b");
	if(db_cliente == NULL) db_cliente = fopen("clientes.db", "w+b");

    int tamanho;
	fseek(db_cliente, 0, SEEK_END);
	tamanho = (ftell(db_cliente) - sizeof(cliente));
	tamanho = (tamanho < 0) ? 0 : tamanho;
	fseek(db_cliente, tamanho, SEEK_SET);
	fread(&cliente, sizeof(cliente), 1, db_cliente);

	/*
	cliente.reg.ident += 1;
	cliente.reg.ativo = TRUE;
	gets(cliente.nome);
	strcpy(cliente.rg, "10.600.603-2");
	strcpy(cliente.cpf, "069.770.859-40");
	strcpy(cliente.email, "edvaldoszy@gmail.com");
	cliente.sexo = M;
	strcpy(cliente.nasc, "03/07/1994");
	strcpy(cliente.endereco.logradouro, "Rodovia Vazilio Boiko, km 4");
	strcpy(cliente.endereco.numero, "s/n");
	strcpy(cliente.endereco.bairro, "Zona Rural");
	strcpy(cliente.endereco.cidade, "Nova Cantu");

	fseek(db_cliente, 0, SEEK_END);
	fwrite(&cliente, sizeof(cliente), 1, db_cliente);
	*/

	/*
	fseek(db_cliente, (sizeof(cliente) * 1), SEEK_SET);
	fread(&cliente, sizeof(cliente), 1, db_cliente);
	*/

	fseek(db_cliente, 0, SEEK_SET);
	while(fread(&cliente, sizeof(cliente), 1, db_cliente)){
		printf("IDENT: %d\n", cliente.reg.ident);
		printf("NOME: %s\n", cliente.nome);
		printf("---\n");
	}

	//printf("IDENT: %d\n", cliente.reg.ident);
	//printf("NOME: %s\n", cliente.nome);

	fclose(db_cliente);
	printf("Concluido!\n");



}
