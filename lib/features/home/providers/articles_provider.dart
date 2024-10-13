import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/app/constants/api_urls.dart';
import 'package:notas/core/services/http_service.dart';
import 'package:notas/features/home/model/space_articles_model.dart';

final articlesProvider = FutureProvider((ref) async {
  final response =
      await HttpService(baseUrl: BASEURL_ARTICLE).get(APIUrls.getArticles);
  print(response);
  return SpaceArticlesResponse.fromJson(response as Map<String, dynamic>);
});

final articleProviderById = FutureProvider.family((ref, int id) async {
  final response = await HttpService(baseUrl: BASEURL_ARTICLE)
      .get(APIUrls.getArticleById(id));
  print(response);
  return Article.fromJson(response as Map<String, dynamic>);
});
