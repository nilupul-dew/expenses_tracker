import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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

  List<String> categoryIconList = [
    'education',
    'entertainment',
    'food',
    'health',
    'maintenance',
    'rent',
    'shopping',
    'travel',
  ];

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
                            bool isExpanded = false;
                            String iconSelected = '';
                            Color categoryColor = Colors.white;
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  backgroundColor: Colors.lightBlue.shade50,
                                  title: Text(
                                    'Create a Custom Category',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  content: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          //controller: expenseConttroller,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            fillColor: Colors.white,

                                            hintText: 'Category Name',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          onTap: () {
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          readOnly: true,
                                          //controller: expenseConttroller,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            fillColor: Colors.white,
                                            suffixIcon: const Icon(
                                              CupertinoIcons.chevron_down,
                                              size: 14,
                                            ),

                                            hintText: 'Icon',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  isExpanded
                                                      ? const BorderRadius.vertical(
                                                        top: Radius.circular(
                                                          12,
                                                        ),
                                                      )
                                                      : BorderRadius.circular(
                                                        12,
                                                      ),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        isExpanded
                                            ? Container(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                      bottom: Radius.circular(
                                                        12,
                                                      ),
                                                    ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: GridView.builder(
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        mainAxisSpacing: 5,
                                                        crossAxisSpacing: 5,
                                                      ),
                                                  itemCount:
                                                      categoryIconList.length,
                                                  itemBuilder: (
                                                    context,
                                                    int i,
                                                  ) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          iconSelected =
                                                              categoryIconList[i];
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            width: 3,
                                                            color:
                                                                iconSelected ==
                                                                        categoryIconList[i]
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .grey,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
                                                          image: DecorationImage(
                                                            image: AssetImage(
                                                              'assets/${categoryIconList[i]}.png',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                            : Container(),

                                        SizedBox(height: 16),

                                        TextFormField(
                                          readOnly: true,
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx2) {
                                                return AlertDialog(
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ColorPicker(
                                                        pickerColor:
                                                            categoryColor,
                                                        onColorChanged: (
                                                          value,
                                                        ) {
                                                          setState(() {
                                                            categoryColor =
                                                                value;
                                                                
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: double.infinity,
                                                        height: 50,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(ctx2);
                                                          },
                                                          style: TextButton.styleFrom(
                                                            backgroundColor:
                                                                Colors.black,
                                                            //backgroundColor: Theme.of(context).colorScheme.primary,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            'Add Color',
                                                            style: TextStyle(
                                                              fontSize: 22,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          //controller: expenseConttroller,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            fillColor: categoryColor,
                                            hintText: 'Color',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        SizedBox(
                                          width: double.infinity,
                                          height: kToolbarHeight,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              //backgroundColor: Theme.of(context).colorScheme.primary,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: Text(
                                              'Create',
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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
                    firstDate: DateTime.now().subtract(Duration(days: 30)),
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
