import 'package:bliu/api/dio_services.dart';
import 'package:bliu/model_listener/home_model_listener.dart';
import 'package:dio/dio.dart';

class HomeModel {
  late Dio _dio;
  HomeModelListener listener;

  HomeModel(this.listener) {
    _dio = DioServices().to();
  }
}