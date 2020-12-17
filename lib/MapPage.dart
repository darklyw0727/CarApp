//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; //google map
import 'package:geolocator/geolocator.dart'; //定位
import 'package:flutter_polyline_points/flutter_polyline_points.dart'; //導航

class MapPage extends StatefulWidget {
  @override
  _MapPage createState() => _MapPage();
}

class _MapPage extends State<MapPage>{
  GoogleMapController mapController; //地圖控制器

  final Geolocator _geolocator = Geolocator(); //定位宣告
  Position _currentPosition; //定義現在位置

  int markerID = 0; //ID marker資訊用
  double pin = -200; //marker資訊視窗位置(-100為畫面外/0為畫面上)

  //導航宣告
  final Set<Polyline> polyline = {};
  List<LatLng> route = [];
  PolylinePoints polylinePoints;
  Map<PolylineId,Polyline> polylines = {};
  LatLng routePosition; //導航目標點

  //導航
  _creatPolylines(start,end)async {
    polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAAV8v36DKrD4HIhy_xWZoqHZq46nG1pjM", //API KEY
      PointLatLng(start.latitude,start.longitude), //起點
      PointLatLng(end.latitude,end.longitude), //終點
      travelMode: TravelMode.driving, //導航模式
    );

    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) {route.add(LatLng(point.latitude,point.longitude));});
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red, //導航線顏色
      points: route,
      width: 3, //粗細
    );
    polylines[id] = polyline;
  }
  Future<bool> routePolylines()async{
    try{
      await _creatPolylines(_currentPosition,routePosition);

      setState(() {
        print('$_currentPosition to $routePosition');
      });

      return true;
    }catch (e){
      print(e);
    }
    return false;
  }

  //定位模塊
  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high) //抓位置
        .then((Position position) async {
      setState(() {
        _currentPosition = position; //設值
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition( //移動相機
            CameraPosition(
              target: LatLng(position.latitude, position.longitude), //中心
              zoom: 17.0, //縮放大小
            ),
          ),
        );
      });
      //await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  //站點位置list
  List<LatLng> poslist = [LatLng(23.705269,120.431020),LatLng(23.701709,120.433065),LatLng(23.699687,120.430576),];
  //站點名稱list
  List<String> namelist = ['後院站','文理站','長春站'];
  //站點地址list
  List<String> addreslist = ['雲林縣虎尾鎮忠孝路41-61號','雲林縣虎尾鎮民主路(虎科文理大樓門口廣場)','雲林縣虎尾鎮長春路112號'];
  //車數量
  List<String> carlist = ['10','9','6'];
  //車位數量
  List<String> parklist = ['5','12','2'];

  //站點
  Set<Marker> _setMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('0'), //ID
          position: poslist[0], //位置
          infoWindow: InfoWindow(title: namelist[0]), //marker上小標示
          icon: BitmapDescriptor.defaultMarker, //marker樣式or顏色
          onTap: () {
            setState(() {
              markerID = 0;
              routePosition = LatLng(23.705269,120.431020); //導航目標點
              pin = 0; //marker資訊往上拉
            });
          }),
      Marker(
          markerId: MarkerId('1'),
          position: poslist[1],
          infoWindow: InfoWindow(title: namelist[1]),
          icon: BitmapDescriptor.defaultMarker,
          onTap: () {
            setState(() {
              markerID = 1;
              routePosition = LatLng(23.701709,120.433065);
              pin = 0;
            });
          }),
      Marker(
          markerId: MarkerId('2'),
          position: poslist[2],
          infoWindow: InfoWindow(title: namelist[2]),
          icon: BitmapDescriptor.defaultMarker,
          onTap: () {
            setState(() {
              markerID = 2;
              routePosition = LatLng(23.699687,120.430576);
              pin = 0;
            });
          })
    ].toSet();
  }

  @override
  void initState(){
    super.initState();
    _getCurrentLocation(); //抓位置
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          //地圖
          GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(0.0,0.0)), //初始相機中心
            myLocationEnabled: true, //現在位置
            myLocationButtonEnabled: false, //內鑑定位鈕
            mapType: MapType.normal, //地圖類型
            zoomGesturesEnabled: true, //縮放手勢
            zoomControlsEnabled: false, //縮放功能鈕
            mapToolbarEnabled: false, //地圖功能鈕(marker...)
            onMapCreated: (GoogleMapController controller) {mapController = controller;},
            polylines: Set<Polyline>.of(polylines.values), //導航
            markers: _setMarker(),
            onTap: (tapLocation){
              setState(() {
                pin = -200;
              });
              print('tapLocation : $tapLocation');
            },
          ),

          //自訂定位鈕
          SafeArea(
              child: Align(
                alignment: Alignment.bottomRight, //對齊右下
                child: Padding(
                  padding: const EdgeInsets.only(right:20.0,bottom:20.0), //右、下外圍間隔10
                  child: FloatingActionButton(
                    backgroundColor: Colors.lightBlueAccent,
                    child: Icon(Icons.my_location),
                    onPressed: (){
                        mapController.animateCamera( //移動相機
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(_currentPosition.latitude, _currentPosition.longitude), //現在位置
                              zoom: 17.0,
                            ),
                          )
                        );
                        },
                  )
                )
              )
          ),

          //marker資訊欄
          AnimatedPositioned(
            bottom: pin, //顯示位置
            right: 0,
            left: 0,
            duration: Duration(milliseconds: 200), //動畫時間
            child: Align(
              alignment: Alignment.bottomCenter, //對齊中下
              child: Container(
                padding: EdgeInsets.all(10), //內縮
                margin: EdgeInsets.all(10), //外圍空白
                height: 150, //高度
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white, //底色
                    boxShadow: <BoxShadow>[ //陰影
                      BoxShadow(
                        blurRadius: 20,
                        offset: Offset.zero,
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ],
                ),
                child: Flex(
                  direction: Axis.horizontal, //對齊方式ROW
                  children: <Widget>[
                    //資訊
                    Expanded(
                      flex: 15, //比例
                      child: Column(
                        children: <Widget>[
                          //站名
                          Container(
                            alignment: Alignment.topLeft, //對齊左上
                            margin: EdgeInsets.only(right: 10),
                            height: 30, //欄位高度
                            child: Text(
                              namelist[markerID], //站名
                              style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue),),
                          ),
                          //地址
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(right: 10),
                            height: 60,
                            child: Text(
                              addreslist[markerID], //站點地址
                              style: TextStyle(fontSize: 14,color: Colors.grey),
                            ),
                          ),
                          //其他資訊
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 40,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end, //對齊底部
                              children: <Widget>[
                                //車子icon
                                Icon(Icons.directions_bike_outlined,size: 30,color: Colors.grey,),
                                //車子數量
                                Container(
                                  margin: EdgeInsets.only(top: 6,bottom: 6,left: 6,right: 10),
                                  child: Text(
                                    carlist[markerID],
                                    style: TextStyle(fontSize: 18,color: Colors.grey),
                                  ),
                                ),
                                //車位icon
                                Icon(Icons.local_parking,size: 30,color:Colors.grey),
                                //車位數量
                                Container(
                                  margin: EdgeInsets.only(top: 6,bottom: 6,left: 6,right: 10),
                                  child: Text(
                                    parklist[markerID],
                                    style: TextStyle(fontSize: 18,color: Colors.grey),
                                  ),
                                ),
                              ],
                            )
                          ),
                        ],
                      )
                    ),

                    //導航鈕
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 130,
                        child: RaisedButton(
                          child: Text('GO',style: TextStyle(fontSize: 30,color: Colors.white),),
                          onPressed: (_currentPosition != null && routePosition != null)?()async{
                            mapController.toString();
                            setState(() {
                              if(polylines.isNotEmpty){polylines.clear();} //清除導航線
                              if(route.isNotEmpty){route.clear();
                              pin = -200;
                              } //清除導航線
                            });
                            routePolylines();
                          }
                          : null,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                ),
              ),
            ),
        ],
      );
  }
}