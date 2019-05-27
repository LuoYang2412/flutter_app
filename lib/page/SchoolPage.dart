import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SchoolPageState();
}

class SchoolPageState extends State<SchoolPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['新闻', '历史', '科技'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School'),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList()),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                final snackbar = SnackBar(
                  content: Text('分享成功'),
                );
                Scaffold.of(context).showSnackBar(snackbar);
              })
        ],
      ),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 5,
              ),
            );
          }).toList()),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 3 * 2,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
        ),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 4),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
                      radius: 50,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'LuoYang',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.add),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Add account',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.settings),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Mannage accounts',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
