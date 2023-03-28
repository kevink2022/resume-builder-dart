class Link {
  final String url;
  final String title;
  final String? imageFile;

  Link({
    required this.url,
    required this.title,
    this.imageFile,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      title: json['title'],
      imageFile: json['image_file'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'title': title,
      'image_file': imageFile,
    };
  }
}
