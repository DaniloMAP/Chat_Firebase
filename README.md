# Chat App

## Apresentação do Projeto

Este é um aplicativo de chat desenvolvido em Flutter que permite aos usuários trocarem mensagens de texto e imagens. O aplicativo utiliza o Firebase para autenticação de usuários, armazenamento de mensagens e imagens, além de integração com o Google Sign-In.

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

- text.composer.dart:
- Importações e Declarações Iniciais:

Importam as bibliotecas necessárias para o funcionamento do código e declaram a classe ChatScreen, que é o estado da tela de bate-papo.

Classe ChatScreen:

Método initState():

Esse método é chamado quando o widget é inserido na árvore de widgets. Ele inicia a escuta das mudanças no estado de autenticação do Firebase. Sempre que o estado de autenticação muda, o método authStateChanges() é chamado, e o novo usuário autenticado (ou null, caso não haja usuário autenticado) é armazenado na variável _currentUser. A chamada para setState() garante que a interface seja reconstruída com base nas mudanças no estado.

Método _getUser():

Esse método tenta fazer login com o Google por meio do plugin google_sign_in. Se o login for bem-sucedido, ele autentica o usuário no Firebase usando as credenciais do Google e retorna o objeto User representando o usuário autenticado. Se ocorrer um erro durante o processo de autenticação, a função retorna null.

Método _sendMessage()

Este método é chamado quando o usuário deseja enviar uma mensagem. Primeiro, ele verifica se o usuário está autenticado. Se o usuário não estiver autenticado, um aviso é mostrado usando um SnackBar com uma mensagem de erro. Caso contrário, o método prepara um mapa com as informações da mensagem (texto, URL da imagem, etc.) e o envia para a coleção "messages" no Firebase Firestore. Além disso, adiciona um carimbo de data/hora à mensagem usando o FieldValue.serverTimestamp() do Firebase.

Método build():

Constrói a interface do aplicativo usando widgets. Uma barra de navegação superior é exibida com o título "Olá". O corpo da tela contém uma coluna com dois widgets: um StreamBuilder que exibe as mensagens na ordem inversa (as mais recentes no topo) e o widget TextComposer que permite ao usuário enviar novas mensagens.

StreamBuilder:

Esse widget constrói a lista de mensagens que é atualizada automaticamente conforme novas mensagens são adicionadas à coleção "messages" no Firestore. Ele recebe um fluxo (stream) de QuerySnapshot que representa a coleção de mensagens. Se não houver dados disponíveis, ele exibe um indicador de carregamento (CircularProgressIndicator). Caso contrário, ele cria uma lista de widgets ListTile, onde cada um exibe o texto da mensagem.

TextComposer:

Este é um widget que representa o campo de composição de mensagens. Ele possui uma barra de envio de texto e um botão para capturar e enviar imagens. Quando o usuário insere texto e pressiona "Enviar" ou insere uma imagem, a função _sendMessage é chamada.

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

Este projeto está licenciado sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para obter mais informações.

---

Desenvolvido por [Danilo Melo](https://github.com/DaniloMAP)
