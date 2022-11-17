import 'dart:html';

import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/budget.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BudgetForm(),
    );
  }
}

class BudgetForm extends StatefulWidget {
  const BudgetForm({super.key});

  @override
  State<BudgetForm> createState() => MyFormPageState();
}

class MyFormPageState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String _milih = "Pilih Jenis";
  List<String> listMilih = ['Pilih Jenis', 'Pengeluaran', 'Pemasukan'];
  //static List<Budget> listBudget =[];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      )
      drawer: Drawer(
        child:Column(
          children : [
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const BudgetForm()),
                );
              }),

            ListTile(
              title: const Text ('Add Budget'),
              onTap: (){
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context)=> const BudgetForm()));
              }),

            ListTile(
              title: const Text('Data Budget'),
              onTap: (){
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const BudgetForm()));
              }),  
        ])),
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (String? value){
                      setState(() {
                        itemBaru = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        itemBaru = value!;
                      });
                    },
                     validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'ID item tidak boleh kosong!';
                      }
                      return null;
                    }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: 'Nominal',
                        border: OutlinedBorder(BorderRadius.circular(5.0))),
                      onChanged: (String? value){
                        setState(() {
                          _nominal = int.parse(value!);
                        });
                      },
                      onSaved: (String? value){
                        setState(() {
                          _nominal = int.parse(value!);
                        });
                      },
                      validator: (String? value){
                        if(value==null || value.isEmpty){
                          return ("Harga tidak boleh kosong");
                        }
                        return null;
                      }),
                ),
                ListTile(
                  trailing: DropdownButton(
                    value: _milih,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listMilih.map((String items){
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue){
                      setState(() {
                        _milih = newValue!;
                      });
                    },
                  ),
                ),
                TextButton(
                  child: const Text(
                    "Save!"
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      budgetList.data.add(Budget(_judul, _nominal, _milih));
                    showDialog(
                      context : context, 
                      builder: (context){
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          child: Container(
                            child: ListView(
                              padding: const EdgeInsets.only(
                                top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(child: const Text(
                                  "Data berhasil disimpan")),
                                SizedBox(height: 20),
                                TextButton(
                                  onPressed:(){
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Back"),
                               ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}