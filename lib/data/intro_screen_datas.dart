import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> getPages() {
  return [
    PageViewModel(
        image: Image.asset(
          "images/scooter.png",
          width: 200,
          height: 200,
        ),
        title: "Sie haben hunger?",
        body:
            "Bestellen Sie Ihere Lieblingsgerichte von den besten Restaurants Ihrer Region!",
        decoration: const PageDecoration(
          pageColor: Colors.white,
        )),
    PageViewModel(
      image: Image.asset(
        "images/scooter.png",
        width: 200,
        height: 200,
      ),
      title: "Sie haben hunger?",
      body:
          "Bestellen Sie Ihere Lieblingsgerichte von den besten Restaurants Ihrer Region!",
    ),
    PageViewModel(
      image: Image.asset(
        "images/scooter.png",
        width: 200,
        height: 200,
      ),
      title: "Sie haben hunger?",
      body:
          "Bestellen Sie Ihere Lieblingsgerichte von den besten Restaurants Ihrer Region!",
    ),
  ];
}
