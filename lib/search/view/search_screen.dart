import 'package:flutter/material.dart';
import 'package:loka_test/search/app/search_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      Provider.of<SearchProvider>(context, listen: false)
          .search();
    });

  }

  @override
  Widget build(BuildContext context) {
    final SearchProvider searchProvider = Provider.of(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          key: const Key("Floating"),
          backgroundColor: Colors.black,
          onPressed: () {
            Provider.of<SearchProvider>(context, listen: false)
                .search();
          },
          child: const Icon(Icons.search),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Loka Test',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: searchProvider.isFetching
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: searchProvider.drinks.drinks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('drink',
                      arguments: searchProvider.drinks.drinks[index]);

                    },
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 0, left: 12, right: 12),
                        child: ListTile(
                          title: Text(
                            searchProvider.drinks.drinks[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            searchProvider.drinks.drinks[index].category,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12, ),
                          ),
                        ))
                  );
                }));
  }
}
