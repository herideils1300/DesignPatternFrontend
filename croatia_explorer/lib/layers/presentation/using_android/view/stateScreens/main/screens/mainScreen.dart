import 'package:croatia_explorer/layers/presentation/using_android/view/stateScreens/main/states/favouritesState.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/stateScreens/main/states/homeState.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/stateScreens/main/states/profileState.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int index = 0;
  final List<Widget> _pages = [
    const HomeStateWidget(),
    FavouritesStateWidget(),
    const ProfileStateWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: index,
          onTap: (int newIndex) {
            setState(() {
              index = newIndex;
            });
          }),
    );
  }
}
