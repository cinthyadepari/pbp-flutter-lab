import 'package:flutter/material.dart';
import 'package:counter_7/mywatchlist.dart';


class WatchlistDetails extends StatefulWidget {
  final int pk;

  const WatchlistDetails({super.key, required this.pk});

  @override
  State<StatefulWidget> createState() => _WatchlistDetailsState();
}
class _WatchlistDetailsState extends State<WatchlistDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color.fromARGB(31, 244, 239, 239),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: Color.fromARGB(255, 255, 255, 255)
                )
              ]
          ),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      watchlistdata[widget.pk].fields.title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   
                    Text(
                      'Status: watched',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'rating: ${watchlistdata[widget.pk].fields.rating}',
                          
                          style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Review',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            watchlistdata[widget.pk].fields.review.toString(),
                            style:
                            const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Release date: ${watchlistdata[widget.pk].fields.releaseDate}',
                            style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 45, right: 45, bottom: 35),
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 227, 124, 115),
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text("Back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
    );
  }
}