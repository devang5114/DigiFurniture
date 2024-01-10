import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkOutProductController = ChangeNotifierProvider<CheckOutProductController>((ref) {
  return CheckOutProductController();
});

class CheckOutProductController extends ChangeNotifier{}