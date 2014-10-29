class Shape {
  int lexIndex;
  int position;
  int[] crd = new int[12];
  
  Shape(int ind, int p) {
    lexIndex = ind;
    position = p;
    crd = getShapeCrd(lexIndex);
    for (int i = 0; i < crd.length; i++) {
      //scale by 3, for now
      crd[i] *= 3;
    }
  }
  
  int[] getShapeCrd(int index) {
    for (int i = 0; i < 12; i++) {
      crd[i] = allCrd[index][i];
      println(crd[i]);
    }
    return crd;
  }
  
  void selectDisplay() {
    switch (position) {
    case 1:
      stroke(0,100,255);
      fill(0,100,255);
      triangle(crd[0],crd[1],crd[2],crd[3],crd[4],crd[5]);
      stroke(0,255,255);
      fill(0,255,255);
      triangle(crd[6],crd[7],crd[8],crd[9],crd[10],crd[11]);
      //bezier curves for second triangle
      //scale by 3, each unit / grid value is 10
      //bezier(crd[0],crd[1],crd[0],crd[1]+30,crd[2],crd[3]+30,crd[2],crd[3]);
      //bezier(crd[4],crd[5],crd[4],crd[5]+30,crd[6],crd[7]+30,crd[6],crd[7]);
      //bezier(crd[8],crd[9],crd[8],crd[9]+30,crd[10],crd[11]+30,crd[10],crd[11]);
      break;
    case 2:
      stroke(0,100,255);
      fill(0,100,255);
      //shift right 60, scale by 3
      triangle((60*3)+crd[0],crd[1],(60*3)+crd[2],crd[3],(60*3)+crd[4],crd[5]);
      stroke(0,255,255);
      fill(0,255,255);
      triangle((60*3)+crd[6],crd[7],(60*3)+crd[8],crd[9],(60*3)+crd[10],crd[11]);
      //bezier curves for second triangle
      //scale by 3, each unit / grid value is 10
      //bezier((60*3)+crd[0],crd[1],(60*3)+crd[0],crd[1]+30,(60*3)+crd[2],crd[3]+30,(60*3)+crd[2],crd[3]);
      //bezier((60*3)+crd[4],crd[5],(60*3)+crd[4],crd[5]+30,(60*3)+crd[6],crd[7]+30,(60*3)+crd[6],crd[7]);
      //bezier((60*3)+crd[8],crd[9],(60*3)+crd[8],crd[9]+30,(60*3)+crd[10],crd[11]+30,(60*3)+crd[10],crd[11]);
      break;
    case 3:
      stroke(0,100,255);
      fill(0,100,255);
      //shift right 60, scale by 3
      triangle((120*3)+crd[0],crd[1],(120*3)+crd[2],crd[3],(120*3)+crd[4],crd[5]);
      stroke(0,255,255);
      fill(0,255,255);
      triangle((120*3)+crd[6],crd[7],(120*3)+crd[8],crd[9],(120*3)+crd[10],crd[11]);
      //bezier curves for second triangle
      //scale by 3, each unit / grid value is 10
      //bezier((120*3)+crd[0],crd[1],(120*3)+crd[0],crd[1]+30,(120*3)+crd[2],crd[3]+30,(120*3)+crd[2],crd[3]);
      //bezier((120*3)+crd[4],crd[5],(120*3)+crd[4],crd[5]+30,(120*3)+crd[6],crd[7]+30,(120*3)+crd[6],crd[7]);
      //bezier((120*3)+crd[8],crd[9],(120*3)+crd[8],crd[9]+30,(120*3)+crd[10],crd[11]+30,(120*3)+crd[10],crd[11]);
      break;
    }
  }
  
}
