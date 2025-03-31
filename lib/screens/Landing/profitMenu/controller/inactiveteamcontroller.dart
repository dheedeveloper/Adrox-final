

import 'package:adrox/screens/Landing/profitMenu/model/inactiveteammodel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';

class InActiveController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  InActiveTeamModel? _inActiveTeamModel;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  InActiveTeamModel? get inActiveData => _inActiveTeamModel;

  Future<void> rankApiCall(String authToken,String filterDate) async {
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

      final response = await ApiService.postRequestWithBodyHeaders(ApiConstants.inactiveTeam,requestData,headers);

      if (response != null && response is Map<String, dynamic>) {
        if (response.containsKey("error")) {
          _errorMessage = response["message"] ?? "Error fetching data";
          _inActiveTeamModel = null;
        } else {
          _inActiveTeamModel = InActiveTeamModel.fromJson(response);
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