import 'package:counter_7/form.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';

class MyDataPage extends StatefulWidget{
  MyDataPage({super.key, this.budgetItem});
  var budgetItem;

  @override
  State<MyDataPage> createState() => MyDataPageState();
}

class MyDataPageState extends State<MyDataPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Budget Data'),
        ),
        drawer: Drawer(
            child: Column(children: [
          ListTile(
              title: const Text('counter_7'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()),
                );
              }),
          ListTile(
            title: const Text("Add Budget"),
            onTap: (){
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (context)=> const BudgetForm()),
              );
            },
          ),
        ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyDataPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.budgetItem == null || widget.budgetItem.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      const Text(
                        "Data kosong!",
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: widget.budgetItem.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(widget.budgetItem[index]._judul),
                          subtitle: Text(widget.budgetItem[index].nominal),
                          trailing: Column(
                            children: [
                              Text(widget.budgetItem[index].jenis),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}