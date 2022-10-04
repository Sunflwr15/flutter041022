import 'package:crud/model/model.dart';
import 'package:crud/services/service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeMurid());
  }
}

class HomeMurid extends StatefulWidget {
  const HomeMurid({super.key});

  @override
  State<HomeMurid> createState() => _HomeMuridState();
}

class _HomeMuridState extends State<HomeMurid> {
  List<DataSiswa> data = [];
  // ignore: unused_element
  void _getData() {
    MuridService().getMurid().then((value) {
      if (value != false) {
        setState(() {
          // ignore: avoid_print
          print(value);
          data = value;
        });
      }
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: data.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                return Container(
                  child: ListTile(
                    title: Text(data[index].nameMurid),
                    subtitle: Text(data[index].nisn.toString()),
                    trailing: InkWell(

                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
