import 'package:flutter/material.dart';
 

class Nav extends StatelessWidget implements PreferredSizeWidget {
  const Nav({super.key});  

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
       backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            Positioned.fill(
                  child: Image.asset(
                    'assets/image/background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: const Color.fromRGBO(2, 28, 49, 0.75),
                  ),
                ),
         const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //IconButton(
              //later use
              Icon(Icons.menu,size: 35.0,color: Colors.white,),
             // onPressed: _sliding,
           // ),
            SizedBox(width: 10.0),
            Text(
              'Calculator',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        ),
        ],
      ),
      ),  
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


 