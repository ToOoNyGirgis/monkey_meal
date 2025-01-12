import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/core/utils/service_locator.dart';
import 'package:meal_monkey/features/home/presentation/home_screen.dart';
import 'package:meal_monkey/features/menu/data/repos/menu_repo_impl.dart';
import 'package:meal_monkey/features/menu/manager/categories_cubit/categories_cubit.dart';
import 'package:meal_monkey/features/menu/presentation/menu_screen.dart';
import 'package:meal_monkey/features/more/presentation/more_screen.dart';
import 'package:meal_monkey/features/offers/presentation/offers_screen.dart';
import 'package:meal_monkey/features/profile/presentation/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[
    BlocProvider(
      create: (context) => CategoriesCubit(getIt.get<MenuRepoImpl>())..getCategories(),
      child: const MenuScreen(),
    ),
    const OffersScreen(),
    const HomeScreen(),
    const ProfileScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: 0.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                haptic: true,
                tabBorderRadius: 15,
                tabActiveBorder: Border.all(
                    color: AppColors.kPrimaryColor.withValues(alpha: 0.4),
                    width: 0.2),
                tabShadow: [
                  BoxShadow(
                      color: Colors.white.withValues(alpha: 0.5), blurRadius: 8)
                ],
                curve: Curves.easeInOut,
                // duration: Duration(milliseconds: 100),
                // gap: 8 ,
                color: Colors.grey[800],
                activeColor: AppColors.kPrimaryColor,
                // iconSize: 24,
                tabBackgroundColor:
                AppColors.kPrimaryColor.withValues(alpha: 0.1),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                tabs: const [
                  GButton(
                    icon: Icons.grid_view_rounded,
                    text: 'Menu',
                  ),
                  GButton(
                    icon: Icons.shopping_bag,
                    text: 'Offers',
                  ),
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.supervised_user_circle_outlined,
                    text: 'Profile',
                  ),
                  GButton(
                    icon: Icons.more_horiz,
                    text: 'More',
                  )
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
