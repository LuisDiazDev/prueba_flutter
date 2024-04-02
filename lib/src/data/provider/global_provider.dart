import 'dart:async';

import 'package:http/http.dart';
import 'package:testing/src/data/provider/rest_api_provider.dart';


class UserAlreadyExist implements Exception {
  final String message;

  UserAlreadyExist(this.message);

  @override
  String toString() {
    return "UserAlreadyExist: $message";
  }
}


class GlobalProvider {
  RestApiProvider restApi = RestApiProvider();

  Future<Response> _post(String endpoint, Map body) async {
    return await restApi.sendRequest(
      "post",
      endpoint: endpoint,
      body: body,
    );
  }

  Future<Response> _get(String endpoint, {String? host}) async {
    return await restApi.sendRequest(
      "get",
      endpoint: endpoint,
    );
  }

  Future<Response> _put(String endpoint, Map body) async {
    return await restApi.sendRequest(
      "put",
      endpoint: endpoint,
      body: body,
    );
  }

  Future<Response> _delete(String endpoint) async {
    return await restApi.sendRequest(
      "delete",
      endpoint: endpoint,
    );
  }



}
