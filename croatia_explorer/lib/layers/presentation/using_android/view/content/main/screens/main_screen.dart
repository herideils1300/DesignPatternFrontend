import 'package:croatia_explorer/layers/application/constants/global.dart';
import 'package:croatia_explorer/layers/domain/post.dart';
import 'package:croatia_explorer/layers/presentation/using_android/providers/posts_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/constants/values.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/app_bar.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/button.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/screen_states.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/state_implementations/favourites_state.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/state_implementations/profile_state.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/state_implementations/sights_state.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/states/state_implementations/social_network_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Post post = Post(uid: "", description: "", images: [], hashtags: []);
        showDialog(
            context: context,
            builder: (context) {
              List<XFile> images = [];
              return Form(
                  child: Dialog(
                child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: images
                            .map((element) => Image.asset(element.path))
                            .toList(),
                      ),
                    ),
                    ButtonWidget(
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          List<XFile> files = await picker.pickMultiImage(
                              maxWidth: double.maxFinite,
                              maxHeight: double.maxFinite,
                              limit: 10);
                          setState(() {
                            images = files;
                          });
                        },
                        textContent: "Pick images",
                        marginInsets:
                            CustomSharedConstants.boxInsets(2.0, 5.0)),
                    TextFormField(
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      onSaved: (value) {},
                    ),
                    TextFormField(
                      onSaved: (newValue) {
                        post.hashtags = newValue!.split(' ');
                      },
                      onChanged: (newValue) {
                        if (newValue[newValue.length - 1] == " ") {
                          newValue = newValue
                              .replaceAll(" ", " #")
                              .replaceAll("##", "#");
                        }
                      },
                    )
                  ],
                ),
              ));
            });
        ref.read(socialProvider.notifier).postAPost(post);
      }),
      body: switch (state) {
        SightsMain() => const HomeStateWidget(),
        FavouritesMain() => const FavouritesStateWidget(),
        ProfileMain() => const ProfileStateWidget(),
        SocialMain() => SocialNetworkWidget(),
        ErrorMain() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Error: something went wrong",
                  style: Theme.of(context).textTheme.displayMedium),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.connect_without_contact), label: "Social")
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
