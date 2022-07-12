// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_hygiene.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/loading/loading_connection.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';

// import dos pacotes
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/data/sources/local/mobx/hygiene/hygiene.dart';

class CreateHygiene extends StatefulWidget {

  final String petId;
  final bool update;
  const CreateHygiene({ Key? key, required this.petId, required this.update }) : super(key: key);

  @override
  State<CreateHygiene> createState() => _CreateHygieneState();
}

class _CreateHygieneState extends State<CreateHygiene> {

  final HygieneMobx _hygieneMobx = HygieneMobx();
  late ConnectionMobx _connectionMobx;
  final hygiene = getIt.get<GetHygieneManager>();

  @override
  void initState() {
    super.initState();
    Services().sendScreen("Vaccines");
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

        double width = MediaQuery.of(context).size.width;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cadastrar Higiene"),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
          : SingleChildScrollView(
            padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 10 ),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                  child: FindDropdown(
                    showSearchBox: false,
                    items: hygiene.listHygiene,
                    label: "Categoria do serviço",
                    selectedItem: _hygieneMobx.name,
                    onChanged: (value) {
                      _hygieneMobx.setName(value.toString());
                    },
                    errorBuilder: ( context, item ) {
                      return const Center(
                        child: Text(
                          "Nenhum serviço encontrado",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    emptyBuilder: ( item ) {
                      return const Center(
                        child: Text(
                          "Nenhum serviço encontrado",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    dropdownBuilder: (context, name) {
                      return Container(
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.blueSolitude,
                        ),
                        child: ListTile(
                          title: Text(
                            ( _hygieneMobx.name.trim().isEmpty )
                            ? "Categoria de serviços."
                            : _hygieneMobx.name,
                          ),
                        ),
                      );
                    },
                    dropdownItemBuilder: (context, name, isSelected) {
                      return Container(
                        decoration: !isSelected
                        ? null
                        : BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          selected: isSelected,
                          title: Text( name.toString() ),
                        ),
                      );
                    },
                  ),
                ),

                // data do servico
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                  child: TextField(
                    controller: _hygieneMobx.controllerDay,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      labelText: "Data do serviço",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                // local
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                  child: TextField(
                    controller: _hygieneMobx.controllerPlace,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      labelText: "Estabelecimento",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                // valor
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                  child: TextField(
                    controller: _hygieneMobx.controllerValue,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      labelText: "Valor",
                      labelStyle: const TextStyle(
                        color: AppColors.barossa,
                      ),
                      filled: true,
                      fillColor: AppColors.blueSolitude,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      _hygieneMobx.validateFields( context, widget.petId, widget.update );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).cardColor,
                      padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 36 ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );

      },
    );
  }
}
