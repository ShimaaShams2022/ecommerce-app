import '../../data/model/responses/category.dart';
import '../Result.dart';

abstract class CategoriesRepository{
  Future<Result<List<Category>?>> getCategories();
}