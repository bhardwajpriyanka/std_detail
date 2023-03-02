import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:std_detail/screen/proivder/home_provider.dart';
import 'package:std_detail/screen/view/home_screen.dart';
void main()
{
   runApp(
     ChangeNotifierProvider(
         create:(context) =>HomeProvider(),
         child: MaterialApp(
         debugShowCheckedModeBanner: false,
         routes: {
           '/':(context)=>HomeScreen(),
          },
       )
     )
   );
}