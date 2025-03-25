import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioException ? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles, error];
}

class RemoteArticleSuccess extends RemoteArticleState {
  const RemoteArticleSuccess(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException error) : super(error: error);
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading() : super();
}
