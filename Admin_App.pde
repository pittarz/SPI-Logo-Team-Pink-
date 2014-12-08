import processing.pdf.*;

int[][] allCrd;
String[][] allUsr;
int lexSize;
int usrSize;
boolean doneTyping = false;
boolean drawShapes = false;
String typing = "";
String saved = "";
String userName = "";
int shapeID1, shapeID2, shapeID3;
Shape s1, s2, s3;
color c1, c2, g1, g2;

void setup() {
  size(1200,850);
  background(255);
  //default color values
  c1 = color(0,100,255);
  c2 = color(0,255,255);
  //grayscale color values
  g1 = color(0);
  g2 = color(255);
  //array of strings, each element is a line from lexicon.txt
  String[] lines = loadStrings("lexicon.txt");
  //determine size of array for storing shape coordinates based on # of shapes (lines) in lexicon.txt
  allCrd = new int[lines.length][12];
  lexSize = lines.length;
  //for each line in lexicon.txt
  for (int i = 0; i < lexSize; i++) {
    //split line into tokens, delimited by ','
    String[] line = split(lines[i], ','); 
    //for each token, of each line (shape), place values into coordinate array
    for (int j = 0; j < 12; j++) {
      allCrd[i][j] = int(line[j]);
    }
  }
  //array of strings, each element is a line from users.txt
  String[] usrLines = loadStrings("users.txt");
  allUsr = new String[usrLines.length][3];
  usrSize = usrLines.length;
  //for each line in users.txt
  for (int i = 0; i < usrSize; i++) {
    //split line into tokens, delimited by ','
    String[] usrLine = split(usrLines[i], ',');
    for (int j = 0; j < 3; j++) {
      allUsr[i][j] = usrLine[j];
    }
  }
}

void draw() {
  if (drawShapes) {
    background(255);
    beginRecord(PDF,userName+"-"+month()+"-"+day()+"-"+year()+".pdf");
    textSize(12);
    fill(0);
    text("SUNY POLY OFFICIAL LOGO\nUSER: " + userName + "@sunyit.edu" + "\n" + month() + "/" + day() + "/" + year(),40,50);
    s1 = new Shape(shapeID1,1,c1,c2);
    s2 = new Shape(shapeID2,2,c1,c2);
    s3 = new Shape(shapeID3,3,c1,c2);
    s1.selectDisplay();
    s2.selectDisplay();
    s3.selectDisplay();
    s1 = new Shape(shapeID1,1,60);
    s2 = new Shape(shapeID2,2,60);
    s3 = new Shape(shapeID3,3,60);
    s1.grayDisplay();
    s2.grayDisplay();
    s3.grayDisplay();
    endRecord();
    fill(0);
    rect(550,35,100,30);
    fill(255);
    textSize(22);
    text("R E S E T",555,58);
  }
  else {
    fill(0);
    textSize(16);
    text("ENTER USER LOGOHASH:",40,50);
    rect(240,28,333,30);
    fill(255);
    text(typing,245,33,330,25);
    if (doneTyping) {
      String[] userCode = split(saved,':');
      println(userCode);
      userName = userCode[0];
      int logoHash = Integer.parseInt(userCode[1]);
      println(logoHash);
      c1 = unhex("FF" + userCode[2]);
      c2 = unhex("FF" + userCode[3]);
      decodeHash(logoHash);
      println(userName);
      drawShapes = true;
      redraw();
    }
  }
}

void decodeHash(int logoHash) {
  shapeID1 = int(logoHash/65536);
  shapeID2 = int((logoHash%65536)/256);
  shapeID3 = int((logoHash%65536)%256);
  println(shapeID1);
  println(shapeID2);
  println(shapeID3);
}

void keyPressed() {
  char entered;
  //if delete key is pressed without any string yet then ignore it
  if (!doneTyping) {
  if (keyCode == BACKSPACE) {
    if (typing.length() > 0) {
      typing = typing.substring(0, typing.length()-1);
    }
    //do nothing - no characters
    else if (typing.length() == 0) { 
    }
  }
  else if (keyCode == SHIFT) { //ignore shift key - do not print out
  }
  //if return key is hit then save the string and change asciisum to 0 before summing up again
  else {
    if (key == '\n') {
      saved = typing;
      typing = "";
      doneTyping = true;
      } 
      else {
        // Each character typed by the user is added to the end of the String variable.
        entered = key;
        typing = typing + entered;
      }
    }
  }
  redraw();
}

void mouseClicked() {
  if (mouseX >= 550 && mouseX <= 650 && mouseY >= 35 && mouseY <= 65) {
    doneTyping = false;
    drawShapes = false;
    saved = "";
    userName = "";
    background(255);
    redraw();
  }
}
