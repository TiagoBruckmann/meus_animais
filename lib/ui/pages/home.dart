// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import das telas
import 'package:meus_animais/ui/pages/settings/settings.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';
import 'package:meus_animais/ui/pages/pets/create.dart';
import 'package:meus_animais/ui/pages/pets/pets.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // controlar abas
  int _selectedIndex = 0;
  final List<Widget> _screensOptions = const [
    PetsPage(),
    CreatePetPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // função para bloquear o giro da tela
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: _screensOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black.withOpacity(.1),
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
              rippleColor: Theme.of(context).primaryColor,
              hoverColor: Theme.of(context).secondaryHeaderColor,
              gap: 5,
              iconSize: 23,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              duration: const Duration(milliseconds: 600),
              tabBackgroundColor: Theme.of(context).primaryColor,
              tabs: [
                GButton(
                  iconActiveColor: Theme.of(context).secondaryHeaderColor,
                  backgroundColor: AppColors.turbo,
                  iconColor: AppColors.turbo,
                  icon: Icons.pets,
                  iconSize: 25,
                  text: "Pets",
                ),

                GButton(
                  iconActiveColor: Theme.of(context).secondaryHeaderColor,
                  backgroundColor: AppColors.turbo,
                  iconColor: AppColors.turbo,
                  icon: FontAwesomeIcons.circlePlus,
                  text: "novo Pet",
                ),

                GButton(
                  iconActiveColor: Theme.of(context).secondaryHeaderColor,
                  backgroundColor: AppColors.turbo,
                  iconColor: AppColors.turbo,
                  icon: Icons.person,
                  iconSize: 25,
                  text: "Configurações",
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
