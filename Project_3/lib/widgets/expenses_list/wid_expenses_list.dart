
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/expense_func.dart';
import 'package:flutter_quiz_app/widgets/expenses_list/wid_expense_1_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList ({super.key,required this.expenses_detail_items ,required this.onRemoveItem});

  final List<Expense_1_item_func> expenses_detail_items;
  final void Function (Expense_1_item_func expenses_detail_items) onRemoveItem;

  @override
  Widget build(BuildContext context){
    return ListView.builder(
        itemCount: expenses_detail_items.length,
        itemBuilder: (ctx,index) => Dismissible(
          key: ValueKey(expenses_detail_items[index]),//delete depend on specific item
          background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.5),
              margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          ),
          onDismissed: (direction) {
            onRemoveItem(expenses_detail_items[index]);//This action help remove the item on saved list not only on the screen
          },
          child: Expense_1_Item(expenses_detail_items[index]),
      ),
    );
  }
}