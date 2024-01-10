import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/enums.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/profile/controller/address_controller.dart';
import 'package:digifurniture/features/profile/controller/profile_controller.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../common/utils/constants/app_assets.dart';
import '../../../../../common/utils/widgets/text_input.dart';

class AddNewAddressView extends ConsumerWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressWatch = ref.watch(addressController);
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10.h),
      child: Form(
        key: addressWatch.addressFormKey,
        child: Column(
          children: [
            MyTextInput(
              hintText: 'Full Name',
              filledColor: Colors.grey.shade100,
              onChange: (val) {
                addressWatch.fullName = val ?? '';
              },
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
              filled: true,
              customBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Colors.transparent)),
            ).marginOnly(bottom: 15.h),
            MyTextInput(
              hintText: 'Flat/House No/Building ',
              filledColor: Colors.grey.shade100,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
              filled: true,
              customBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Colors.transparent)),
            ).marginOnly(bottom: 15.h),
            MyTextInput(
              hintText: 'Landmark (Optional)',
              filledColor: Colors.grey.shade100,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
              filled: true,
              customBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Colors.transparent)),
            ).marginOnly(bottom: 15.h),
            MyTextInput(
              hintText: 'Pincode',
              filledColor: Colors.grey.shade100,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
              filled: true,
              customBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Colors.transparent)),
            ).marginOnly(bottom: 15.h),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: 'Gujarat',
                  child: Text('Gujarat'),
                ),
                DropdownMenuItem(
                  value: 'Mumbai',
                  child: Text('Mumbai'),
                )
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: 'State',
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
              ),
            ).marginOnly(bottom: 15.h),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: 'Ahmedabad',
                  child: Text('Ahmedabad'),
                ),
                DropdownMenuItem(
                  value: 'Surat',
                  child: Text('Surat'),
                )
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: 'City',
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
              ),
            ).marginOnly(bottom: 15.h),
            IntlPhoneField(
              textInputAction: TextInputAction.next,
              style: const TextStyle(fontSize: 14),
              dropdownTextStyle:
                  const TextStyle(color: Colors.black, fontSize: 15),
              dropdownIcon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
              ),
              dropdownIconPosition: IconPosition.trailing,
              initialCountryCode: 'IN',
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
                fillColor: Colors.grey.shade100,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.red)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
                helperText: null,
                hintText: 'Phone Number',
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
              ),
            ).marginOnly(bottom: 15.h),
            IntlPhoneField(
              textInputAction: TextInputAction.next,
              style: const TextStyle(fontSize: 14),
              dropdownTextStyle:
                  const TextStyle(color: Colors.black, fontSize: 15),
              dropdownIcon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
              ),
              dropdownIconPosition: IconPosition.trailing,
              initialCountryCode: 'USA',
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
                fillColor: Colors.grey.shade100,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.red)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
                helperText: null,
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
              ),
            ).marginOnly(bottom: 15.h),
            Row(
              children: [
                Text(
                  'Address Type',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ).marginOnly(right: 10.h),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      addressWatch.addressType = AddressType.home;
                      addressWatch.notifyListeners();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.w,
                          padding: EdgeInsets.all(1.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: context.colorScheme.primary,
                                  width: 2.w)),
                          child: Container(
                            height: 16.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  addressWatch.addressType == AddressType.home
                                      ? context.colorScheme.primary
                                      : Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      addressWatch.addressType = AddressType.office;
                      addressWatch.notifyListeners();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.w,
                          padding: EdgeInsets.all(1.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: context.colorScheme.primary,
                                  width: 2.w)),
                          child: Container(
                            height: 16.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  addressWatch.addressType == AddressType.office
                                      ? context.colorScheme.primary
                                      : Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Office',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ).marginVertical(15.h)
          ],
        ),
      ),
    ).marginSymmetric(horizontal: 15.h, vertical: 15.h);
  }
}
