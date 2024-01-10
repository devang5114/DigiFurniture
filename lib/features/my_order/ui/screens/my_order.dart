import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/my_order/controller/my_order_controller.dart';
import 'package:digifurniture/features/my_order/ui/widgets/my_order_tabs.dart';

class MyOrder extends ConsumerStatefulWidget {
  const MyOrder({super.key});

  @override
  ConsumerState<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends ConsumerState<MyOrder> {
  @override
  void initState() {
    super.initState();
    ref.read(myOrderController).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60.h,
            width: context.screenWidth,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide.none,
                    horizontal:
                        BorderSide(color: Colors.grey.shade300, width: 1.w))),
            child: Text(
              "My Orders",
              style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
            ),
          ),
          const Expanded(child: MyOrderTabs()),
        ],
      ),
    ));
  }
}
