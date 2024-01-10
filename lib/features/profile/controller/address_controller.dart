import 'package:digifurniture/common/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressController = ChangeNotifierProvider<AddressController>((ref) {
  return AddressController();
});

class AddressController extends ChangeNotifier {
  Map<String, String>? selectedAddress;
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  List<Map<String, String>> dummyAddresses = [];
  String fullName = '';
  String flatNo = '';
  String landMark = '';
  String pinCode = '';
  String state = '';
  String city = '';
  AddressType addressType = AddressType.home;

  init() {
    dummyAddresses = [
      {'title': 'Home', 'data': '61480 Sunbrook Park, PC 5679'},
      {'title': 'Office', 'data': '6993 Meadow Valley Terra. PC 3637'},
      {'title': 'Apartment', 'data': '21833 Clyde Gallagher, PC 4662'},
      {'title': "Parent's House", 'data': '5259 Blue Bill Park. PC 4627'},
    ];
    selectedAddress = dummyAddresses[0];
  }

  selectAddress(var address) {
    selectedAddress = address;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
