import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({Key? key}) : super(key: key);

  List<Ogrenci> tumOgrenciler = List.generate(
    500,
    (index) => Ogrenci(
        index + 1, 'Ogrenci Adı ${index + 1}', 'Ogrenci soyadi ${index + 1}'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ogrenci Listesi'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var oaankiOgrenci = tumOgrenciler[index];
          return Card(
            color: index % 2 == 0
                ? Colors.orange.shade100
                : Colors.purple.shade100,
            child: ListTile(
              onTap: () {
                print("Eleman tıklandı : $index");
                EasyLoading.showToast('Eleman Tıklandı',
                    duration: Duration(
                      seconds: 3,
                    ),
                    dismissOnTap: true,
                    toastPosition: EasyLoadingToastPosition.bottom);
              },
              onLongPress: () {
                _alertDialogIslemleri(context);
              },
              title: Text(oaankiOgrenci.isim),
              subtitle: Text(oaankiOgrenci.soyisim),
              leading: CircleAvatar(
                child: Text(oaankiOgrenci.id.toString()),
              ),
            ),
          );
        },
        itemCount: tumOgrenciler.length,
        separatorBuilder: (context, index) {
          var yeniIndex = index + 1;
          if (yeniIndex % 4 == 0) {
            return Divider(
              thickness: 2,
              color: Colors.teal,
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  ListView klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map((Ogrenci ogr) => ListTile(
                title: Text(ogr.isim),
                subtitle: Text(ogr.soyisim),
                leading: CircleAvatar(
                  child: Text(ogr.id.toString()),
                ),
              ))
          .toList(),
    );
  }
}

void _alertDialogIslemleri(BuildContext myContext) {
  showDialog(
      context: myContext,
      builder: (context) {
        return AlertDialog(
          title: Text('Diaglog başlık'),
          content: SingleChildScrollView(
              child: Column(
            children: [
              Text('Samil' * 100),
              Text('Samil' * 100),
              Text('Samil' * 100),
            ],
          )),
          actions: [
            ButtonBar(children: [
           TextButton(onPressed: () {}, child: Text('Kapat')),
            TextButton(onPressed: () {}, child: Text('Aç')),
            ],),
            TextButton(onPressed: () {}, child: Text('Kapat')),
            TextButton(onPressed: () {}, child: Text('Aç')),
          ],
        );
      });
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
}
