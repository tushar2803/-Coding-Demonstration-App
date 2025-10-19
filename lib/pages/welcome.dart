import 'dart:convert';

import 'package:coding_app/models/problem_model.dart';
import 'package:coding_app/pages/detail_page.dart';
import 'package:coding_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final problemJson = await rootBundle.loadString('lib/problems.json');
    final decodeProblems = jsonDecode(problemJson);
    var problems = decodeProblems["coding_problems"];
    ProblemModel.problems = List.from(problems)
        .map<Problem>((problem) => Problem.fromMap(problem))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        title: "CodingJr".text.color(Colors.white).make().centered(),
        backgroundColor: primary,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => DetailPage(
                              problem: ProblemModel.problems[index],
                            )));
              },
              child: Card(
                color: primary,
                child: ListTile(
                    title: ProblemModel.problems[index].title?.text
                        .color(Colors.white)
                        .bold
                        .make(),
                    trailing: getText(index)),
              ),
            ),
          );
        },
        itemCount: ProblemModel.problems.length,
      ),
    );
  }
}

getText(int index) {
  String? text = ProblemModel.problems[index].difficulty?.toString();
  if (text == "Easy") {
    return ProblemModel.problems[index].difficulty?.text
        .color(Colors.green)
        .bold
        .make();
  } else if (text == "Medium") {
    return ProblemModel.problems[index].difficulty?.text
        .color(Colors.yellow)
        .bold
        .make();
  } else {
    return ProblemModel.problems[index].difficulty?.text
        .color(Colors.red)
        .bold
        .make();
  }
}
