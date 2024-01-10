import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/dasboard/controller/dasboard_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HideToScrollWidget extends ConsumerWidget {
  const HideToScrollWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashBoardWatch = ref.watch(dasboardController);
    return AnimatedContainer(
      duration: 300.ms,
      height: dashBoardWatch.isBottomNavVisible
          ? kBottomNavigationBarHeight + 30.h
          : 0,
      child: Wrap(children: [child]),
    );
  }
}
