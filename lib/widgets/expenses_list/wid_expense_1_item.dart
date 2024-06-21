import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/expense_func.dart';

class Expense_1_Item extends StatelessWidget{
  const Expense_1_Item(this.specfic_esp_item, {super.key});
  final Expense_1_item_func specfic_esp_item;


  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                specfic_esp_item.title,
                style: Theme.of(context).textTheme.titleLarge
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${specfic_esp_item.amount.toStringAsFixed(2)}'),//This is a way to consider this data as string
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[specfic_esp_item.category]),
                    const SizedBox(width: 4),
                    Text(specfic_esp_item.formattedDate)
                ],)
              ],
            )
          ],
        ),
      ),
    );

  }
}
