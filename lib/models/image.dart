class PostImage {
  final String path;
  final String name;
  final String type;
  final int size;
  final String mime;
  final Map<dynamic, dynamic> meta;
  final String url;

  PostImage({
    required this.path,
    required this.name,
    required this.type,
    required this.size,
    required this.mime,
    required this.meta,
    required this.url,
  });

  factory PostImage.fromJson(Map<String, dynamic> json) {
    return PostImage(
      path: json['path'],
      name: json['name'],
      type: json['type'],
      size: json['size'],
      mime: json['mime'],
      meta: json['meta'],
      url: json['url'],
    );
  }
}
