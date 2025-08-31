import 'package:croatia_explorer/layers/application/constants/global.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/app_bar.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/screen_states.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/state_implementations/favourites_state.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/state_implementations/profile_state.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/state_implementations/sights_state.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/state_implementations/social_network_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreenWidget extends ConsumerStatefulWidget {
  const MainScreenWidget({super.key});

  @override
  MainScreenWidgetState createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends ConsumerState<MainScreenWidget> {
  int index = 0;
  late ScreenState state;


  @override
  void initState() {
    state = SightsMain();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: switchNameAppBar(context, index),
      body: switch (state){
        SightsMain() => const HomeStateWidget(),
        FavouritesMain() => const FavouritesStateWidget(),
        ProfileMain() => const ProfileStateWidget(),
        SocialMain() => SocialNetworkWidget(),
        ErrorMain() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error: something went wrong", style: Theme.of(context).textTheme.displayMedium),
          ],
        )

      },
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.connect_without_contact), label: "Social")
          ],
          currentIndex: index,
          onTap: (int newIndex) {
            setState(() {
              index = newIndex;
              state = GlobalConstants.screenStateList[newIndex];
            });
          }),
    );
  }
  
}
