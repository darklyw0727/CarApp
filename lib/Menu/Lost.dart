import 'package:flutter/material.dart';

class Lost extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('失物招領'),
        ),

        body: Align(
          alignment: Alignment.topCenter,
          //滾動列表
          child: ListView(
            children: <Widget>[
              Container(
                height: 140,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(color: Colors.deepPurpleAccent,borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: <Widget>[
                    Image(image: NetworkImage('https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-12-blue-select-2020?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1601830934000'),width: 120,height: 120,),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start, //靠左對齊
                          children: <Widget>[
                            Text('iPhone 12',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('站點 : ASD站',style: TextStyle(fontSize: 16),),
                            Text('日期 : YYYY/MM/DD  hh:mm',style: TextStyle(fontSize: 16),),
                            Text('時間 : hh:mm',style: TextStyle(fontSize: 16),),
                          ],
                        )
                    )
                  ],
                ),
              ),
              Container(
                height: 140,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(color: Colors.deepPurpleAccent,borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: <Widget>[
                    Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Nintendo-Switch-wJoyCons-BlRd-Standing-FL.jpg/220px-Nintendo-Switch-wJoyCons-BlRd-Standing-FL.jpg'),width: 120,height: 120,),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start, //靠左對齊
                          children: <Widget>[
                            Text('Switch',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('站點 : QWE站',style: TextStyle(fontSize: 16),),
                            Text('日期 : YYYY/MM/DD  hh:mm',style: TextStyle(fontSize: 16),),
                            Text('時間 : hh:mm',style: TextStyle(fontSize: 16),),
                          ],
                        )
                    )
                  ],
                ),
              ),
              Container(
                height: 140,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(color: Colors.deepPurpleAccent,borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: <Widget>[
                    Image(image: NetworkImage('https://store.sony.com.tw/resource/file/product_files/ILCE-6600/CX88300_front-Large_e00cf.jpg'),width: 120,height: 120,),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start, //靠左對齊
                          children: <Widget>[
                            Text('Sony 相機',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('站點 : JKL站',style: TextStyle(fontSize: 16),),
                            Text('日期 : YYYY/MM/DD  hh:mm',style: TextStyle(fontSize: 16),),
                            Text('時間 : hh:mm',style: TextStyle(fontSize: 16),),
                          ],
                        )
                    )
                  ],
                ),
              ),
              Container(
                height: 140,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(color: Colors.deepPurpleAccent,borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: <Widget>[
                    Image(image: NetworkImage('https://www.lenovo.com/medias/37-lenovo-thinkbook-15-hero.png?context=bWFzdGVyfHJvb3R8OTM5ODl8aW1hZ2UvcG5nfGg1NC9oNTIvMTA2NzQ5NDE3ODgxOTAucG5nfGM0NDY0YjA2OTE3YmM2ZDljMGZlNDFhZjBiOWFkMTZmZDZjOTkwZjUzNTgyMjIzNDRmMmFiOTk4MjM4YmJhYTI'),width: 120,height: 120,),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start, //靠左對齊
                          children: <Widget>[
                            Text('Lenovo 筆電',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('站點 : BNM站',style: TextStyle(fontSize: 16),),
                            Text('日期 : YYYY/MM/DD  hh:mm',style: TextStyle(fontSize: 16),),
                            Text('時間 : hh:mm',style: TextStyle(fontSize: 16),),
                          ],
                        )
                    )
                  ],
                ),
              ),
              Container(
                height: 140,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(color: Colors.deepPurpleAccent,borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: <Widget>[
                    Image(image: NetworkImage('https://d2lfcsub12kx0l.cloudfront.net/tw/product/img/Google_google_pixel_5_1001104401739_640x480.jpg'),width: 120,height: 120,),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start, //靠左對齊
                          children: <Widget>[
                            Text('Google Pixel 5',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('站點 : ZXC站',style: TextStyle(fontSize: 16),),
                            Text('日期 : YYYY/MM/DD  hh:mm',style: TextStyle(fontSize: 16),),
                            Text('時間 : hh:mm',style: TextStyle(fontSize: 16),),
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