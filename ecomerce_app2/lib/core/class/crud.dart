import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/function/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postdata(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return left(StatusRequest.serverfailure);
    }
  }
}
