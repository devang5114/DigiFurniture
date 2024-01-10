import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authController = ChangeNotifierProvider<AuthController>((ref) {
  return AuthController();
});

class AuthController extends ChangeNotifier{}