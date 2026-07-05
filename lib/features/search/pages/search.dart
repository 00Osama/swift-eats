import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/core/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddeliveryapp/features/home/widgets/food_details.dart';
import 'package:fooddeliveryapp/features/search/widgets/empty_search_suggestions.dart';
import 'package:fooddeliveryapp/features/search/widgets/food_search_card.dart';
import 'package:fooddeliveryapp/generated/l10n.dart';

class Search extends SearchDelegate {
  Future<List<DocumentSnapshot>> searchAllCollections(String searchTerm) async {
    List<QuerySnapshot> snapshots = await Future.wait([
      FirebaseFirestore.instance.collection('Foods    ').get(),
      FirebaseFirestore.instance.collection('Drinks    ').get(),
      FirebaseFirestore.instance.collection('Snacks    ').get(),
      FirebaseFirestore.instance.collection('Desserts    ').get(),
    ]);

    List<DocumentSnapshot> results = [];
    snapshots.forEach((snapshot) {
      results.addAll(snapshot.docs);
    });

    String queryLowerCase = searchTerm.toLowerCase();
    List<DocumentSnapshot> filteredResults = results.where((doc) {
      String foodName = doc['foodName'].toString().toLowerCase();
      return foodName.startsWith(queryLowerCase);
    }).toList();

    return filteredResults;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.cancel_rounded),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return EmptySearchSuggestions();
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: FutureBuilder(
          future: searchAllCollections(query),
          builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.neutralButton,
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(S
                    .of(context)
                    .profileErrorWithDetails(snapshot.error.toString())),
              );
            }

            List<DocumentSnapshot> filterFoods = snapshot.data ?? [];

            if (filterFoods.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).noFoodsFound,
                  style: const TextStyle(fontFamily: 'Ubuntu'),
                ),
              );
            }

            return ListView.builder(
              itemCount: filterFoods.length,
              itemBuilder: (context, index) {
                DocumentSnapshot food = filterFoods[index];
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          foodName: food['foodName'],
                          foodPrice: food['foodPrice'],
                          image: food['foodImage'],
                          food: food,
                        ),
                      ),
                    );
                  },
                  child:
                      FoodSearchCard(food: food.data() as Map<String, dynamic>),
                );
              },
            );
          },
        ),
      );
    }
  }
}
