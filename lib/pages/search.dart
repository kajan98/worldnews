import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/home.dart';


class NewsSearch extends SearchDelegate<String> {
  final List<ArticleModel> articles;

  NewsSearch({required this.articles});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search logic here
    List<ArticleModel> searchResults = articles
        .where((article) =>
        article.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return BlogTile(
          desc: searchResults[index].description!,
          imageUrl: searchResults[index].urlToImage!,
          title: searchResults[index].title!,
          url: searchResults[index].url!,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Suggestions based on the query (optional)
    return Container();
  }
}
