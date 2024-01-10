import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/dasboard/controller/dasboard_controller.dart';
import 'package:digifurniture/features/home/ui/widgets/home_search_bar.dart';
import 'package:digifurniture/features/home/ui/widgets/new_arrivels/new_arrival_section_widget.dart';
import 'package:digifurniture/features/home/ui/widgets/special_offer_widget.dart';
import 'package:digifurniture/features/home/ui/widgets/top_categories/top_categories_widget.dart';
import 'furniture_categorys_widget.dart';
import 'most_popular/most_popular_section_widget.dart';
import 'offer_banners/offer_banner_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    ref.read(dasboardController).initHomeTab(scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        SizedBox(height: 17.h),
        const SearchBarWidget(),
        const SpecialOfferWidget(),
        SizedBox(height: 10.h),
        const FurnitureCategorysWidget(),
        SizedBox(height: 14.h),
        const MostPopularSectionWidget(),
        SizedBox(height: 10.h),
        const TopCategoriesWidget(),
        SizedBox(height: 10.h),
        const OfferBannerWidget(),
        SizedBox(height: 10.h),
        const NewArrivalSectionWidget(),
        SizedBox(height: 20.h)
      ],
    );
  }
}
