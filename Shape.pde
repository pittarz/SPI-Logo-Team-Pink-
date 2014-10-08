class Shape {
  int lexIndex;
  int position;
  int[] crd = new int[12];
  
  //special shape object for displaying alphabet!
  Shape() {
  }
  
  Shape(int ind, int p) {
    lexIndex = ind;
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
  
  void displayAlphabet(int lexSize) {
    int index = 0;
    int xShift, yShift;
    int rows = lexSize/6;
    if (lexSize % 6 != 0) {
      rows++;
    }
    for (int j = 0; j < rows; j++) {
      yShift = j*30;
      for (int i = 0; i < 6; i++) {
        xShift = i*30;
        crd = getShapeCrd(index);
        for (int k = 0; k < crd.length; k++) {
          //tiny shapes, SCALE BY 1/2, but also by 3!!!
          crd[k] = (crd[k]/2)+5;
          crd[k] *= 3;
        }
        stroke(0,100,255);
        fill(0,100,255);
        triangle(crd[0]+(xShift*3),crd[1]+(yShift*3),crd[2]+(xShift*3),crd[3]+(yShift*3),crd[4]+(xShift*3),crd[5]+(yShift*3)); 
        stroke(0,255,255);
        fill(0,255,255);
        triangle(crd[6]+(xShift*3),crd[7]+(yShift*3),crd[8]+(xShift*3),crd[9]+(yShift*3),crd[10]+(xShift*3),crd[11]+(yShift*3));
        index++;
        if (index == lexSize) {
          break;
        }
      }
    }
  }
  
  void displayMini() {
    for (int i = 0; i < crd.length; i++) {
      //tiny, SCALE BY 1/2, but also by 3!!!
      crd[i] *= 3;
      crd[i] /= 2;
    }
    //where shape is drawn, depending on position in logo
    //1st shape, 2nd shape or 3rd shape
    switch(position) {
    case 1:
      stroke(0,100,255);
      fill(0,100,255);
      triangle(crd[0]+(50*3),crd[1]+(200*3),crd[2]+(50*3),crd[3]+(200*3),crd[4]+(50*3),crd[5]+(200*3)); 
      stroke(0,255,255);
      fill(0,255,255);
      triangle(crd[6]+(50*3),crd[7]+(200*3),crd[8]+(50*3),crd[9]+(200*3),crd[10]+(50*3),crd[11]+(200*3));
      break;
    case 2:
      stroke(0,100,255);
      fill(0,100,255);
      triangle(crd[0]+(80*3),crd[1]+(200*3),crd[2]+(80*3),crd[3]+(200*3),crd[4]+(80*3),crd[5]+(200*3));
      stroke(0,255,255);
      fill(0,255,255);
      triangle(crd[6]+(80*3),crd[7]+(200*3),crd[8]+(80*3),crd[9]+(200*3),crd[10]+(80*3),crd[11]+(200*3));
      break;
    case 3:
      stroke(0,100,255);
      fill(0,100,255);
      triangle(crd[0]+(110*3),crd[1]+(200*3),crd[2]+(110*3),crd[3]+(200*3),crd[4]+(110*3),crd[5]+(200*3));
      stroke(0,255,255);
      fill(0,255,255);
      triangle(crd[6]+(110*3),crd[7]+(200*3),crd[8]+(110*3),crd[9]+(200*3),crd[10]+(110*3),crd[11]+(200*3));
      break;
    }
    println("SOMETHING SHOULD HAVE HAPPENED");
  }
  
  int[] getShapeCrd(int index) {
    for (int i = 0; i < 12; i++) {
      crd[i] = allCrd[index][i];
      println(crd[i]);
    }
    return crd;
  }
}
