import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/config/theme/app_string.dart';
import '../widgets/notifications_list.dart';

class Notifications extends ConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CommonAppBar(title: appString.keyNotification),
          const NotificationsList()
        ],
      ),
    ));
  }
}
