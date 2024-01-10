import 'package:digifurniture/features/auth/ui/screens/auth.dart';
import 'package:digifurniture/features/auth/ui/screens/forget_password.dart';
import 'package:digifurniture/features/auth/ui/screens/forget_password_otp.dart';
import 'package:digifurniture/features/auth/ui/screens/new_password.dart';
import 'package:digifurniture/features/auth/ui/screens/password_chang_greeting.dart';
import 'package:digifurniture/features/auth/ui/screens/sign_in.dart';
import 'package:digifurniture/features/auth/ui/screens/sign_up.dart';
import 'package:digifurniture/features/auth/ui/screens/sign_up_details.dart';
import 'package:digifurniture/features/auth/ui/screens/sign_up_otp.dart';
import 'package:digifurniture/features/auth/ui/screens/sign_up_otp_verifyed.dart';
import 'package:digifurniture/features/cart/ui/screens/check_out_product.dart';
import 'package:digifurniture/features/cart/ui/screens/shipping_address.dart';
import 'package:digifurniture/features/dasboard/ui/screens/dasboard.dart';
import 'package:digifurniture/features/filter/ui/screens/category_selection.dart';
import 'package:digifurniture/features/filter/ui/screens/search_filter.dart';
import 'package:digifurniture/features/home/ui/screens/home.dart';
import 'package:digifurniture/features/most_popular_products/ui/screens/most_popular_products.dart';
import 'package:digifurniture/features/my_wishlist/ui/screens/my_wishlist.dart';
import 'package:digifurniture/features/notifications/ui/screens/notifications.dart';
import 'package:digifurniture/features/on_boarding/ui/screens/on_boarding.dart';
import 'package:digifurniture/features/payment/ui/screens/payment.dart';
import 'package:digifurniture/features/payment/ui/screens/payment_methods.dart';
import 'package:digifurniture/features/payment/ui/screens/view_order.dart';
import 'package:digifurniture/features/product_detail/ui/screens/product_detail.dart';
import 'package:digifurniture/features/product_reviews/ui/screens/product_reviews.dart';
import 'package:digifurniture/features/profile/ui/screens/add_new_address.dart';
import 'package:digifurniture/features/profile/ui/screens/contact_us.dart';
import 'package:digifurniture/features/profile/ui/screens/help_center.dart';
import 'package:digifurniture/features/profile/ui/screens/notification_setting.dart';
import 'package:digifurniture/features/profile/ui/screens/privacy_policy.dart';
import 'package:digifurniture/features/profile/ui/screens/profile_edit.dart';
import 'package:digifurniture/features/search/ui/screens/search.dart';
import 'package:digifurniture/features/track_order/ui/screens/track_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../features/most_popular_products/ui/widget/most_popular_products.dart';
import '../../../features/profile/ui/screens/address.dart';
import '../../../features/splash/splash.dart';
import '../../utils/constants/app_const.dart';
import 'app_routes.dart';
import 'package:page_transition/page_transition.dart';

class AppRouteManager {
  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    final isFromFilter = args?[isFromFilterKey] ?? false;
    final isFromSearch = args?[isFromSearchKey] ?? false;
    final productId = args?[productIdKey] ?? '-1';
    ProductData? product = args?['product'];
    switch (settings.name) {
      case AppRoutes.splash:
        return PageTransition(
            child: const Splash(), type: PageTransitionType.fade);
      case AppRoutes.onBoarding:
        return PageTransition(
            child: const OnBoarding(), type: PageTransitionType.fade);
      case AppRoutes.auth:
        return PageTransition(
            child: const Auth(), type: PageTransitionType.fade);

      case AppRoutes.signIn:
        return PageTransition(
            child: const SignIn(),
            type: PageTransitionType.fade,
            duration: 400.ms);

      case AppRoutes.signUp:
        return PageTransition(
            child: const SignUp(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.signUpDetail:
        return PageTransition(
            child: const SignUpDetails(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.signUpOtp:
        return PageTransition(
            child: const SignUpOtp(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.signUpOtpVerifyGreeting:
        return PageTransition(
            child: const SignUpOtpVerifyGreeting(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.forgetPassword:
        return PageTransition(
            child: const ForgetPassWord(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.forgetPasswordOtp:
        return PageTransition(
            child: const ForgetPassWordOtp(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.newPassword:
        return PageTransition(
            child: const NewPassword(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.passwordChangedGreeting:
        return PageTransition(
            child: const PasswordChangeGreeting(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.home:
        return PageTransition(
            child: const Home(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.dashBoard:
        return PageTransition(
            child: const Dasboard(),
            type: PageTransitionType.fade,
            duration: 400.ms);
      case AppRoutes.myWishList:
        return PageTransition(
            child: const MyWishlist(),
            type: PageTransitionType.rightToLeft,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.notifications:
        return PageTransition(
            child: const Notifications(),
            type: PageTransitionType.rightToLeft,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.searchFilter:
        return PageTransition(
            child: SearchFilter(isFromSearchScreen: isFromSearch),
            type: PageTransitionType.rightToLeft,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.search:
        return PageTransition(
            child: Search(isFromFilter: isFromFilter),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.categorySelection:
        return PageTransition(
            child: const CategorySelection(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.productDetail:
        return PageTransition(
            child: const ProductDetail(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.productReviews:
        return PageTransition(
            child: const ProductReviews(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.mostPopularProduct:
        return PageTransition(
            child: const MostPopularProducts(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.checkOutProducts:
        return PageTransition(
            child: const CheckOutProducts(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.shippingAddress:
        return PageTransition(
            child: const ShippingAddress(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.payment:
        return PageTransition(
            child: const Payment(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.paymentMethod:
        return PageTransition(
            child: const PaymentMethods(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.viewOrder:
        return PageTransition(
            child: const ViewOrder(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.trackOrder:
        return PageTransition(
            child: TrackOrder(product!),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.profileEdit:
        return PageTransition(
            child: const ProfileEdit(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.address:
        return PageTransition(
            child: const Address(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.addNewAddress:
        return PageTransition(
            child: const AddNewAddress(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.notificationSetting:
        return PageTransition(
            child: const NotificationSetting(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.privacyPolicy:
        return PageTransition(
            child: const PrivacyPolicy(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.contactUs:
        return PageTransition(
            child: const ContactUs(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);
      case AppRoutes.helpCenter:
        return PageTransition(
            child: const HelpCenter(),
            type: PageTransitionType.fade,
            curve: Curves.easeInOut,
            duration: 300.ms);

      default:
        return MaterialPageRoute(
            builder: (context) => const Material(
                child: Center(child: Text('Something Went Wrong'))));
    }
  }
}
