import 'package:flutter/material.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/iterymodel.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/tripdetails/expence.dart';

class IteryPage extends StatefulWidget {
  Plandetails plandetails;
  int day;
   IteryPage({required this.plandetails,required this.day, super.key});

  @override
  State<IteryPage> createState() => _IteryPageState();
}

class _IteryPageState extends State<IteryPage> {

  TextEditingController itercontroller = TextEditingController();
   
 @override
  void initState() {
    super.initState();
    
    fetchData();
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
      itemBuilder: (BuildContext,index){
            if(index==0){

            
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: (){
                   showdailog(null);
                }, child: Text("Add")),
            ],
          ),
        );}
      return  GestureDetector(
        onTap: () {
         showdailog(iteryes[index-1]);
        },
        child: Container(
        
              constraints: const BoxConstraints(minHeight: 100),
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Center(
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: 100,
                        ),
                        width: 10,
                        // height: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    ),
                    Expanded(
                      child:Text(iteryes[index-1].itery))
                ],
              ),
            ),
      );
    },
    itemCount: iteryes.length+1,
    );
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
                                      IteryModel iteryModel= IteryModel(id:null, itery:itercontroller.text, tripid:widget.plandetails.id!, day: widget.day, time: 0);
                                 await addIteryes(iteryModel);
                                  }else{
                                    model.itery=itercontroller.text;
                                    await edititeryes(model);
                                  }
                                  
                                 Navigator.of(context).pop();
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