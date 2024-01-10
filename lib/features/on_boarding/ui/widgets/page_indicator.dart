import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/on_boarding/controller/on_boarding_controller.dart';

class PageIndicator extends ConsumerWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onBoardingWatch = ref.watch(onBoardingController);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return onBoardingWatch.index == index
              ? Container(
                  height: 15.h,
                  width: 40.w,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: BorderRadius.circular(10.r)),
                )
              : GestureDetector(
                  onTap: () {
                    onBoardingWatch.setPage(index);
                  },
                  child: Container(
                    height: 15.h,
                    width: 15.w,
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: context.colorScheme.primary)),
                  ),
                );
        }));
  }
}
