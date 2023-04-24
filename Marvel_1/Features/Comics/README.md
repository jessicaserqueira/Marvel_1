# App SwiftUI com Injeção de Dependência e Coordinators

Este é um aplicativo iOS desenvolvido em Swift com o SwiftUI, que permite visualizar informações sobre personagens e quadrinhos da Marvel. Ele usa a API pública da Marvel para obter informações sobre personagens e quadrinhos, e o Firebase como plataforma de armazenamento em nuvem para persistência dos dados.

## Recursos
O aplicativo oferece os seguintes recursos:
- Visualização de lista de personagens e quadrinhos da Marvel, com informações detalhadas sobre cada item
- Pesquisa por nome de personagens
- Salvar personagens como favoritos, que são armazenados no Firebase
- Login com Firebase Auth

## Configuração
Para executar o aplicativo, você precisa das seguintes dependências:
- Xcode 12 ou superior
- Swift Package Manager (SPM)

Após clonar o repositório, o SPM irá automaticamente baixar as dependências necessárias (Firebase/Core, Firebase/Auth, Firebase/Storage, Firebase/Firestore).

Em seguida, abra o arquivo MarvelApp.xcodeproj no Xcode e execute o aplicativo no simulador ou em um dispositivo iOS conectado.

## Arquitetura
O aplicativo segue uma arquitetura baseada em MVVM-C (Model-View-ViewModel-Coordinator), com as seguintes camadas:

- Presentation: camada responsável por apresentar os dados para o usuário, usando SwiftUI e ViewModels
- Domain: camada que define as regras de negócios do aplicativo
- Data: camada que acessa os dados, tanto da API da Marvel quanto do Firebase, para fornecer dados para a camada de domínio.

O aplicativo também usa injeção de dependência nativa para gerenciar a dependência entre essas camadas. Os coordinators são usados para gerenciar a navegação do aplicativo, permitindo a transição entre telas de forma eficiente e escalável.

## Créditos
Este aplicativo foi desenvolvido por Jéssica Serqueira e Nathasha Amaral, como projeto de estudo e aprimoramento das habilidades em Swift e SwiftUI.