import 'package:flutter/material.dart';

class Service extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('客服中心'),
      ),

      body: Align(
        alignment: Alignment.topCenter,
        //滾動列表
        child: ListView(
          children: <Widget>[
            //虎科名片
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: <Widget>[
                 Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/zh/thumb/7/75/NFU_Logo.svg/1280px-NFU_Logo.svg.png'),width: 70,height: 70,),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //靠左對齊
                      children: <Widget>[
                        Text('國立虎尾科技大學',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text('632301 雲林縣虎尾鎮文化路64號',style: TextStyle(fontSize: 16),),
                        Text('電話 : 886-5-6315000',style: TextStyle(fontSize: 16),),
                        Text('E-Mail : network@nfu.edu.tw',style: TextStyle(fontSize: 16),),
                      ],
                    )
                  )
                ],
              ),
            ),
            //實驗室名片
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(color: Colors.greenAccent,borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: <Widget>[
                  Image(image: NetworkImage('https://www.ahui3c.com/wp-content/uploads/2017/09/1200px-Android_dance.svg-300x300.png'),width: 70,height: 70,),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, //靠左對齊
                        children: <Widget>[
                          Text('NFU EMNA',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text('虎尾科大電機館 310',style: TextStyle(fontSize: 16),),
                          Text('指導教授 : 蘇暉凱',style: TextStyle(fontSize: 16),),
                        ],
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}