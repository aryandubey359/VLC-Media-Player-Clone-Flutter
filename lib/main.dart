import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:video_example/page/orientation_page.dart';
import 'package:video_example/page/signin.dart';
import 'package:firebase_core/firebase_core.dart';

final urlLandscapeVideo =
    'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4';
final urlPortraitVideo =
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4';
final urlYoutubeVideo = 'https://youtube.com/watch?v=HSAa9yi0OMA';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VLC Video Player',
        theme: ThemeData(
          primaryColor: Colors.orange,
          scaffoldBackgroundColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.dark(),
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  // ignore: deprecated_member_use
  void _databasetester(){
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("database_test");
    _testRef.set("Hello World 77");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    // return BottomNavigationBar(
    //   backgroundColor: Theme.of(context).primaryColor,
    //   selectedItemColor: Colors.white,
    //   unselectedItemColor: Colors.white70,
    //   currentIndex: index,
    //   items: [
    //     BottomNavigationBarItem(
    //       icon: Text('VideoPlayer', style: style),
    //       label: ("Basics"),
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Text('VideoPlayer', style: style),
    //       label: ('Orientation'),
    //     ),
    //   ],
    //   onTap: (int index) => setState(() => this.index = index),
    // );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return SigninOrSignupScreen();
      case 1:
        return OrientationPage();
      default:
        return Container();
    }
  }
}

