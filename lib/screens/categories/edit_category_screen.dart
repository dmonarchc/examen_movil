import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/services/category_services.dart';
import 'package:flutter_application_1/widgets/category/form_category.dart';
import 'package:provider/provider.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryServices = Provider.of<CategoryServices>(context);

    return ChangeNotifierProvider(
      create: (_) => CaterogyFormProvider(categoryServices.SelectCategory!),
      child: _CategoryScreenBody(categoryServices: categoryServices),
    );
  }
}

class _CategoryScreenBody extends StatelessWidget {
  final CategoryServices categoryServices;

  const _CategoryScreenBody({required this.categoryServices});

  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CaterogyFormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categoría'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16), child: FormCategory()),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'deleteCategory',
            child: const Icon(Icons.delete_forever),
            onPressed: () async {
              if (!categoryForm.isValidForm()) return;

              await categoryServices.deleteCategory(
                categoryForm.category,
                context,
              );
            },
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 'saveCategory',
            child: const Icon(Icons.save),
            onPressed: () async {
              if (!categoryForm.isValidForm()) return;

              await categoryServices.editOrCreateCategories(
                categoryForm.category,
              );

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
