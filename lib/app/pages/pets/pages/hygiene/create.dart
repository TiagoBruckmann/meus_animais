// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/pets/pages/hygiene/mobx/hygiene.dart';
import 'package:meus_animais/app/core/widgets/verify_connection.dart';
import 'package:meus_animais/app/core/widgets/loading_overlay.dart';
import 'package:meus_animais/app/core/widgets/dropdown_error.dart';

// import dos domain
import 'package:meus_animais/domain/entities/service.dart';

// import dos pacotes
import 'package:myne_find_dropdown/myne_find_dropdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CreateHygienePage extends StatefulWidget {
  final String petId;
  final bool isUpdate;
  const CreateHygienePage({ super.key, required this.petId, required this.isUpdate });

  @override
  State<CreateHygienePage> createState() => _CreateHygienePageState();
}

class _CreateHygienePageState extends State<CreateHygienePage> {

  final _mobx = HygieneMobx();

  @override
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("create_hygiene");
    _mobx.getServices();
  }

  @override
  void dispose() {
    _mobx.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return VerifyConnection(
      keyAppBar: "pages.hygiene.create.app_bar",
      page: Observer(
        builder: ( builder ) {

          return LoadingOverlay(
            isLoading: _mobx.isLoading,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 10 ),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                    child: FindDropdown<String>(
                      showSearchBox: false,
                      items: [
                        for ( final item in _mobx.listService )
                          item.name,
                      ],
                      label: FlutterI18n.translate(context, "pages.hygiene.create.category"),
                      selectedItem: _mobx.selectedService,
                      onChanged: ( String? value) {
                        if ( value == null ) return;

                        Session.appEvents.logHygieneName(value);
                        _mobx.setSelectedService(value);
                      },
                      errorBuilder: ( context, item ) {
                        return const DropdownErrorWidget(
                          text: "pages.hygiene.create.empty_category",
                        );
                      },
                      emptyBuilder: ( item ) {
                        return const DropdownErrorWidget(
                          text: "pages.hygiene.create.empty_category",
                        );
                      },
                      dropdownBuilder: (context, name) {
                        return Container(
                          width: width,
                          decoration: BoxDecoration(
                            border: Border.all(color: theme.colorScheme.primary),
                            borderRadius: BorderRadius.circular(5),
                            color: theme.colorScheme.tertiary,
                          ),
                          child: ListTile(
                            title: Text(
                              ( _mobx.selectedService.trim().isEmpty )
                              ? FlutterI18n.translate(context, "pages.hygiene.create.category")
                              : _mobx.selectedService,
                              style: theme.textTheme.headlineMedium,
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
                              color: theme.colorScheme.primary,
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
                      controller: _mobx.controllerDay,
                      style: theme.textTheme.headlineMedium,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.hygiene.create.day"),
                      ),
                    ),
                  ),

                  // local
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                    child: TextField(
                      controller: _mobx.controllerPlace,
                      style: theme.textTheme.headlineMedium,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.hygiene.create.establishment"),
                      ),
                    ),
                  ),

                  // valor
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                    child: TextField(
                      controller: _mobx.controllerValue,
                      style: theme.textTheme.headlineMedium,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.hygiene.create.value"),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                    width: width,
                    child: ElevatedButton(
                      onPressed: () => _mobx.validateFields( widget.petId, widget.isUpdate ),
                      child: Text(
                        FlutterI18n.translate(context, "btn_register"),
                        style: theme.textTheme.headlineMedium?.apply(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );

        },
      ),
    );
  }
}
