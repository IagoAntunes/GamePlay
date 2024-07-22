![Capa (1)](https://github.com/user-attachments/assets/6b4e1040-2439-4897-9585-47a00e9b977b)

# :red_circle: GamePlay

:iphone::red_circle: GamePlay App

Aplicativo para lhe ajudar a conectar-se e organizar o momento de diversão e jogar com os amigos. Crie grupos para jogar seus games favoritos com seus amigos com esse App que possui autenticação.
- Vídeo: [Em Breve]

## :iphone: FrontEnd (Aplicativo)
- Flutter
<details>
<summary>Clique para Expandir!</summary>

## Introdução

Bem-vindo ao projeto GamePlay! Este projeto foi desenvolvido para fornecer uma plataforma onde os jogadores podem se conectar, criar e entrar em salas de jogos, facilitando a organização e o encontro com outros jogadores para momentos de diversão.

Nesta aplicação, você poderá:

- Registrar-se e fazer login para acessar todas as funcionalidades do aplicativo.
- Criar salas de jogos para seus games favoritos e convidar seus amigos ou outros jogadores para participar.
- Explorar e entrar em salas de jogos já existentes, filtrando por categorias como 'rankeada', '1vs1', e 'diversão'.
- Utilizar a autenticação segura para garantir que apenas usuários autorizados possam criar ou entrar em salas.

A seguir, você encontrará as instruções para instalação, uso e mais detalhes sobre este projeto.

## Instalação

Para instalar este projeto, siga os seguintes passos:

1. Clone o repositório:
    ```sh
    git clone https://github.com/IagoAntunes/GamePlay.git
    ```
2. Instale as dependências:
    ```sh
    flutter pub get
    ```
3. Execute:
    ```sh
    flutter run
    ```

## :wrench: Tecnologias e Ferramentas

### Tecnologias
- Flutter

### Ferramentas
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - Utilizado para gerenciamento de estado.
- [dio](https://pub.dev/packages/dio) - Package utilizado para realizar consultas (não foi usado por os dados estarem mockados).
- [shared_preferences](https://pub.dev/packages/get_storage) - Utilizado para guardar informações offline.
- [flutter_secure_storage](https://pub.dev/packages/internet_connection_checker) - Utilizado para guardar dados sensíveis do usuário.

## Arquitetura
  
Este projeto utiliza a **Clean Architecture** para organizar o código de maneira modular e desacoplada, facilitando a manutenção e evolução do sistema. A estrutura de pastas está organizada da seguinte forma:

### Estrutura de Pastas

```
lib
│
├── core
│
├── services
|
├── src/features

```

- **core:** Contem os códigos e regras que são compartilhadas entre as funcionalidades do aplicativo.
- **features** Contem os códigos de cada funcionalidade.
- **services** Contem as abstrações e implementações de serviços como http, banco de dados.

```
features
│
├── domain
│
├── datasource
│
└── presentation
```
- **domain:** Contém as abstrações do repositório e modelos (entities) que representam os dados fundamentais da aplicação.

- **datasource:** Responsável pela implementação das fontes de dados externas e objetos de acesso a dados (DAO).

- **presentation:** Contém os códigos relacionados à interface do usuário (UI) e controladores.

</details>

## :computer: BackEnd
- Spring Boot, Kotlin
<details>
<summary>Clique para Expandir!</summary>

## Introdução

Bem-vindo ao projeto GamePlay Backend! Este projeto foi desenvolvido utilizando Spring Boot e Kotlin para fornecer uma API robusta e segura que suporta as funcionalidades do aplicativo GamePlay.

Nesta aplicação, você poderá:

- Gerenciar a autenticação e autorização dos usuários.
- Criar, editar e deletar salas de jogos.
- Conectar jogadores a salas de jogos com base em diferentes critérios.
- Armazenar e recuperar dados de usuários e salas de jogos de forma eficiente.

A seguir, você encontrará as instruções para instalação, uso e mais detalhes sobre este projeto.

## Instalação

Para instalar este projeto, siga os seguintes passos:

1. Clone o repositório:
    ```sh
    git clone https://github.com/IagoAntunes/GamePlayBackend.git
    ```
2. Navegue até o diretório do projeto:
    ```sh
    cd GamePlayBackend
    ```
3. Instale as dependências:
    ```sh
    ./mvnw clean install
    ```
4. Execute a aplicação:
    ```sh
    ./mvnw spring-boot:run
    ```

## :wrench: Tecnologias e Ferramentas

### Tecnologias
- Spring Boot
- Kotlin

### Dependências
- [spring-boot-starter-web](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-web) - Para construir aplicações web, incluindo RESTful.
- [jackson-module-kotlin](https://mvnrepository.com/artifact/com.fasterxml.jackson.module/jackson-module-kotlin) - Suporte para Kotlin no Jackson.
- [spring-boot-devtools](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-devtools) - Ferramentas de desenvolvimento para Spring Boot.
- [spring-boot-starter-test](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-test) - Testes para Spring Boot.
- [spring-boot-starter-data-jpa](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-data-jpa) - Para persistência de dados.
- [mysql-connector-j](https://mvnrepository.com/artifact/mysql/mysql-connector-java) - Conector MySQL.
- [jackson-dataformat-xml](https://mvnrepository.com/artifact/com.fasterxml.jackson.dataformat/jackson-dataformat-xml) - Para trabalhar com XML.
- [jackson-dataformat-yaml](https://mvnrepository.com/artifact/com.fasterxml.jackson.dataformat/jackson-dataformat-yaml) - Para trabalhar com YAML.
- [flyway-core](https://mvnrepository.com/artifact/org.flywaydb/flyway-core) - Migração de banco de dados.
- [spring-hateoas](https://mvnrepository.com/artifact/org.springframework.hateoas/spring-hateoas) - Hypermedia as the Engine of Application State.
- [spring-boot-starter-security](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-security) - Para segurança e autenticação.
- [java-jwt](https://mvnrepository.com/artifact/com.auth0/java-jwt) - Para trabalhar com JWT.
- [springdoc-openapi-starter-webmvc-ui](https://mvnrepository.com/artifact/org.springdoc/springdoc-openapi-starter-webmvc-ui) - Para documentação da API com OpenAPI.

</details>
