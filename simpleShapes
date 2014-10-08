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
boolean stringToShape = false;
//to indicate that stringToShape function has completed execution
boolean stsComplete = false;
//mode indicates user has found a logo, in mode where can save or start over
boolean logoSelected = false;
boolean logoAvailable = false;
boolean logoSaved = false;

// Variable to store text currently being typed
String typing = "";
// Variable to store saved text when return is hit
String saved = "";
//ASCII bin values.
int ASCIIsum[] = new int[3];
//user ID # for storing shape data in database
String UNumber = "";

void setup() {
  //size(250*scale,100*scale*display)
  size(600,720);
  frame.setResizable(true);
  noStroke();
  smooth();
  db = new SQLite(this, "SPI_Base");
  if (db.connect()) {
    db.query("SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"");
    while(db.next()) {
      String tableName = db.getString("Name");
      println(tableName);
    }
  }
  //current user object
  lexSize = dbImportValues();
}

void draw() {  
  background(255);
  int i;
  
  //in view alphabet mode
  if (viewAlphabet && !stringToShape && !logoSelected) {
    fill(0,100,255);
    noStroke();
    rect(6*3,3*3,26*3,5*3,7);
    fill(255);
    textSize(12);
    text("Create Logo", 7*3,7*3);
    Shape a1 = new Shape();
    a1.displayAlphabet(lexSize);
  }
  
  //in stringToShape mode
  else if (stringToShape && !viewAlphabet && !logoSelected) {
    //button for create logo mode
    fill(0,100,255);
    noStroke();
    rect(6*3,3*3,26*3,5*3,7);
    fill(255);
    textSize(12);
    text("Create Logo", 7*3,7*3);
    //stringToShape mode controls
    fill(0);
    // Display everything
    textSize(14);
    text("Click in the box and type, hit enter to see the value:", 120, 220);
    //draw textbox outline
    noFill();
    stroke(0);
    rect(120,230,350,50);
    textSize(12);
    text(typing,125,235,340,45);
    if (stsComplete) {
      drawGradients((20*3),(20*3),40.0*3,40.0*3,1);
      for (i = 0; i < 3; i++) {
        Shape u1 = new Shape(ASCIIsum[i],i+1);
        u1.display(0);
      }
      noLoop();
    }
  }
  
  //in create logo mode, all boolean mode flags are false
  else if (!viewAlphabet && !stringToShape) {
    //means we are running the program again, after having saved a previous logo
    //clear user object data
    if (logoSaved) {
      for (i = 0; i < 3; i++) {
        theUser.logo[i] = -1;
      }
      theUser.currentSpot = 0;
      logoSaved = false;
      
    }
    fill(0,100,255);
    noStroke();
    rect(6*3,3*3,30*3,5*3,7);
    fill(255);
    textSize(12);
    text("View Alphabet", 7*3,7*3);
    //string-to-shape button
    fill(0,100,255);
    noStroke();
    rect(37*3,3*3,34*3,5*3,7);
    fill(255);
    textSize(12);
    text("String-to-Shape", 38*3,7*3);
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
      //indicate we are in logoSelected mode
      logoSelected = true;
      //cover previous button...
      fill(255);
      noStroke();
      rect(6*3,3*3,100*3,5*5);
      //draw save image button
      fill(0,100,255);
      noStroke();
      rect(6*3,3*3,52*3,5*3,7);
      fill(255);
      textSize(12);
      text("Save Logo / Export Image", 7*3,7*3);
      fill(0);
      textSize(14);
      text("To save and export your logo, enter your SUNY POLY UNumber in \nthe box below and click \"Save Logo / Export Image.\"", 80, 220);
      noFill();
      stroke(0);
      rect(120,260,350,25);
      textSize(12);
      text(typing,125,265,340,45);
      drawGradients((20*3),(20*3),40.0*3,40.0*3,1);
      for (i = 0; i < 3; i++) {
        if (theUser.logo[i] != -1) {  
          Shape u1 = new Shape(theUser.logo[i],i+1);
          u1.display(0);
        }
      }
      //check if logo is available...db queries
      //for now, assume that it is
      logoAvailable = true;
      noLoop();
    }
  }
}

int dbImportValues() {
  int val;
  int count = 0;
  int logoCount = 0;
  String query;
  //JP's database
  //db = new SQLite(this, "SPI_Base");
  //to confirm that database is accessible and opened successfully
  /*
  if (db.connect()) {
    db.query("SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"");
    while(db.next()) {
      String tableName = db.getString("Name");
      println(tableName);
    }
  */  
    if (logoSelected) {
      println("INSIDE HERE!!!");
      query = "SELECT COUNT(*) As \"count\" FROM Logo";
      db.query(query);
      logoCount = db.getInt("count");
      println("THIS IS LOGOCOUNT: %d", logoCount);
      //add a new user
      logoCount++;
      query = String.format("INSERT INTO Logo (OwnID,LogID) values (%d,%d)",logoCount,logoCount);
      db.query(query);
      //add UNumber as Stu_UNum
      query = String.format("INSERT INTO Student (Stu_UNum, OwnID) values ('%s',%d)",UNumber,logoCount);
      db.query(query);
      //add shape indices to database as ShapID, in order of position as ShapNum
      query = String.format("INSERT INTO DesignLine (ShapNum, ShapID, LogID) Values (%d,%d,%d)",1,theUser.logo[0],logoCount);
      db.query(query);
      query = String.format("INSERT INTO DesignLine (ShapNum, ShapID, LogID) Values (%d,%d,%d)",2,theUser.logo[1],logoCount);
      db.query(query);
      query = String.format("INSERT INTO DesignLine (ShapNum, ShapID, LogID) Values (%d,%d,%d)",3,theUser.logo[2],logoCount);
      db.query(query);
    }
    
    //READ IN EXISTING USER / LOGO DATA
    //determine number of rows (shapes) in lexicon table
    else {
    query = "SELECT COUNT(*) As \"count\" FROM TriangleShape";
    db.query(query);
    count = db.getInt("count");
    lexSize = count;
    
    //ASSUMED TRIANGLE - 12 coordinate values
    allCrd = new int[count][12];
    
    //get values from database for EACH SHAPE IN TABLE and load into array in memory
    for (int i = 0; i < count; i++) {
      query = "SELECT x1_1 As \"t1x1\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1x1");
      allCrd[i][0] = val;
      
      query = "SELECT y1_1 As \"t1y1\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1y1");
      allCrd[i][1] = val;
      
      query = "SELECT x1_2 As \"t1x2\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1x2");
      allCrd[i][2] = val;
      
      query = "SELECT y1_2 As \"t1y2\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1y2");
      allCrd[i][3] = val;
      
      query = "SELECT x1_3 As \"t1x3\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1x3");
      allCrd[i][4] = val;
      
      query = "SELECT y1_3 As \"t1y3\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t1y3");
      allCrd[i][5] = val;
      
      query = "SELECT x2_1 As \"t2x1\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2x1");
      allCrd[i][6] = val;
      
      query = "SELECT y2_1 As \"t2y1\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2y1");
      allCrd[i][7] = val;
      
      query = "SELECT x2_2 As \"t2x2\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2x2");
      allCrd[i][8] = val;
      
      query = "SELECT y2_2 As \"t2y2\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2y2");
      allCrd[i][9] = val;
      
      query = "SELECT x2_3 As \"t2x3\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2x3");
      allCrd[i][10] = val;
      
      query = "SELECT y2_3 As \"t2y3\" FROM TriangleShape join shape WHERE TriangleShape.ShapID = Shape.ShapID AND TriangleShape.ShapID = " + String.format("%d",i+1);
      db.query(query);
      val = db.getInt("t2y3");
      allCrd[i][11] = val;
    }
    }
  //}
  return count;
}

//SCALE = 3!!!
void mouseClicked() {
  //this means we are in view alphabet mode
  if (viewAlphabet && !stringToShape && !logoSelected) {
    //CREATE LOGO BUTTON
    if (mouseX >= 18 && mouseX <= 96 && mouseY >= 9 && mouseY <= 24) {
      viewAlphabet = false;
      redraw();
    }
  }
  
  //this means we are in stringToShape mode
  else if (stringToShape && !viewAlphabet && !logoSelected) {
    //CREATE LOGO BUTTON
    if (mouseX >= 18 && mouseX <= 96 && mouseY >= 9 && mouseY <= 24) {
      viewAlphabet = false;
      stringToShape = false;
      redraw();
    }
  }
  
  //viewing selected logo
  else if (logoSelected && !stringToShape && !viewAlphabet) {
    //if (logoAvailable) {
      //clicked the SAVE LOGO BUTTON
      if (mouseX >= 18 && mouseX <= 90 && mouseY >= 9 && mouseY <= 24) {
        saveLogo();
        logoSelected = false;
        logoAvailable = false;
        logoSaved = true;
        viewAlphabet = false;
        stringToShape = false;
        redraw();
      }
    //}
    //else {
      //display some stuff about how logo is not available, try again
    //}
  }
  
  //this means we are in create logo mode
  else if (!viewAlphabet && !stringToShape && !logoSelected) {
    //VIEW ALPHABET BUTTON
    if (mouseX >= 18 && mouseX <= 108 && mouseY >= 9 && mouseY <= 24) {
      viewAlphabet = true;
      redraw();
    }
    
    //STRING-TO-SHAPE BUTTON
    if (mouseX >= 111 && mouseX <= 213 && mouseY >= 9 && mouseY <= 24) {
      stringToShape = true;
      redraw();
    }
    
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

void keyPressed() {
  //either in stringToShape mode or logoSelected Mode
  if (stringToShape) {
    //not finished typing (user has not hit enter)
    stsComplete = false;
    //if delete key is pressed without any string yet then ignore it
    if (keyCode == BACKSPACE) {
      if (typing.length() > 0) {
        typing = typing.substring(0, typing.length()-1);
      }
      //do nothing - no characters
      else if (typing.length() == 0) { 
      }
    }
    //if return key is hit then save the string and change asciisum to 0 before summing up again
    else {
      if (key == '\n') {
        ASCIIsum[0] = 0;
        ASCIIsum[1] = 0;
        ASCIIsum[2] = 0;
        for (int i = 0; i < typing.length(); i++) {
          ASCIIsum[i%3] = typing.charAt(i) + ASCIIsum[i%3];
        }
        //each bin must b less than size of alphabet
        ASCIIsum[0] = ASCIIsum[0] % lexSize;
        ASCIIsum[1] = ASCIIsum[1] % lexSize;
        ASCIIsum[2] = ASCIIsum[2] % lexSize;
        typing = "";
        printArray(ASCIIsum);
        stsComplete = true;
      } 
      else {
        // Each character typed by the user is added to the end of the String variable.
        typing = typing + key;
      }
    }
  }
  //in logoSelected mode
  else if (logoSelected) {
    if (key == BACKSPACE) {
      if (typing.length() > 0) {
        typing = typing.substring(0, typing.length()-1);
      }
      //do nothing - no characters
      else if (typing.length() == 0) { 
      }
    }
    //to ensure no weird nonprintable characters are recorded
    else if (key >= 32 && key <= 255) {
      typing = typing + key;
    }
  }
  //either in view alphabet mode or shape select mode
  else {
    if (key == 32) {
    }
    else if (key == 114) {
      for (int i = 0; i < 3; i++) {
        theUser.logo[i] = -1;
      }
      theUser.currentSpot = 0;
      viewAlphabet = false;
      stringToShape = false;
      logoSelected = false;
      logoSaved = true;
    }
  }
  redraw();
}

void saveLogo() {
  drawGradients((20*3),(20*3),40.0*3,40.0*3,1);
  for (int i = 0; i < 3; i++) {
    if (theUser.logo[i] != -1) {  
      Shape u1 = new Shape(theUser.logo[i],i+1);
      u1.display(0);
    }
  }
  //saveFrame("###-logo.tif");
  PImage img;
  UNumber = typing;
  //clear value for next use
  typing = "";
  //save image, with user identifier!
  img = get(60,60,480,120);
  img.save(UNumber+"_logo.tif");
  //store user and shape data in database
  dbImportValues();
}
