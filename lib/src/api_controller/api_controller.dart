import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
//import 'package:get/get.dart';
//import 'dart:convert';
import 'package:profile/src/utils/const.dart' as _constants;
//import 'package:profile/src/utils/utils.dart';

class APIController {
  static const _storage = FlutterSecureStorage();
  static String? authToken;

  static saveAuthToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  static getToken() async {
    return await _storage.read(key: 'token') ?? '';
  }

  static Future<Map<String, String>> _getHeaders() async {
    if (authToken != null) {
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'auth-key': '$authToken',
      };
    }
    else {
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  /*static Future<Map<String, dynamic>> getHttpMethod({String? url, String? token}) async {
    if (token != null)
    {
      var header = await _getHeaders();
      http.Response response = await http.get(
        Uri.parse("$apiEndpoint$url"),
        headers: header
      );
      print(response);
      return {};
    }
  }*/
  static Future checkService() async {
    http.Response response;
    var header = await _getHeaders();
    response = await http.get(
        Uri.parse(_constants.serviceUri as String),
        headers: header
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': null,
      };
      print(data);
    } else {
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error_description': null,
      };
      print(data);
    }
  }
}

  /*static Future<Map<String, dynamic>> postHttpMethod(
      {@required String? url,
        Map<String, dynamic>? data,
        String? token}) async {
    if (token != null) {
      var header = await _getHeaders();
      http.Response response = await http.post(
        Uri.parse("$endPointUrl$url"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'bt-key': '$token',
        },
        body: data == null ? null : jsonEncode(data),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': null,
        };
        return data;
      } else if (response.statusCode == 400) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "400",
        };
        return data;
      } else if (response.statusCode == 401) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "401",
        };
        return data;
      } else if (response.statusCode == 403) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "403",
        };
        return data;
      } else if (response.statusCode == 404) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "404",
        };
        return data;
      } else if (response.statusCode == 500) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "500",
        };
        return data;
      } else {
        return {
          'body': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    } else {
      var header = await _getHeaders();
      http.Response response = await http.post(
        Uri.parse("$endPointUrl$url"),
        headers: header,
        body: data == null ? null : jsonEncode(data),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': null,
        };
        return data;
      } else if (response.statusCode == 400) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "400",
        };
        return data;
      } else if (response.statusCode == 401) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "401",
        };
        return data;
      } else if (response.statusCode == 403) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "403",
        };
        return data;
      } else if (response.statusCode == 404) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "404",
        };
        return data;
      } else if (response.statusCode == 500) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "500",
        };
        return data;
      } else {
        return {
          'body': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    }
  }

  static Future<Map<String, dynamic>> putHttpMethod(
      {@required String? url,
        Map<String, dynamic>? data,
        String? token}) async {
    if (token != null) {
      http.Response response = await http.put(
        Uri.parse("$endPointUrl$url"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'bt-key': token,
        },
        body: data == null ? null : jsonEncode(data),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': null,
        };
        return data;
      } else if (response.statusCode == 400) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "400",
        };
        return data;
      } else if (response.statusCode == 401) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "401",
        };
        return data;
      } else if (response.statusCode == 403) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "403",
        };
        return data;
      } else if (response.statusCode == 404) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "404",
        };
        return data;
      } else if (response.statusCode == 500) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "500",
        };
        return data;
      } else {
        return {
          'body': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    } else {
      var header = await _getHeaders();
      http.Response response = await http.put(
        Uri.parse("$endPointUrl$url"),
        headers: header,
        body: data == null ? null : jsonEncode(data),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': null,
        };
        return data;
      } else if (response.statusCode == 400) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "400",
        };
        return data;
      } else if (response.statusCode == 401) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "401",
        };
        return data;
      } else if (response.statusCode == 403) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "403",
        };
        return data;
      } else if (response.statusCode == 404) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "404",
        };
        return data;
      } else if (response.statusCode == 500) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "500",
        };
        return data;
      } else {
        return {
          'body': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    }
  }

  static Future<Map<String, dynamic>> getHttpMethod(
      {@required String? url, String? token}) async {
    if (token != null) {
      http.Response response = await http.get(
        Uri.parse("$endPointUrl$url"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'bt-key': '$token',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': null,
        };
        return data;
      } else if (response.statusCode == 400) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "400",
        };
        return data;
      } else if (response.statusCode == 401) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "401",
        };
        return data;
      } else if (response.statusCode == 403) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "403",
        };
        return data;
      } else if (response.statusCode == 404) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "404",
        };
        return data;
      } else if (response.statusCode == 500) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "500",
        };
        return data;
      } else {
        return {
          'body': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    } else {
      var header = await _getHeaders();
      http.Response response = await http.get(
        Uri.parse("$endPointUrl$url"),
        headers: header,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': null,
        };
        return data;
      } else if (response.statusCode == 400) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "400",
        };
        return data;
      } else if (response.statusCode == 401) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "401",
        };
        return data;
      } else if (response.statusCode == 403) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "403",
        };
        return data;
      } else if (response.statusCode == 404) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "404",
        };
        return data;
      } else if (response.statusCode == 500) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "500",
        };
        return data;
      } else {
        return {
          'body': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    }
  }

  static Future<Map<String, dynamic>> deleteHttpMethod(
      {@required String? url, String? token}) async {
    if (token != null) {
      http.Response response = await http.delete(
        Uri.parse("$endPointUrl$url"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'bt-key': '$token',
        },
      );
      if (response.statusCode == 200) {

        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': null,
        };
        return data;
      } else if (response.statusCode == 400) {

        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "400",
        };
        return data;
      } else if (response.statusCode == 401) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "401",
        };
        return data;
      } else if (response.statusCode == 403) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "403",
        };
        return data;
      } else if (response.statusCode == 404) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "404",
        };
        return data;
      } else if (response.statusCode == 500) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "500",
        };
        return data;
      } else {
        return {
          'body': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    } else {
      var header = await _getHeaders();
      http.Response response = await http.delete(
        Uri.parse("$endPointUrl$url"),
        headers: header,
      );
      if (response.statusCode == 200) {

        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': null,
        };
        return data;
      } else if (response.statusCode == 400) {

        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "400",
        };
        return data;
      } else if (response.statusCode == 401) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "401",
        };
        return data;
      } else if (response.statusCode == 403) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "403",
        };
        return data;
      } else if (response.statusCode == 404) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "404",
        };
        return data;
      } else if (response.statusCode == 500) {
        Map<String, dynamic> data = {
          'body': response.body,
          'headers': response.headers,
          'error_description': "500",
        };
        return data;
      } else {
        return {
          'body': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    }
  }*/