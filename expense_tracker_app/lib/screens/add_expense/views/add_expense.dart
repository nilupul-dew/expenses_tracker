import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseConttroller = TextEditingController();
  TextEditingController categoryConttroller = TextEditingController();
  TextEditingController dateConttroller = TextEditingController();
  DateTime selectDate = DateTime.now();

  @override
  void initState() {
    dateConttroller.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.surface),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Expenses',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseConttroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: FaIcon(
                        FontAwesomeIcons.rupeeSign,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: categoryConttroller,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15),
                    child: FaIcon(
                      FontAwesomeIcons.list,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text('Create a Custom Category',textAlign: TextAlign.center, style: TextStyle(fontSize: 20, ),),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    //controller: expenseConttroller,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      //prefixIcon: Padding(
                                      //padding: const EdgeInsets.only(
                                      //top: 15,
                                      //left: 15,
                                      //),
                                      //child: FaIcon(
                                      //FontAwesomeIcons.rupeeSign,
                                      //color: Colors.grey,
                                      //size: 16,
                                      //),
                                      //),
                                      hintText: 'Category Name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  TextFormField(
                                    //controller: expenseConttroller,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      //prefixIcon: Padding(
                                      //padding: const EdgeInsets.only(
                                      //top: 15,
                                      //left: 15,
                                      //),
                                      //child: FaIcon(
                                      //FontAwesomeIcons.rupeeSign,
                                      //color: Colors.grey,
                                      //size: 16,
                                      //),
                                      //),
                                      hintText: 'Icon',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),

                                  TextFormField(
                                    //controller: expenseConttroller,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      //prefixIcon: Padding(
                                      //padding: const EdgeInsets.only(
                                      //top: 15,
                                      //left: 15,
                                      //),
                                      //child: FaIcon(
                                      //FontAwesomeIcons.rupeeSign,
                                      //color: Colors.grey,
                                      //size: 16,
                                      //),
                                      //),
                                      hintText: 'Color',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        FontAwesomeIcons.plus,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                  ),
                  hintText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: dateConttroller,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );

                  if (newDate != null) {
                    setState(() {
                      dateConttroller.text = DateFormat(
                        'dd/MM/yyyy',
                      ).format(newDate);
                      selectDate = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15),
                    child: FaIcon(
                      FontAwesomeIcons.clock,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                  hintText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    //backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
