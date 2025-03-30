import 'dart:convert';
import 'package:adrox/core/constants/App_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // GET request
  static Future<dynamic> getRequest(String url) async {
    print("GET Request URL: $url");

    try {
      final response = await http.get(Uri.parse(url));

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "error": "Failed to fetch data",
          "statusCode": response.statusCode,
          "message": response.body
        };
      }
    } catch (e) {
      print("GET Request Error: $e");
      return {"error": "Network Error", "details": e.toString()};
    }
  }

  // POST request
  static Future<dynamic> postRequest(String url, Map<String, dynamic> requestData) async {
    print("POST Request URL--------: $url");
    print("Request Data------------: ${requestData.toString()}");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestData),
      );

      print("Response Status---------------: ${response.statusCode}");
      print("Response Body ----------------: ${response.body.toString()}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return {
          "error": "Failed to send data",
          "statusCode": response.statusCode,
          "message": response.body
        };
      }
    } catch (e) {
      print("POST Request Error: $e");
      return {"error": "Network Error", "details": e.toString()};
    }
  }

  static Future<dynamic> postRequestWithHeaders(String url, Map<String, dynamic> requestData, Map<String, String> headers) async {
    print("POST Request URL--------: $url");
    print("Request Data------------: ${jsonEncode(requestData)}");
    print("Headers ----------------: $headers");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          ...headers, // Merging additional headers
        },
        body: jsonEncode(requestData),
      );

      print("Response Status---------------: ${response.statusCode}");
      print("Response Body ----------------: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return {
          "error": "Failed to send data",
          "statusCode": response.statusCode,
          "message": response.body
        };
      }
    } catch (e) {
      print("POST Request Error: $e");
      return {"error": "Network Error", "details": e.toString()};
    }
  }

  static Future<dynamic> getRequestWithHeaders(String url, Map<String, String> headers) async {
    print("GET Request URL--------: $url");
    print("Request Headers--------: ${headers.toString()}");

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers, // Sending only headers
      );

      print("Response Status---------------: ${response.statusCode}");
      print("Response Body ----------------: ${response.body.toString()}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return {
          "error": "Failed to fetch data",
          "statusCode": response.statusCode,
          "message": response.body
        };
      }
    } catch (e) {
      print("GET Request Error: $e");
      return {"error": "Network Error", "details": e.toString()};
    }
  }
}


class DataLoader extends StatefulWidget {
  const DataLoader({super.key});

  @override
  State<DataLoader> createState() => _DataLoaderState();
}

class _DataLoaderState extends State<DataLoader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator(
      color: AppColors.primarycolor,
    ),),);
  }
}
