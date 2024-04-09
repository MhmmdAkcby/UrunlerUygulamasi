import 'package:flutter/material.dart';
import 'package:urunler_uygulamasi/data/entity/urunler.dart';
import 'package:urunler_uygulamasi/ui/core/add_to_chart_button.dart';
import 'package:urunler_uygulamasi/ui/core/project_font_size.dart';
import 'package:urunler_uygulamasi/ui/core/project_padding.dart';
import 'package:urunler_uygulamasi/ui/product/image_path.dart';
import 'package:urunler_uygulamasi/ui/product/language/language_items.dart';
import 'package:urunler_uygulamasi/ui/product/language/urun_ad.dart';
import 'package:urunler_uygulamasi/ui/product/urun_fiyat.dart';
import 'package:urunler_uygulamasi/ui/urun_detay.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final UrunAd urunAd = UrunAd();
  final ImagePath imagePath = ImagePath();
  final ProjectFontSize fontSize = ProjectFontSize();

  Future<List<Urunler>> urunleriYukle() async {
    List<Urunler> urunlerListesi = _urunEkle();

    return urunlerListesi;
  }

  List<Urunler> _urunEkle() {
    var urunlerListesi = <Urunler>[];
    var u1 = Urunler(
        urun_id: 1,
        urun_ad: urunAd.bilgisayarAd,
        urun_resim: imagePath.bilgisayarPng,
        urun_fiyat: UrunFiyat.bilgisayarFiyat);
    var u2 = Urunler(
        urun_id: 2, urun_ad: urunAd.gozlukAd, urun_resim: imagePath.gozlukPng, urun_fiyat: UrunFiyat.gozlukFiyat);
    var u3 = Urunler(
        urun_id: 3, urun_ad: urunAd.kulaklikAd, urun_resim: imagePath.kulaklikPng, urun_fiyat: UrunFiyat.kulaklikFiyat);
    var u4 = Urunler(
        urun_id: 4, urun_ad: urunAd.parfumAd, urun_resim: imagePath.parfumPng, urun_fiyat: UrunFiyat.parfumFiyat);
    var u5 =
        Urunler(urun_id: 5, urun_ad: urunAd.saatAd, urun_resim: imagePath.saatPng, urun_fiyat: UrunFiyat.saatFiyat);
    var u6 = Urunler(
        urun_id: 6, urun_ad: urunAd.supurgeAd, urun_resim: imagePath.supurgePng, urun_fiyat: UrunFiyat.supurgeFiyat);
    var u7 = Urunler(
        urun_id: 7, urun_ad: urunAd.telefonAd, urun_resim: imagePath.telefonPng, urun_fiyat: UrunFiyat.telefonFiyat);

    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);
    urunlerListesi.add(u5);
    urunlerListesi.add(u6);
    urunlerListesi.add(u7);
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(LanguageItems.appBarName),
        ),
        body: FutureBuilder<List<Urunler>>(
          future: urunleriYukle(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var urunlerListesi = snapshot.data;

              return ListView.builder(
                itemCount: urunlerListesi!.length,
                itemBuilder: (context, index) {
                  var urun = urunlerListesi[index];
                  return _Card(urun: urun, fontSize: fontSize);
                },
              );
            } else {
              return const Center();
            }
          },
        ));
  }
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required this.urun,
    required this.fontSize,
  });

  final Urunler urun;
  final ProjectFontSize fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigetNavigatorManager().navigateToWidget(
            context,
            UrunDetay(
              urun: urun,
            ));
      },
      child: Card(
        child: Padding(
          padding: ProjectPadding.paddingAllSmall,
          child: Row(
            children: [
              SizedBox(height: 128, width: 128, child: Image.asset('assets/png/${urun.urun_resim}')),
              Padding(
                padding: ProjectPadding.paddingAllSmall,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      urun.urun_ad,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: fontSize.fontSizeSmall,
                          ),
                    ),
                    Text(
                      '${urun.urun_fiyat} ₺',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: fontSize.fontSizeMedium,
                          ),
                    ),
                    const AddToChartButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigetNavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
