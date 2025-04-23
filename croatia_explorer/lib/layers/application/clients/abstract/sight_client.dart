
import 'package:croatia_explorer/layers/data/dto/sight_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part '../implementations/sight_client.g.dart';

@RestApi(baseUrl: "http://144.91.87.48:8080")
abstract class SightsClient {

    factory SightsClient(Dio dio) = _SightsClient;

    @GET("/sight/all")
    Future<HttpResponse<List<SightDto>>> getAllSights();

    @GET("/sight/{id}")
    Future<HttpResponse<SightDto>> getOneSight(@Path('id') int id);

}