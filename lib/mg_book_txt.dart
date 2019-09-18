import 'package:flutter/material.dart';
import './mg_global.dart';
import './mg_drawer.dart';
import './service/mg_api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MGBookTxt extends StatefulWidget {
  MGBookTxt();

  @override
  _MGBookTxtState createState() => _MGBookTxtState();
}

class _MGBookTxtState extends State<MGBookTxt> {
  Map content = {};
  double mgFontSize = 22.0;

  @override
  void initState() {
    _requstData();
    super.initState();
  }

  _requstData() async {
    Map data = await MGAPIService.oneArticle();
    content = data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String author = content['author'] ?? '';
    String title = content['title'] ?? '';
    String contents = content['content'] ?? '';

    return Scaffold(
      drawer: MgDrawer(),
      appBar: AppBar(
        title: Text(ReadTitle),
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: new EdgeInsets.all(15.0),
        children: <Widget>[
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: (mgFontSize + 6)),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
          ),
          Text(author,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: mgFontSize),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
          ),
          Text(contents,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: mgFontSize - 2),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 100000),
          Padding(
            padding: const EdgeInsets.all(16.0),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          mgFontSize = mgFontSize + 1;
          if(mgFontSize >= 40){
            mgFontSize = 40.0;
            Fluttertoast.showToast(
                msg: "字体已到最大40",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 1,
                backgroundColor: Color(MGPrimarySwatchRGB),
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
          setState(() {});
        },
      ),
    );
  }
}
