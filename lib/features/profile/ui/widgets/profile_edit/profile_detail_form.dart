import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/profile/controller/profile_controller.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../common/utils/constants/app_assets.dart';
import '../../../../../common/utils/widgets/text_input.dart';

class ProfileDetailForm extends ConsumerWidget {
  const ProfileDetailForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return Form(
      key: profileWatch.profileEditFormKey,
      child: Column(
        children: [
          MyTextInput(
            hintText: 'Name',
            filledColor: Colors.grey.shade100,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
            filled: true,
            customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.transparent)),
          ).marginOnly(bottom: 15.h),
          MyTextInput(
            hintText: 'SurName ',
            filledColor: Colors.grey.shade100,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
            filled: true,
            customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.transparent)),
          ).marginOnly(bottom: 15.h),
          MyTextInput(
            hintText: 'DD/MM/YYYY ',
            readOnly: true,
            onTap: () => profileWatch.pickDate(context),
            controller: profileWatch.dobController,
            filledColor: Colors.grey.shade100,
            suffixIcon: const Icon(Icons.calendar_month_rounded),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
            filled: true,
            customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.transparent)),
          ).marginOnly(bottom: 15.h),
          MyTextInput(
            hintText: 'Email',
            filledColor: Colors.grey.shade100,
            suffixIcon: IconButton(
                onPressed: null,
                icon: Image.asset(
                  AppAssets.emailIcon,
                  fit: BoxFit.cover,
                  height: 28.h,
                  color: Colors.black,
                  width: 28.w,
                )),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
            filled: true,
            customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.transparent)),
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
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ).marginOnly(bottom: 15.h),
          DropdownButtonFormField(
            items: const [
              DropdownMenuItem(
                value: 'Male',
                child: Text('Male'),
              ),
              DropdownMenuItem(
                value: 'female',
                child: Text('Female'),
              )
            ],
            onChanged: (value) {},
            value: 'Male',
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
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
          )
        ],
      ),
    ).marginOnly(top: 30.h);
  }
}
