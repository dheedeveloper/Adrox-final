

import 'package:adrox/screens/Landing/profitMenu/model/secondreferralmodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';

class SecondReferralController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  SecondReferralModel? _secondReferralModel;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  SecondReferralModel? get secondRefData => _secondReferralModel;

  Future<void> secondRefApiCall(String authToken,String filterDate,String filterLevel) async {
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
        "filterdate":filterDate,
        "filterlevel":filterLevel
      };

      final response = await ApiService.postRequestWithBodyHeaders(ApiConstants.referralTwo,requestData,headers);

      if (response != null && response is Map<String, dynamic>) {
        if (response.containsKey("error")) {
          _errorMessage = response["message"] ?? "Error fetching data";
          _secondReferralModel = null;
        } else {
          _secondReferralModel = SecondReferralModel.fromJson(response);
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