import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/tripdetails/tripdetails.dart';

class Search extends SearchDelegate {
  List data = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear_rounded)
        
          )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<Box<Plandetails>>(
        future: Hive.openBox<Plandetails>('trip_plan_db'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final stdbox = snapshot.data!.values.toList();
            final filteredData = stdbox
                .where((data) =>
                    data.place.toLowerCase().contains(query.toLowerCase()))
                .toList();
                if(filteredData.isEmpty&&query.isEmpty){
                  return Center(
                    child: Column(
                      children: [
                             Lottie.asset(
                              'assets/animation/Animation - 1707303256733.json',
                              width: 200,
                              height: 200),
                                const Text('No Data')
                      ],
                    ),
                  );


                }
                else if(filteredData.isEmpty){
                     return const Center(
                    child:  Text('No Result',style: TextStyle(fontWeight: FontWeight.w500),),
                  );
                };

                             
                     
           
            return Wrap(
              children: filteredData.map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                child: Chip(
                 backgroundColor:Colors.grey[200] ,
                 shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35), 
        side:const  BorderSide(color: Colors.white ),
      ),
                  label:InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Tripdetails(data:e,)));
                    },
                    child: Column(
                      children: [
                        Text(e.place,style: const TextStyle(fontSize: 13),),
                        Text(e.startdate,style: const TextStyle(fontSize: 10),)
                      ],
                    )
                    )
                    ),
                    
              ) ).toList()

              ,
            );
        

            // return ListView.builder(
            //   itemBuilder: (ctx, index) {
            //     final data = filteredData[index];
            //     String namevalue = data.place;
            //     if (namevalue.toLowerCase().contains(query.toLowerCase())) {
            //       return Column(
            //         children: [
            //           InkWell(
            //             onTap: () {
            //               Navigator.of(context).push(MaterialPageRoute(
            //                   builder: (ctx) => Tripdetails(
            //                         data: data,
            //                       )));
            //             },
            //             child: 
            //             Row(
            //               children: [
            //                 Card(
            //                   child: Text(
            //                        data.place,
            //                           style: const TextStyle(
            //                             fontSize: 15,
            //                   )
            //                   ),
            //                 )
            //               ],
            //             )
            //             // Card(
            //             //   color: const Color(0xFF05999E),
            //             //   child: Padding(
            //             //     padding: const EdgeInsets.all(8.0),
            //             //     child: Column(
            //             //       crossAxisAlignment: CrossAxisAlignment.start,
            //             //       children: [
            //             //         Row(
            //             //           mainAxisAlignment:
            //             //               MainAxisAlignment.spaceBetween,
            //             //           children: [
            //             //             Text(
            //             //               data.place,
            //             //               style: const TextStyle(
            //             //                 fontSize: 25,
            //             //               ),
            //             //             ),
                                   
            //             //           ],
            //             //         ),
            //             //         SizedBox(
            //             //           height:
            //             //               MediaQuery.of(context).size.height * 0.01,
            //             //         ),
            //             //         Text(
            //             //           data.startdate,
            //             //           style: const TextStyle(fontSize: 16),
            //             //         ),
            //             //         const Column(
            //             //           crossAxisAlignment: CrossAxisAlignment.start,
            //             //           children: [],
            //             //         ),
            //             //       ],
            //             //     ),
            //             //   ),
            //             // ),
            //           ),
            //           const SizedBox(
            //             height: 12,
            //           ),
            //         ],
            //       );
            //     } else {
            //       return const SizedBox();
            //     }
            //   },
            //   itemCount: filteredData.length,
            // );
          } else {
            return const SizedBox();
          }
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<Box<Plandetails>>(
        future: Hive.openBox<Plandetails>('trip_plan_db'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final stdbox = snapshot.data!.values.toList();
            List<Plandetails>filteredData=[];
            if(query!=""){

                filteredData = stdbox.where((data) =>
                    data.place.toLowerCase().contains(query.toLowerCase())).toList();
                
            }else{
              filteredData=stdbox;
            }
           
            if (query.isEmpty) {
              return const SizedBox();
            } else if (filteredData.isEmpty) {
              return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                   child: Column(
                    children: [
                      Lottie.asset('assets/animation/Animation - 1707302519132.json',
                      height: 200,
                      width: 200),
                    const   Text("Searched Data Not Found")
                    ],
                   ),
                  ),
                ],
              );
            }
            return ListView.builder(
              itemBuilder: (ctx, index) {
                Plandetails data = filteredData[index];
                String namevalue = data.place;
                if (namevalue.toLowerCase().contains(query.toLowerCase())) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Tripdetails(
                                    data: data,
                                  )));
                        },
                        child: Card(
                          color: const Color(0xFF05999E),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.place,
                                      style: const TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                    Row(
                                      children: [],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  data.startdate,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'your destination     :     ${data.place}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text(
                                      'Starting Date          :     ${data.startdate}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text(
                                      'Ending Date            :     ${data.enddate}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text(
                                      'Expected Amount  : ${data.expectedamount}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
              itemCount: filteredData.length,
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
