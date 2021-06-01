import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'Telegram'
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
        ],
        backgroundColor: Colors.grey[850],
          brightness: Brightness.dark,
      ),
      drawer: Drawer(
        child: ListView(
          children:[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[850],

              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/abo_ali.jpg'
                          ),
                          radius: 35,

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Ahmed Ali Ahmed Ali Ahmed Ali ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '+201015408967',
                          style: TextStyle(
                              color: Colors.grey
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ),
                  Column(
                    children: [

                      IconButton(
                        icon: Icon(
                          Icons.wb_sunny,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),

                    ],
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                ],
              ),
              margin: EdgeInsets.all(0),

            ),
            buildListTile(
                icon:   Icons.group,
                title:  'New Group'),
            buildListTile(
                icon:   Icons.perm_contact_cal_rounded,
                title:  'Contacts'),

            buildListTile(
                icon:   Icons.call,
                title:  'Calls'),

            buildListTile(
                icon:   Icons.nature_people_rounded,
                title:  'People Nearby'),

            buildListTile(
                icon:   Icons.save,
                title:  'Saved Messages'),

            buildListTile(
                icon:   Icons.settings,
                title: 'Settings'),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),

            buildListTile(
                icon:   Icons.person_add_rounded,
                title: 'Add Friends'),
            buildListTile(
                icon:   Icons.help_outline,
                title: 'Telegram Features'),

          ],

        ),

      ),
      drawerEnableOpenDragGesture: true ,
      backgroundColor: Colors.grey[900],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: (){},
      ),
      body: ListView.separated(
           scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => buildUserItem(),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 70
            ),
            child: Container(
              color: Colors.black54,
              width: double.infinity,
              height: 1,

            ),
          ),
          itemCount: 20
      ),
    );
  }

  Widget buildUserItem()=>Container(
    height: 70,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/abo_ali.jpg'
            ),
            radius: 30,

          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 8
                        ),
                        child: Text(
                          'Ahmed Ali',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis ,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '4:10',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          color: Colors.grey
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 8
                        ),
                        child: Text(
                          ' welcome Abdelrman Ali Ahmed ahmed',
                          style: TextStyle(

                              fontWeight: FontWeight.w300,
                              color: Colors.grey
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis ,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CircleAvatar(
                        radius: 11,

                        child: Text(
                          '12',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,

                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildListTile({
   @required IconData icon,
   @required String title,
   Color titleColor = Colors.white,
    Color iconColor = Colors.grey,
})=>ListTile(
    leading: Icon(
     icon,
      color: iconColor,
    ),
    title: Text(
         title,
      style: TextStyle(
        color: titleColor,
      ),
    ),

  );
}
