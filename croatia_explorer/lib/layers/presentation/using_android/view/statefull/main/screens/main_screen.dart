import 'package:croatia_explorer/layers/domain/sight.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers_and_notifiers/sights_screen_state_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreenWidget extends ConsumerStatefulWidget {
  const MainScreenWidget({super.key});

  @override
  MainScreenWidgetState createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends ConsumerState<MainScreenWidget> {
  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(sightsScreenStateProvider.notifier);
    final state = ref.watch(sightsScreenStateProvider);
    return Scaffold(
      appBar: switchNameAppBar(context, index),
      body: state as StatefulWidget,
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
