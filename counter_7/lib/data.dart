import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget.dart';

class MyDataPage extends StatefulWidget {
  MyDataPage({super.key, this.budgetItem});
  var budgetItem;

  @override
  State<MyDataPage> createState() => _budgetState();
}

class _budgetState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: "Program Counter")),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BudgetForm()),
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
                        "Data Kosong!",
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
                          subtitle: Text(widget.budgetItem[index]._nominal),
                          trailing: Column(
                            children: [
                              Text(widget.budgetItem[index]._milih)
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