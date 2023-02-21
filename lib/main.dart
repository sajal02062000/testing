import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:python_flutter/Controllers/data_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Python Script Runner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Python Script Runner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                ': : Gerated Numbers : :',
                style: Theme.of(context).textTheme.headline4,
              ),
              if (dataController.generatedNumbers.isNotEmpty)
                Text(
                  dataController.generatedNumbers.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
              Text(
                ': : Show Message From Script : :',
                style: Theme.of(context).textTheme.headline3,
              ),
              if (dataController.message.value != "")
                Text(
                  dataController.message.value,
                  style: Theme.of(context).textTheme.headline5,
                ),
              MaterialButton(
                color: Colors.purple,
                onPressed: () => dataController.getMessage(),
                padding: const EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Generate Message",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => dataController.generateNumbers(),
        tooltip: 'Generate Numbers',
        child: const Icon(Icons.gamepad_sharp),
      ),
    );
  }
}
