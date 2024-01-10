import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

class ReviewsList extends ConsumerWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Darlene Robertson',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 15.sp,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '5',
                            style: TextStyle(fontSize: 13.sp),
                          )
                        ],
                      ),
                    )
                  ],
                ).marginSymmetric(
                  horizontal: 15.w,
                ),
                Text(
                  'The item is very good, my son likes it very much and plays every day',
                  softWrap: true,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                ).marginOnly(left: 15.w, right: 15.w, top: 15.h, bottom: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          AppAssets.likeIcon,
                          height: 25.h,
                          width: 25.w,
                        )),
                    Text(
                      '729',
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ).marginOnly(right: 10.h),
                    Text(
                      '6 days to go',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ).marginOnly(left: 5.w)
              ],
            ),
          );
        },
      ),
    );
  }
}
