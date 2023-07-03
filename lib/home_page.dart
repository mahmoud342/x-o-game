import 'package:flutter/material.dart';

import 'board_btn.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> boardBtnState = [
    '','','',
    '','','',
    '','',''
  ];

  int counter = 0;
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    ///receive 2 args of player names.
    ///with casting.
    var args = ModalRoute.of(context)?.settings.arguments as HomePageArgs;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '.. X-O Game ..',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      ///Note: We sending an optional named parameter(body:) in the constructor of scaffold.
      body: Column(
        children: [
          ///1st row: Player names and Scores row
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '* ${args.player1Name} (X)',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '$player1Score',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '* ${args.player2Name} (O)',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '$player2Score',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ///1st board btn row.
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               BoardBtn(btnText: boardBtnState[0] , btnIndex: 0 , onBtnClicked: onBtnClicked),
               BoardBtn(btnText: boardBtnState[1], btnIndex: 1 , onBtnClicked: onBtnClicked ),
               BoardBtn(btnText: boardBtnState[2], btnIndex: 2 , onBtnClicked: onBtnClicked),
              ],
            ),
          ),
          ///2nd board btn row.
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               BoardBtn(btnText: boardBtnState[3], btnIndex: 3 , onBtnClicked: onBtnClicked),
               BoardBtn(btnText: boardBtnState[4], btnIndex: 4 , onBtnClicked: onBtnClicked),
               BoardBtn(btnText: boardBtnState[5], btnIndex: 5 , onBtnClicked: onBtnClicked),
              ],
            ),
          ),
          ///3rd board btn row.
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(btnText: boardBtnState[6], btnIndex: 6 , onBtnClicked: onBtnClicked),
                BoardBtn(btnText: boardBtnState[7], btnIndex: 7 , onBtnClicked: onBtnClicked),
                BoardBtn(btnText: boardBtnState[8], btnIndex: 8 , onBtnClicked: onBtnClicked),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onBtnClicked(int index)
  {
    ///flag.
    //print(index);

    if(boardBtnState[index].isNotEmpty)
      {
        return ;
      }
    if(counter % 2 == 0)
      {
        boardBtnState[index] = 'x';
      }else{
      boardBtnState[index] = 'o';
    }
    counter++;
    if(checkWinner('x'))
      {
        player1Score += 5;
        initBoard();

      }
    else if(checkWinner('o'))
    {
      player2Score +=5;
      initBoard();
    }
    else if(counter == 9)
      {
        initBoard();
      }

    setState(() {

    });
  }

  bool checkWinner(String symbol)
  {
    ///for rows
    for(int i=0 ; i<7 ; i+=3)
      {
        if(boardBtnState[i]==symbol && boardBtnState[i+1]==symbol && boardBtnState[i+2]==symbol)
          {
            return true;
          }
      }
    ///for Columns
    for(int i=0 ; i<3 ; i++)
      {
        if(boardBtnState[i]==symbol && boardBtnState[i+3]==symbol && boardBtnState[i+6]==symbol)
          {
            return true;
          }
      }
    ///for diagonals.
    if(boardBtnState[0]== symbol && boardBtnState[4]== symbol && boardBtnState[8] == symbol)
      {
        return true;
      }
    if(boardBtnState[2]== symbol && boardBtnState[4] == symbol && boardBtnState[6] == symbol)
    {
      return true;
    }
    else{
      return false;
    }
  }

  void initBoard()
  {
    ///reset the board.
    boardBtnState=[
      '','','',
      '','','',
      '','','',
    ];

    ///reset the counter.
    counter = 0;

     setState(() {

     });

  }

}

///data class of args
class HomePageArgs
{
String player1Name;
String player2Name;
HomePageArgs({required this.player1Name , required this.player2Name});
}



