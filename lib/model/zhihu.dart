
class Zhihu {
  String date;
  List<ZhihuItem> stories;
  List<ZhihuItem> topStories;
  List<ZhihuItem> allStories;

  Zhihu({
    this.date,
    this.stories,
    this.topStories,
    this.allStories,
  });

  factory Zhihu.fromJson(Map<String, dynamic> jsonStr) {


    List<ZhihuItem> stories = [];
    if (jsonStr['stories'] == null) {
      stories = [];
    } else {
      List contentL = jsonStr['stories'];
      contentL.forEach((value) {
        if (value != null) {
          ZhihuItem item = ZhihuItem.fromJson(value);
          stories.add(item);
        }
      });
    }

    List<ZhihuItem> topStories = [];
    if (jsonStr['top_stories'] == null) {
      topStories = [];
    } else {
      List contentL = jsonStr['top_stories'];
      contentL.forEach((value) {
        if (value != null) {
          ZhihuItem item = ZhihuItem.fromJson(value);
          topStories.add(item);
        }
      });
    }

    List<ZhihuItem> allStories = [];
    allStories.addAll(stories);
    allStories.addAll(topStories);

    return Zhihu(
        date: jsonStr['date'],
        stories: stories,
        topStories: topStories,
        allStories: allStories
    );
  }
}

class ZhihuItem {
  String image_hue;
  String title;
  String url;
  String hint;
  String ga_prefix;
  String type;
  String id;
  String image;
  List<String> images;

  ZhihuItem({
    this.image_hue,
    this.title,
    this.url,
    this.hint,
    this.ga_prefix,
    this.type,
    this.id,
    this.image,
    this.images,
  });

  factory ZhihuItem.fromJson(Map<String, dynamic> jsonStr) {
    List<String> images = [];
    if (jsonStr['images'] == null) {
      images = [];
    } else {
      List contentL = jsonStr['images'];
      contentL.forEach((value) {
        if (value != null) {
          images.add(value.toString());
        }
      });
    }

    return ZhihuItem(
      image_hue: jsonStr['image_hue'],
      title: jsonStr['title'],
      url: jsonStr['url'],
      hint: jsonStr['hint'].toString(),
      ga_prefix: jsonStr['ga_prefix'].toString(),
      type: jsonStr['type'].toString(),
      id: jsonStr['id'].toString(),
      image: jsonStr['image'],
      images: images,
    );
  }
}
