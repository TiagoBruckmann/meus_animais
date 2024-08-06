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

### :gear: .ENV exemplo

to run this app, you need an **.ENV** file, here is an example.

```sh
BASE_URL=TODO
    
ONESIGNAL_APP_ID=TODO
ONESIGNAL_TEMPLATE_INFO_DATA=TODO
ONESIGNAL_TEMPLATE_REAPPLY=TODO
```

---

### :star: Gerar APK release da loja android

```sh
flutter build appbundle --release --dart-define-from-file=.env
```

### :star2: Gerar APK release com ofuscação de codigo

```sh
flutter build apk --split-per-abi --release --dart-define-from-file=.env
```

---

## :gear: Flutter Setup
```sh
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run flutter_launcher_icons
    flutter pub run build_runner build
    flutter run --dart-define-from-file=.env
```

## :bulb: Caso algo não estiver funcionando adequadamente
```sh
    flutter clean
    rm -rf pubspec.lock
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run flutter_launcher_icons
    flutter pub run build_runner build --delete-conflicting-outputs
    flutter run --dart-define-from-file=.env
```

### :gear: MacOS Setup

```sh
cd ios/

pod clean
pod cache
pod deintegrate
pod install
```

---

### :star: Executar os testes unitarios

```sh
flutter test test/pasta/nome_do_arquivo.dart
```

---

### :gear: Configurações do firebase debug - ANDROID
Para que os dados do firebase não sejam poluidos com dados do desenvolvimento precisa ser utilizado o comando abaixo para que todos os logs e ações dentro do app de desenvolvimento seja realocada no setor de dev do proprio firebase. Este comando ativará o modo depuração do analytics até que seja desativado.

```
adb shell setprop debug.firebase.analytics.app br.com.meus_animais

Execute o app em modo debug -> Vá para as opções de desenvolvedor -> Selecione app debug -> selecione o app Orgalive

o processo acima irá exibir o dispositivo no debugview.
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

#### Desativar depuração - IOS

```
FIRDebugDisabled
```

---

Cores padrão:

- blueSolitude ![#E8F0FE](https://via.placeholder.com/15/E8F0FE/000000?text=+) `#E8F0FE`
- whiteSmoke ![#F2F2F2](https://via.placeholder.com/15/F2F2F2/000000?text=+) `#F2F2F2`
- bossanova ![#494649](https://via.placeholder.com/15/494649/000000?text=+) `#494649`
- balticSea ![#343A40](https://via.placeholder.com/15/343A40/000000?text=+) `#343A40`
- cinnabar ![#E42924](https://via.placeholder.com/15/E42924/000000?text=+) `#E42924`
- barossa ![#363435](https://via.placeholder.com/15/363435/000000?text=+) `#363435`
- amber ![#FFC000](https://via.placeholder.com/15/FFC000/000000?text=+) `#FFC000`
- white ![#FFFFFF](https://via.placeholder.com/15/FFFFFF/000000?text=+) `#FFFFFF`
