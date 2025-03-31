

import 'package:adrox/screens/Landing/profitMenu/model/profitlendmodel.dart';
import 'package:adrox/screens/Landing/profitMenu/model/proflendhistorymodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';

class ProfitLendHistoryController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  ProfitLendHistoryModel? _profitLendingHistoryData;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  ProfitLendHistoryModel? get profLendingHistoryData => _profitLendingHistoryData;

  Future<void> profLendHistoryApiCall(String authToken,String filterDate) async {
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

      Map<String, String> requestData = {
        "filterdate":filterDate
      };

      final response = await ApiService.postRequestWithBodyHeaders(ApiConstants.profitLendingHistory,requestData,headers);

      if (response != null && response is Map<String, dynamic>) {
        if (response.containsKey("error")) {
          _errorMessage = response["message"] ?? "Error fetching data";
          _profitLendingHistoryData = null;
        } else {
          _profitLendingHistoryData = ProfitLendHistoryModel.fromJson(response);
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