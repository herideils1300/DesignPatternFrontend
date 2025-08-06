import 'package:croatia_explorer/layers/presentation/using_android/providers/sights_provider.dart';
import 'package:croatia_explorer/layers/presentation/using_android/view/shared/custom_widgets/custom_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SightsFuture extends ConsumerStatefulWidget{
  const SightsFuture({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SightsFutureWidget();
}

class SightsFutureWidget extends ConsumerState<SightsFuture>{
  
  @override
  Widget build(BuildContext context) {
    //final future = ref.read(sightsScreenStateProvider);
    final futureNotifier = ref.watch(sightsScreenStateProvider.notifier);

    return FutureBuilder(future: futureNotifier.getAllSights(), builder: (context, snapshot){
      if(snapshot.hasData){
        return ListView.builder(itemBuilder: (context, index){
          return CustomCard(sight: snapshot.data![index]); 
        });
      }else if(snapshot.hasError){
        return Text("Error: ${snapshot.error}", style: Theme.of(context).textTheme.displayMedium);
      }else{
        return Container(
              width: 75,
              height: 75,
              margin: const EdgeInsets.only(top: 20),
              child: Lottie.asset("lib/assets/animations/loading_sights.json",
                  alignment: Alignment.center),
            );
      }
    });
  }

}