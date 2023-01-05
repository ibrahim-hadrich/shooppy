import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/smallText.dart';

class IntroduceText extends StatefulWidget {
  final String Text;
  const IntroduceText({Key? key, required this.Text}) : super(key: key);

  @override
  State<IntroduceText> createState() => _IntroduceTextState();
}

class _IntroduceTextState extends State<IntroduceText> {
  late String firstHalf;
  late String secondtHalf;
  bool hiddenText=true;
  double textHeight=Dimensions.screenHeight/5.63;
  @override
  void initState(){
    super.initState();
    if(widget.Text.length>textHeight){
      firstHalf=widget.Text.substring(0,textHeight.toInt());
      secondtHalf=widget.Text.substring(textHeight.toInt()+1,widget.Text.length);
    }else{
      firstHalf=widget.Text;
      secondtHalf='';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondtHalf.isEmpty?smallText(size: Dimensions.font16,text: firstHalf):Column(
        children: [
          smallText(size:Dimensions.font16,text: hiddenText?(firstHalf+"..."):(firstHalf+secondtHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });

            },
            child: Row(
              children: [
                hiddenText?
                smallText(text: "Show more",color: const Color(0xFF89dad0),):
                smallText(text: "Show less",color: const Color(0xFF89dad0),),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: const Color(0xFF89dad0)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
