import 'package:croatia_explorer/layers/presentation/usingAndroid/view/shared/widgets/appBar.dart';
import 'package:croatia_explorer/layers/presentation/usingAndroid/view/statefull/main/states/favouritesState.dart';
import 'package:croatia_explorer/layers/presentation/usingAndroid/view/statefull/main/states/sightsState.dart';
import 'package:croatia_explorer/layers/presentation/usingAndroid/view/statefull/main/states/profileState.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  MainScreenWidgetState createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends State<MainScreenWidget> {
  int index = 0;
  final List<Widget> _pages = [
    HomeStateWidget(),
    FavouritesStateWidget(),
    ProfileStateWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: switchNameAppBar(context, index),
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
