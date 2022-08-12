import 'package:essay_app_login/essay_menu.dart';
import 'package:flutter/material.dart';


final List<String> TemporaryList = <String>['Pizza','Pizza','Pizza','Pizza','Pizza','Pizza','Pizza',];


// var testList = ["whale", "fish", "shark"];

class ProjectSources {
  List<String> Sources = <String>[];

  ProjectSources() {

  }
}

class DeletedProjectsInfo {
  late String Title;
  late String DateDeleted;
  // List<ProjectSources> Sources;

  DeletedProjectsInfo(this.Title, this.DateDeleted, /*this.Sources*/);

}





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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () {Navigator.of(context).pop();
          },
          child: Text('Back'),
        ),

        Container(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Center(
                  child: Text('test'),
                ),
              );
            }
          ),
        ),

      ],
    ),
  );
}
