

import 'package:adrox/screens/Landing/profitMenu/model/rightpoolmodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';

class RightPoolController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  RightPoolModel? _rightPoolModel;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  RightPoolModel? get rightPoolData => _rightPoolModel;

  Future<void> rightPoolApiCall(String authToken,String filterDate) async {
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

      final response = await ApiService.postRequestWithBodyHeaders(ApiConstants.rightPool,requestData,headers);

      if (response != null && response is Map<String, dynamic>) {
        if (response.containsKey("error")) {
          _errorMessage = response["message"] ?? "Error fetching data";
          _rightPoolModel = null;
        } else {
          _rightPoolModel = RightPoolModel.fromJson(response);
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