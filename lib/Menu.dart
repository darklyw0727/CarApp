import 'package:flutter/material.dart';

class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            //抬頭
            Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Row(
                    children: <Widget>[
                      //頭像
                      Container(
                        margin: EdgeInsets.only(top: 20,right:20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS2E_YFwDHKefL-tQ1QQ0qZex2lCi-9Y8-HIw&usqp=CAU'
                              ),
                              fit: BoxFit.fill,
                            )
                        ),
                      ),

                      //資訊
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //使用者名稱
                              Text(
                                'NFU EMNA',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              //祝福語
                              Text(
                                'Have a nice Day !',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )
                      ),
                    ]
                )
            ),

            //列表 4項(4card)
            //最新消息
            Card(
              child: ListTile(
                leading: Icon(Icons.info,size:35,color: Colors.black), //icon
                onTap: (){Navigator.of(context).pushNamed('/News');}, //畫面轉跳
                title: Text(
                  '最新消息',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            //客服中心
            Card(
              child: ListTile(
                leading: Icon(Icons.call,size:35,color: Colors.black),
                onTap: (){Navigator.of(context).pushNamed('/Service');},
                title: Text(
                  '客服中心',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            //失物招領
            Card(
              child: ListTile(
                leading: Icon(Icons.search,size:35,color: Colors.black),
                onTap: (){Navigator.of(context).pushNamed('/Lost');},
                title: Text(
                  '失物招領',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            //登出
            Card(
              child: ListTile(
                leading: Icon(Icons.remove_circle_outline,size:35,color: Colors.black),
                title: Text(
                  '登出',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onTap: (){ //提醒視窗
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('登出'), //標題
                        content: Text('系統尚未實裝，點擊「確定」返回'), //內文
                        actions: [ //動作
                          TextButton( //按鈕
                              onPressed: (){Navigator.of(context).pop();}, //跳出
                              child: Text('確定'), //按鈕文字
                          )
                        ],
                      );
                    }
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}