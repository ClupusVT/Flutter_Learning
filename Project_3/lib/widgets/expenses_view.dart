import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/widgets/expenses_list/wid_expenses_list.dart';
import 'package:flutter_quiz_app/models/expense_func.dart';
import 'package:flutter_quiz_app/widgets/wid_adding_expense_item.dart';

class expenses_Page extends StatefulWidget{
  const expenses_Page({super.key});

  @override
  State<expenses_Page> createState(){
    return _ExpenseState();
  }
}

class _ExpenseState extends State<expenses_Page> {
  //We still able to add new value with the provided list, below is a sample list with value inside
  final List<Expense_1_item_func> _registereditemExpenses = [
    Expense_1_item_func(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work
    ),
    Expense_1_item_func(
        title: 'Cinema',
        amount: 15,
        date: DateTime.now(),
        category: Category.leisure
    ),
    Expense_1_item_func(
        title: 'Hamburger',
        amount: 22,
        date: DateTime.now(),
        category: Category.food
    ),
  ];
  void _openAddExpenseOverlay(){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) =>  addingNewItem(addExecutingExpenseitem: _addExecutingExpenseitem),
    );
  }
  void _addExecutingExpenseitem(Expense_1_item_func expenses_detail_items){
    setState(() {
      _registereditemExpenses.add(expenses_detail_items);
    });
  }

  void _removeExecutingExpenseitem(Expense_1_item_func expenses_detail_items){
    final expenseIndex = _registereditemExpenses.indexOf(expenses_detail_items);
    setState(() {
      _registereditemExpenses.remove(expenses_detail_items);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(seconds: 3),
            content: const Text("Item deleted !"),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registereditemExpenses.insert(expenseIndex,expenses_detail_items);
              });
            }
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
        child: Text('No expenses found. Start adding some!'),
    );
    if (_registereditemExpenses.isNotEmpty){
      mainContent = ExpensesList(
        expenses_detail_items: _registereditemExpenses, // View list of item
        onRemoveItem: _removeExecutingExpenseitem , //Remove item action
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ExpenseTracker'),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay,
                icon: const Icon(Icons.add)
            )
          ],
        ),
        body :Column(
          children:  [
            const Text('The chart'),
            Expanded(
                child:mainContent
            ),//need double expand here
      ],
    ));
  }

}