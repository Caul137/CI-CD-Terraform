# 🚀 Terraform - CI/CD Multi Ambiente (AWS App Runner)

---

# 📘 *Sobre*:

 
* Este projeto provisiona uma infraestrutura modularizada utilizando Terraform para implantar um serviço no AWS App Runner. A automação é feita via GitHub Actions, garantindo um fluxo de entrega contínua (CI/CD) com validação de saúde (Health Check).

##### 🛠️ Arquitetura e Tecnologias:

- Infraestrutura: Terraform (Modularizado).

- Cloud Provider: AWS (App Runner, S3 para State).

- Runtime: Node.js 22.20.0

- CI/CD: GitHub Actions (Ambientes de Dev e Prod).

 ---

 ### 🔓  Requisitos:
 
- [x] Ter o **Terraform** instalado
    Caso não tenha, voCê pode baixa-lo por aqui: https://developer.hashicorp.com/terraform/install
- [X] Ter o **CLI** da **AWS** instalado
     Caso não tenha, voCê pode baixa-lo por aqui: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


---

## 🖥 Configuração - Secrets

##### Você deve configurar as seguintes Secrets no seu repositório:

- AWS_ACCESS_KEY_ID: Sua chave de acesso AWS.

- AWS_SECRET_ACCESS_KEY: Sua chave secreta AWS.

- API_KEY: Chave de API para a aplicação.

- DB_PASSWORD: Senha do banco de dados.

---


📁 **Estrutura**

├── environment/
│   ├── dev/
│   └─ prod/
│   
├── modules/app-runner
│   ├── main
│   ├── outputs
│   └── variables
│
├── .gitignore
├── index.js
└── readme

---

# 📚 Funcionamento

## Pipeline - execução via CI/CD:
- Deploy Dev: Provisiona o ambiente de desenvolvimento ao realizar um push na main.

- Health Check: O GitHub Actions captura a URL gerada pelo App Runner (via terraform output) e aguarda o serviço subir, realizando testes de conectividade com curl.

- Deploy Prod: Somente após o sucesso do Health Check, a infraestrutura de produção é atualizada.

Obs: Certifique-se de que tem um bucket S3 na conta aws com o mesmo nome que colocar no bucket-config da pipeline, ele não cria sozinho na pipeline.

## Local - manual:

- Configure o perfil: aws configure --profile dev

- Ative o perfil: export AWS_PROFILE=dev (Linux/Mac) ou $env:AWS_PROFILE="dev" (Windows)

- **Execute**: terraform apply dentro da pasta do ambiente. 

---


#### Importante:

Como eu não tenho uma conta AWS registrada(não consigo ter), então não posso testar o projeto, deve conter alguns erros ou talvez não suba.