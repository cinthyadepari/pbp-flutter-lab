import 'package:flutter/material.dart';
import 'package:counter_7/budget.dart' as globals;
import 'package:flutter/services.dart';

class BudgetForm extends StatefulWidget {
  const BudgetForm({super.key});

  @override
  State<StatefulWidget> createState() => _BudgetFormState();
}


class _BudgetFormState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _listmilih = ["Pilih Jenis","Pemasukan", "Pengeluaran"];
  String _judul ='';
  int _nominal=0;
  String type='';
  final _judulController = TextEditingController();
  final _nominalController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
               
                Padding(
                  
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _judulController,
                    decoration: InputDecoration(
                      hintText: "Beli es teh jumbo",
                      labelText: "Judul",
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    
                    validator: (String? value) {
                      if (value == null) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nominalController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      hintText: "Nominal",
                      //labelText: "Nominal",
                      prefix: const Text("Rp"),
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                   
                    onChanged: (String? value) {
                      setState(() {
                        _nominal = int.parse(value!);
                      });
                    },
                    
                    onSaved: (String? value) {
                      setState(() {
                        _nominal = int.parse(value!);
                      });
                    },
          
                    validator: (String? value) {
                      if (value == null) {
                        return 'Nominal tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),

                DropdownButtonFormField<String>(
                  value: type,
                  items : _listmilih.map((String items){
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? valueBaru){
                    setState(() {
                      type = valueBaru!;
                    });
                  },
                    validator: (value) {
                      if (value == 'Pilih Jenis') {
                        return 'Mohon isi jenis budget!';
                      }
                      return null;
                    }),
                
               Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          globals.itemList.add(
                              globals.Budget(_judul, _nominal.toString(), type));
                          _judulController.clear();
                          _nominalController.clear();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 10,
                                    child: Container(
                                        child: ListView(
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 20),
                                            shrinkWrap: true,
                                            children: <Widget>[
                                          Center(
                                              child: const Text(
                                                  'Data berhasil disimpan')),
                                          SizedBox(height: 20),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Kembali'),
                                          )
                                        ])));
                              });
                        }
                      }))
            ]),
          ),
        ),
      ),
    );
  }
}