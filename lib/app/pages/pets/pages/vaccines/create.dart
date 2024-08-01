// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/pets/pages/vaccines/mobx/vaccine.dart';
import 'package:meus_animais/app/core/widgets/verify_connection.dart';
import 'package:meus_animais/app/core/widgets/loading_overlay.dart';
import 'package:meus_animais/app/core/widgets/dropdown_error.dart';

// import dos pacotes
import 'package:myne_find_dropdown/myne_find_dropdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CreateVaccinePage extends StatefulWidget {
  final String petId;
  final bool isUpdate;
  const CreateVaccinePage({ super.key, required this.petId, required this.isUpdate });

  @override
  State<CreateVaccinePage> createState() => _CreateVaccinePageState();
}

class _CreateVaccinePageState extends State<CreateVaccinePage> {

  final _mobx = VaccineMobx();

  @override
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("create_vaccines");
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
      keyAppBar: "pages.vaccines.create.app_bar",
      page: Observer(
        builder: ( builder ) {

          return LoadingOverlay(
            isLoading: _mobx.isLoading,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 10 ),
              child: Column(
                children: [

                  // nome
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                    child: TextField(
                      controller: _mobx.controllerName,
                      style: theme.textTheme.headlineMedium,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.vaccines.create.name"),
                      ),
                    ),
                  ),

                  // tipo de vacina
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                    child: TextField(
                      controller: _mobx.controllerType,
                      style: theme.textTheme.headlineMedium,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.vaccines.create.type"),
                      ),
                    ),
                  ),

                  // descricao
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                    child: TextField(
                      controller: _mobx.controllerDescription,
                      minLines: 1,
                      maxLines: 4,
                      keyboardType: TextInputType.text,
                      style: theme.textTheme.headlineMedium,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.vaccines.create.description"),
                      ),
                    ),
                  ),

                  // dia da vacina
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 10 ),
                    child: TextField(
                      controller: _mobx.controllerDate,
                      keyboardType: TextInputType.number,
                      style: theme.textTheme.headlineMedium,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.vaccines.create.day"),
                      ),
                    ),
                  ),

                  SwitchListTile(
                    value: _mobx.reapply,
                    onChanged: (value) => _mobx.setReapply(value),
                    title: Text(
                      FlutterI18n.translate(context, "pages.vaccines.create.reapply"),
                      style: theme.textTheme.headlineMedium?.apply(
                        fontWeightDelta: 4,
                      ),
                    ),
                    activeColor: theme.colorScheme.primary,
                  ),

                  if ( _mobx.reapply )
                    Column(
                    children: [

                      // tipo de tempo
                      Padding(
                        padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                        child: FindDropdown<String>(
                          showSearchBox: false,
                          items: [
                            FlutterI18n.translate(context, "pages.vaccines.create.type_time_day"),
                            FlutterI18n.translate(context, "pages.vaccines.create.type_time_week"),
                            FlutterI18n.translate(context, "pages.vaccines.create.type_time_month"),
                            FlutterI18n.translate(context, "pages.vaccines.create.type_time_year"),
                          ],
                          label: FlutterI18n.translate(context, "pages.vaccines.create.type_time_label"),
                          selectedItem: _mobx.typeTime,
                          onChanged: ( String? value ) {
                            if ( value == null ) return;
                            Session.appEvents.logTypeTime("create_vaccines", value);
                            _mobx.setTypeTime(value);
                          },
                          errorBuilder: ( context, item ) {
                            return const DropdownErrorWidget(
                              text: "pages.vaccines.create.empty_vaccine",
                            );
                          },
                          emptyBuilder: ( item ) {
                            return const DropdownErrorWidget(
                              text: "pages.vaccines.create.empty_vaccine",
                            );
                          },
                          dropdownBuilder: ( context, typeTime ) {
                            return Container(
                              width: width,
                              decoration: BoxDecoration(
                                border: Border.all(color: theme.colorScheme.primary),
                                borderRadius: BorderRadius.circular(5),
                                color: theme.colorScheme.tertiary,
                              ),
                              child: ListTile(
                                title: Text(
                                  ( _mobx.typeTime.trim().isEmpty )
                                  ? FlutterI18n.translate(context, "pages.vaccines.create.type_time_empty")
                                  : _mobx.typeTime,
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
                                  color: theme.colorScheme.primary,
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
                      if ( _mobx.typeTime.trim().isNotEmpty )
                        Padding(
                          padding: const EdgeInsets.symmetric( vertical: 12, horizontal: 10 ),
                          child: FindDropdown(
                            showSearchBox: false,
                            items: _mobx.listTime,
                            label: FlutterI18n.translate(context, "pages.vaccines.create.interval"),
                            selectedItem: _mobx.time,
                            onChanged: ( String? value ) {
                              if ( value == null ) return;

                              String time = value.split(" - ")[0];
                              Session.appEvents.logTime("create_vaccines", time);
                              _mobx.setTime(time);
                            },
                            errorBuilder: ( context, item ) {
                              return const DropdownErrorWidget(
                                text: "pages.vaccines.create.empty_vaccine",
                              );
                            },
                            emptyBuilder: ( item ) {
                              return const DropdownErrorWidget(
                                text: "pages.vaccines.create.empty_vaccine",
                              );
                            },
                            dropdownBuilder: ( context, time ) {
                              return Container(
                                width: width,
                                decoration: BoxDecoration(
                                  border: Border.all(color: theme.colorScheme.primary),
                                  borderRadius: BorderRadius.circular(5),
                                  color: theme.colorScheme.tertiary,
                                ),
                                child: ListTile(
                                  title: Text(
                                    ( _mobx.time.trim().isEmpty )
                                    ? FlutterI18n.translate(context, "pages.vaccines.create.interval_empty")
                                    : _mobx.time,
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
                                    color: theme.colorScheme.primary,
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
                          controller: _mobx.controllerLaboratory,
                          style: theme.textTheme.headlineMedium,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: FlutterI18n.translate(context, "pages.vaccines.create.laboratory"),
                          ),
                        ),
                      ),

                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                    width: width,
                    child: ElevatedButton(
                      onPressed: () => _mobx.validateFields( widget.petId, widget.isUpdate ),
                      child: Text(
                        FlutterI18n.translate(context, "btn_register"),
                        style: theme.textTheme.headlineMedium,
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
