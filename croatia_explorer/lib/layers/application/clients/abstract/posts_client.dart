import 'package:croatia_explorer/layers/data/dto/post_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part '../implementations/posts_client.g.dart';

@RestApi(baseUrl: "http://localhost:5121")
abstract class PostsClient {

  factory PostsClient(Dio dio) = _PostsClient;

  @GET("/posts")
  Future<List<PostDto>> getAllPosts();

  @GET("/posts/{id}")
  Future<List<PostDto>> getPost(@Path("id") int id);

  @POST("/posts")
  Future<PostDto> postImagePost(@Body(nullToAbsent: true) PostDto dto);

  @PUT("/posts/{id}")
  Future<PostDto> putPost(@Body(nullToAbsent: true) PostDto dto);

  @DELETE("/post/{id}")
  Future<PostDto> deletePost(@Path("id") int id);
}
