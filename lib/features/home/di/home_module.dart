import '../data/datasources/product_data_source.dart';
import '../data/datasources/product_local_data_source.dart';
import '../data/repositories/product_repository_impl.dart';
import '../domain/repositories/product_repository.dart';
import '../domain/usecases/get_most_liked_products_usecase.dart';
import '../domain/usecases/search_products_usecase.dart';
import '../presentation/bloc/home_bloc.dart';

/// 提供Home模块所需的依赖
class HomeModule {
  // 私有构造函数，防止实例化
  HomeModule._();

  // 单例实例
  static final HomeModule _instance = HomeModule._();

  // 获取单例实例
  static HomeModule get instance => _instance;

  // 懒加载数据源
  late final ProductDataSource _productDataSource = ProductLocalDataSource();

  // 懒加载仓库
  late final ProductRepository _productRepository = ProductRepositoryImpl(_productDataSource);

  // 提供获取最受欢迎产品的用例
  GetMostLikedProductsUseCase get getMostLikedProductsUseCase => 
      GetMostLikedProductsUseCase(_productRepository);

  // 提供搜索产品的用例
  SearchProductsUseCase get searchProductsUseCase => 
      SearchProductsUseCase(_productRepository);
}