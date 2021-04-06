import 'package:commonlib/common_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingExampleState();
}

class _LoadingExampleState extends State<LoadingExample> {
  LoaderState state = LoaderState.Loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _delayShow();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: LoaderContainer(
        contentView: Padding(
          padding: EdgeInsets.all(0.0),
          child: Center(
            child: Text("这是个加载等待框示例！"),
          ),
        ),
        loaderState: state,
      ),
    );
  }

  _delayShow() {
    //延时500毫秒执行
    Future.delayed(const Duration(milliseconds: 2000), () {
      //延时执行的代码
      setState(() {
        //延时更新状态
        state = LoaderState.Succeed;
      });
    });
  }
}
