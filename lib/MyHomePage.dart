import 'package:flutter/material.dart';
import 'package:flutter_connectivity/ObjectClasses/FetchCountries.dart';
import 'VisaServices/Services.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isLoading;
  List<FetchCountries> countriesList;


  @override
  void initState() {
    // TODO: implement initState
      isLoading = true;


      Services.getVisaCountries().then((value){
        setState(() {
          isLoading = false;
          countriesList = value;

        });
      });

      super.initState();

  }

  @override
  Widget build(BuildContext context) {

    int dataLength = countriesList.isEmpty ? 0 : countriesList.length;
    print(countriesList);
    return isLoading==true ? Scaffold(
      body:  Center(child: CircularProgressIndicator()),
    )
    :
    Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: countriesList==null ? 0 : countriesList.length,
        itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Row(
            children: [
              Image.network("${countriesList[index].cImage}",width: 20,height: 20,),
              SizedBox(width: 10,),
              Text("${countriesList[index].cName}",style: TextStyle(color: Colors.black, fontSize: 20),),
            ],
          ),
        );
      },)
    );
  }
}