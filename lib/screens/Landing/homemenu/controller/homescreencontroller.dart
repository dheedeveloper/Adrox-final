import 'package:flutter/cupertino.dart';
import 'package:adrox/screens/Landing/homemenu/model/homescreenmodel.dart';
import '../../../../core/constants/apiconstants.dart';
import '../../../../core/constants/apiservice.dart';

class HomeScreenController with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  HomeScreenModel? _homeScreenData;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  HomeScreenModel? get homeData => _homeScreenData;

  Future<void> homeApiCall(String authToken) async {
    if (authToken.isEmpty) {
      _errorMessage = "Auth token is missing";
      return;
    }

    _setLoading(true);

    try {
      // Define headers
      Map<String, String> headers = {
        "Authorization": authToken,
      };

      final response = await ApiService.getRequestWithHeaders(ApiConstants.userHome, headers);

      if (response != null && response is Map<String, dynamic>) {
        if (response.containsKey("error")) {
          _errorMessage = response["message"] ?? "Error fetching data";
          _homeScreenData = null;
        } else {
          _homeScreenData = HomeScreenModel.fromJson(response);
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
