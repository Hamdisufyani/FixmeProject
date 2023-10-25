import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fixme/core/class/statusrequest.dart';

import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';
class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    if (await checkInternet()) {
      try {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);

          return Right(responsebody);
        } else {
          // Handle non-200 status codes with appropriate error status
          return const Left(StatusRequest.serverFailure);
        }
      } catch (e) {
        // Handle exceptions from http.post or jsonDecode
        print('Error: $e');
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      // Handle offline situation with appropriate error status
      return const Left(StatusRequest.offlineFailure);
    }
  }
}