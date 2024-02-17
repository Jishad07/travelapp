import 'package:flutter/material.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/expensemodel.dart';
import 'package:travel_app/model/tripplanmodel.dart';



class Expensedetails extends StatefulWidget {
   Plandetails plandetailsdata;
   Expensedetails({super.key,required this.plandetailsdata});

  @override
  State<Expensedetails> createState() => _ExpensedetailsState();
  
}
int newamount=0;
int totalamount=0;
int total=0;
List<Expensemodel> dbexpense = [];

class _ExpensedetailsState extends State<Expensedetails> {

  List<Expensemodel> dbexpense = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
   if(widget.plandetailsdata.id==null){
    return ;
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
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
                                        Text(data.amount)
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
                    color: Color.fromARGB(255, 147, 141, 141)
                  ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
