import 'package:croatia_explorer/layers/data/dto/SightDto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

@RestApi(baseUrl: "http://144.91.87.48:8080")
abstract class SightClient {

    SightClient(Dio dio); 

    @GET("/sight/all")
    Future<List<SightDto>> getAllSights();

    @GET("/sight/{id}")
    Future<SightDto> getOneSight(@Path('id') int id);

}