import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/auth/controller/sign_up_detail_controller.dart';

import '../../../../../common/config/theme/app_string.dart';
import '../../../../../common/utils/constants/app_assets.dart';
import '../../../../../common/utils/helper/validator.dart';
import '../../../../../common/utils/widgets/text_input.dart';

class DetailForm extends ConsumerWidget {
  const DetailForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailWatch = ref.watch(signUpDetailController);
    final appString = ref.watch(appStringController);

    return Form(
      key: detailWatch.detailKey,
      child: Column(
        children: [
          MyTextInput(
            filled: true,
            hintText: appString.keyFullName,
            textInputAction: TextInputAction.next,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            validator: nameValidator,
            prefixIcon: IconButton(
                onPressed: null,
                icon: Image.asset(
                  AppAssets.emailIcon,
                  fit: BoxFit.cover,
                  height: 28.h,
                  width: 28.w,
                )),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.white)),
            filledColor: Colors.grey.shade200,
          ),
          SizedBox(height: 10.h),
          MyTextInput(
            filled: true,
            readOnly: true,
            controller: detailWatch.birthDateController,
            onTap: () => detailWatch.pickDate(context),
            hintText: appString.keyDateOfBirth,
            textInputAction: TextInputAction.next,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const IconButton(
                onPressed: null, icon: Icon(Icons.calendar_month)),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.white)),
            filledColor: Colors.grey.shade200,
          ),
          SizedBox(height: 10.h),
          MyTextInput(
            filled: true,
            hintText: appString.keyPhoneNumber,
            maxLength: 10,
            textInputAction: TextInputAction.next,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            validator: phoneValidator,
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: null,
                    icon: Image.asset(
                      AppAssets.callIcon,
                      fit: BoxFit.cover,
                      height: 28.h,
                      color: Colors.grey,
                      width: 28.w,
                    )),
                DropdownButton(
                  items: const [DropdownMenuItem(child: Text('+91'))],
                  onChanged: (value) {},
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.white)),
            filledColor: Colors.grey.shade200,
          )
        ],
      ),
    );
  }
}
