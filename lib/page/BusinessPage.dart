import 'package:banner/banner.dart';
import 'package:flutter/material.dart';

class BusinessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BusinessPageState();
  }
}

class BusinessPageState extends State<BusinessPage> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Divider divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.green,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Business'),
      ),
      body: Column(
        children: <Widget>[
          BannerView(
            data: ['a', 'b', 'c'],
            buildShowView: (index, data) {
              print(data);
              return Padding(
                padding: EdgeInsets.only(left: 2, right: 2, top: 2),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.orange]),
                      borderRadius: BorderRadius.circular(4)),
                  position: DecorationPosition.background,
                  child: Center(
                    child: Text(
                      "$data",
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              );
            },
            onBannerClickListener: (index, data) {
              print(index);
            },
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: ListView.separated(
                itemCount: 1000,
                controller: _controller,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                },
                separatorBuilder: (context, index) {
                  return index % 2 == 0 ? divider1 : divider2;
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }
}
