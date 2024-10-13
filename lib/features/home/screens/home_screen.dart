import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/constants/app_images.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/app/themes/app_text_field_themes.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/utils/loader.dart';
import 'package:notas/features/home/providers/articles_provider.dart';
import 'package:notas/features/home/providers/home_state_provider.dart';
import 'package:notas/features/home/screens/ai_screen.dart';
import 'package:notas/features/home/screens/buyer_profile_screen.dart';
import 'package:notas/features/home/screens/explore_article_screen.dart';
import 'package:notas/features/home/screens/explore_exoplanets_screen.dart';
import 'package:notas/features/home/screens/news_card_widget.dart';
// import 'package:notas/features/stars/stars_screen.dart';
import 'package:notas/features/home/screens/widgets/app_bars.dart';
import 'package:notas/features/home/screens/widgets/custom_navigation_bar.dart';
import 'package:notas/features/home/screens/widgets/expedition_card.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  int currentScreen = 0;
  final List<Widget> screens = [
    const HomeScreenWidget(),
    const ExploreArticlesScreen(),
    const BuyerProfileScreen(),
    const ExploreArticlesScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentScreen = ref.watch(homeStateProvider);
    // final currentUserValue = ref.watch

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: appBars[currentScreen]),
      body: screens[currentScreen],
      bottomNavigationBar: CustomNavigationBar(
        w: context.w,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: () {
          // context.push(const AddExpeditionScreen());
          // context.push(const AIScreen());
        },
        child: SvgPicture.asset(
          "assets/svgs/ai.svg",
          height: 30,
          width: 30,
          colorFilter:
              const ColorFilter.mode(AppColors.textBlackColor, BlendMode.srcIn),
        ),
        // child: Row(
        //   children: [
        //     Text("Ask AI",
        //         style: Theme.of(context)
        //             .textTheme
        //             .labelMedium
        //             ?.copyWith(color: AppColors.textBlackColor)),
        //     AppSizes.tinyX,
        //     SvgPicture.asset(
        //       "assets/svgs/ai.svg",
        //       colorFilter: const ColorFilter.mode(
        //           AppColors.textBlackColor, BlendMode.srcIn),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

class HomeScreenWidget extends ConsumerStatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends ConsumerState<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final articleValue = ref.watch(articlesProvider);

    return Container(
      child: const Text("Homescreen"),
    );

    // return SizedBox(
    //   height: context.h,
    //   width: context.w,
    //   child: streamValue.when(
    //     error: (error, stackTrace) {
    //       print("error : ${error.toString()} stackTrace: $stackTrace");
    //       return Text("error : ${error.toString()} ",
    //           style: const TextStyle(color: Colors.white));
    //     },
    //     loading: () => const Loader(),
    //     data: (data) => SingleChildScrollView(
    //       child: Stack(
    //         children: [
    //           Image.asset(
    //             AppImages.authImage,
    //             fit: BoxFit.cover,
    //             height: context.h,
    //             width: context.w,
    //           ),
    //           Padding(
    //             padding: AppPaddings.normal,
    //             child: Column(
    //               children: [
    //                 Column(children: [
    //                   Container(
    //                       height: 50,
    //                       padding: const EdgeInsets.symmetric(horizontal: 10),
    //                       child: TextField(
    //                         cursorHeight: 25,
    //                         controller: TextEditingController(),
    //                         decoration:
    //                             AppTextFieldDecorations.searchFieldDecoration,
    //                       )),
    //                   AppSizes.normalY,
    //                   // CatogoriesTabNav(w: context.w),
    //                 ]),
    //                 Container(
    //                   // height: context.h * 0.72,
    //                   // width: context.w,
    //                   // padding: AppPaddings.normal,
    //                   // decoration: const BoxDecoration(
    //                   //     color: Colors.white,
    //                   //     borderRadius: BorderRadius.only(
    //                   //         topLeft: Radius.circular(45),
    //                   //         topRight: Radius.circular(45))),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       AppSizes.normalY,
    //                       Text("Go to Expeditions ",
    //                           style: Theme.of(context).textTheme.headlineSmall),
    //                       AppSizes.normalY,
    //                       SizedBox(
    //                         height: context.h * 0.35,
    //                         child: GridView.builder(
    //                           scrollDirection: Axis.horizontal,
    //                           gridDelegate:
    //                               SliverGridDelegateWithFixedCrossAxisCount(
    //                                   crossAxisCount: 1,
    //                                   childAspectRatio: 1.0,
    //                                   mainAxisSpacing: 10.h,
    //                                   crossAxisSpacing: 5.w),
    //                           itemCount: data.length,
    //                           itemBuilder: (context, index) =>
    //                               ExpeditionCardWidget(
    //                                   id: data[index].id,
    //                                   image: data[index].image,
    //                                   name: data[index].name,
    //                                   description: data[index].description,
    //                                   onTapFav: () {}),
    //                         ),
    //                       ),

    //                       AppSizes.normalY,

    //                       Text("Recent News ",
    //                           style: Theme.of(context).textTheme.headlineSmall),
    //                       AppSizes.normalY,
    //                       articleValue.when(
    //                         data: (data) => SizedBox(
    //                           height: context.h * 0.2,
    //                           child: GridView.builder(
    //                             scrollDirection: Axis.horizontal,
    //                             gridDelegate:
    //                                 SliverGridDelegateWithFixedCrossAxisCount(
    //                                     crossAxisCount: 1,
    //                                     childAspectRatio: 1.0,
    //                                     mainAxisSpacing: 10.h,
    //                                     crossAxisSpacing: 5.w),
    //                             itemCount: data.results.length,
    //                             itemBuilder: (context, index) => NewsCardWidget(
    //                                 id: data.results[index].id.toString(),
    //                                 image: data.results[index].imageUrl,
    //                                 name: data.results[index].title,
    //                                 description: data.results[index].summary,
    //                                 onTapFav: () {}),
    //                           ),
    //                         ),
    //                         error: (error, stackTrace) => Container(),
    //                         loading: () => Container(),
    //                       ),

    //                       // SizedBox(
    //                       //   height: context.h * 0.25,
    //                       //   child: ListView.builder(
    //                       //     scrollDirection: Axis.horizontal,
    //                       //     itemCount: 5,
    //                       //     // data.length,
    //                       //     itemBuilder: (context, index) => ExpeditionCardWidget(
    //                       //         image: "",
    //                       //         name: "Centarus",
    //                       //         description: "1800 lightyears ",
    //                       //         onTapFav: () {}),

    //                       //     // FeaturedHouseImages(
    //                       //     //   onTap: () {
    //                       //     //     // context.push(
    //                       //     //     //     HouseDetailScreen(house: data[index]));
    //                       //     //   },
    //                       //     //   house: "data[index]",
    //                       //     // )
    //                       //   ),
    //                       // ),
    //                       AppSizes.normalY,
    //                       AppSizes.normalY,
    //                       AppSizes.normalY,
    //                       AppSizes.normalY,
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
