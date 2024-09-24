import 'package:ecommerce_app/data/ApiManager.dart';
import 'package:ecommerce_app/data/model/responses/category.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/repository/categories_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState>{

  var apiManager =ApiManager();
  HomeViewModel(this.categoriesRepository):super(LoadingState());

  CategoriesRepository categoriesRepository;

  void loadHomeScreen() async {
    //loading initial state
    emit(LoadingState());
    var result = await categoriesRepository.getCategories();
    
    switch(result){
      case Success():{
        emit(SuccessState(result.data));
      }

      case ServerError<List<Category>?>():{
        emit(ErrorState(result.exception));
      }


      case Error<List<Category>?>():
       emit(ErrorState(result.exception));
    }

  }
}

sealed class HomeState{}
class LoadingState extends HomeState{}
class SuccessState extends HomeState{
  List<Category>? categories;
  SuccessState(this.categories);
}
class ErrorState extends HomeState{
  Exception exception;
  ErrorState(this.exception);
}