import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class RestApiProvider {
  Future<http.Response> sendRequest(
    String method, {
    required String endpoint,
    Map? body = const {},
    int? timeoutSecs,
    int attempt = 1,
  }) async {

    var uri = Uri.parse('http://fake.com/rest$endpoint');
    var headers = {
      'Content-Type': 'application/json'
    };
    var timeout = Duration(seconds: timeoutSecs ?? 5);
    http.Response? response;
    try {
      if (method == "get") {
        response = await http
            .get(
              uri,
              headers: headers,
            )
            .timeout(timeout);
      } else if (method == "post") {
        response = await http
            .post(
              uri,
              body: jsonEncode(body),
              headers: headers,
            )
            .timeout(timeout);
      } else if (method == "put") {
        response = await http
            .put(
              uri,
              body: jsonEncode(body),
              headers: headers,
            )
            .timeout(timeout);
      } else if (method == "delete") {
        response = await http
            .delete(
              uri,
              body: jsonEncode(body),
              headers: headers,
            )
            .timeout(timeout);
      }
    } catch (e) {
      log(e.toString()); // TODO: emit domain error
      if (response != null && response.statusCode > 205) {
        if (response.body.isNotEmpty &&
            response.body.toString().contains("Connection reset by peer")) {
          if (attempt > 3) {
            return response;
          }
          return sendRequest(
            method,
            endpoint: endpoint,
            timeoutSecs: timeoutSecs,
            attempt: attempt + 1,
          );
        }
      }
      if(e.toString().contains("Connection reset by peer")){
        return http.Response(e.toString(), 205);
      }
      return http.Response(e.toString(), 500);
    }

    return response!;
  }
}
