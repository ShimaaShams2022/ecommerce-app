

import '../../domain/Result.dart';
import '../model/responses/category.dart';

abstract class CategoriesOnLineDataSource {
  Future<Result<List<Category>?>> getCategories();
}