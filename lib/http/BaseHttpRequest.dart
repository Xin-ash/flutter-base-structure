import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:package_info/package_info.dart';

class BaseHttpRequest {
  ///Services
  late BuildContext context;

  ///Loading
  Loading? loading;
  bool showLoading = false;

  ///Variable
  late String endPoint;
  var extraHeader = [];
  var jsonBody;

  Future<JsonResponse?> httpPost() async {
    ///Show loading
    if (showLoading) {
      loading = new Loading(context);
      loading!.openLoadingDialog();
    }

    Map<String, String> headers = await _headers(extraHeader, jsonBody);
    JsonResponse response = await _performPost(headers);

    ///Dismiss Loading
    if (loading != null) {
      loading!.dismissDialog();
    }

    if (response.statusCode == 200) {
      return JsonResponse(response.statusCode, response.body);
    } else {
      return null;
    }
  }

  ///Normal API request
  Future<JsonResponse> _performPost(headers) async {
    final response = await http.post(Uri.parse(endPoint), headers: headers, body: jsonBody).catchError((error) {
      return new http.Response('{}', 999);
    });

    return JsonResponse(response.statusCode, response.body);
  }
}
