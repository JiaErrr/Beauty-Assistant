import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../screens/camera_screen.dart';
import '../../../../screens/sign_in_screen.dart';
import '../../di/home_module.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    // 初始化BLoC
    _homeBloc = HomeBloc(
      getMostLikedProductsUseCase: HomeModule.instance.getMostLikedProductsUseCase,
      searchProductsUseCase: HomeModule.instance.searchProductsUseCase,
    );
    // 加载最受欢迎的产品
    _homeBloc.add(const LoadMostLikedProductsEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundDefault,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  SearchBarWidget(
                    controller: _searchController,
                    onSearch: (query) {
                      if (query.isNotEmpty) {
                        _homeBloc.add(SearchProductsEvent(query));
                      } else {
                        _homeBloc.add(const LoadMostLikedProductsEvent());
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildProductSection(state),
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavigationWidget(currentIndex: 0),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CameraScreen()),
                );
              },
              backgroundColor: AppColors.brandPrimary,
              child: const Icon(Icons.camera_alt, color: AppColors.textPrimary),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('美妆助手', style: AppTextStyles.h1),
              const SizedBox(height: 4),
              Text('发现适合你的美妆产品', style: AppTextStyles.bodyRegular),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            },
            child: const CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.brandSecondary,
              child: Icon(Icons.person, color: AppColors.textInverse),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSection(HomeState state) {
    if (state is HomeLoadingState) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(color: AppColors.brandPrimary),
        ),
      );
    } else if (state is HomeErrorState) {
      return Expanded(
        child: Center(
          child: Text(
            '加载失败: ${state.message}',
            style: AppTextStyles.bodyRegular.copyWith(color: Colors.red),
          ),
        ),
      );
    } else if (state is HomeLoadedState) {
      final products = state.products;
      if (products.isEmpty) {
        return const Expanded(
          child: Center(
            child: Text('没有找到产品', style: AppTextStyles.bodyRegular),
          ),
        );
      }
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.isSearchResult ? '搜索结果' : '推荐产品',
                style: AppTextStyles.titleLG,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        // 导航到产品详情页
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}