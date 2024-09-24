import 'package:ecommerce_app/data/ApiManager.dart';
import 'package:ecommerce_app/data/datasource/CategoriesOnlineDataSource.dart';
import 'package:ecommerce_app/data/model/responses/category.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:  CategoriesOnLineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnLineDataSource{
    ApiManager apiManager;
    // constructor injection
    @factoryMethod
    CategoriesOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Category>?>> getCategories() {
 return apiManager.loadCategories();
  }

}