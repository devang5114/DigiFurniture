import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/my_order/ui/widgets/pending_order/pending_order.dart';

import 'complete_order/complete_order.dart';

class MyOrderTabs extends ConsumerWidget {
  const MyOrderTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.h,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15.w),
                tabs: const [
                  Tab(
                    child: Text(
                      'Pending',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text('Completed',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ]),
            const Expanded(
                child: TabBarView(children: [PendingOrders(), CompleteOrder()]))
          ],
        ));
  }
}
