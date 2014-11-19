class Shape {
  int lexIndex;
  int position;
  int[] crd = new int[12];
  color c1, c2;
  
  Shape(int ind, int p, color color1, color color2) {
    lexIndex = ind;
    position = p;
    c1 = color1;
    c2 = color2;
    getShapeCrd(lexIndex);
  }
  
  Shape(int[] customCrd, int p) {
    for (int i = 0; i < 12; i++) {
      crd[i] = customCrd[i];
    }
    position = p;
    c1 = color(0,100,255);
    c2 = color(0,255,255);
  }
  
  //special shape for displaying alphabet
  Shape(){
  }
  
  int[] getShapeCrd(int index) {
    for (int i = 0; i < 12; i++) {
      crd[i] = 3*allCrd[index][i];
    }
    return crd;
  }
  
  int[] getShapeCrd() {
    return crd;
  }
  
  void updateColor(color color1, color color2) {
    c1 = color1;
    c2 = color2;
  }
  
  void selectDisplay() {
    switch (position) {
    case 1:
      stroke(c1);
      fill(c1);
      beginShape();
        vertex(crd[0], crd[1]);
        bezierVertex((crd[0]+((crd[4]+crd[2])/2))/2, (crd[1]+((crd[5]+crd[3])/2))/2, (crd[2]+((crd[0]+crd[4])/2))/2, (crd[3]+((crd[1]+crd[5])/2))/2, crd[2], crd[3]);
        bezierVertex((crd[2]+((crd[0]+crd[4])/2))/2, (crd[3]+((crd[1]+crd[5])/2))/2, (crd[4]+((crd[0]+crd[2])/2))/2, (crd[5]+((crd[1]+crd[3])/2))/2, crd[4], crd[5]); 
        bezierVertex((crd[4]+((crd[0]+crd[2])/2))/2, (crd[5]+((crd[1]+crd[3])/2))/2, (crd[0]+((crd[4]+crd[2])/2))/2, (crd[1]+((crd[5]+crd[3])/2))/2, crd[0], crd[1]);
      endShape();
      stroke(c2);
      fill(c2);
      beginShape();
        vertex(crd[6], crd[7]);
        bezierVertex((crd[6]+((crd[10]+crd[8])/2))/2, (crd[7]+((crd[11]+crd[9])/2))/2, (crd[8]+((crd[6]+crd[10])/2))/2, (crd[9]+((crd[7]+crd[11])/2))/2, crd[8], crd[9]);
        bezierVertex((crd[8]+((crd[6]+crd[10])/2))/2, (crd[9]+((crd[7]+crd[11])/2))/2, (crd[10]+((crd[6]+crd[8])/2))/2, (crd[11]+((crd[7]+crd[9])/2))/2, crd[10], crd[11]); 
        bezierVertex((crd[10]+((crd[6]+crd[8])/2))/2, (crd[11]+((crd[7]+crd[9])/2))/2, (crd[6]+((crd[10]+crd[8])/2))/2, (crd[7]+((crd[11]+crd[9])/2))/2, crd[6], crd[7]);
      endShape();
      break;
    case 2:
      stroke(c1);
      fill(c1);
      //shift right 60, scale by 3
      
      beginShape();
        vertex(crd[0]+180, crd[1]);
        bezierVertex((crd[0]+((crd[4]+crd[2])/2))/2+180, (crd[1]+((crd[5]+crd[3])/2))/2, (crd[2]+((crd[0]+crd[4])/2))/2+180, (crd[3]+((crd[1]+crd[5])/2))/2, crd[2]+180, crd[3]);
        bezierVertex((crd[2]+((crd[0]+crd[4])/2))/2+180, (crd[3]+((crd[1]+crd[5])/2))/2, (crd[4]+((crd[0]+crd[2])/2))/2+180, (crd[5]+((crd[1]+crd[3])/2))/2, crd[4]+180, crd[5]); 
        bezierVertex((crd[4]+((crd[0]+crd[2])/2))/2+180, (crd[5]+((crd[1]+crd[3])/2))/2, (crd[0]+((crd[4]+crd[2])/2))/2+180, (crd[1]+((crd[5]+crd[3])/2))/2, crd[0]+180, crd[1]);
      endShape();
      stroke(c2);
      fill(c2);
      beginShape();
        vertex(crd[6]+180, crd[7]);
        bezierVertex((crd[6]+((crd[10]+crd[8])/2))/2+180, (crd[7]+((crd[11]+crd[9])/2))/2, (crd[8]+((crd[6]+crd[10])/2))/2+180, (crd[9]+((crd[7]+crd[11])/2))/2, crd[8]+180, crd[9]);
        bezierVertex((crd[8]+((crd[6]+crd[10])/2))/2+180, (crd[9]+((crd[7]+crd[11])/2))/2, (crd[10]+((crd[6]+crd[8])/2))/2+180, (crd[11]+((crd[7]+crd[9])/2))/2, crd[10]+180, crd[11]); 
        bezierVertex((crd[10]+((crd[6]+crd[8])/2))/2+180, (crd[11]+((crd[7]+crd[9])/2))/2, (crd[6]+((crd[10]+crd[8])/2))/2+180, (crd[7]+((crd[11]+crd[9])/2))/2, crd[6]+180, crd[7]);
      endShape();
      break;
    case 3:
      stroke(c1);
      fill(c1);
      //shift right 60, scale by 3
      beginShape();
        vertex(crd[0]+360, crd[1]);
        bezierVertex((crd[0]+((crd[4]+crd[2])/2))/2+360, (crd[1]+((crd[5]+crd[3])/2))/2, (crd[2]+((crd[0]+crd[4])/2))/2+360, (crd[3]+((crd[1]+crd[5])/2))/2, crd[2]+360, crd[3]);
        bezierVertex((crd[2]+((crd[0]+crd[4])/2))/2+360, (crd[3]+((crd[1]+crd[5])/2))/2, (crd[4]+((crd[0]+crd[2])/2))/2+360, (crd[5]+((crd[1]+crd[3])/2))/2, crd[4]+360, crd[5]); 
        bezierVertex((crd[4]+((crd[0]+crd[2])/2))/2+360, (crd[5]+((crd[1]+crd[3])/2))/2, (crd[0]+((crd[4]+crd[2])/2))/2+360, (crd[1]+((crd[5]+crd[3])/2))/2, crd[0]+360, crd[1]);
      endShape();
      stroke(c2);
      fill(c2);
      beginShape();
        vertex(crd[6]+360, crd[7]);
        bezierVertex((crd[6]+((crd[10]+crd[8])/2))/2+360, (crd[7]+((crd[11]+crd[9])/2))/2, (crd[8]+((crd[6]+crd[10])/2))/2+360, (crd[9]+((crd[7]+crd[11])/2))/2, crd[8]+360, crd[9]);
        bezierVertex((crd[8]+((crd[6]+crd[10])/2))/2+360, (crd[9]+((crd[7]+crd[11])/2))/2, (crd[10]+((crd[6]+crd[8])/2))/2+360, (crd[11]+((crd[7]+crd[9])/2))/2, crd[10]+360, crd[11]); 
        bezierVertex((crd[10]+((crd[6]+crd[8])/2))/2+360, (crd[11]+((crd[7]+crd[9])/2))/2, (crd[6]+((crd[10]+crd[8])/2))/2+360, (crd[7]+((crd[11]+crd[9])/2))/2, crd[6]+360, crd[7]);
      endShape();
      break;
    }
  }
  
  //just added
   void displayAlphabet(int lexSize, int screenShift, color c1, color c2) {
    int index = 0+(screenShift*6);
    int xShift, yShift;
    int rows = (lexSize/6)-screenShift;
    if (lexSize % 6 != 0) {
      rows++;
    }
    for (int j = 0; j < rows; j++) {
      yShift = j*30;
      for (int i = 0; i < 6; i++) {
        xShift = i*30;
        crd = getShapeCrd(index);
        for (int k = 0; k < crd.length; k++) {
          //tiny shapes, SCALE BY 1/2
          crd[k] = (crd[k]/2)+15;
        }
        stroke(c1);
        fill(c1);
        
        beginShape();
          vertex(crd[0]+(xShift*3), crd[1]+(yShift*3));
          bezierVertex((crd[0]+((crd[4]+crd[2])/2))/2+(xShift*3), (crd[1]+((crd[5]+crd[3])/2))/2+(yShift*3), (crd[2]+((crd[0]+crd[4])/2))/2+(xShift*3), (crd[3]+((crd[1]+crd[5])/2))/2+(yShift*3), crd[2]+(xShift*3), crd[3]+(yShift*3));
          bezierVertex((crd[2]+((crd[0]+crd[4])/2))/2+(xShift*3), (crd[3]+((crd[1]+crd[5])/2))/2+(yShift*3), (crd[4]+((crd[0]+crd[2])/2))/2+(xShift*3), (crd[5]+((crd[1]+crd[3])/2))/2+(yShift*3), crd[4]+(xShift*3), crd[5]+(yShift*3)); 
          bezierVertex((crd[4]+((crd[0]+crd[2])/2))/2+(xShift*3), (crd[5]+((crd[1]+crd[3])/2))/2+(yShift*3), (crd[0]+((crd[4]+crd[2])/2))/2+(xShift*3), (crd[1]+((crd[5]+crd[3])/2))/2+(yShift*3), crd[0]+(xShift*3), crd[1]+(yShift*3));
        endShape();
      
        stroke(c2);
        fill(c2);
        
        beginShape();
          vertex(crd[6]+(xShift*3), crd[7]+(yShift*3));
          bezierVertex((crd[6]+((crd[10]+crd[8])/2))/2+(xShift*3), (crd[7]+((crd[11]+crd[9])/2))/2+(yShift*3), (crd[8]+((crd[6]+crd[10])/2))/2+(xShift*3), (crd[9]+((crd[7]+crd[11])/2))/2+(yShift*3), crd[8]+(xShift*3), crd[9]+(yShift*3));
          bezierVertex((crd[8]+((crd[6]+crd[10])/2))/2+(xShift*3), (crd[9]+((crd[7]+crd[11])/2))/2+(yShift*3), (crd[10]+((crd[6]+crd[8])/2))/2+(xShift*3), (crd[11]+((crd[7]+crd[9])/2))/2+(yShift*3), crd[10]+(xShift*3), crd[11]+(yShift*3)); 
          bezierVertex((crd[10]+((crd[6]+crd[8])/2))/2+(xShift*3), (crd[11]+((crd[7]+crd[9])/2))/2+(yShift*3), (crd[6]+((crd[10]+crd[8])/2))/2+(xShift*3), (crd[7]+((crd[11]+crd[9])/2))/2+(yShift*3), crd[6]+(xShift*3), crd[7]+(yShift*3));
        endShape();
      
        index++;
        if (index == lexSize) {
          break;
        }
      }
    }
  }
  //end newly added
  
}
