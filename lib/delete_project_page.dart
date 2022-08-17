import 'package:essay_app_login/essay_menu.dart';
import 'package:flutter/material.dart';


final List<String> TemporaryList = <String>['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15',];





class RecoverDeletedProjects extends StatefulWidget {
  const RecoverDeletedProjects({Key? key}) : super(key: key);

  @override
  State<RecoverDeletedProjects> createState() => _RecoverDeletedProjectsState();
}

class _RecoverDeletedProjectsState extends State<RecoverDeletedProjects> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: 80,),


        Container(
          height: 500,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
              itemCount: TemporaryList.length,
              itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.grey,
                child: Center(
                  child: Text(
                    style: TextStyle(fontSize: 20),
                    '${TemporaryList[index]}'),
                ),
              );
            }
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () {Navigator.of(context).pop();
          },
          child: Text('Back'),
        ),

      ],
    ),
  );
}
