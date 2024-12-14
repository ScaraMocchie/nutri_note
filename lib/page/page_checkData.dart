import 'package:flutter/material.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/page/page_beranda.dart';
import 'package:nutri_note/page/page_edit.dart';
import 'package:nutri_note/page/page_firstEdit.dart';
import 'package:nutri_note/widget/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckDataPage extends StatelessWidget {
  Future<bool> isDataAvailable() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? username = sp.getString('username');
    
    return username != null && username.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: FutureBuilder<bool>(
        future: isDataAvailable(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            // Redirect berdasarkan hasil isDataAvailable
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (snapshot.data == true) {
                DataUser.updateData();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Beranda()),
                );
              } else {
                
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PageFirstEdit()),
                );
              }
            });

            // Tampilan sementara selama redirect
            return Background1(height, width);
          }
        },
      ),
    );
  }
}