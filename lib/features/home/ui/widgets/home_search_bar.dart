import 'package:animations/animations.dart';
import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/search/ui/screens/search.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../common/utils/constants/app_const.dart';
import '../../../../common/utils/widgets/text_input.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({this.node, super.key, this.isSearchScreen = false});
  final bool isSearchScreen;
  final FocusNode? node;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      transitionDuration: 700.ms,
      closedBuilder: (context, action) {
        return GestureDetector(
          onTap: () {
            if (!isSearchScreen) {
              action.call();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 3.w),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.withOpacity(.8))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: null,
                    icon: Image.asset(
                      AppAssets.searchIcon,
                      height: 26.h,
                      width: 26.w,
                    )),
                if (isSearchScreen)
                  Expanded(
                      child: MyTextInput(
                    focusNode: node,
                    borderInputNone: true,
                  ))
                else ...[
                  Text(
                    appString.keySearch,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const Spacer()
                ],
                IconButton(
                    onPressed: () {
                      if (isSearchScreen) {
                        context.pushNamed(AppRoutes.searchFilter,
                            arguments: {isFromSearchKey: true});
                      } else {
                        context.pushNamed(AppRoutes.searchFilter);
                      }
                    },
                    icon: Image.asset(
                      AppAssets.filterIcon,
                      height: 26.h,
                      width: 26.w,
                    ))
              ],
            ),
          ),
        );
      },
      openBuilder: (context, action) {
        return const Search();
      },
    );
  }
}
