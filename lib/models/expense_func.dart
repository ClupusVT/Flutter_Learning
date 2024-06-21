import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid(); //This variable used for global , this use unique ID
final formatter = DateFormat.yMd();
enum Category  {work,leisure,food,travel}

const categoryIcons = {//mapping the icon
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.travel: Icons.movie,
};

class Expense_1_item_func {
  Expense_1_item_func({required this.title, required this.amount, required this.date, required this.category}): id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}