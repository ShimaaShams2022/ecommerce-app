import 'package:ecommerce_app/data/datasource/CategoriesOnlineDataSource.dart';
import 'package:ecommerce_app/data/model/responses/category.dart';

import 'package:ecommerce_app/domain/Result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/categories_repository.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesOnLineDataSource dataSource;
@factoryMethod
  CategoriesRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Category>?>> getCategories() {
    return dataSource.getCategories();
  }

}