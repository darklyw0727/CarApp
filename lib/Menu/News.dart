import 'package:flutter/material.dart';

class News extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最新消息'),
      ),

      body: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            //說明書
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: <Widget>[
                  //標題
                  Container(
                    alignment: Alignment.center,
                    child: Text('APP 介紹與使用方法',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  //內文
                  Container(
                    alignment: Alignment.centerLeft, //靠左對齊
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end, //靠左對齊
                      children: <Widget>[
                        Text('此APP以flutter開發，使用GoogleMap為基底，額外添加地圖針作為車站點，若使用者點選站點，螢幕下方便會彈出站點詳細資訊，再點一下地圖資訊便會消失。',style: TextStyle(fontSize: 16),),
                        Text('站點資訊中會顯示:「站點名稱」、「站點地址」、「站點剩餘車輛及車位」，於站點資訊的右方有一個紅色的「GO」按鈕，按下後便會將使用者目前的所在位置導航至站點位置。',style: TextStyle(fontSize: 16),),
                      ],
                    )
                  ),
                ],
              ),
            ),
            //未來
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text('未來開發方向',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('1. 結合雲端資料庫以管理數據。',style: TextStyle(fontSize: 16),),
                          Text('2. 新增「使用者登入」功能。',style: TextStyle(fontSize: 16),),
                          Text('3. 新增「查詢站點」功能。',style: TextStyle(fontSize: 16),),
                          Text('4. 新增「常用站點」功能。',style: TextStyle(fontSize: 16),),
                          Text('4. 新增「顯示距離」功能。',style: TextStyle(fontSize: 16),),
                        ],
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}