# NodeProducts

**Projeto de CRUD de produtos com Typescript e Node + EXTRA sincronização com API IBGE ao ser solicitado**

**Tecnologias:**

```
NodeJs 20.10
Postgrees 16
```

Para executar o projeto, entre na pasta do arquivo Node,

**Entre no diretório do react e siga os passos**

```
(Node)
1 - Entre no arquivo em Node, certifique-se de ter o Node E Postgrees instalado em sua máquina
2 - Após isso, entre no terminal de projeto, execute a série de comandos a seguir
```

**Rodar o Node**

```
# Instale as dependências do projeto Node
npm install

# Rodar o servidor
npm run dev

# Localhost (Variável padrão): http://localhost:8080

    # Orientações para conexão com banco de dados local Postgrees

# Copie o arquivo de configuração do ambiente (.env.example). **Que devem ser mudadas com as credencias, no momento certo do passo a passo
    1° Deve ser gerado o banco de dados local e importar o dump, com as seguintes orientações
    CREATE DATABASE teste(nome do banco de dados); - Através do terminal do Postgrees ou outro terminal de sua preferência

    2° Após isso, utilize algum gerenciador de banco de dados como Dbeaver, faça a conexão e import o Dump

    **3° Antes de qualquer teste, atualize os dados do .env no Node com suas credenciais

O comando a seguir não é necessário, somente em caso do dump estiver com erro, para rodar a migrations existentes
npm run typeorm migration:run -- -d ./src/data-source

Caso seja necessário, queira rodar as migrations do zero num novo banco de dados, utilize esse comando, primeiramente antes do run
npm run typeorm migration:generate ./src/migrations/InitialMigration -- -d ./src/data-source.ts

Dcoumentaçao para auxílio:
https://nodejs.org/en/guides
https://docs.fedoraproject.org/en-US/quick-docs/postgresql/
```

**Rotas padrão** - Variavel padrão **http://localhost:8080**

```
    # Orientações das rotas. Essas orientações podem se tornar opcionais. Caso opte por fazer o import do arquivo json(Crud NodeProducts And Extra), em um programa de rotas como Insomnia ou Postman, que já vem com dados setados para uso.


        GET - VariávelPadrão/list-products
        STATUS 200 Ok

Request
No body

Response
[
	{
		"id": 2,
		"name": "Mudando nome do produto",
		"category": "Categoria do Produto",
		"status": "ACTIVE",
		"quantity": 200,
		"created_at": "2023-12-24T18:56:57.087Z",
		"updated_at": "2023-12-24T19:00:14.910Z",
		"deleted_at": null
	}
]


        POST - VariávelPadrão/create-product
        STATUS 201 Created

Request
{
  "name": "Nome do Produto",
  "category": "Categoria do Produto",
  "status": "ACTIVE",
  "quantity": 10
}

Response
{
	"name": "Nome do Produto",
	"category": "Categoria do Produto",
	"status": "ACTIVE",
	"quantity": 10,
	"deleted_at": null,
	"id": 2,
	"created_at": "2023-12-24T18:56:57.087Z",
	"updated_at": "2023-12-24T18:56:57.087Z"
}


        PATCH - VariávelPadrão/update-product/{id}
        STATUS 200 Ok

Request
{
	"name": "Mudando nome do produto",
	"quantity": 200
}

Response
{
	"id": 2,
	"name": "Mudando nome do produto",
	"category": "Categoria do Produto",
	"status": "ACTIVE",
	"quantity": 200,
	"created_at": "2023-12-24T18:56:57.087Z",
	"updated_at": "2023-12-24T19:00:14.910Z",
	"deleted_at": null
}


        DELETE - VariávelPadrão/delete-product/{id}
        STATUS 200 Ok

Request
No Body

Response 
{
	"message": "Produto excluído com sucesso"
}


        EXTRA - IBGE SYNC
        GET - VariávelPadrão/sync-cities
        STATUS 200 Ok

Request
No body

Response
{
	"message": "Cidades sincronizadas com sucesso."
}
```

**Pacotes Externos:**
```
TypeOrm
Cors
Express
Typescript
Axios
```
