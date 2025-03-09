class ArticleModel {
  final String? author;
  final String? image;
  final String? title;
  final String? description;
  final String urlImage;
  final DateTime publishedAt;
  final String? source;

  ArticleModel({
    required this.author,
    required this.image,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.publishedAt,
    required this.source,
  });
  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      author: json['author'],
      publishedAt: DateTime.parse(json['publishedAt']),
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      urlImage: json['url'],
      source: json['source']['name'],
    );
  }
}
