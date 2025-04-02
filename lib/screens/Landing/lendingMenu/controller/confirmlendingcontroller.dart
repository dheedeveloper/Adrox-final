

import 'package:adrox/screens/Landing/lendingMenu/model/confirmlendingmodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';

class ConfirmLendingController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  ConfirmLendingModel? _confirmLendingData;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  ConfirmLendingModel? get confirmLendingData => _confirmLendingData;

  Future<void> confirmLendingApiCall(String authToken, String package_id, String user_amount) async {
    if (authToken.isEmpty) {
      _errorMessage = "Auth token is missing";
      notifyListeners();
      return;
    }

    _setLoading(true);

    try {
      Map<String, String> headers = {
        "Authorization": authToken,
      };

      Map<String, String> requestData = {
        "package_id": package_id,
        "user_amount": user_amount
      };

      final response = await ApiService.postRequestWithBodyHeaders(
          ApiConstants.lendingConfirm, requestData, headers
      );

      if (response != null && response is Map<String, dynamic>) {
        if (response.containsKey("error")) {
          _errorMessage = response["message"] ?? "Error fetching data";
          _confirmLendingData = null;
        } else {
          _confirmLendingData = ConfirmLendingModel.fromJson(response);
          _errorMessage = '';
        }
      } else {
        _errorMessage = "Unexpected response format";
        _confirmLendingData = null;
      }
    } catch (e) {
      _errorMessage = "Network error: ${e.toString()}";
      _confirmLendingData = null;
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}