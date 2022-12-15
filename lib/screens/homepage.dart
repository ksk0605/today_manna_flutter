import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 두 번째 페이지
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy.MM.dd.E');
    String strToday = formatter.format(now);
    return strToday;
  }

  /// 카드 이미지
  final String cardImgUrl = "https://i.ibb.co/BgfYHg4/2021-12-16-1-49-51.png";

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 500));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 500));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _HomeAppBar(),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(),
        // footer: CustomFooter(
        //   builder: (BuildContext context, LoadStatus mode){
        //     Widget body ;
        //     if(mode==LoadStatus.idle){
        //       body =  Text("pull up load");
        //     }
        //     else if(mode==LoadStatus.loading){
        //       body =  CupertinoActivityIndicator();
        //     }
        //     else if(mode == LoadStatus.failed){
        //       body = Text("Load Failed!Click retry!");
        //     }
        //     else if(mode == LoadStatus.canLoading){
        //         body = Text("release to load more");
        //     }
        //     else{
        //       body = Text("No more Data");
        //     }
        //     return Container(
        //       height: 55.0,
        //       child: Center(child:body),
        //     );
        //   },
        // ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Column(
          children: [
            SizedBox(
                height: 135,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '오늘의 만나를\n수확해볼까요?🍐',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Spacer(),
                          Text(
                            getToday(),
                            style: TextStyle(
                                fontSize: 18, color: Colors.amber[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            _TodayRangeContianer(),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(color: Colors.white),
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '오늘의 맥체인',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        // Stack(
                        //   children: [
                        //     Image.asset('assets/images/checked.png'),
                        //   ],
                        // ),
                        Stack(
                          children: [
                            Image.asset('assets/images/unchecked.png'),
                            Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text('왜'))),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            Image.asset('assets/images/unchecked.png'),
                            Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text('안'))),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            Image.asset('assets/images/unchecked.png'),
                            Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text('읽'))),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            Image.asset('assets/images/unchecked.png'),
                            Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text('어'))),
                          ],
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class _TodayRangeContianer extends StatelessWidget {
  const _TodayRangeContianer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      width: double.infinity,
      height: 145,
      padding: EdgeInsets.all(16),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '오늘의 범위',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Text(
                '맥체인',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'API내놔',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )
            ]),
          ],
        ),
        Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                print('settings clicked');
              },
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                print('share clicked');
              },
              icon: Icon(
                Icons.share,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
              size: 30,
            ))
      ],
      title: Text(
        '홈',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
