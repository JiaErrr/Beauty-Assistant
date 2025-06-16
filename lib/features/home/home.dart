// 导出主要组件，方便导入

// 领域层
export 'domain/entities/product_entity.dart';
export 'domain/repositories/product_repository.dart';
export 'domain/usecases/get_most_liked_products_usecase.dart';
export 'domain/usecases/search_products_usecase.dart';

// 数据层
export 'data/models/product_model.dart';
export 'data/repositories/product_repository_impl.dart';
export 'data/datasources/product_data_source.dart';
export 'data/datasources/product_local_data_source.dart';

// 表现层
export 'presentation/bloc/home_bloc.dart';
export 'presentation/bloc/home_event.dart';
export 'presentation/bloc/home_state.dart';
export 'presentation/pages/home_page.dart';
export 'presentation/widgets/product_card.dart';
export 'presentation/widgets/search_bar_widget.dart';
export 'presentation/widgets/bottom_navigation_widget.dart';

// 依赖注入
export 'di/home_module.dart';