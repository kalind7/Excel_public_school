  // Future<bool> _onWillPop() {
  //   return showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: const Text('Are you sure?'),
  //           content: const Text('Do you want to exit the App?'),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(false),
  //               child: const Text('No'),
  //             ),
  //             TextButton(
  //               onPressed: () => exit(0),
  //               child: const Text('Yes'),
  //             )
  //           ],
  //         ),
  //       ) ??
  //       false;
  // }