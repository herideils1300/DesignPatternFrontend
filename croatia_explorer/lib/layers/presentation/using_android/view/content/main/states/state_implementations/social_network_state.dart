import 'package:croatia_explorer/layers/presentation/using_android/view/content/main/futures/social_media_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialNetworkWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SocialNetworkState();
  }

}

class SocialNetworkState extends ConsumerState<SocialNetworkWidget> {
  @override
  Widget build(BuildContext context) {
    return SocialMediaFuture();
  }

}