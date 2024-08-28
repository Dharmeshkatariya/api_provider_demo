import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../models/property_data.dart';
import '../models/qr_code_data.dart';
import '../utils/constant.dart';
import 'api_end_points.dart';
import 'dio_api_client.dart';

class API {
  static DioClient? dioClient;
  static bool enableLog = false;

  API() {
    var dio = Dio();
    dioClient = DioClient(ApiConstant.baseUrl, dio);
  }

//:::::::::::::::::::::::::::::::::::::::   LOGIN API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future<Either<String, dynamic>> loginApi(
      {Map<String, dynamic>? body}) async {
    String? data;
    try {
      if (body!.isNotEmpty) {
        data = json.encode(body);
      }
      final response = await dioClient!.post(
        loginApiEnd,
        data: data,
        skipAuth: true,
      );

      if (enableLog) log(name: "LOGIN API RES", "$response");
      return Right(response);
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);
    }
  }

  static Future<Either<String, PropertyData>> getHomePropertyApi() async {
    try {
      final response = await dioClient!.get(propertyApiEnd, skipAuth: false);
      if (enableLog) log(name: "Property Api  RES", "$response");

      return Right(PropertyData.fromJson(response));
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);
    }
  }

  static Future<Either<String, QrCodeData>> getQrCodeApi(
      {Map<String, dynamic>? body}) async {
    String? data;

    try {
      if (body!.isNotEmpty) {
        data = json.encode(body);
      }
      final response =
          await dioClient!.get(qrCodeApiEnd, skipAuth: false, data: data);
      if (enableLog) log(name: "QRCODE Api  RES", "$response");

      return Right(QrCodeData.fromJson(response));
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);
    }
  }
}
