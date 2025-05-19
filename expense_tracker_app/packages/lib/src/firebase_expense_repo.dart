import 'dart:math';
import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../expense_repo.dart';

class FirebaseExpenseRepo implements ExpenseRepo {
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');
  final categoryCollection = FirebaseFirestore.instance.collection(
    'categories',
  );
  @override
  Future<void> createCategory(Category category) async {
    try {await categoryCollection.doc(category.categoryId).set(category.toEntity().toDocment())} catch (e) {
      log(e.toString() as num);
      rethrow;
    }
  }

  @override
  Future<void> getCategory() async {
    try {await categoryCollection.get().} catch (e) {
      log(e.toString() as num);
      rethrow;
    }
  }
}
