// Model for an individual article
class Article {
  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final String publishedAt;
  final String updatedAt;
  final bool featured;
  final List<dynamic> launches;
  final List<dynamic> events;

  Article({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
    required this.launches,
    required this.events,
  });

  // Factory constructor to create an Article from JSON
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      imageUrl: json['image_url'],
      newsSite: json['news_site'],
      summary: json['summary'],
      publishedAt: json['published_at'],
      updatedAt: json['updated_at'],
      featured: json['featured'],
      launches: json['launches'] ?? [],
      events: json['events'] ?? [],
    );
  }

  // Convert Article to a Map (for serialization)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'image_url': imageUrl,
      'news_site': newsSite,
      'summary': summary,
      'published_at': publishedAt,
      'updated_at': updatedAt,
      'featured': featured,
      'launches': launches,
      'events': events,
    };
  }
}

// Model for the API response
class SpaceArticlesResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Article> results;

  SpaceArticlesResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  // Factory constructor to create SpaceFlightNewsResponse from JSON
  factory SpaceArticlesResponse.fromJson(Map<String, dynamic> json) {
    return SpaceArticlesResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((articleJson) => Article.fromJson(articleJson))
          .toList(),
    );
  }

  // Convert SpaceFlightNewsResponse to a Map (for serialization)
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((article) => article.toJson()).toList(),
    };
  }
}
