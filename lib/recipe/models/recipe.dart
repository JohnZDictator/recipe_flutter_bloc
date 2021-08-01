import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  Recipe({
    this.id,
    required this.title,
    required this.description,
    // required this.image,
    required this.recipeOwner,
  });

  final String? id;
  final String title;
  final String description;
  // final Image image;
  final String recipeOwner;

  @override
  List<Object?> get props => [id, title, description, recipeOwner];

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        // image: json['image'],
        recipeOwner: json['Chef']);
  }

  @override
  String toString() =>
      'Recipe { id: $id, title: $title, description: $description, recipeOwner: $recipeOwner}';
}
