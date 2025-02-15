import 'package:events_emitter/events_emitter.dart';
import 'package:expense_tracker/dao/category_dao.dart';
import 'package:expense_tracker/events.dart';
import 'package:expense_tracker/model/category.model.dart';
import 'package:expense_tracker/widgets/dialog/category_form.dialog.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoryDao _categoryDao = CategoryDao();
  EventListener? _categoryEventListener;
  List<Category> _categories = [];

  @override
  void initState() {
    super.initState();
    loadData();

    _categoryEventListener = globalEvent.on("category_update", (data) {
      debugPrint("categories are changed");
      loadData();
    });
  }

  @override
  void dispose() {
    _categoryEventListener?.cancel();
    super.dispose();
  }

  void loadData() async {
    List<Category> categories = await _categoryDao.find();
    setState(() {
      _categories = categories;
    });

    for (var category in categories) {
      if (category.expense != null &&
          category.budget != null &&
          category.expense! > category.budget!) {
        _showBudgetExceededWarning(category);
      }
    }
  }

  void _showBudgetExceededWarning(Category category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Budget Exceeded"),
        content: Text("You have exceeded the budget for '${category.name}'!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: ListView.separated(
        itemCount: _categories.length,
        itemBuilder: (builder, index) {
          Category category = _categories[index];
          double expenseProgress =
              (category.expense ?? 0) / (category.budget ?? 1);

          bool isOverBudget =
              (category.expense ?? 0) > (category.budget ?? double.infinity);

          return ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (builder) => CategoryForm(category: category),
              );
            },
            leading: CircleAvatar(
              backgroundColor: category.color.withOpacity(0.2),
              child: Icon(category.icon, color: category.color),
            ),
            title: Text(
              category.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: isOverBudget ? Colors.red : Colors.black, // 🔥 Fixed color issue
              ),
            ),
            subtitle: expenseProgress.isFinite
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: expenseProgress.clamp(0.0, 1.0),
                          color: isOverBudget ? Colors.red : null,
                          semanticsLabel: expenseProgress.toString(),
                        ),
                      ),
                      if (isOverBudget)
                        const Text(
                          "Budget exceeded!",
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                    ],
                  )
                : const Text(
                    "No budget",
                    style: TextStyle(color: Colors.grey, overflow: TextOverflow.ellipsis),
                  ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            color: Colors.grey.withAlpha(25),
            height: 1,
            margin: const EdgeInsets.only(left: 75, right: 20),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (builder) => const CategoryForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
