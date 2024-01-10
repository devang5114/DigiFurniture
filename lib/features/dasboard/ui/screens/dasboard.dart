import 'package:digifurniture/features/cart/ui/screens/cart.dart';
import 'package:digifurniture/features/dasboard/controller/dasboard_controller.dart';
import 'package:digifurniture/features/dasboard/ui/widgets/bottom_navbar.dart';
import 'package:digifurniture/features/home/ui/screens/home.dart';
import 'package:digifurniture/features/products/ui/screens/products.dart';
import 'package:digifurniture/features/profile/ui/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/ui/widgets/home_drawer.dart';
import '../../../my_order/ui/screens/my_order.dart';

class Dasboard extends ConsumerWidget {
  const Dasboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dasBoardWatch = ref.watch(dasboardController);

    return Scaffold(
      key: dasBoardWatch.key,
      drawer: const HomeDrawer(),
      body: SafeArea(
        child: [
          const Home().animate().fade(),
          const Products().animate().fade(),
          const Cart().animate().fade(),
          const MyOrder().animate().fade(),
          const Profile().animate().fade(),
        ][dasBoardWatch.index],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
