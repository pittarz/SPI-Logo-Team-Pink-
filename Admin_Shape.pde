class Shape {
  int lexIndex;
  int position;
  int[] crd = new int[12];
  color c1, c2;
  int yShift;
  
  Shape(int ind, int p, color color1, color color2) {
    lexIndex = ind;
    position = p;
    c1 = color1;
    c2 = color2;
    getShapeCrd(lexIndex);
  }
  
  //shifted, grayscale shapes
  Shape(int ind, int p, int y) {
    lexIndex = ind;
    position = p;
    yShift = y;
    c1 = color(0);
    c2 = color(255);
    getGrayShapeCrd(lexIndex);
  }
  
  int[] getShapeCrd(int index) {
    for (int i = 0; i < 12; i++) {
      crd[i] = 2*(3*allCrd[index][i]);
    }
    return crd;
  }
  
  int[] getGrayShapeCrd(int index) {
    for (int i = 0; i < 12; i++) {
      if (i%2==1) {
        crd[i] = 2*(180+(3*allCrd[index][i]));
      }
      else {
        crd[i] = 2*(3*allCrd[index][i]);
      }
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
    case 3:
      stroke(c1);
      fill(c1);
      //shift right 60, scale by 3
      beginShape();
        vertex(crd[0]+720, crd[1]);
        bezierVertex((crd[0]+((crd[4]+crd[2])/2))/2+720, (crd[1]+((crd[5]+crd[3])/2))/2, (crd[2]+((crd[0]+crd[4])/2))/2+720, (crd[3]+((crd[1]+crd[5])/2))/2, crd[2]+720, crd[3]);
        bezierVertex((crd[2]+((crd[0]+crd[4])/2))/2+720, (crd[3]+((crd[1]+crd[5])/2))/2, (crd[4]+((crd[0]+crd[2])/2))/2+720, (crd[5]+((crd[1]+crd[3])/2))/2, crd[4]+720, crd[5]); 
        bezierVertex((crd[4]+((crd[0]+crd[2])/2))/2+720, (crd[5]+((crd[1]+crd[3])/2))/2, (crd[0]+((crd[4]+crd[2])/2))/2+720, (crd[1]+((crd[5]+crd[3])/2))/2, crd[0]+720, crd[1]);
      endShape();
      stroke(c2);
      fill(c2);
      beginShape();
        vertex(crd[6]+720, crd[7]);
        bezierVertex((crd[6]+((crd[10]+crd[8])/2))/2+720, (crd[7]+((crd[11]+crd[9])/2))/2, (crd[8]+((crd[6]+crd[10])/2))/2+720, (crd[9]+((crd[7]+crd[11])/2))/2, crd[8]+720, crd[9]);
        bezierVertex((crd[8]+((crd[6]+crd[10])/2))/2+720, (crd[9]+((crd[7]+crd[11])/2))/2, (crd[10]+((crd[6]+crd[8])/2))/2+720, (crd[11]+((crd[7]+crd[9])/2))/2, crd[10]+720, crd[11]); 
        bezierVertex((crd[10]+((crd[6]+crd[8])/2))/2+720, (crd[11]+((crd[7]+crd[9])/2))/2, (crd[6]+((crd[10]+crd[8])/2))/2+720, (crd[7]+((crd[11]+crd[9])/2))/2, crd[6]+720, crd[7]);
      endShape();
      break;
    }
  }
    
  void grayDisplay() {
    switch (position) {
    case 1:
      stroke(c1);
      fill(c1);
      beginShape();
        vertex(crd[0], crd[1]);
        bezierVertex((crd[0]+((crd[4]+crd[2])/2))/2, ((crd[1])+((crd[5]+crd[3])/2))/2, (crd[2]+((crd[0]+crd[4])/2))/2, (crd[3]+((crd[1]+crd[5])/2))/2, crd[2], crd[3]);
        bezierVertex((crd[2]+((crd[0]+crd[4])/2))/2, ((crd[3])+((crd[1]+crd[5])/2))/2, (crd[4]+((crd[0]+crd[2])/2))/2, (crd[5]+((crd[1]+crd[3])/2))/2, crd[4], crd[5]); 
        bezierVertex((crd[4]+((crd[0]+crd[2])/2))/2, ((crd[5])+((crd[1]+crd[3])/2))/2, (crd[0]+((crd[4]+crd[2])/2))/2, (crd[1]+((crd[5]+crd[3])/2))/2, crd[0], crd[1]);
      endShape();
      stroke(c1);
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
        vertex(crd[0]+360, crd[1]);
        bezierVertex((crd[0]+((crd[4]+crd[2])/2))/2+360, (crd[1]+((crd[5]+crd[3])/2))/2, (crd[2]+((crd[0]+crd[4])/2))/2+360, (crd[3]+((crd[1]+crd[5])/2))/2, crd[2]+360, crd[3]);
        bezierVertex((crd[2]+((crd[0]+crd[4])/2))/2+360, (crd[3]+((crd[1]+crd[5])/2))/2, (crd[4]+((crd[0]+crd[2])/2))/2+360, (crd[5]+((crd[1]+crd[3])/2))/2, crd[4]+360, crd[5]); 
        bezierVertex((crd[4]+((crd[0]+crd[2])/2))/2+360, (crd[5]+((crd[1]+crd[3])/2))/2, (crd[0]+((crd[4]+crd[2])/2))/2+360, (crd[1]+((crd[5]+crd[3])/2))/2, crd[0]+360, crd[1]);
      endShape();
      stroke(c1);
      fill(c2);
      beginShape();
        vertex(crd[6]+360, crd[7]);
        bezierVertex((crd[6]+((crd[10]+crd[8])/2))/2+360, (crd[7]+((crd[11]+crd[9])/2))/2, (crd[8]+((crd[6]+crd[10])/2))/2+360, (crd[9]+((crd[7]+crd[11])/2))/2, crd[8]+360, crd[9]);
        bezierVertex((crd[8]+((crd[6]+crd[10])/2))/2+360, (crd[9]+((crd[7]+crd[11])/2))/2, (crd[10]+((crd[6]+crd[8])/2))/2+360, (crd[11]+((crd[7]+crd[9])/2))/2, crd[10]+360, crd[11]); 
        bezierVertex((crd[10]+((crd[6]+crd[8])/2))/2+360, (crd[11]+((crd[7]+crd[9])/2))/2, (crd[6]+((crd[10]+crd[8])/2))/2+360, (crd[7]+((crd[11]+crd[9])/2))/2, crd[6]+360, crd[7]);
      endShape();
      break;
    case 3:
      stroke(c1);
      fill(c1);
      //shift right 60, scale by 3
      beginShape();
        vertex(crd[0]+720, crd[1]);
        bezierVertex((crd[0]+((crd[4]+crd[2])/2))/2+720, (crd[1]+((crd[5]+crd[3])/2))/2, (crd[2]+((crd[0]+crd[4])/2))/2+720, (crd[3]+((crd[1]+crd[5])/2))/2, crd[2]+720, crd[3]);
        bezierVertex((crd[2]+((crd[0]+crd[4])/2))/2+720, (crd[3]+((crd[1]+crd[5])/2))/2, (crd[4]+((crd[0]+crd[2])/2))/2+720, (crd[5]+((crd[1]+crd[3])/2))/2, crd[4]+720, crd[5]); 
        bezierVertex((crd[4]+((crd[0]+crd[2])/2))/2+720, (crd[5]+((crd[1]+crd[3])/2))/2, (crd[0]+((crd[4]+crd[2])/2))/2+720, (crd[1]+((crd[5]+crd[3])/2))/2, crd[0]+720, crd[1]);
      endShape();
      stroke(c1);
      fill(c2);
      beginShape();
        vertex(crd[6]+720, crd[7]);
        bezierVertex((crd[6]+((crd[10]+crd[8])/2))/2+720, (crd[7]+((crd[11]+crd[9])/2))/2, (crd[8]+((crd[6]+crd[10])/2))/2+720, (crd[9]+((crd[7]+crd[11])/2))/2, crd[8]+720, crd[9]);
        bezierVertex((crd[8]+((crd[6]+crd[10])/2))/2+720, (crd[9]+((crd[7]+crd[11])/2))/2, (crd[10]+((crd[6]+crd[8])/2))/2+720, (crd[11]+((crd[7]+crd[9])/2))/2, crd[10]+720, crd[11]); 
        bezierVertex((crd[10]+((crd[6]+crd[8])/2))/2+720, (crd[11]+((crd[7]+crd[9])/2))/2, (crd[6]+((crd[10]+crd[8])/2))/2+720, (crd[7]+((crd[11]+crd[9])/2))/2, crd[6]+720, crd[7]);
      endShape();
      break;
    }
  }
}
