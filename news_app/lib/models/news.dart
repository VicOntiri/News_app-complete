// ignore_for_file: public_member_api_docs, sort_constructors_first
class News {
  final String author;
  final String title;
  final String description;
  final String url;
  final String image;
  final String publishedAt;
  final String content;
  News({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'] ?? 'Unknown',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      image: json['urlToImage'] ??
          'https://bitsofco.de/content/images/2018/12/Screenshot-2018-12-16-at-21.06.29.png',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
