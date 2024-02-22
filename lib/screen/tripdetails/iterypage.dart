// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/iterymodel.dart';
import 'package:travel_app/model/tripplanmodel.dart';


class IteryPage extends StatefulWidget {
  Plandetails plandetails;
  int day;
   IteryPage({required this.plandetails,required this.day, super.key});

  @override
  State<IteryPage> createState() => _IteryPageState();
}

class _IteryPageState extends State<IteryPage> {

  TextEditingController itercontroller = TextEditingController();
  TextEditingController iterytimecontroller = TextEditingController();
   
 @override
  void initState() {
     fetchData();
     print("itery init");
    super.initState();
    
   
  }

   fetchData()async{
    List<IteryModel>newList=await gettiteryes(widget.plandetails.id!,widget.day);
    setState((){
      iteryes= newList;
    });
    
   }
  
  List<IteryModel>iteryes=[];
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      // shrinkWrap: true,physics:NeverScrollableScrollPhysics() ,
      itemBuilder: (context,index){
    
            if(index==0){

            
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: (){
                   showdailog(null);
                }, child: const Text("Add")),
            ],
          ),
        );}
      return  GestureDetector(
        onTap: () {
         showdailog(iteryes[index]);
        },
        child: Container(
        
              constraints: const BoxConstraints(minHeight: 100),
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,bottom: 5),
                      child: Row(
                        children: [
                          Text(iteryes[index-1].time),
                         const  SizedBox(width: 15,),
                          Container(
                            constraints:const BoxConstraints(
                              minHeight: 100,
                            ),
                            width: 7,
                            // height: double.infinity,
                            color: Colors.grey,
                            child:const CircleAvatar(
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                    Expanded(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(iteryes[index-1].itery),
                          IconButton(onPressed: ()async{
                            print("button clicked");
                           
                           await deleteiteryes(iteryes[index-1].id!);
                         
                            fetchData();
                          }, icon:const Icon(Icons.delete))
                        ],
                      ))
                ],
              ),
            ),
      );
    },
    itemCount:iteryes.length+1,
    );
  }

   Future<void> time() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
       iterytimecontroller.text= picked.format(context);
      });
    }
  }

  void showdailog(IteryModel? model){
    itercontroller.text=model?.itery??"";
    showDialog(
                  context: (context),
                  builder: (context) {
                    return AlertDialog(
                      elevation: 20,
                      shadowColor: Colors.white,
                      title:  Text("Day   \t ${widget.day+1}"),
                      content: const Text("Please Add Your Iteryies"),
                      actions: [
                        Form(
                         
                          child: Column(
                            children: [
                              TextFormField(
                                onTap: () {
                                  time();
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter iteries';
                                  } else {
                                    return null;
                                  }
                                },
                              
                                controller:iterytimecontroller,
                                decoration:
                                    const InputDecoration(hintText: 'Time'),
                              ),
                               TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter iteries';
                                  } else {
                                    return null;
                                  }
                                },
                              
                                controller: itercontroller,
                                decoration:
                                    const InputDecoration(hintText: 'Itery'),
                              ),
                          
                           
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel")),
                            TextButton(
                                onPressed: () async{
                                  if(model==null){
                                      IteryModel iteryModel= IteryModel(id:null, itery:itercontroller.text, tripid:widget.plandetails.id!, day: widget.day, time: iterytimecontroller.text.toString());
                                 await addIteryes(iteryModel);
                                  }else{
                                    model.itery=itercontroller.text;
                                    await edititeryes(model);
                                  }
                                  if(mounted){
                                     Navigator.of(context).pop();
                                  }
                              
                                fetchData();
                                },
                                child: Text( model == null?"Add":"Update"))
                          ],
                        )
                      ],
                    );
                  },
                );
  }
}