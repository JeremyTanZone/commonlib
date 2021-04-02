part of commonlib;

///自定义Dialog
class CustomDialog extends StatefulWidget {
  //------------------不带图片的dialog------------------------
  final String title; //弹窗标题
  final String content; //弹窗内容
  final String confirmContent; //按钮文本
  final String cancelContent; //按钮文本
  final Color confirmTextColor; //确定按钮文本颜色
  final bool isCancel; //是否有取消按钮，默认为true true：有 false：没有
  final Color confirmColor; //确定按钮颜色
  final Color cancelColor; //取消按钮颜色
  final bool outsideDismiss; //点击弹窗外部，关闭弹窗，默认为true true：可以关闭 false：不可以关闭
  final Function confirmCallback; //点击确定按钮回调
  final Function dismissCallback; //弹窗关闭回调
  final double height; //dialog高度

  //------------------带图片的dialog------------------------
  final String image; //dialog添加图片
  final String imageHintText; //图片下方的文本提示

  const CustomDialog(
      {Key key,
      this.title,
      this.content,
      this.confirmContent,
      this.confirmTextColor,
      this.cancelContent,
      this.isCancel = true,
      this.confirmColor,
      this.cancelColor,
      this.outsideDismiss = true,
      this.confirmCallback,
      this.dismissCallback,
      this.image,
      this.imageHintText,
      this.height})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomDialogState();
  }
}

class _CustomDialogState extends State<CustomDialog> {
  _confirmDialog() {
    Navigator.of(context).pop();
    if (widget.confirmCallback != null) {
      widget.confirmCallback();
    }
  }

  _dismissDialog() {
    Navigator.of(context).pop();
    if (widget.dismissCallback != null) {
      widget.dismissCallback();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    Column _columnText = Column(
      children: <Widget>[
        SizedBox(height: widget.title == null ? 0 : 16.0),
        Text(widget.title == null ? '' : widget.title,
            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,)),
        Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              alignment: Alignment.center,
              child: Text(
                  widget.content == null ? '' : widget.content,
                  style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center,),
            ),
            flex: 1),
        SizedBox(height: 1.0, child: Container(color: Color(0xDBDBDBDB))),
        Container(
            height: 45,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: widget.isCancel
                        ? Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0))),
                            child: FlatButton(
                              child: Text(widget.cancelContent == null
                                  ? '取消'
                                  : widget.cancelContent,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: widget.cancelColor == null
                                        ? Colors.black87
                                        : widget.cancelColor,
                                  )),
                              onPressed: _dismissDialog,
                              splashColor: Color(0xFFFFFFFF),
                              highlightColor: Color(0xFFFFFFFF),
                            ),
                          )
                        : Text(''),
                    flex: widget.isCancel ? 1 : 0),
                SizedBox(
                    width: widget.isCancel ? 1.0 : 0,
                    child: Container(color: Color(0xDBDBDBDB))),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: widget.isCancel
                              ? BorderRadius.only(
                                  bottomRight: Radius.circular(12.0))
                              : BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0))),
                      child: FlatButton(
                        onPressed: _confirmDialog,
                        child: Text(
                            widget.confirmContent == null
                                ? '确定'
                                : widget.confirmContent,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: widget.confirmColor == null
                                  ? (widget.confirmTextColor == null
                                      ? Colors.black87
                                      : widget.confirmTextColor)
                                  : widget.confirmColor,
                            )),
                        splashColor: Color(0xFFFFFFFF),
                        highlightColor: Color(0xFFFFFFFF),
                      ),
                    ),
                    flex: 1),
              ],
            ))
      ],
    );

    Column _columnImage = Column(
      children: <Widget>[
        SizedBox(
          height: widget.imageHintText == null ? 35.0 : 23.0,
        ),
        Image(
            image: AssetImage(widget.image == null ? '' : widget.image),
            width: 72.0,
            height: 72.0),
        SizedBox(height: 10.0),
        Text(widget.imageHintText == null ? "" : widget.imageHintText,
            style: TextStyle(fontSize: 16.0)),
      ],
    );

    return WillPopScope(
        child: GestureDetector(
          onTap: () => {widget.outsideDismiss ? _dismissDialog() : null},
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                width: widget.image == null ? width - 100.0 : width - 150.0,
                height: widget.height == null ? 150.0 : widget.height,
                alignment: Alignment.center,
                child: widget.image == null ? _columnText : _columnImage,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return widget.outsideDismiss;
        });
  }
}
