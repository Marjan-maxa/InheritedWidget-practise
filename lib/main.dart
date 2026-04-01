import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  CounterController counterController=CounterController();
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CounterController()),
        ChangeNotifierProvider(create: (context)=>AbcController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home:  MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final counterController=context.read<CounterController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Consumer<CounterController>(

               builder: ( context, _,child) {
                 return Text(
                   '${counterController.counter}',
                   style: Theme.of(context).textTheme.headlineMedium,
                 );
               },
            ),
            ElevatedButton(onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingScreen())), child: Text('Navigate to Setting'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counterController.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    final counterController=context.read<CounterController>();
    return Scaffold(
      appBar: AppBar(

        title: const Text('Setting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
         // ListenableBuilder(
         //    listenable: counterController,
         //      builder: (context, child) {
         //        return Text('Counter ${counterController.counter}',style: TextStyle(
         //          fontSize: 25,
         //          fontWeight: .bold
         //        ),);
         //      }
         //    ),

            Consumer<CounterController>(
                builder: (context,_, child) {
                  return Text('Counter ${counterController.counter}',style: TextStyle(
                      fontSize: 25,
                      fontWeight: .bold
                  ),);
                }
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){

        counterController.incrementCounter();
      },child: Icon(Icons.add),),

    );
  }
}

class CounterController extends ChangeNotifier{
  int counter=0;
  void incrementCounter(){
    counter++;
    notifyListeners();
  }

}
class AbcController extends ChangeNotifier{
  int counter=0;
  void incrementCounter(){
    counter++;
    notifyListeners();
  }

}
// class CounterControllerInheritedWidget extends InheritedWidget{
//   final CounterController counterController;
//
//   CounterControllerInheritedWidget({required super.child, required this.counterController});
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true;
//   }
//   static CounterControllerInheritedWidget of(BuildContext context){
//     return context.dependOnInheritedWidgetOfExactType<CounterControllerInheritedWidget>()!;
//   }
//
// }

 // 48:36
