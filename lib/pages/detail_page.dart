// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coding_app/pages/editor.dart';
import 'package:coding_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:coding_app/models/problem_model.dart';

class DetailPage extends StatelessWidget {
  final Problem problem;
  const DetailPage({
    Key? key,
    required this.problem,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Editor()),
            );
          },
          backgroundColor: Colors.green,
          child: "Editor".text.make(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            problem.title!.text
                .color(Colors.white)
                .semiBold
                .xl3
                .make()
                .py(39)
                .px(6),
            "Description".text.color(Colors.white).xl3.semiBold.make().p(10),
            problem.description!.text.color(Colors.white).xl.make().p8(),
            "Constraints".text.color(Colors.white).xl3.semiBold.make().p(10),
            problem.constraints!.text.color(Colors.white).xl.make().p8(),
          ],
        ),
      ),
    );
  }
}
