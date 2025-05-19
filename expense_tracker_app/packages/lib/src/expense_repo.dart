import '../expense_repo.dart';

abstract class ExpenseRepo {
  Future<void> createCategory(Category category);
  Future<void> getCategory();
}
