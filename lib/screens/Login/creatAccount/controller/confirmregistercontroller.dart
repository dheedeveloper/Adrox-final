

import 'package:adrox/core/utility/text.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';
import '../model/confirmregistermodel.dart';

class ConfirmRegisterController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  ConfirmRegisterModel? _ConfirmRegisterData;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  ConfirmRegisterModel? get registerData => _ConfirmRegisterData;

  // API call function for user sign-in
  Future<void> confirmRegister(String referralId, String sponser_id,String mnemonic) async {
    _setLoading(true);

    Map<String, String> requestData = {
      "referralId":referralId,
      "sponser_id":sponser_id,
      "mnemonic":mnemonic
    };

    final response = await ApiService.postRequest(ApiConstants.registerConfirm, requestData);

    if (response != null && response is Map<String, dynamic>) {
      if (response.containsKey("error")) {
        _errorMessage = response["message"] ?? "Register failed";
        _ConfirmRegisterData = null;
      } else {
        _ConfirmRegisterData = ConfirmRegisterModel.fromJson(response);
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
