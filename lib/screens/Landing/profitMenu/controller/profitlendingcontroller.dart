

import 'package:adrox/screens/Landing/profitMenu/model/profitlendmodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';

class ProfitLendingController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  ProfitLendingModel? _profitLendingData;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  ProfitLendingModel? get profitLendingData => _profitLendingData;

  Future<void> profitLendingApiCall(String authToken) async {
    if (authToken.isEmpty) {
      _errorMessage = "Auth token is missing";
      notifyListeners();
      return;
    }

    _setLoading(true);

    try {
      // Define headers
      Map<String, String> headers = {
        "Authorization": authToken,
      };

      final response = await ApiService.postRequestWithHeader(ApiConstants.profitLendingBonus,headers);

      if (response != null && response is Map<String, dynamic>) {
        if (response.containsKey("error")) {
          _errorMessage = response["message"] ?? "Error fetching data";
          _profitLendingData = null;
        } else {
          _profitLendingData = ProfitLendingModel.fromJson(response);
          _errorMessage = '';
        }
      } else {
        _errorMessage = "Unexpected response format";
      }
    } catch (e) {
      _errorMessage = "Network error: ${e.toString()}";
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isLoading = value;
      notifyListeners();
    });
  }
}