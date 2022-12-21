import 'package:flutter/material.dart';
import 'package:student_app/screen/screen_input.dart';
import 'package:student_app/screen/screen_list.dart';
import 'package:student_app/screen/search.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: const  Text(
          'BROTOTYPE',
          style: TextStyle(
            letterSpacing: 5,
          ),),
        centerTitle: true,
        elevation: 3,
        
        leadingWidth: 56,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchProfile(),);
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: const SafeArea(
          child: ScreenList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ScreenInput()));
        },
        tooltip: 'New Data',
        child: Icon(Icons.person_add),
        splashColor: Colors.black,
        elevation: 3,
      ),
    );}
  }

  