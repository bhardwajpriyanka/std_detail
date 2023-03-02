import 'package:flutter/material.dart';
import 'package:std_detail/screen/model/std_model.dart';

class HomeProvider extends ChangeNotifier
{
  List<stdModel> StudentDetail = [];

  void add(stdModel s1)
  {
    StudentDetail.add(s1);
    notifyListeners();
  }

  void remove(int index)
  {
    StudentDetail.removeAt(index);
    notifyListeners();
  }

  void update(int index,stdModel s1)
  {
    StudentDetail[index]=s1;
    notifyListeners();
  }
}