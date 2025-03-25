abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

// Compare this snippet from lib/features/daily_news/domain/usecases/get_news_articles.dart:
// import 'package:news/core/usecase/usecase.dart';
// import 'package:news/core/resources/data_state.dart';
// import 'package:news/features/daily_news/domain/entities/article.dart';
// import 'package:news/features/daily_news/domain/repositories/article_repository.dart';
