import 'package:flutter/material.dart';
import 'package:logindemo/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  logindata()async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
      {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Homepage()));
      }
    else
      {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds:3), () {
      setState(() {
        logindata();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SplashScreen"),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset("img/Splash.png",fit: BoxFit.cover,)),
          ],
        ),
      ),
    );
  }
}
