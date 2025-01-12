import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/core/utils/app_colors.dart';
import 'package:meal_monkey/features/menu/manager/categories_cubit/categories_cubit.dart';
import 'package:meal_monkey/features/menu/presentation/widgets/categories_section.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar.dart';
import 'package:meal_monkey/core/widgets/custom_search_bar.dart';
import 'package:meal_monkey/features/menu/presentation/widgets/loading_categories.dart';
import 'package:shimmer/shimmer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          const CustomAppBar(title: 'Menu',),
          const CustomSearchBar(),
          const SizedBox(height: 40),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: 100,
                decoration: const BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if(state is CategoriesLoading){
                   return _buildLoading();
                  }
                 else if (state is CategoriesSuccess) {
                    return  CategoriesSection(
                      categoriesModel: state.categoriesModel,
                    );
                  }
                  else if (state is CategoriesFailure) {
                    return  Center(child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Center(child: Text(state.errMsg)),
                    ),);
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Shimmer _buildLoading() {
    return Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[100]!,
                      child: const LoadingCategories(),
                    );
  }
}



