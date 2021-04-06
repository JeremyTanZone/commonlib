part of commonlib;

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Platform.isAndroid
              ? CircularProgressIndicator(
                  strokeWidth: 3.0, backgroundColor: Colors.greenAccent)
              : CupertinoActivityIndicator(radius: 20.0),
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('加载中', style: TextStyle(fontSize: 16)))
        ]),
      );
}
