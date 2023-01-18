import 'dart:math';
import 'package:flutter/material.dart';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({Key? key}) : super(key: key);

  @override
  State<BlackJackScreen> createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  //Function
  bool _isGameStarted = false; // Is game started then we return MaterialButton

  //Cards Images
  List<Image> myCards = []; //Empty list    //myCards = playerCards
  List<Image> dealersCards = []; //Empty list

  // Cards
  // String dealerFirstCard = 0;
  // String? dealerFirstCard = null;
  String? dealerFirstCard;
  String? dealerSecondCard;

  String? playersFirstCard;
  String? playersSecondCard;

  //Scores
  int dealersScore = 0;
  int playersScore = 0;

  //Deck of cards
  final Map<String, int> deckOfCards = {
    "cards/2.1.png": 2,
    "cards/2.2.png": 2,
    "cards/2.3.png": 2,
    "cards/2.4.png": 2,
    "cards/3.1.png": 3,
    "cards/3.2.png": 3,
    "cards/3.3.png": 3,
    "cards/3.4.png": 3,
    "cards/4.1.png": 4,
    "cards/4.2.png": 4,
    "cards/4.3.png": 4,
    "cards/4.4.png": 4,
    "cards/5.1.png": 5,
    "cards/5.2.png": 5,
    "cards/5.3.png": 5,
    "cards/5.4.png": 5,
    "cards/6.1.png": 6,
    "cards/6.2.png": 6,
    "cards/6.3.png": 6,
    "cards/6.4.png": 6,
    "cards/7.1.png": 7,
    "cards/7.2.png": 7,
    "cards/7.3.png": 7,
    "cards/7.4.png": 7,
    "cards/8.1.png": 8,
    "cards/8.2.png": 8,
    "cards/8.3.png": 8,
    "cards/8.4.png": 8,
    "cards/9.1.png": 9,
    "cards/9.2.png": 9,
    "cards/9.3.png": 9,
    "cards/9.4.png": 9,
    "cards/10.1.png": 10,
    "cards/10.2.png": 10,
    "cards/10.3.png": 10,
    "cards/10.4.png": 10,
    "cards/J1.png": 10,
    "cards/J2.png": 10,
    "cards/J3.png": 10,
    "cards/J4.png": 10,
    "cards/Q1.png": 10,
    "cards/Q2.png": 10,
    "cards/Q3.png": 10,
    "cards/Q4.png": 10,
    "cards/K1.png": 10,
    "cards/K2.png": 10,
    "cards/K3.png": 10,
    "cards/K4.png": 10,
    "cards/A1.png": 11,
    "cards/A2.png": 11,
    "cards/A3.png": 11,
    "cards/A4.png": 11,
  };
// Playing cards in this games.
  // Playing cards in this games.
  Map<String, int> playingCards = {};




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    playingCards.addAll(deckOfCards); //Add deck of cards into playing cards
  }

  //Reset round and reset card
  // startNewRound means changeCards
  void startNewRound() {
    _isGameStarted = true;
    //Start new round with new/full deckOfCards
    playingCards = {}; //Empty list
    playingCards.addAll(
        deckOfCards); //New Round with full of deck of cards; Add deck of cards into playing cards

    //Reset cards images
    myCards = []; //Empty list
    dealersCards = []; //Empty list

    //Generate random number
    Random random = Random(); //we have instance of random

    //Random card one for dealer
    // fetching random card here
    //This card assign will be players card
    //String cardOneKey = random.nextInt(playingCards.keys.length); // This one provide us random number but we want to find element of that number
    String cardOneKey = playingCards.keys.elementAt(random
        .nextInt(playingCards.keys.length)); // it provide us random number

    //This will remove the key from CardOne Key
    //This will make sure we don't have this card anymore in the (Player) deckOfCards.
    playingCards.removeWhere((key, value) =>
        key ==
        cardOneKey); //Remove element from the playcard //This help to avoid same card we have to used this

    //Random card two for dealer
    String cardTwoKey = playingCards.keys.elementAt(random
        .nextInt(playingCards.keys.length)); // it provide us random number

    //This will remove the key from CardTwo Key
    playingCards.removeWhere((key, value) => key == cardTwoKey);

    //Random card three for player
    String cardThreeKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));

    //This will remove the key from CardFour Key
    playingCards.removeWhere((key, value) => key == cardThreeKey);

    //Random card four for player
    String cardFourKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));

    //This will remove the key from CardFour Key
    playingCards.removeWhere((key, value) => key == cardFourKey);

    //Assign card to dealer's card
    dealerFirstCard = cardOneKey;
    dealerSecondCard = cardTwoKey;

    //Assign card to player's card
    playersFirstCard = cardThreeKey;
    playersSecondCard = cardFourKey;

    //Adding dealers cards images to display them in Grid view
    // dealersCards.add(Image.asset(dealersFirstCard ?? "assets/error_image.png"));  //If there is null the we proceed this way
    dealersCards
        .add(Image.asset(dealerFirstCard!)); //There won't be null or error
    dealersCards
        .add(Image.asset(dealerSecondCard!)); //There won't be null or error

    //Give score for dealers
    dealersScore =
        deckOfCards[dealerFirstCard]! + deckOfCards[dealerSecondCard]!;

    //Adding players cards images to display them in Grid view
    // dealersCards.add(Image.asset(dealersFirstCard ?? "assets/error_image.png"));  //If there is null the we proceed this way
    myCards.add(Image.asset(playersFirstCard!)); //There won't be null or error
    myCards.add(Image.asset(playersSecondCard!)); //There won't be null or error

    //Give score for players
    playersScore =
        deckOfCards[playersFirstCard]! + deckOfCards[playersSecondCard]!;

    //Calll in the last whe everything done. It create our widgets
    setState(() {});
  }

  //Add extra card to player
  void addCard() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isGameStarted //Is Game started = true, then it'll show other screen
              ? SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          //Todo : add score
                          Text(
                              "Dealer Score $dealersScore"), //String interpolation

                          //Dealers Card
                          Container(
                            height: 200,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: dealersCards.length,
                              itemBuilder: (context, index) {
                                //Todo-Return Dealer card here
                                return dealersCards[index];
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          //Todo : add score
                          Text(
                              "Player's Score $playersScore"), //String interpolation

                          Container(
                            height: 200,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              //Todo- Change this Item - Count Later
                              itemCount: myCards.length,
                              itemBuilder: (context, index) {
                                //Todo-Return Players card here
                                return myCards[index]; //myCards = playerCards
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              addCard();
                            },
                            child: Text("Another card"),
                            color: Colors.brown[200],
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Text("Next round"),
                            color: Colors.brown[200],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Center(
                  child: MaterialButton(
                  color: Colors.brown[200],
                  minWidth: 150,
                  onPressed: () {
                    setState(() {
                      // _isGameStarted = true;
                      startNewRound(); //When Pressed on it. It start new round. It's say it that it game started
                    });
                  },
                  child: Text("Start Game"),
                )),
    );
  }
}
