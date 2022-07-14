// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

// import dos sources
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
import 'package:meus_animais/data/sources/local/mobx/vaccines/vaccines.dart';

class CreateVaccines extends StatefulWidget {

  final String petId;
  final bool update;
  const CreateVaccines({ Key? key, required this.petId, required this.update }) : super(key: key);

  @override
  State<CreateVaccines> createState() => _CreateVaccinesState();
}

class _CreateVaccinesState extends State<CreateVaccines> {

  final VaccinesMobx _vaccinesMobx = VaccinesMobx();
  late ConnectionMobx _connectionMobx;

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
            title: Text(
              FlutterI18n.translate(context, "pages.vaccines.create.appbar"),
            ),
          ),

          body: ( _connectionMobx.connectionStatus.toString() == "ConnectivityResult.none" )
          ? const LoadingConnection()
          : SingleChildScrollView(
            padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 10 ),
            child: Column(
              children: [

                // nome
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                  child: TextField(
                    controller: _vaccinesMobx.controllerName,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      labelText: FlutterI18n.translate(context, "pages.vaccines.create.name"),
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

                // tipo de vacina
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                  child: TextField(
                    controller: _vaccinesMobx.controllerType,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      labelText: FlutterI18n.translate(context, "pages.vaccines.create.type"),
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

                // descricao
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                  child: TextField(
                    controller: _vaccinesMobx.controllerDescription,
                    minLines: 1,
                    maxLines: 4,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      labelText: FlutterI18n.translate(context, "pages.vaccines.create.description"),
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

                // dia da vacina
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                  child: TextField(
                    controller: _vaccinesMobx.controllerDay,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      labelText: FlutterI18n.translate(context, "pages.vaccines.create.day"),
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

                SwitchListTile(
                  value: _vaccinesMobx.reapply,
                  onChanged: (value) {
                    _vaccinesMobx.setReapply(value);
                  },
                  title: Text(
                    FlutterI18n.translate(context, "pages.vaccines.create.reapply"),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  activeColor: AppColors.cinnabar,
                ),

                ( _vaccinesMobx.reapply == false )
                ? const Padding(padding: EdgeInsets.zero)
                : Column(
                  children: [

                    // tipo de tempo
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                      child: FindDropdown(
                        showSearchBox: false,
                        items: const [
                          "Dia(s)",
                          "Semana(s)",
                          "Mês/Meses",
                          "Ano(s)",
                        ],
                        label: FlutterI18n.translate(context, "pages.vaccines.create.type_time_label"),
                        selectedItem: _vaccinesMobx.typeTime,
                        onChanged: (value) {
                          _vaccinesMobx.setTypeTime(value.toString());
                        },
                        dropdownBuilder: (context, typeTime) {
                          return Container(
                            width: width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.blueSolitude,
                            ),
                            child: ListTile(
                              title: Text(
                                ( _vaccinesMobx.typeTime.trim().isEmpty )
                                ? FlutterI18n.translate(context, "pages.vaccines.create.type_time_empty")
                                : _vaccinesMobx.typeTime,
                              ),
                            ),
                          );
                        },
                        dropdownItemBuilder: (context, typeTime, isSelected) {
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
                              title: Text( typeTime.toString() ),
                            ),
                          );
                        },
                      ),
                    ),

                    // tempo
                    ( _vaccinesMobx.typeTime.trim().isEmpty )
                    ? const Padding(padding: EdgeInsets.zero)
                    : Padding(
                      padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                      child: FindDropdown(
                        showSearchBox: false,
                        items: _vaccinesMobx.listTime,
                        label: FlutterI18n.translate(context, "pages.vaccines.create.interval"),
                        selectedItem: _vaccinesMobx.time,
                        onChanged: (value) {
                          String time = value.toString().split(" - ")[0];
                          _vaccinesMobx.setTime(time);
                        },
                        dropdownBuilder: (context, time) {
                          return Container(
                            width: width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.blueSolitude,
                            ),
                            child: ListTile(
                              title: Text(
                                ( _vaccinesMobx.time.trim().isEmpty )
                                ? FlutterI18n.translate(context, "pages.vaccines.create.interval_empty")
                                : _vaccinesMobx.time,
                              ),
                            ),
                          );
                        },
                        dropdownItemBuilder: (context, time, isSelected) {
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
                              title: Text( time.toString() ),
                            ),
                          );
                        },
                      ),
                    ),

                    // laboratorio da vacina
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 4, horizontal: 10 ),
                      child: TextField(
                        controller: _vaccinesMobx.controllerLaboratory,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          labelText: FlutterI18n.translate(context, "pages.vaccines.create.laboratory"),
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

                  ],
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      _vaccinesMobx.validateFields( context, widget.petId, widget.update );
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
          )
        );

      },
    );
  }
}
