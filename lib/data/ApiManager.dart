import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/extentions.dart';
import 'package:ecommerce_app/data/model/responses/categories/CategoriesResponse.dart';
import 'package:ecommerce_app/data/model/responses/categories/ErrorResponse.dart';
import 'package:ecommerce_app/data/model/responses/category.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{

    final dio=Dio();
  static  String baseUrl="https://ecommerce.routemisr.com";
  static  String categoriesEndpoint ="$baseUrl/api/v1/categories";

   Future<Result<List<Category>?>> loadCategories()async{
    var response = await dio.get(categoriesEndpoint);
    var categoriesResponse=CategoriesResponse.fromJson(response.data);

    try{
      if(response.statusCode?.isSuccessCall()==true){
           return Success(data: categoriesResponse.data);
          }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMsg,errorResponse.message));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

  static loadBrands(){}
}