import 'package:croatia_explorer/layers/domain/post.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialMediaPost extends ConsumerWidget {
  final Post post;

  const SocialMediaPost({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Flex(
            direction: Axis.horizontal,
            children: post.images
                .map((image) => Image.memory(
                      image,
                      fit: BoxFit.cover,
                    ))
                .toList()),
      ],
    );
  }
}
