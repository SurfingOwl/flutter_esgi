import 'package:flutter_esgi/models/post.dart';

class Page {
  final int itemsReceived;
  final int curPage;
  final int nextPage;
  final int prevPage;
  final int offset;
  final int itemsTotal;
  final int pageTotal;
  final List<Post> items;

  Page({
    required this.itemsReceived,
    required this.curPage,
    required this.nextPage,
    required this.prevPage,
    required this.offset,
    required this.itemsTotal,
    required this.pageTotal,
    required this.items,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      itemsReceived: json['itemsReceived'],
      curPage: json['curPage'],
      nextPage: json['nextPage'],
      prevPage: json['prevPage'],
      offset: json['offset'],
      itemsTotal: json['itemsTotal'],
      pageTotal: json['pageTotal'],
      items: Post.mapPostList(json['items']),
    );
  }
}
