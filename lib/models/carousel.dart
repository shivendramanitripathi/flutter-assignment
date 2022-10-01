// To parse this JSON data, do
//
//     final carousel = carouselFromJson(jsonString);

import 'dart:convert';

List<Carousel> carouselFromJson(String str) => List<Carousel>.from(json.decode(str).map((x) => Carousel.fromJson(x)));

String carouselToJson(List<Carousel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carousel {
  Carousel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
    albumId: json["albumId"] == null ? null : json["albumId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    url: json["url"] == null ? null : json["url"],
    thumbnailUrl: json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId == null ? null : albumId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "url": url == null ? null : url,
    "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
  };
}
