import 'package:flutter/material.dart';
import './mg_global.dart';
import './model/zhihu.dart';
import './mg_drawer.dart';
import './service/mg_api_service.dart';
import './util/NavigatorUtil.dart';
import './webview/webview_page.dart';

class MgHomeList extends StatefulWidget {
  @override
  _MgHomeListState createState() => _MgHomeListState();
}

class _MgHomeListState extends State<MgHomeList> {
  List<ZhihuItem> content = [];

  @override
  void initState() {
    super.initState();
  }

  Future<Zhihu> _requstData() async {
    Zhihu zhihu = await MGAPIService.zhihuDaily();
    content = zhihu.allStories;
    return zhihu;
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    ZhihuItem item = content[index];
    String img = item.image;
    if (img == null) {
      img = item.images[0];
    }
    return Container(
      margin: EdgeInsets.all(0.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: 'images/logo.png',
                image: img,
                fit: BoxFit.fill,
              ),
              ListTile(
                  title: Text(item.title),
                  onTap: () {
                    NavigatorUtil.push(
                        context, WebViewPage(item.url,title: item.title));
                  }),
              Divider(
                height: 30.0,
                indent: 1.0,
                color: Color(MGLineRGB),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MgDrawer(),
      appBar: AppBar(
        title: Text(APPTitle),
        elevation: 0.0,
      ),
      body: FutureBuilder<Zhihu>(
        future: _requstData(),
        builder: (BuildContext context, AsyncSnapshot<Zhihu> snapshot) {
          if (snapshot.hasData) {
            int _count = snapshot.data.allStories.length;
            return ListView.builder(
              itemCount: _count,
              itemBuilder: _listItemBuilder,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

    );
  }
}
