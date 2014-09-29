class Shape {
  int position;
  int lol;
  int[] crd = new int[12];
  
  Shape(int lexIndex, int p) {
    position = p;
    crd = getShapeCrd(lexIndex);
  }
  
  void display(int set) {
    //3 is scale!!!
    set = set*60*3;
    for (int i = 0; i < crd.length; i++) {
      //scale by 3!!!
      crd[i] *= 3;
    }
    //where shape is drawn, depending on position in logo
    //1st shape, 2nd shape or 3rd shape
    switch(position) {
    case 1:
      stroke(0,100,255);
      fill(0,100,255);
      triangle(crd[0],crd[1]+set,crd[2],crd[3]+set,crd[4],crd[5]+set); 
      stroke(0,255,255);
      fill(0,255,255);
      triangle(crd[6],crd[7]+set,crd[8],crd[9]+set,crd[10],crd[11]+set);
      break;
    case 2:
      stroke(0,100,255);
      fill(0,100,255);
      triangle((60*3)+crd[0],crd[1]+set,(60*3)+crd[2],crd[3]+set,(60*3)+crd[4],crd[5]+set);
      stroke(0,255,255);
      fill(0,255,255);
      triangle((60*3)+crd[6],crd[7]+set,(60*3)+crd[8],crd[9]+set,(60*3)+crd[10],crd[11]+set);
      break;
    case 3:
      stroke(0,100,255);
      fill(0,100,255);
      triangle((120*3)+crd[0],crd[1]+set,(120*3)+crd[2],crd[3]+set,(120*3)+crd[4],crd[5]+set);
      stroke(0,255,255);
      fill(0,255,255);
      triangle((120*3)+crd[6],crd[7]+set,(120*3)+crd[8],crd[9]+set,(120*3)+crd[10],crd[11]+set);
      break;
    }
  }
  
  int[] getShapeCrd(int index) {
    for (int i = 0; i < 12; i++) {
      crd[i] = allCrd[index][i];
      println(crd[i]);
    }
    return crd;
  }
}
