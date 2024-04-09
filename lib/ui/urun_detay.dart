import 'package:flutter/material.dart';
import 'package:urunler_uygulamasi/data/entity/urunler.dart';
import 'package:urunler_uygulamasi/ui/core/project_font_size.dart';

class UrunDetay extends StatefulWidget {
  Urunler urun;

  UrunDetay({super.key, required this.urun});

  @override
  State<UrunDetay> createState() => _UrunDetayState();
}

class _UrunDetayState extends State<UrunDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.urun.urun_ad),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/png/${widget.urun.urun_resim}'),
            Text(
              '${widget.urun.urun_fiyat} ₺ ',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: ProjectFontSize().fontSizeXXLarge),
            ),
          ],
        ),
      ),
    );
  }
}
