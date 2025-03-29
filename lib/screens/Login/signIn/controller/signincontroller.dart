import 'package:flutter/material.dart';
import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';
import '../model/signinmodel.dart';

class SignInController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  SignInModel? _signInData;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  SignInModel? get signInData => _signInData;

  // API call function for user sign-in
  Future<void> signIn(String walletAddress, String mnemonicKey,String code) async {
    _setLoading(true);

    Map<String, String> requestData = {
      "walletAddress": walletAddress,
      "mnemonicKey": mnemonicKey,
      "twofaCode":code
    };

    final response = await ApiService.postRequest(ApiConstants.loginUser, requestData);

    if (response != null && response is Map<String, dynamic>) {
      if (response.containsKey("error")) {
        _errorMessage = response["message"] ?? "Login failed";
        _signInData = null;
      } else {
        _signInData = SignInModel.fromJson(response);
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
