import 'package:adrox/screens/Login/creatAccount/model/registermodel.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';


class RegisterController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  RegisterModel? _RegisterData;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  RegisterModel? get registerData => _RegisterData;

  // API call function for user sign-in
  Future<void> register(String email, String user,String id) async {
    _setLoading(true);

    Map<String, String> requestData = {
      "email":email,
      "username":user,
      "sponser_id":id
    };

    final response = await ApiService.postRequest(ApiConstants.registerUser, requestData);

    if (response != null && response is Map<String, dynamic>) {
      if (response.containsKey("error")) {
        _errorMessage = response["message"] ?? "Register failed";
        _RegisterData = null;
      } else {
        _RegisterData = RegisterModel.fromJson(response);
        _errorMessage = '';
      }
    } else {
      _errorMessage = "Unexpected response format";
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
