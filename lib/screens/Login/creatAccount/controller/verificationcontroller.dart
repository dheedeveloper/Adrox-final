import 'package:adrox/screens/Login/creatAccount/model/verificationmodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';

class VerifyController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  VerificationModel? _VerificationModel;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  VerificationModel? get verifyData => _VerificationModel;

  // API call function for user sign-in
  Future<void> verify2FA(String twofactorsecret, String twofacode) async {
    _setLoading(true);

    Map<String, String> requestData = {
      "twofactorsecret":twofactorsecret,
      "twofacode":twofacode,
    };

    final response = await ApiService.postRequest(ApiConstants.verification2FA, requestData);

    if (response != null && response is Map<String, dynamic>) {
      if (response.containsKey("error")) {
        _errorMessage = response["message"] ?? "";
        _VerificationModel = null;
      } else {
        _VerificationModel = VerificationModel.fromJson(response);
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
