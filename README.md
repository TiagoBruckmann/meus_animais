# meus_animais

Tome nota dos cuidados especiais que seu pet precisa! Desde os dias que tomam vacinas até a quantidade de banhos que tomam.

```
# Versionamento
#
# ┌────── Marcos
# │ ┌─────── Épicos
# │ │ ┌──────── Funcionalidade nova (reseta ao finalizar um marco/Épico)
# │ │ │
# 1.1.1
```

---

## :gear: Flutter Setup
```sh
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run build_runner build
    flutter run
```

## :bulb: Caso algo não estiver funcionando adequadamente
```sh
    flutter clean
    rm -rf pubspec.lock
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run build_runner build --delete-conflicting-outputs
    flutter run
```

### :star: Executar os testes unitarios

```sh
flutter test test/pasta/nome_do_arquivo.dart
```

### :gear: Configurações do firebase debug - ANDROID
Para que os dados do firebase não sejam poluidos com dados do desenvolvimento precisa ser utilizado o comando abaixo para que todos os logs e ações dentro do app de desenvolvimento seja realocada no setor de dev do proprio firebase. Este comando ativará o modo depuração do analytics até que seja desativado.

```
adb shell setprop debug.firebase.analytics.app br.com.pechinchadahoraadmin
```

#### Desativar depuração

```
adb shell setprop debug.firebase.analytics.app .none.
```

### :gear: Configurações do firebase debug - IOS
Utilizando o Xcode rode o comando abaixo na linha de comando para que o dispositivo fique cadastrado como dispositivo de depuração do analytics e demais plugins do firebase habilitados para o projeto.

```
FIRDebugEnabled
```

#### Desativar depuração

```
FIRDebugDisabled
```

## Pacotes utilizados

<ul>
    <li>flutter_secure_storage</li>
    <li>flutter_native_splash</li>    
    <li>firebase_performance</li>
    <li>firebase_crashlytics</li>
    <li>flutter_masked_text2</li>
    <li>injectable_generator</li>
    <li>firebase_analytics</li>
    <li>shimmer_animation</li>
    <li>connectivity_plus</li>
    <li>firebase_storage</li>
    <li>cloud_firestore</li>
    <li>cupertino_icons</li>
    <li>google_nav_bar</li>    
    <li>firebase_auth</li>
    <li>firebase_core</li>
    <li>flutter_mobx</li>
    <li>image_picker</li>
    <li>find_dropdown</li>
    <li>flutter_i18n</li>
    <li>url_launcher</li>
    <li>build_runner</li>
    <li>flutter_lints</li>
    <li>mobx_codegen</li>
    <li>injectable</li>
    <li>image_crop</li>
    <li>provider</li>
    <li>get_it</li>
    <li>mobx</li>
    <li>test</li>
    <li>intl</li>
</ul>

### :star: Gerar APK release da loja android

```sh
flutter build appbundle
```

### :star2: Gerar APK release com ofuscação de codigo

```sh
flutter build apk --split-per-abi
```

Cores padrão:

- blueSolitude ![#E8F0FE](https://via.placeholder.com/15/E8F0FE/000000?text=+) `#E8F0FE`
- whiteSmoke ![#F2F2F2](https://via.placeholder.com/15/F2F2F2/000000?text=+) `#F2F2F2`
- bossanova ![#494649](https://via.placeholder.com/15/494649/000000?text=+) `#494649`
- balticSea ![#343A40](https://via.placeholder.com/15/343A40/000000?text=+) `#343A40`
- cinnabar ![#E42924](https://via.placeholder.com/15/E42924/000000?text=+) `#E42924`
- barossa ![#363435](https://via.placeholder.com/15/363435/000000?text=+) `#363435`
- amber ![#FFC000](https://via.placeholder.com/15/FFC000/000000?text=+) `#FFC000`
- white ![#FFFFFF](https://via.placeholder.com/15/FFFFFF/000000?text=+) `#FFFFFF`

### :gear: Ubuntu Setup

Para fazer a instalação do plugin flutter siga os seguintes comandos em versões superiores a 16.* do Linux

```sh
// instala o flutter e ja deixa ele em variaveis globais
sudo snap install flutter --classic

// saber o diretorio de instalação SDK
flutter sdk-path

// verificar se o flutter esta saudavel
flutter doctor

// para rodar no VS Code instalar as extensões
Dart, Flutter
```
