import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController user ,pass;
  String userError,passError;
  SnackBar alarm;
  GlobalKey<ScaffoldState>scaffoldkey;
  @override
  void initState() {
    user =TextEditingController();
    pass=TextEditingController();

    scaffoldkey=GlobalKey<ScaffoldState>();

    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key:scaffoldkey ,
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text("login page"),
          centerTitle: true,
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        body: Center(
          child: Container(
            child: ListView(
              children: [
                Image.asset("images/flutter.png"),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextField(
                    controller: user,
                    decoration: InputDecoration(
                      errorText: userError,
                        contentPadding: EdgeInsets.fromLTRB(16, 14, 16, 14),
                        hintText: "UserName",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: passError,
                        contentPadding: EdgeInsets.fromLTRB(16, 14, 16, 14),
                        hintText: "PassWord",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),

                  child: MaterialButton(
                    padding:EdgeInsets.fromLTRB(16, 14, 16, 14) ,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    color: Colors.blue,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        if(user.text.length <4){
                          userError="UserName must be >4";

                        }else if(pass.text.length <4){
                          userError=null;
                         passError="pass must be >4";

                        }else{
                          userError=null;
                          passError=null;
                          alarm =SnackBar(content: Text("login seccesful ! Wellcame ${user.text}"));
                          scaffoldkey.currentState.showSnackBar(alarm);
                        }
                      });
                    } ,
                    child: Text(
                      "login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
