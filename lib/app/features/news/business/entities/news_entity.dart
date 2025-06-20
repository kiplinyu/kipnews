class NewsEntity {
  final String id;
  final String title;
  final String slug;
  final String summary;
  final String content;
  final String? featuredImageUrl;
  final String? authorId;
  final String category;
  final List<String>? tags;
  final bool isPublished;
  final DateTime? publishedAt;
  final int? viewCount;
  final String? imageUrl;


  NewsEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.summary,
    required this.content,
    this.featuredImageUrl,
    this.authorId,
    required this.category,
     this.tags,
     required this.isPublished,
     this.publishedAt,
     this.viewCount,
     this.imageUrl,
  });
}
