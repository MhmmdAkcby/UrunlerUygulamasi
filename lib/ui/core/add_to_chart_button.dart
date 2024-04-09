import 'package:flutter/material.dart';
import 'package:urunler_uygulamasi/ui/product/language/language_items.dart';

class AddToChartButton extends StatelessWidget {
  const AddToChartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(LanguageItems.snackBarMessage)));
      },
      child: const Text(LanguageItems.addToChartButtonName),
    );
  }
}
