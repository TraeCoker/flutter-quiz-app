import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//provider lets us create a state class to seperate the data from the widget itself
//extends change notifier which is a built in class that defines any data that changes
//throughout the lifecycle of the app and provides methods to mutate the data

class CounterState extends ChangeNotifier {

  int count = 0;

  updateCount() {
    count++;
    //tells the app to re-render when this value changes
    notifyListeners();
  }


}

class CounterApp extends StatelessWidget {
  const CounterApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //gives all children access to state class
    return ChangeNotifierProvider(
      //instantiates counter state class and initial state
      create: (context) => CounterState(),
      child: const CountText(),
      
    );
  }
}

//We can now access the state anywhere in the widget tree with context.watch
class CountText extends StatelessWidget {
  const CountText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var state = context.watch<CounterState>();
    //does the same as above
    var state2 = Provider.of<CounterState>(context);

    return Text('${state.count}');
  }
}