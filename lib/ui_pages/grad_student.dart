import 'package:flutter/material.dart';

class GradStudent extends StatefulWidget {
  const GradStudent({Key? key}) : super(key: key);

  @override
  _GradStudentState createState() => _GradStudentState();
}

class _GradStudentState extends State<GradStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 400,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  // color: Colors.blue,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, right: 55.0),
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("images/profile.png"),
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, right: 5.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search,
                              color: Colors.black, size: 25.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, right: 5.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications_active,
                              color: Colors.black, size: 25.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, right: 5.0),
                        child: IconButton(
                          onPressed: () {},
                          icon:
                              Icon(Icons.menu, color: Colors.black, size: 25.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text('Functionalities',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 20.0),
                GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 4,
                  children: List.generate(models.length, (index) {
                    return Center(
                      child: ModelCard(model: models[index]),
                    );
                  }),
                ),
              ],
            ),

        ],
      ),
    );
  }
}

class Model {
  const Model({required this.text, required this.icon});

  final String text;
  final IconData icon;
// final Size size;

}

List<Model> models = <Model>[
  Model(text: 'Profile', icon: Icons.person),
  Model(text: 'Fees', icon: Icons.event_note_rounded),
  Model(text: 'Result', icon: Icons.file_copy_sharp),
  Model(text: 'Attendance', icon: Icons.home_work_outlined),
  Model(text: 'Subjects', icon: Icons.subject),
  Model(text: 'Downloads', icon: Icons.download_rounded),
  Model(text: 'Routine', icon: Icons.request_page_outlined),
  Model(text: 'Library', icon: Icons.library_books_sharp),
  Model(text: 'Teachers', icon: Icons.people),
  Model(text: 'Exam', icon: Icons.wallpaper),
  Model(text: 'Dormitory', icon: Icons.hotel),
  Model(text: 'Transport', icon: Icons.bus_alert),
];

class ModelCard extends StatelessWidget {
  // const ModelCard({Key? key}) : super(key: key);
  final Model model;

  const ModelCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.caption;
    return Card(
      elevation: 3.0,
      // margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(model.icon, size: 25.0, color: Colors.blue),
              SizedBox(height: 13.0),
              Text(model.text,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black87)),
            ]),
      ),
    );
  }
}
