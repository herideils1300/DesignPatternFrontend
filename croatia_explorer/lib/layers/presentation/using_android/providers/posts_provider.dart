import 'package:croatia_explorer/layers/application/clients/abstract/posts_client.dart';
import 'package:croatia_explorer/layers/data/dto/image_dto.dart';
import 'package:croatia_explorer/layers/data/dto/post_dto.dart';
import 'package:croatia_explorer/layers/domain/image.dart';
import 'package:croatia_explorer/layers/domain/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsProvider extends StateNotifier<List<Post>> {
  final PostsClient client = PostsClient(Dio(BaseOptions(headers: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods":
        "GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS",
    "Access-Control-Allow-Headers": "*",
    "Access-Control-Expose-Headers": "Authorization, authenticated",
  }, connectTimeout: const Duration(minutes: 30))));
  PostsProvider(super.state);

  Future<List<Post>> getAllPosts() async {
    List<PostDto> dtos = await client.getAllPosts();

    List<Post> posts = dtos.map((element) {
      return Post(
          uid: element.uid,
          description: element.description,
          images:
              element.images.map((image) => ImageModel.fromDto(image)).toList(),
          hashtags: element.hashtags);
    }).toList();

    return posts;
  }

  Future<PostDto> postAPost(Post post) async {
    PostDto dto = await client.postImagePost(PostDto(
        id: 0,
        uid: post.uid,
        description: post.description,
        images: post.images
            .map((model) => ImageDto(0, model.index, model.image, model.width,
                model.height, model.type))
            .toList(),
        hashtags: post.hashtags));
    return dto;
  }
}

StateNotifierProvider<PostsProvider, List<Post>> socialProvider =
    StateNotifierProvider<PostsProvider, List<Post>>(
        (ref) => PostsProvider([]));
