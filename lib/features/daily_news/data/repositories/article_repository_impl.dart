import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news/core/constants/constants.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news/features/daily_news/data/models/article_model.dart';
import 'package:news/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {

      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: newsAPICountry,
        category: newsAPICategory,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(
          DioException(
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
          ),
        );
      }
      
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
