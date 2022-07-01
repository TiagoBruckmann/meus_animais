// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';

// import dos pacotes
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';

class CreatePetPage extends StatefulWidget {
  const CreatePetPage({Key? key}) : super(key: key);

  @override
  State<CreatePetPage> createState() => _CreatePetPageState();
}

class _CreatePetPageState extends State<CreatePetPage> {
  late ConnectionMobx _connectionMobx;

  @override
  void initState() {
    super.initState();
    Services().sendScreen("Create-pet");
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _connectionMobx = Provider.of<ConnectionMobx>(context);
    await _connectionMobx.verifyConnection();
    _connectionMobx.connectivity.onConnectivityChanged.listen(_connectionMobx.updateConnectionStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: ( builder ) {

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cadastrar animal"),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
          : const Center(
            child: Text("Novo pet"),
          ),
        );

      },
    );
  }
}
