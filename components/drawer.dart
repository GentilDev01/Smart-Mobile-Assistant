import 'package:flutter/material.dart';

class DrawerSection extends StatelessWidget {
  const DrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
       backgroundColor: Theme.of(context).primaryColor,
         child: ListView( 
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: UserAccountsDrawerHeader(
              accountName: const Text('Calculatorapp.com'),
              accountEmail: const Text('Calculator@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/image/avatarone.jpg',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration:  BoxDecoration(
                color:  const Color.fromARGB(255, 14, 61, 100),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.asset('assets/image/background.jpg',
                      fit: BoxFit.cover,
                    ).image,
                    ),
              ),
            ),
          ),
          ListTile(
            
            leading: const Icon(Icons.favorite,
              color: Colors.red,
            ),
            title: const Text('Favorites',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            leading:   const Icon(Icons.person,
             color:  Color.fromARGB(255, 28, 24, 255),
            ),
            title:  const Text('Friends',
             style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            leading:   const Icon(Icons.share,
             color:  Color.fromARGB(255, 28, 24, 255),
            ),
            title: const Text('Share',
             style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
        const  ListTile(
            leading: Icon(Icons.notifications,
             color:  Color.fromARGB(255, 28, 24, 255),
            ),
            title: Text('Request',
             style: TextStyle(color: Colors.white),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings,
              color: Color.fromARGB(255, 28, 24, 255),
            ),
            title: const Text('Settings',
             style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.description,
              color:  Color.fromARGB(255, 28, 24, 255),
            ),
            title: const Text('Policies',
             style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),

         const Divider(),
          ListTile(
            title: const Text('Exit',
             style: TextStyle(color: Colors.white),
            ),
            leading: const Icon(Icons.exit_to_app,
              color:  Color.fromARGB(255, 28, 24, 255),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}