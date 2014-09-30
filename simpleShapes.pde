import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

SQLite db;

//javascript does not like a dynamic window size! SCALE IS 3! DISPLAY 3 ROWS!
//int scale = 3;
//int display = 3;

int[][] allCrd;
User theUser = new User();
Shape u1, u2, u3;

//number of shapes in alphabet
int lexSize;

//temporary storage of shape IDs - if shape selected!
int[] tempShapeIDs = new int[9];

//boolean flags for different modes of operation
boolean viewAlphabet = false;

void setup() {
  //size(250*scale,100*scale*display)
  size(600,720);
  frame.setResizable(true);
  noStroke();
  smooth();
  //current user object
  lexSize = dbImportValules();
}

void draw() {  
  background(255);
  int i;
  
  if (viewAlphabet) {
    fill(0,100,255);
    noStroke();
    rect(6*3,3*3,26*3,5*3,7);
    fill(255);
    textSize(12);
    text("Create Logo", 7*3,7*3);
    Shape a1 = new Shape();
    a1.displayAlphabet(lexSize);
  }
  
  else {
    fill(0,100,255);
    noStroke();
    rect(6*3,3*3,30*3,5*3,7);
    fill(255);
    textSize(12);
    text("View Alphabet", 7*3,7*3);
    //while the user can still select shapes
    if (theUser.currentSpot < 3) {
      //draw gradients
      drawGradients((20*3),(20*3),40.0*3,40.0*3,3);
      //counter for tempShapeIDs index
      int countID = 0;
      //set is row COUNTER - indicate current row
      int set = 0;
      //DISPLAY 3 ROWS, 9 shapes total
      while(set < 3) {
        int[] ran = new int[3];
        for (i = 0; i < 3; i++) {
          //NEED TO KNOW NUMBER OF ITEMS IN DATABASE, RIGHT NOW HARDCODED VALUE!!!
          //replace 38 with number of available shapes in database
          ran[i] = int(random(0,38));
        }    
        Shape s1 = new Shape(ran[0],1);
        tempShapeIDs[countID] = ran[0];
        countID++;
        Shape s2 = new Shape(ran[1],2);
        tempShapeIDs[countID] = ran[1];
        countID++;
        Shape s3 = new Shape(ran[2],3);
        tempShapeIDs[countID] = ran[2];
        countID++;
        s1.display(set);
        s2.display(set);
        s3.display(set);
        set++;
      }
  
      //see if any shapes have been selected, if so, display at bottom
      for (i = 0; i < 3; i++) {
        if (theUser.logo[i] != -1) {
          drawMiniGradients((60*3)+(i*90),(210*3),20.0*3,20.0*3);
          Shape u1 = new Shape(theUser.logo[i],i+1);
          u1.displayMini();
        }
      }

      noLoop();
      }
  
    //once all three shapes are selected, blank window
    else {
      frame.setSize(600,300);
      size(600,300);
      background(255);
      drawGradients((20*3),(20*3),40.0*3,40.0*3,1);
      for (i = 0; i < 3; i++) {
        if (theUser.logo[i] != -1) {  
          Shape u1 = new Shape(theUser.logo[i],i+1);
          u1.display(0);
        }
      }
      noLoop();
    }
  }
}

int dbImportValules() {
  int val;
  int count = 0;
  //crappy database of values for testing
  db = new SQLite(this, "testDB.db");
  
  //to confirm that database is accessible and opened successfully
  if (db.connect()) {
    db.query("SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"");
    while(db.next()) {
      String tableName = db.getString("Name");
      println(tableName);
    }
    
    //determine number of rows (shapes) in lexicon table
    String query = "SELECT COUNT(*) As \"count\" FROM LEXICON";
    db.query(query);
    count = db.getInt("count");
    
    //ASSUMED TRIANGLE - 12 coordinate values
    allCrd = new int[count][12];
    
    //get values from database for EACH SHAPE IN TABLE and load into array in memory
    for (int i = 0; i < count; i++) {
      query = "SELECT t1x1 As \"t1x1\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1x1");
      allCrd[i][0] = val;
      
      query = "SELECT t1y1 As \"t1y1\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1y1");
      allCrd[i][1] = val;
      
      query = "SELECT t1x2 As \"t1x2\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1x2");
      allCrd[i][2] = val;
      
      query = "SELECT t1y2 As \"t1y2\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1y2");
      allCrd[i][3] = val;
      
      query = "SELECT t1x3 As \"t1x3\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1x3");
      allCrd[i][4] = val;
      
      query = "SELECT t1y3 As \"t1y3\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1y3");
      allCrd[i][5] = val;
      
      query = "SELECT t2x1 As \"t2x1\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2x1");
      allCrd[i][6] = val;
      
      query = "SELECT t2y1 As \"t2y1\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2y1");
      allCrd[i][7] = val;
      
      query = "SELECT t2x2 As \"t2x2\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2x2");
      allCrd[i][8] = val;
      
      query = "SELECT t2y2 As \"t2y2\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2y2");
      allCrd[i][9] = val;
      
      query = "SELECT t2x3 As \"t2x3\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2x3");
      allCrd[i][10] = val;
      
      query = "SELECT t2y3 As \"t2y3\" FROM LEXICON WHERE ID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2y3");
      allCrd[i][11] = val;
    }
  }
  return count;
}

//SCALE = 3!!!
void mousePressed() {
  //VIEW ALPHABET BUTTON
  if (mouseX >= 18 && mouseX <= 98 && mouseY >= 9 && mouseY <= 24) {
    if (viewAlphabet) {
      viewAlphabet = false;
      redraw();
    }
    else {
      viewAlphabet = true;
      redraw();
    }
  }
  
  
  if (viewAlphabet == false) {
  if (mouseX >= 20*3 && mouseX <= 60*3 && mouseY >= 20*3 && mouseY <= 60*3) {
    if (theUser.currentSpot < 3) {
      theUser.setLogo(theUser.currentSpot,tempShapeIDs[0]);
    }
    print("current logo values are: ");
    int[] currentLogo = theUser.getLogo();
    //check logo values
    for (int i = 0; i < 3; i++) {
      print(currentLogo[i] + " ");
    }
    println();
    redraw();
  }
  
  if (mouseX >= 80*3 && mouseX <= 120*3 && mouseY >= 20*3 && mouseY <= 60*3) {
    if (theUser.currentSpot < 3) {
      theUser.setLogo(theUser.currentSpot,tempShapeIDs[1]);
    }
    print("current logo values are: ");
    int[] currentLogo = theUser.getLogo();
    //check logo values
    for (int i = 0; i < 3; i++) {
      print(currentLogo[i] + " ");
    }
    println();
    redraw();
  }
  
  if (mouseX >= 140*3 && mouseX <= 180*3 && mouseY >= 20*3 && mouseY <= 60*3) {
    if (theUser.currentSpot < 3) {
      theUser.setLogo(theUser.currentSpot,tempShapeIDs[2]);
    }
    print("current logo values are: ");
    int[] currentLogo = theUser.getLogo();
    //check logo values
    for (int i = 0; i < 3; i++) {
      print(currentLogo[i] + " ");
    }
    println();
    redraw();
  }
  
  if (mouseX >= 20*3 && mouseX <= 60*3 && mouseY >= 80*3 && mouseY <= 120*3) {
    if (theUser.currentSpot < 3) {
      theUser.setLogo(theUser.currentSpot,tempShapeIDs[3]);
    }
    print("current logo values are: ");
    int[] currentLogo = theUser.getLogo();
    //check logo values
    for (int i = 0; i < 3; i++) {
      print(currentLogo[i] + " ");
    }
    println();
    redraw();
  }
  
  if (mouseX >= 80*3 && mouseX <= 120*3 && mouseY >= 80*3 && mouseY <= 120*3) {
    if (theUser.currentSpot < 3) {
      theUser.setLogo(theUser.currentSpot,tempShapeIDs[4]);
    }
    print("current logo values are: ");
    int[] currentLogo = theUser.getLogo();
    //check logo values
    for (int i = 0; i < 3; i++) {
      print(currentLogo[i] + " ");
    }
    println();
    redraw();
  }
  
  if (mouseX >= 140*3 && mouseX <= 180*3 && mouseY >= 80*3 && mouseY <= 120*3) {
    if (theUser.currentSpot < 3) {
      theUser.setLogo(theUser.currentSpot,tempShapeIDs[5]);
    }
    print("current logo values are: ");
    int[] currentLogo = theUser.getLogo();
    //check logo values
    for (int i = 0; i < 3; i++) {
      print(currentLogo[i] + " ");
    }
    println();
    redraw();
  }
  
  if (mouseX >= 20*3 && mouseX <= 60*3 && mouseY >= 140*3 && mouseY <= 180*3) {
    if (theUser.currentSpot < 3) {
      theUser.setLogo(theUser.currentSpot,tempShapeIDs[6]);
    }
    print("current logo values are: ");
    int[] currentLogo = theUser.getLogo();
    //check logo values
    for (int i = 0; i < 3; i++) {
      print(currentLogo[i] + " ");
    }
    println();
    redraw();
  }
  
  if (mouseX >= 80*3 && mouseX <= 120*3 && mouseY >= 140*3 && mouseY <= 180*3) {
    if (theUser.currentSpot < 3) {
      theUser.setLogo(theUser.currentSpot,tempShapeIDs[7]);
    }
    print("current logo values are: ");
    int[] currentLogo = theUser.getLogo();
    //check logo values
    for (int i = 0; i < 3; i++) {
      print(currentLogo[i] + " ");
    }
    println();
    redraw();
  }
  
  if (mouseX >= 140*3 && mouseX <= 180*3 && mouseY >= 140*3 && mouseY <= 180*3) {
    if (theUser.currentSpot < 3) {
      theUser.setLogo(theUser.currentSpot,tempShapeIDs[8]);
    }
    print("current logo values are: ");
    int[] currentLogo = theUser.getLogo();
    //check logo values
    for (int i = 0; i < 3; i++) {
      print(currentLogo[i] + " ");
    }
    println();
    redraw();
  }
  }
  
}

//background gradient, left to right
//*3 is SCALE BY 3
void drawGradients(int x, int y, float w, float h, int rows) {
  noFill();
  int j, k;
  int xShift, yShift; 
  int xStart = x;
  int yStart = y;
  //for each row of shapes
  for (j = 0; j < rows; j++) {
    yShift = j*60*3;
    y = yStart + yShift;
    //for each shape in the row
    for (k = 0; k < 3; k++) {
      xShift = k*60*3;
      x = xStart + xShift;    
      for (float i = x; i < x+w; i+=.1) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(color(200,0,255), color(255,255,255), inter);
        stroke(c);
        line(i , y, i, y+h);
      }
    }
  }
}

void drawMiniGradients(int x, int y, float w, float h) {
  noFill();
  int j, k;
  int xShift, yShift; 
  int xStart = x;
  int yStart = y;   
  for (float i = x; i < x+w; i+=.1) {
    float inter = map(i, x, x+w, 0, 1);
    color c = lerpColor(color(200,0,255), color(255,255,255), inter);
    stroke(c);
    line(i , y, i, y+h);
  }
}
