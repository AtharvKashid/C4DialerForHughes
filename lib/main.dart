import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C4 Dialer for Hughes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{

  int _selectedFragment = 0;
  List<Widget> fragment =[
    DashBoard(),
    MyWebView(),
    Profile()
  ];
  void _onitemSelcted(int index){
    setState(() {
      _selectedFragment = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C4 Dialer For Hughes'),
      ),
      body: fragment.elementAt(_selectedFragment),
      bottomNavigationBar: BottomNavigationBar(
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Dashboard'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          ),
        ],
        currentIndex: _selectedFragment,
        onTap: _onitemSelcted,

      ),
    );
  }
}

class Profile extends StatefulWidget {
   @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   String weburl ='https://www.google.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: WebView(
        initialUrl: weburl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class DashBoard extends StatefulWidget{
  @override
 _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
   final  TextEditingController _number=TextEditingController();
   String _numberTocall ='';
  @override
  void dispose() {
    _number.dispose();
    super.dispose();
  }
  void call() async{
    int value = int.parse(_number.text);
    int add1 = 6654;
    int add2 = 6752;
    int add3 = 6638;
    int add4 = 6615;
    int add5 = 6658;
    int add6 = 6615;
    int add7 = 6636;
    int add8 = 6639;
    int add9 = 6659;
    int add10 = 6749;
    int add11 = 6743;
    int add12 = 6615;
    int add13 = 6743;
    int add14 = 6658;
    int add15 = 6743;
    int add16 = 6615;
    int add17 = 6743;
    int add18 = 6615;
    int add19 = 6743;
    int add20 = 6651;
    int add21 = 6615;
    int add22 = 6743;
    int add23 = 6610;

    if (value >= 1000 && value <= 1099) {
     _numberTocall = "22$add1$value";
    } else if (value >= 1100 && value <= 1299) {
      _numberTocall = "22$add2$value";
    } else if (value >= 1300 && value <= 1399) {
      _numberTocall = "22$add3$value";
    } else if (value >= 1400 && value <= 1499) {
      _numberTocall = "22$add4$value";
    } else if (value >= 1500 && value <= 1679) {
      _numberTocall = "22$add5$value";
    } else if (value >= 1680 && value <= 1999) {
      _numberTocall = "22$add6$value";
    } else if (value >= 2000 && value <= 3499) {
      _numberTocall = "22$add7$value";
    } else if (value >= 3500 && value <= 4999) {
      _numberTocall = "22$add8$value";
    } else if (value >= 5000 && value <= 5999) {
      _numberTocall = "22$add9$value";
    } else if (value >= 6000 && value <= 6399) {
      _numberTocall = "22$add10$value";
    } else if (value >= 6400 && value <= 6999) {
      _numberTocall = "22$add11$value";
    } else if (value >= 7000 && value <= 7099) {
      _numberTocall = "22$add12$value";
    } else if (value >= 7100 && value <= 7899) {
      _numberTocall = "22$add13$value";
    } else if (value >= 7900 && value <= 7909) {
      _numberTocall = "22$add14$value";
    } else if (value >= 7910 && value <= 8009) {
      _numberTocall = "22$add15$value";
    } else if (value >= 8010 && value <= 8069) {
      _numberTocall = "22$add16$value";
    } else if (value >= 8070 && value <= 8079) {
      _numberTocall = "22$add17$value";
    } else if (value >= 8080 && value <= 8099) {
      _numberTocall= "22$add18$value";
    } else if (value >= 8100 && value <= 8499) {
      _numberTocall= "22$add19$value";
    } else if (value >= 8500 && value <= 8999) {
      _numberTocall = "22$add20$value";
    } else if (value >= 9000 && value <= 9099) {
      _numberTocall = "22$add21$value";
    } else if (value >= 9100 && value <= 9199) {
      _numberTocall = "22$add22$value";
    } else if (value >= 9200 && value <= 9999) {
      _numberTocall= "22$add23$value";
    }
    // Request CALL_PHONE permission at runtime
    PermissionStatus status =  Permission.phone.request() as PermissionStatus;
    if(_numberTocall.isNotEmpty){
      String url = 'tel:$_numberTocall';
      if(status.isGranted){
        if (await canLaunch(url)) {
          await launch(url);
        }else {
          print('Failed to launch call');
        }
      }else {
        print('Permission denied');
      }

    }
    setState(() {});

  }
  // void makeCall() async{
  //   if(_numberTocall.isNotEmpty){
  //     final url = 'tel:$_numberTocall';
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:null,
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
               TextField(
                  controller: _number,
                  keyboardType: TextInputType.phone,
                  maxLength: 4,
                  decoration: const InputDecoration(
                    hintText: 'Enter Hughes Number',
                  ),
               ),
              IconButton(
                iconSize: 100,
                icon:Icon(Icons.call),
                color: Colors.blue,
                onPressed: call
              ),
              const SizedBox(
                  height: 16.0,
                  width: 16.0,
              ),

            ],
          ),
        )
      ),

    );
  }
}


class MyWebView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:null,
      body: WebView(
        initialUrl: 'assets/calci.html',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _loadHTMLFromAssets(webViewController);
        },
      ),
    );
  }
}

void _loadHTMLFromAssets(WebViewController webViewController) async{
   String fileText = await rootBundle.loadString('assets/calci.html');
   webViewController.loadUrl(Uri.dataFromString(
     fileText,
     mimeType: 'text/html',
     encoding: Encoding.getByName('utf-8'),
   ).toString());

}






