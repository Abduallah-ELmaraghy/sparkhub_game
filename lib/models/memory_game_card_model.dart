class CardModel {
  String imageAssetPath = "";
  bool isSelected = false;
  CardModel();

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  bool? getIsSelected() {
    return isSelected;
  }

  List<String> fillSourceArray() {
    return [
      'assets/MemoryGameImages/fox.png',
      'assets/MemoryGameImages/hippo.png',
      'assets/MemoryGameImages/horse.png',
      'assets/MemoryGameImages/monkey.png',
      'assets/MemoryGameImages/panda.png',
      'assets/MemoryGameImages/parrot.png',
      'assets/MemoryGameImages/rabbit.png',
      'assets/MemoryGameImages/zoo.png',
      'assets/MemoryGameImages/dino.png',
      'assets/MemoryGameImages/fish.png',
      'assets/MemoryGameImages/frog.png',
      'assets/MemoryGameImages/girraf.png',
      'assets/MemoryGameImages/octo.png',
      'assets/MemoryGameImages/wolf.png',
      'assets/MemoryGameImages/whale.png',
      'assets/MemoryGameImages/shark.png',
      'assets/MemoryGameImages/seahorse.png',
      'assets/MemoryGameImages/peacock.png',
    ];
  }
}
