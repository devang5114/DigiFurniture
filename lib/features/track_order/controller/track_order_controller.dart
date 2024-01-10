import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trackOrderController =
    ChangeNotifierProvider<TrackOrderController>((ref) {
  return TrackOrderController();
});

class TrackOrderController extends ChangeNotifier {
  List<OrderStatusData> orderStatus = [
    OrderStatusData('Order In Transit - Dec 17',
        '32 Manchester Ave, Ringgold, GA 30736', '15:20 PM'),
    OrderStatusData('Order... Customs Port - Dec 16',
        '4 Evergreen Street Lake Zurich, IL 60047', '14:40 PM'),
    OrderStatusData('Orders are... Shipped - Dec 15',
        '9177 Hillcrest Street Wheeling, WV 26003', '11:30 AM'),
    OrderStatusData('Order is in Packing - Dec 15',
        '891 Glen Ridge St. Gainesville, VA 20155 ', '10:25 AM'),
    OrderStatusData('Verified Payments - Dec 15',
        '55 Summerhouse Dr. Apopka, FL 32703', '10:04 AM'),
  ];
  init() {}
}

class OrderStatusData {
  final String title;
  final String data;
  final String time;

  OrderStatusData(this.title, this.data, this.time);
}
