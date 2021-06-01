import 'package:flutter/material.dart';

class YoutubeHomeScreen extends StatefulWidget {
  const YoutubeHomeScreen({Key key}) : super(key: key);

  @override
  _YoutubeHomeScreenState createState() => _YoutubeHomeScreenState();
}

class _YoutubeHomeScreenState extends State<YoutubeHomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/abo_ali.jpg'
              ),
              radius: 15,
            ),
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: (){}
            ),
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: (){}
            ),
            IconButton(
                icon: Icon(
                  Icons.connect_without_contact,
                  color: Colors.white,
                ),
                onPressed: (){}
            ),

          ],
        ),
        actions: [
          IconButton(
              icon: Container(
                  width: 40,
                decoration: BoxDecoration(
                  color: Colors.red[700],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              onPressed: (){}
          ),
          Center(
            child: Text(
                'YouTube',
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold
               ),

            ),
          ),

        ],
        backgroundColor: Colors.grey[800],
        brightness:  Brightness.dark,
      ),
      backgroundColor: Colors.black87,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined,

              ),
            label: 'Library',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined
            ,
            ),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline,
              size: 40,

            ),
            label: '',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined , ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
        ],
        backgroundColor: Colors.grey[900],
        unselectedLabelStyle: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,

        ),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
         onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },


      ),
    );
  }
}
