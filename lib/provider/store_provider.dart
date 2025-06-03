// lib/providers/store_provider.dart
import 'package:flutter/material.dart';
import 'package:shoes/model/store_model.dart' show StoreModel;
import 'package:shoes/services/api_repositry.dart' show ApiRepositry;

class StoreProvider1w extends ChangeNotifier {
  TextEditingController pinController = TextEditingController();
  StoreModel? _storeModel; // Nullable, as data might not be loaded yet
  bool _isLoading = false;
  String? _errorMessage;
  StoreModel? get storeModel => _storeModel;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  final ApiRepositry _apiRepositry = ApiRepositry();

  Future<void> fetchStores() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      // _storeModel = await _apiRepositry.getRpdFiltersSTORE();
      // pinController.text = _storeModel.data.


    } catch (e) {
      _errorMessage = e.toString();
      print('Error in StoreProvider: $_errorMessage'); // Log the actual error
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI that loading has finished (success or error)
    }
  }

// You can add other methods to manipulate the _storeModel if needed
}