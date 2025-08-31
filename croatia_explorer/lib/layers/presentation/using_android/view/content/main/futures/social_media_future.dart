import 'package:croatia_explorer/layers/presentation/using_android/providers/posts_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/shared/custom_widgets/social_media_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SocialMediaFuture extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SocialMediaFutureState();
  }
}

class SocialMediaFutureState extends ConsumerState<SocialMediaFuture> {
  @override
  Widget build(BuildContext context) {
    PostsProvider postsNotifier =
        ref.watch(socialProvider.notifier) as PostsProvider;
    return FutureBuilder(
        future: postsNotifier.getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, index) {
              return SocialMediaPost(post: snapshot.data![index]);
            });
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(
                child: Text("No posts yet!",
                    style: Theme.of(context).textTheme.displayMedium));
          } else if (snapshot.hasError) {
            return Center(
                child: Text("Error happend.",
                    style: Theme.of(context).textTheme.displayMedium));
          } else {
            return Container(
              width: 75,
              height: 75,
              margin: const EdgeInsets.only(top: 20),
              child: Lottie.asset("lib/assets/animations/loading_sights.json",
                  alignment: Alignment.center),
            );
          }
        });
  }
}
