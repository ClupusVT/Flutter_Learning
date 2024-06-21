import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class addingNewItem extends StatefulWidget{
  const addingNewItem ({super.key});

  @override
  State<addingNewItem> createState(){
    return _addingNewItem();
  }
}

class _addingNewItem extends State<addingNewItem>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  //need to tell Flutter to delete if you don't use anymore, dispose only used for stateful widget
  void dispose(){
    _titleController.dispose();
    //_amountController.dispose();
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
                      children: [
                        const Text('Selected Date'),
                        IconButton(
                          onPressed:() {},
                          icon: const Icon(
                              Icons.calendar_month),
                        )
                      ],
                    ),
                )
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      print(_titleController.text);
                      print(_amountController.text);
                    },
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