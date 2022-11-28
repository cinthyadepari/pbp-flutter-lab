import 'dart:convert';
import 'dart:io';
import 'package:counter_7/budget.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/models/mywatchlist.dart';
import 'package:counter_7/mywatchlist_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<MyWatchlist> watchlistdata = [];

class mywatchlist extends StatefulWidget{
  const mywatchlist({Key? key}) : super(key: key);

  @override
  State<mywatchlist> createState() => _mywatchlistState();
}

class _mywatchlistState extends State<mywatchlist>{

  @override
  Widget build(BuildContext context) {

    Future<List<MyWatchlist>> fetchmywatchlist() async{
      var url = Uri.parse('https://katalogpbp.herokuapp.com/mywatchlist/json');
      var response = await http.get(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
      );

      //melakukan decode response agar menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      //mengonversi data json menjadi object
      List<MyWatchlist> list_watch = [];
          for (var d in data) {
            if (d != null) {
                MyWatchlist listfilm = MyWatchlist.fromJson(d);
                list_watch.add(MyWatchlist.fromJson(d));
                watchlistdata.add(listfilm);

            }
          }
          return list_watch;
      }

      return Scaffold(
        appBar: AppBar(
          title: Text("My WatchList"),
        ),
        body: FutureBuilder(
          future: fetchmywatchlist(),
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.data==null){
              return const Center(child: CircularProgressIndicator());
            }else{
              if(!snapshot.hasData){
                return Column(
                  children: const [
                    Text(
                      "Tidak terdapat watchlist",
                      style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              }else{
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => WatchlistDetails(pk: snapshot.data[index].pk - 1,))
                      );
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(

                          color:Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 120, 110, 110),
                                blurRadius: 3.0,
                                spreadRadius: -2,
                                offset: Offset(0, 2.5),
                            )
                          ]
                      ),
                    
                    
                    child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                ),
                                
                            ),
                        ],
                        ),
                  )
              

                    

                  )
                );
              }
            }
          }
        )
      );
  }
}