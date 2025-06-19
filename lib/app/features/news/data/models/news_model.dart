import '../../business/entities/news_entity.dart';

class NewsModel {
  final String id;
  final String title;
  final String slug;
  final String summary;
  final String content;
  final String featuredImageUrl;
  final String category;
  final List<String> tags;
  final String authorName;
  final DateTime publishedAt;

  NewsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.summary,
    required this.content,
    required this.featuredImageUrl,
    required this.category,
    required this.tags,
    required this.authorName,
    required this.publishedAt,
  });

  NewsEntity toEntity() => NewsEntity(
    id: id,
    title: title,
    summary: summary,
    imageUrl: featuredImageUrl,
  );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      summary: json['summary'],
      content: json['content'],
      featuredImageUrl: json['featured_image_url'],
      category: json['category'],
      tags: List<String>.from(json['tags']),
      authorName: json['author_name'],
      publishedAt: DateTime.parse(json['published_at']),
    );
  }
}



