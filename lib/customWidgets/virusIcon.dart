import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class VirusLoader extends StatelessWidget {
  // const VirusLoader({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: HeartbeatProgressIndicator(
        child: SizedBox(
            height: 50.0,
            child: Image(
              height: MediaQuery.of(context).size.height * 0.02,
              image: AssetImage(
                'images/loader.png'
              ),
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }
}