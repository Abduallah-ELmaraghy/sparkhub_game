import '../models/memory_game_card_model.dart';
import '../screens/memory_game_levels_screen.dart';

class MemoryGameHomePageModel {
  String selectedCard = "";
  int? selectedIndex;
  bool selected = true;
  int points = 0;

  List<CardModel> getPairs() {
    List<CardModel> pairs = <CardModel>[];
    CardModel cardModel = CardModel();
    List sourceArray = cardModel.fillSourceArray();

    if (details.getSelctedLevel() == 2) {
      for (int i = 0; i < sourceArray.length; i++) {
        cardModel.setImageAssetPath("${sourceArray[i]}");
        cardModel.setIsSelected(false);
        pairs.add(cardModel);
        pairs.add(cardModel);
        cardModel = CardModel();
      }
    } else if (details.getSelctedLevel() == 1) {
      for (int i = 0; i < 12; i++) {
        cardModel.setImageAssetPath("${sourceArray[i]}");
        cardModel.setIsSelected(false);
        pairs.add(cardModel);
        pairs.add(cardModel);
        cardModel = CardModel();
      }
    } else if (details.getSelctedLevel() == 0) {
      for (int i = 0; i < 8; i++) {
        cardModel.setImageAssetPath("${sourceArray[i]}");
        cardModel.setIsSelected(false);
        pairs.add(cardModel);
        pairs.add(cardModel);
        cardModel = CardModel();
      }
    }

    return pairs;
  }

  List<CardModel> getQuestionPairs() {
    List<CardModel> pairs = <CardModel>[];
    CardModel cardModel = CardModel();
    List sourceArray = cardModel.fillSourceArray();

    if (details.getSelctedLevel() == 2) {
      for (int i = 0; i < sourceArray.length; i++) {
        cardModel.setImageAssetPath("assets/MemoryGameImages/question.png");
        cardModel.setIsSelected(false);
        pairs.add(cardModel);
        pairs.add(cardModel);
        cardModel = CardModel();
      }
    } else if (details.getSelctedLevel() == 1) {
      for (int i = 0; i < 12; i++) {
        cardModel.setImageAssetPath("assets/MemoryGameImages/question.png");
        cardModel.setIsSelected(false);
        pairs.add(cardModel);
        pairs.add(cardModel);
        cardModel = CardModel();
      }
    } else if (details.getSelctedLevel() == 0) {
      for (int i = 0; i < 8; i++) {
        cardModel.setImageAssetPath("assets/MemoryGameImages/question.png");
        cardModel.setIsSelected(false);
        pairs.add(cardModel);
        pairs.add(cardModel);
        cardModel = CardModel();
      }
    }

    return pairs;
  }
}
