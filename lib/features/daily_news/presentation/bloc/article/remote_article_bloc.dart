import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/features/daily_news/domain/usecases/get_article.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote_article_event.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  
  final GetArticlesUseCase _getArticleUseCase;
  
  RemoteArticleBloc(this._getArticleUseCase): super(const RemoteArticleLoading()){
    on <GetArticles> (onGetArticle);
  }

  void onGetArticle(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase.call();
    if(dataState is DataSuccess && dataState.data!.isEmpty){
      emit(RemoteArticleSuccess(dataState.data!));
    } else if(dataState is DataError){
      emit(RemoteArticleError(dataState.error!));
    }
  } 




}
