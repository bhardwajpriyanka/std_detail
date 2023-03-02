import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:std_detail/screen/model/std_model.dart';
import 'package:std_detail/screen/proivder/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController txtname =  TextEditingController();
  TextEditingController txtstd =  TextEditingController();
  TextEditingController txtid =  TextEditingController();

  TextEditingController dtxtname =  TextEditingController();
  TextEditingController dtxtstd =  TextEditingController();
  TextEditingController dtxtid =  TextEditingController();

  HomeProvider? homeProvider;
  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Student Data"), centerTitle: true),
          body: Column(
            children: [
              TextFormField(
                controller: txtname,
                decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Enter the Name"
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtid,
                decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Enter the Id"
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtstd,
                decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Enter the Standard"
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {
                stdModel s1 = stdModel(name: txtid.text,id: txtname.text,std: txtstd.text);
                homeProvider!.add(s1 );
              }, child: Text("Add")),
              Expanded(
                child: Consumer<HomeProvider>(
                  builder: (context, value, child) => ListView.builder(
                    itemCount: homeProvider!.StudentDetail.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text("${homeProvider!.StudentDetail[index].id}"),
                        title: Text("${homeProvider!.StudentDetail[index].name}"),
                        subtitle: Text("${homeProvider!.StudentDetail[index].std}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
                              homeProvider!.remove(index);
                            }, icon: Icon(Icons.delete,color: Colors.red,)),
                            IconButton(onPressed: () {
                              dtxtid = TextEditingController(text: "${homeProvider!.StudentDetail[index].name}");
                              dtxtname = TextEditingController(text: "${homeProvider!.StudentDetail[index].id}");
                              dtxtstd = TextEditingController(text: "${homeProvider!.StudentDetail[index].std}");
                              showDialog(context: context, builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(controller: dtxtid,),
                                    TextField(controller: dtxtname,),
                                    TextField(controller: dtxtstd,),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(onPressed: () {
                                    Navigator.pop(context);
                                  }, child: Text("Cancle")),
                                  ElevatedButton(onPressed: () {
                                    stdModel s1 = stdModel(name: dtxtstd.text,id: dtxtname.text,std: dtxtid.text);
                                   homeProvider!.update(index, s1 );
                                    Navigator.pop(context);
                                  }, child: Text("Done"))
                                ],
                              ),);
                            }, icon: Icon(Icons.edit))
                          ],
                        ),
                      );
                    },),
                ),
              )
            ],
          ),
        ),
    );
  }
}
