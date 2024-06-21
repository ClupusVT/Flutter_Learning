import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz_app/models/expense_func.dart';

class addingNewItem extends StatefulWidget{
  const addingNewItem ({super.key, required this.addExecutingExpenseitem});
  final void Function(Expense_1_item_func expenses_detail_items) addExecutingExpenseitem;
  @override
  State<addingNewItem> createState(){
    return _addingNewItem();
  }
}

class _addingNewItem extends State<addingNewItem>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate:firstDate,
        lastDate: now
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0; //Check if input value is invalid
    if (_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
              'Please make sure a valid title, amount, date and category was entered'
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('Okay'),
              )
            ],
          ),
      );
      return;
    }

    widget.addExecutingExpenseitem(
        Expense_1_item_func(
            title: _titleController.text,
            amount: enteredAmount,
            date: _selectedDate!,
            category: _selectedCategory
        )
    );
    Navigator.pop(context);
  }

  @override
  //need to tell Flutter to delete if you don't use anymore, dispose only used for stateful widget
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: InputDecoration(
                label: const Text('Title'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity, // Adjust width as needed
                    child: TextField(
                      controller: _amountController,
                      maxLength: 50,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        prefixText: '\$',
                        labelText: 'Amount',
                      ),
                    ),
                  ),
                ),
                const SizedBox (width: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null ? 'No Selected Date': formatter.format(_selectedDate!)),
                      IconButton(
                        onPressed:_presentDatePicker,
                        icon: const Icon(
                            Icons.calendar_month),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                        ),
                      ),
                    ).toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                ),
                const Spacer(),
                TextButton(
                    onPressed: _submitExpenseData,
                    child: Text('Save')
                ),
                const SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      _titleController.clear();
                      _amountController.clear();
                    },
                    child: Text('Clear')
                ),
                const SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);//Back to the main screen
                    },
                    child: Text('Cancel')
                ),
              ],
            )
          ],
        )
    );
  }
}