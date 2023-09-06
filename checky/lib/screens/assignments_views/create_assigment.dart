import 'package:flutter/material.dart';

List testCase = ["0"];

class CreateAssigment extends StatefulWidget {
  const CreateAssigment({super.key});

  @override
  State<CreateAssigment> createState() => _CreateAssigmentState();
}

class _CreateAssigmentState extends State<CreateAssigment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.amber),
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            child: Text(
              "create assigment",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                labelText: "title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 300,
            // height: 100,
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "Desciption",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Test Case",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TestCaseConstructor();
              },
              itemCount: 3,

              //  TestCaseConstructor(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

class TestCaseConstructor extends StatelessWidget {
  const TestCaseConstructor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: "input",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 100,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: "output",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 100,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Mark",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
