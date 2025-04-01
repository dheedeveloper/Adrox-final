

import 'package:adrox/screens/Landing/profitMenu/model/referralmodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';

class ReferralController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  ReferralModel? _referralModel;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  ReferralModel? get referralData => _referralModel;

  Future<void> referralApiCall(String authToken,String filterDate) async {
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

      final response = await ApiService.postRequestWithBodyHeaders(ApiConstants.profitReferral,requestData,headers);

      if (response != null && response is Map<String, dynamic>) {
        if (response.containsKey("error")) {
          _errorMessage = response["message"] ?? "Error fetching data";
          _referralModel = null;
        } else {
          _referralModel = ReferralModel.fromJson(response);
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