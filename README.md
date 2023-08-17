Peço desculpas pelo erro. Vou corrigir o estilo das seções. Aqui está o README corrigido:


# Chat App

## Apresentação do Projeto

Este é um aplicativo de chat desenvolvido em Flutter que permite aos usuários trocarem mensagens de texto e imagens. O aplicativo utiliza o Firebase para autenticação de usuários, armazenamento de mensagens e imagens, além de integração com o Google Sign-In.

Claro, aqui está a adaptação para deixar essa parte mais apresentável:

Claro, aqui está a parte ajustada do seu README:

## Estrutura do Projeto

A estrutura do projeto está organizada da seguinte forma:

```
chat_app/
|-- lib/
|   |-- chat_screen.dart
|   |-- text_composer.dart
|-- firebase_options.dart
|-- main.dart
|-- pubspec.yaml
```

- **`lib/`**: Contém os arquivos Dart do projeto, incluindo as classes que compõem a interface do usuário e a lógica do chat.
- **`firebase_options.dart`**: Arquivo de configuração do Firebase, onde você deve inserir suas chaves e tokens de autenticação.
- **`main.dart`**: Ponto de entrada do aplicativo, que configura e inicializa o Flutter e o Firebase.
- **`pubspec.yaml`**: Arquivo de configuração das dependências, listando os pacotes utilizados no projeto.

Esta estrutura foi projetada para manter uma organização clara e facilitar a manutenção do código.

## Dependências

- [Firebase Core](https://pub.dev/packages/firebase_core): Configuração e inicialização do Firebase.
- [Firebase Auth](https://pub.dev/packages/firebase_auth): Autenticação de usuários.
- [Cloud Firestore](https://pub.dev/packages/cloud_firestore): Armazenamento de mensagens.
- [Firebase Storage](https://pub.dev/packages/firebase_storage): Armazenamento de imagens.
- [Google Sign-In](https://pub.dev/packages/google_sign_in): Integração com o Google Sign-In.
- [Image Picker](https://pub.dev/packages/image_picker): Captura de imagens da câmera.

## Instalação

1. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/chat-app.git
   ```

2. Acesse o diretório do projeto:

   ```bash
   cd chat-app
   ```

3. Instale as dependências:

   ```bash
   flutter pub get
   ```

4. Crie um arquivo `firebase_options.dart` na raiz do projeto e configure as opções do Firebase conforme o exemplo fornecido em `firebase_options_example.dart`.

5. Execute o aplicativo:

   ```bash
   flutter run
   ```

## Licença

Este projeto está licenciado sob a licença [MIT]. Consulte o arquivo [LICENSE](LICENSE) para obter mais informações.

---

Desenvolvido por [Danilo Melo](https://github.com/DaniloMAP)
