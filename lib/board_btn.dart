import 'package:flutter/material.dart';

class BoardBtn extends StatelessWidget {

  String btnText = '';
  int  btnIndex ;
  Function onBtnClicked ;

  BoardBtn({ required this.btnText , required this.btnIndex , required this.onBtnClicked });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.orange
          ),
        ),
        margin: EdgeInsets.all(3),
        child: ElevatedButton(
            onPressed: (){
              onBtnClicked(btnIndex);
            },
            child: Text(
             btnText,
              style: TextStyle(
                fontSize: 45,
              ),
            )
        ),
      ),
    );
    /// must put ; after return because after return the system exit the fn or block.
  }
}
