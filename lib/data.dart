import 'package:flutter/material.dart';

class Product {
  final String name;
  final String title;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Product(
      {this.name, this.title, this.imagePath, this.description, this.colors});
}

List<Product> products = [
  Product(
      name: "Chuck Taylor Classic All Star Low top Black",
      title: "Low top Black",
      imagePath: "images/black.png",
      description:
          "The unmistakable Chuck Taylor All Star Classic celebrates the iconic low top silhouette presented in a range of classic colours. No one will blame you for getting more than one pair.",
      colors: [Colors.grey.shade100]),
  Product(
      name: "Chuck Taylor Classic All Star High top Black",
      title: "High top Black",
      imagePath: "images/blackankle.png",
      description:
          "The unmistakable Chuck Taylor All Star Classic celebrates the iconic low top silhouette presented in a range of classic colours. No one will blame you for getting more than one pair.",
      colors: [Colors.grey.shade100]),
  Product(
      name: "Chuck Taylor Classic All Star High top Charcoal",
      title: "High top Charcoal",
      imagePath: "images/charcoal.png",
      description:
          "The unmistakable Chuck Taylor All Star Classic celebrates the iconic low top silhouette presented in a range of classic colours. No one will blame you for getting more than one pair.",
      colors: [Colors.grey.shade100]),
  Product(
      name: "Chuck Taylor Classic All Star High top Navy",
      title: "High top Navy",
      imagePath: "images/navy.png",
      description:
          "The unmistakable Chuck Taylor All Star Classic celebrates the iconic low top silhouette presented in a range of classic colours. No one will blame you for getting more than one pair.",
      colors: [Colors.grey.shade100]),
  Product(
      name: "Chuck Taylor Classic All Star High Top Red",
      title: "High Top Red",
      imagePath: "images/04redankle.png",
      description:
          "The unmistakable Chuck Taylor All Star Classic celebrates the iconic low top silhouette presented in a range of classic colours. No one will blame you for getting more than one pair.",
      colors: [Colors.grey.shade100]),
  Product(
      name: "Chuck Taylor Classic All Star Low Top White",
      title: "Low Top White",
      imagePath: "images/white.png",
      description:
          "The unmistakable Chuck Taylor All Star Classic celebrates the iconic low top silhouette presented in a range of classic colours. No one will blame you for getting more than one pair.",
      colors: [Colors.grey.shade100]),
];

List<String> sizeNumList = [
  "7",
  "8",
  "9",
  "10",
];

var images = [
  "images/black.png",
  "images/blackankle.png",
  "images/charcoal.png",
  "images/navy.png",
  "images/04redankle.png",
  "images/white.png",
];

var title = [
  "Low top Black",
  "High Top Black",
  "High Top Charcoal",
  "High Top Navy",
  "High Top Red",
  "Low Top White"
];
var price = ["120", "120", "120", "120", "120", "120"];
