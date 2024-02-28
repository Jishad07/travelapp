// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/expensemodel.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/tripdetails/expence.dart';

class Expensedetails extends StatefulWidget {
  Function? didpopexpensedetails;
  Plandetails plandetailsdata;
  Expensedetails({super.key, required this.plandetailsdata,this.didpopexpensedetails});

  @override
  State<Expensedetails> createState() => _ExpensedetailsState();
}

int newamount = 0;
int totalamount = 0;
int total = 0;
List<Expensemodel> dbexpense = [];

class _ExpensedetailsState extends State<Expensedetails> {

  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  TextEditingController categorycontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  final GlobalKey<FormState> validation = GlobalKey<FormState>();
  List<Expensemodel> dbexpense = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    if (widget.plandetailsdata.id == null) {
      return;
    }
    dbexpense = await getExpense(widget.plandetailsdata.id!);

    addTotal();
  }

  void addTotal() {
    total = 0;
    for (int i = 0; i < dbexpense.length; i++) {
      int convertamount = int.parse(dbexpense[i].amount);
      total += convertamount;
    }

    setState(() {
      newamount = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense"),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: ()async {
          if(widget.didpopexpensedetails!=null){
             widget.didpopexpensedetails!();
          }
          return true;
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView (
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    child: Card(
                      color: const Color.fromARGB(255, 221, 220, 220),
                      child: Column(
                        children: [
                          Expanded(
                            child: dbexpense.isEmpty
                                ? const Center(
                                    child: Text(
                                      'No data',
                                      style: TextStyle(
                                        fontSize: 25,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white,
                                            offset: Offset(1, 5),
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        final data = dbexpense[index];
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(data.date),
                                            Text(data.time),
                                            Text(data.category),
                                            Text(data.amount),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: PopupMenuButton(
                                                  color: Colors.white,
                                                  elevation: 20,
                                                  icon: const Icon(
                                                    Icons.more_vert,
                                                    color: Colors.black,
                                                  ),
                                                  onSelected: (value) {
                                                    if (value == 'edit') {
                                                      setState(() {
                                                        showdailog(data);
                                                      });
                                                    } else if (value == 'delete') {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                "Delete Trip Plan? ",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              content: const Text(
                                                                  "This plan will be permanantly deleted in your app "),
                                                              actions: [
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                const Divider(
                                                                  height: 1,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(
                                                                                  context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "No",
                                                                          style: TextStyle(
                                                                              color:
                                                                                  Colors.blue),
                                                                        )),
                                                                    Container(
                                                                      width: 1,
                                                                      height: 35,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    TextButton(
                                                                        onPressed:
                                                                            ()async {
                                                                         await deleteExpense(
                                                                                data.id!);
                                                                            fetchData();
                                                                             Navigator.of(
                                                                                  context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "Yes",
                                                                          style: TextStyle(
                                                                              color:
                                                                                  Colors.blue),
                                                                        ))
                                                                  ],
                                                                )
                                                              ],
                                                            );
                                                          });
                                                    }
                                                  },
                                                  itemBuilder: (context) {
                                                    return [
                                                      const PopupMenuItem(
                                                          value: 'edit',
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.edit),
                                                              Text("Edit"),
                                                            ],
                                                          )),
                                                      const PopupMenuItem(
                                                          value: 'delete',
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.delete),
                                                              Text("Delete"),
                                                            ],
                                                          ))
                                                    ];
                                                  },
                                                )),
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Divider(height: 1);
                                      },
                                      itemCount: dbexpense.length,
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    gradient: const LinearGradient(
                      colors: [Colors.pink, Colors.amber],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      newamount.toString(),
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 147, 141, 141)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> time() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        timecontroller.text = picked.format(context);
      });
    }
  }

  Future<void> startdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        datecontroller.text = dateFormat(selectedDate);
      });
    }
  }

  String dateFormat(DateTime date) {
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  void showdailog(Expensemodel? model) {
      datecontroller.text=model!.date;
      timecontroller.text=model.time;
      categorycontroller.text=model.category;
      amountcontroller.text=model.amount;
    showDialog(
      context: (context),
      builder: (
        context,
      ) {
        return AlertDialog(
          elevation: 20,
          shadowColor: Colors.white,
          title: const Text('Edit Expense'),
          content: const Text("Please Edit Your Expense"),
          actions: [
            Form(
              key: validation,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Add Date';
                      } else {
                        return null;
                      }
                    },
                    onTap: () {
                      startdate(context);
                    },
                    controller: datecontroller,
                    decoration: const InputDecoration(hintText: 'Date'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Add Time';
                      }
                      return null;
                    },
                    onTap: () {
                      time();
                    },
                    controller: timecontroller,
                    decoration: const InputDecoration(hintText: 'Time'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Add Category';
                      }
                      return null;
                    },
                    controller: categorycontroller,
                    decoration: const InputDecoration(hintText: 'category'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Add Amount';
                      }
                      return null;
                    },
                    controller: amountcontroller,
                    decoration: const InputDecoration(hintText: 'Amount'),
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
                    onPressed: () {
                      editexpense(model);
                      // expensechecking(widget.tripid);
                    },
                    child: const Text('Update'))
              ],
            )
          ],
        );
      },
    );
  }

    void editexpense(Expensemodel? newvalue) async {
    if (validation.currentState!.validate()) {
      final expensedate = datecontroller.text.trim();
      final expensetime = timecontroller.text.trim();
      final expensecategory = categorycontroller.text.trim();
      final expenseamount = amountcontroller.text.trim();
      newvalue?.amount=expenseamount;
      newvalue?.date=expensedate;
      newvalue?.time=expensetime;
      newvalue?.category=expensecategory;
      
          
      await editexpensedb(newvalue!);
          
Navigator.of(context).pop();
     fetchData();
      }
      return ;
    }
  }

