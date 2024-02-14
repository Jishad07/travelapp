

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/expensemodel.dart';
import 'package:travel_app/screen/expensedetails/deatails.dart';

class Expence extends StatefulWidget {
   Expence({required this.expectedamount, super.key});
   String? expectedamount;
  @override
  State<Expence> createState() => _ExpenceState();
}

TextEditingController datecontroller = TextEditingController();
TextEditingController timecontroller = TextEditingController();
TextEditingController categorycontroller = TextEditingController();
TextEditingController amountcontroller = TextEditingController();
final GlobalKey<FormState> validation = GlobalKey<FormState>();

DateTime selectedDate = DateTime.now();
DateTime selectedtime = DateTime.now();

class _ExpenceState extends State<Expence> {
  List<Expensemodel> dbexpense = [];
  int newValue = 0;
  int balanceValue=0;
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        setState(() {
          gettotal();
          getbalance();
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
      height: MediaQuery.of(context).size.height/2.8,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF05999E), Color(0xFFCBE7E3)])),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width /5,
             ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    shadowColor: Colors.amber,
                    elevation: 10,
                    color: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                              colors: [Colors.amber, Colors.pink],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const Expensedetails()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Total Expence",
                              style: TextStyle(color: Colors.white),
                            ),
                            Center(
                                child: ExpenseText(
                              newvalue: newValue,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                shadowColor: Colors.amber,
                elevation: 10,
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width/2.5, 
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Color(0xFF05999E),Color.fromARGB(255, 196, 164, 70)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const Expensedetails()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Balance Amount",
                          style: TextStyle(color: Colors.white),
                        ),
                        Center(
                            child:BalanceText(
                          expectedamount:widget.expectedamount,
                          balanceValue: balanceValue,
                          
                        )),
                      ],
                    ),
                  ),
                ),
              ),
                ],
              ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
             
            ),
            // ListView.separated(
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     final data = dbexpense[index];
            //     return Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(data.date),
            //         Text(data.time),
            //         Text(data.category),
            //         Text(data.amount)
            //       ],
            //     );
            //   },
            //   separatorBuilder: (context, index) {
            //     return const Divider(height: 1);
            //   },
            //   itemCount: dbexpense.length,
            //   shrinkWrap: true,
            // ),
            // SizedBox(
            // height: MediaQuery.of(context).size.height * 0.09,
            // ),
            FloatingActionButton(
              elevation: 20,
              splashColor: Colors.pink,
              onPressed: () async {
                await showDialog(
                  context: (context),
                  builder: (context) {
                    return SingleChildScrollView(
                      child: AlertDialog(
                        elevation: 20,
                        shadowColor: Colors.white,
                        title: const Text('Creat Expense'),
                        content: const Text("Please Add Your Expense"),
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
                                  decoration:
                                      const InputDecoration(hintText: 'Date'),
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
                                  decoration:
                                      const InputDecoration(hintText: 'Time'),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Add Category';
                                    }
                                    return null;
                                  },
                                  controller: categorycontroller,
                                  decoration:
                                      const InputDecoration(hintText: 'category'),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Add Amount';
                                    }
                                    return null;
                                  },
                                  controller: amountcontroller,
                                  decoration:
                                      const InputDecoration(hintText: 'Amount'),
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
                                    expensechecking();
                                  },
                                  child: const Text('Add'))
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
               },
              child: const IconTheme(
                  data:
                      IconThemeData(color: Colors.pink, size: 50, opacity: 0.2),
                  child: Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
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

  Future<void> time() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        timecontroller.text = picked.format(context);
      });
    }
  }

  String dateFormat(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  void expensechecking() async {
    if (validation.currentState!.validate()) {
      final expensedate = datecontroller.text.trim();
      final expensetime = timecontroller.text.trim();
      final expensecategory = categorycontroller.text.trim();
      final expenseamount = amountcontroller.text.trim();
      final expense = Expensemodel(
          date: expensedate,
          time: expensetime,
          category: expensecategory,
          amount: expenseamount);
      await addexpense(expense);
      gettotal();
      getbalance();
      if (mounted) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const Expensedetails()));
      }
    }
  }

  void gettotal() async {
    List<Expensemodel> newlist = await getExpense();

    setState(() {
      dbexpense = newlist;
    });

    total = 0;
    for (int i = 0; i < dbexpense.length; i++) {
      int convertamount = int.parse(dbexpense[i].amount);
      total += convertamount;
    }

    setState(() {
      newValue = total;
    });
  }


   void getbalance() async {
    List<Expensemodel> newlist = await getExpense();

    setState(() {
      dbexpense = newlist;
    });
    
     int c=int.parse(widget.expectedamount as String);
    total = c;
      for (int i = 0; i < dbexpense.length; i++) {
      int convertamount = int.parse(dbexpense[i].amount);
      total -= convertamount; 
    }

    setState(() {
      balanceValue = total;
    });
  }
}

class ExpenseText extends StatefulWidget {
  ExpenseText({this.newvalue,super.key});
  int? newvalue = 0;
  
  @override
  State<ExpenseText> createState() => ExpenseTextState();
}

class ExpenseTextState extends State<ExpenseText> {
  // void initState() {
  //   // fetchData();
  //   super.initState();
  // }

  //  void fetchData() async {
  //   dbexpense = await getExpense();
  //   addTotal();
  // }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
        ).createShader(bounds);
      },
      child: Text(
        '₹ ${widget.newvalue ?? 0}',
        style: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BalanceText extends StatefulWidget {

 BalanceText({this.balanceValue,this.expectedamount, super.key});
   String? expectedamount;
  int? balanceValue=0;
  @override
  State<BalanceText> createState() => BalanceTextState();
}

class BalanceTextState extends State<BalanceText> {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
        ).createShader(bounds);
      },
      child: Text(
        '₹ ${widget.balanceValue?? 0}',
        style: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

