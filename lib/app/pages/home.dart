// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/settings/setting.dart';
import 'package:meus_animais/app/pages/pets/create.dart';
import 'package:meus_animais/app/pages/pets/pets.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // controlar abas
  int _selectedIndex = 0;
  final List<Widget> _screensOptions = const [
    PetsPage(),
    CreatePet(),
    SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    Session.notifications.init();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final theme = Theme.of(context);

    return Scaffold(
      body: _screensOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          boxShadow: [

            BoxShadow(
              blurRadius: 15,
              color: Colors.black.withValues(alpha: 0.1),
            ),

          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 6,
            ),
            child: GNav(
              rippleColor: theme.colorScheme.primary,
              hoverColor: theme.colorScheme.secondary,
              gap: 5,
              iconSize: 23,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              duration: const Duration(milliseconds: 600),
              tabBackgroundColor: theme.colorScheme.primary,
              tabs: [

                GButton(
                  iconActiveColor: theme.colorScheme.error,
                  backgroundColor: theme.colorScheme.secondary,
                  iconColor: theme.colorScheme.secondary,
                  icon: Icons.pets,
                  iconSize: 25,
                  text: FlutterI18n.translate(context, "home.main"),
                  textColor: theme.colorScheme.error,
                ),

                GButton(
                  iconActiveColor: theme.colorScheme.error,
                  backgroundColor: theme.colorScheme.secondary,
                  iconColor: theme.colorScheme.secondary,
                  icon: FontAwesomeIcons.circlePlus,
                  text: FlutterI18n.translate(context, "home.new"),
                  textColor: theme.colorScheme.error,
                ),

                GButton(
                  iconActiveColor: theme.colorScheme.error,
                  backgroundColor: theme.colorScheme.secondary,
                  iconColor: theme.colorScheme.secondary,
                  icon: Icons.person,
                  iconSize: 25,
                  text: FlutterI18n.translate(context, "home.settings"),
                  textColor: theme.colorScheme.error,
                ),

              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
