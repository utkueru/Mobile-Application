import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(CocktailApp());
}

class CocktailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnaKategoriEkrani(),
      ),
    );
  }
}
class DataModel extends ChangeNotifier {
  List<dynamic> _data = [];

  List<dynamic> get data => _data;

  void setData(List<dynamic> newData) {
    _data = newData;
    notifyListeners();
  }
}

class AnaKategoriEkrani extends StatelessWidget {
  Future<void> fetchCategories(BuildContext context) async {
    final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['drinks'];
      Provider.of<DataModel>(context, listen: false).setData(data);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cocktail Categories'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        
      ),
      body: FutureBuilder(
        future: fetchCategories(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else {
            final data = Provider.of<DataModel>(context).data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['strCategory']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AltKategoriEkrani(
                          kategori: data[index]['strCategory'],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class AltKategoriEkrani extends StatelessWidget {
  final String kategori;

  AltKategoriEkrani({required this.kategori});

  Future<List<dynamic>> fetchCocktails() async {
    final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$kategori'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['drinks'];
    } else {
      throw Exception('Failed to load cocktails');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kategori),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: fetchCocktails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else {
            final cocktails = snapshot.data;
            return ListView.builder(
              itemCount: cocktails?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Hero(
                    tag: 'hero-tag-${cocktails?[index]['idDrink']}',
                    child: Text(cocktails?[index]['strDrink']),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KokteylDetayEkrani(
                          kokteylAdi: cocktails?[index]['strDrink'],
                          id: cocktails?[index]['idDrink'],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class KokteylDetayEkrani extends StatelessWidget {
  final String kokteylAdi;
  final String id;

  KokteylDetayEkrani({required this.kokteylAdi, required this.id});

  Future<Map<String, dynamic>> fetchCocktailDetail() async {
    final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['drinks'][0];
    } else {
      throw Exception('Failed to load cocktail details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kokteylAdi),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: fetchCocktailDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else {
            final cocktailDetail = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: 'hero-tag-$id',
                    child: Image.network(cocktailDetail?['strDrinkThumb']),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      cocktailDetail?['strInstructions'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}