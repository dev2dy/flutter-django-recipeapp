import 'package:flutter/foundation.dart';

class Recipe {
  final int id;
  final String name;
  final String description;
  final List<String> ingredients;
  final List<String> ingredients_raw_str;
  final String serving_size;
  final int servings;
  final List<String> steps;
  final List<String> tags;
  final List<String> search_terms;
  final int author_id;
  final String author_name;
  final String submitted;
  final String image_url;
  final int minutes;
  final String category;
  final String calories;
  final int n_steps;
  final int n_ingredients;
  final List<String> nutrition;
  final String rating;
  final int review_count;

  const Recipe({
    @required this.id,
    @required this.name,
    this.description,
    this.ingredients,
    this.ingredients_raw_str,
    this.serving_size,
    this.servings,
    this.steps,
    this.tags,
    @required this.search_terms,
    this.author_id,
    this.author_name,
    this.submitted,
    @required this.image_url,
    @required this.minutes,
    this.category,
    this.calories,
    this.n_steps,
    this.n_ingredients,
    this.nutrition,
    @required this.rating,
    this.review_count,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      name: json['name'],
      description: json['description'],
      ingredients: json["ingredients"] != null
          ? new List<String>.from(json["ingredients"].map((x) => x))
          : [],
      ingredients_raw_str: json["ingredients_raw_str"] != null
          ? new List<String>.from(json["ingredients_raw_str"].map((x) => x))
          : [],
      serving_size: json['serving_size'],
      servings: json['servings'],
      steps: json["steps"] != null
          ? new List<String>.from(json["steps"].map((x) => x))
          : [],
      tags: json["tags"] != null
          ? new List<String>.from(json["tags"].map((x) => x))
          : [],
      search_terms: json["search_terms"] != null
          ? new List<String>.from(json["search_terms"].map((x) => x))
          : [],
      author_id: json['author_id'],
      author_name: json['author_name'],
      submitted: json['submitted'],
      image_url: json['image_url'],
      minutes: json['minutes'],
      category: json['category'],
      calories: json['calories'],
      n_steps: json['n_steps'],
      n_ingredients: json['n_ingredients'],
      nutrition: json["nutrition"] != null
          ? new List<String>.from(json["nutrition"].map((x) => x))
          : [],
      rating: json['rating'],
      review_count: json['review_count'],
    );
  }
}
