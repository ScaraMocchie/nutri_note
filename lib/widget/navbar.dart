import 'package:flutter/material.dart';
import 'package:nutri_note/controller/page_position.dart';

class NavBar extends StatefulWidget {
  final double width;
  const NavBar({super.key, required this.width});
 

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
          height: 80,
          width: widget.width*3/4,
          padding: EdgeInsets.symmetric(horizontal: 30),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Image.asset("asset/icons/material-symbols_home.png", color: (pagePosition.current=="beranda")?Color(0xffFE7A33):null,),

                onTap: () {
                  setState(() {
                    pagePosition.current = "beranda";
                  });
                },
              ),
              InkWell(
                child: Image.asset("asset/icons/mdi_graph-box.png", 
                color: (pagePosition.current=="catatan")?Color(0xffFE7A33):null,),
                onTap: () {
                  setState(() {
                    pagePosition.current = "catatan";
                  });
                },
              ),
              InkWell(
                child: Image.asset("asset/icons/iconamoon_profile-fill.png",
                color: (pagePosition.current=="profil")?Color(0xffFE7A33):null,),
                onTap: () {
                  setState(() {
                    pagePosition.current = "profil";
                  });
                },
              )
            ],
          ),
        );
  }
}