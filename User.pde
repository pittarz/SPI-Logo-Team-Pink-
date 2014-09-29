class User {
  int[] logo = new int[3];
  int currentSpot = 0;
  
  User() {
    for (int i = 0; i < 3; i++) {
      logo[i] = -1;
    }
  }
  
  void setLogo(int index, int ID) {
    logo[index] = ID;
    currentSpot++;
  }
  
  int[] getLogo() {
    return logo;
  }
}
