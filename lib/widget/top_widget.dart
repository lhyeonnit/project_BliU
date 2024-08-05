import 'package:flutter/material.dart';

// TODO
mixin TopWidgetDelegate {

}

class TopWidget extends StatelessWidget {
  final String? title;
  final bool? isCenter;
  final bool? isBack;
  final Color? backgroundColor;
  final ImageProvider? rightImage1;
  final ImageProvider? rightImage2;
  final TopWidgetDelegate? delegate;

  const TopWidget(
    {
      super.key,
      this.title,
      this.isCenter,
      this.isBack,
      this.backgroundColor,
      this.rightImage1,
      this.rightImage2,
      required this.delegate
    }
  );

  @override
  Widget build(BuildContext context) {
    Image tmpImg = Image.asset('');

    var titleAlign = Alignment.centerLeft;
    if (isCenter ?? false) {
      titleAlign = Alignment.center;
    }

    var rightImage1Visible = false;
    var rightImage2Visible = false;

    if (rightImage1 != null) {
      rightImage1Visible = true;
    }

    if (rightImage2 != null) {
      rightImage2Visible = true;
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      color: backgroundColor ?? Colors.white,
      height: 56,
      child: Row(
        children: [
          Visibility(
            visible: isBack ?? true,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              // color: Colors.red,
              // width: 25,
              // height: 30,
              child: IconButton(
                icon: const Icon(
                    Icons.arrow_back_ios_new
                ),
                onPressed: () {

                },
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: titleAlign,
              child: Text(
                title ?? "",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            )
          ),
          Visibility(
            visible: rightImage2Visible,
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              width: 30,
              height: 30,
              child: Image(
                image: rightImage2 ?? tmpImg.image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Visibility(
            visible: rightImage1Visible,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Image(
                image: rightImage1 ?? tmpImg.image,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}