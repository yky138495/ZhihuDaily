import 'dart:async';
import './request.dart';
import 'dart:convert';
import '../model/zhihu.dart';

class MGAPIService {

  static Future<Zhihu> zhihuDaily() async {
    String url = "https://news-at.zhihu.com/api/4/news/latest";
    String body = await Request.get(url);
    Zhihu zhihu = Zhihu.fromJson(json.decode(body));
    return zhihu;
  }

  static Future<Map> oneArticle() async {
    var url = "https://interface.meiriyiwen.com/article/today?dev=1";
    String body = await Request.get(url);
    var obj = json.decode(body);
    String content = obj['data']['content'];
    content = content.replaceAll('\<\/p\>','');
    content = content.replaceFirst('\<p\>','        ');
    content = content.replaceAll('\<p\>','\n        ');
    return {
      'author': obj['data']['author'],
      'title': obj['data']['title'],
      'content': content
    };
  }
}