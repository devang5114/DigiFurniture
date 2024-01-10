import 'dart:io';

import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helpCenterController =
    ChangeNotifierProvider<HelpCenterController>((ref) {
  return HelpCenterController();
});

class HelpCenterController extends ChangeNotifier {
  late String selectedFilter;
  List<String> filter = [];
  List<HelpCenterData> data = [];
  init() {
    filter = ['General', 'Account', 'Service', 'Privacy', 'Querys'];
    selectedFilter = filter[0];
    data = [
      HelpCenterData(
          title: 'What is eCommerce?',
          data:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
      HelpCenterData(
          title: 'How to use eCommerce?',
          data:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
      HelpCenterData(
          title: 'How do I cancel a orders product?',
          data:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
      HelpCenterData(
          title: 'How do I cancel a orders product?',
          data:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
      HelpCenterData(
          title: 'How do I cancel a orders product?',
          data:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
    ];
  }

  setFilter(String val) {
    selectedFilter = val;
    notifyListeners();
  }

  onChangeExpansion(int i, bool val) {
    data[i].isExpanded = val;
    notifyListeners();
  }
}

class HelpCenterData {
  final String title;
  final String data;
  bool isExpanded;

  HelpCenterData(
      {required this.title, required this.data, this.isExpanded = false});
}
