import '../../business/entities/news_entity.dart';

class NewsModel {
  final String id;
  final String title;
  final String slug;
  final String summary;
  final String content;
  final String? featuredImageUrl;
  final String category;
  final List<String>? tags;
  final String? authorName;
  final DateTime? publishedAt;

  NewsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.summary,
    required this.content,
    this.featuredImageUrl,
    required this.category,
    this.tags,
    this.authorName,
    this.publishedAt,
  });

  NewsEntity toEntity() => NewsEntity(
    id: id,
    title: title,
    slug: slug,
    summary: summary,
    content: content,
    featuredImageUrl: featuredImageUrl,
    category: category,
    tags: tags,
    authorId: authorName, // Assuming authorName is used as authorId
    isPublished: true, // Assuming all news are published
    publishedAt: publishedAt,
    viewCount: 0, // Default value for viewCount
    imageUrl: featuredImageUrl, // Assuming featuredImageUrl is used as imageUrl
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



