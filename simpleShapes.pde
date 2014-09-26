import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

SQLite db;

//javascript does not like a dynamic window size! SCALE IS 3! DISPLAY 3 ROWS!
//int scale = 3;
//int display = 3;

int[][] allCrd;

void setup() {
  //size(250*scale,100*scale*display)
  size(600,600);
  noStroke();
  smooth();
  
  dbImportValules();
  
}

void draw() {  
  background(255);
  //draw gradients
  drawGradients((20*3),(20*3),40.0*3,40.0*3);
  //set is row COUNTER - indicate current row
  int set = 0;
  int i;
  //DISPLAY 3 ROWS, 9 shapes total
  while(set < 3) {
    int[] ran = new int[3];
    for (i = 0; i < 3; i++) {
      //NEED TO KNOW NUMBER OF ITEMS IN DATABASE, RIGHT NOW HARDCODED VALUE!!!
      //replace 38 with number of available shapes in database
      ran[i] = int(random(0,38));
    }    
    Shape s1 = new Shape(ran[0],1);
    Shape s2 = new Shape(ran[1],2);
    Shape s3 = new Shape(ran[2],3);
    s1.display(set);
    s2.display(set);
    s3.display(set);
    set++;
  }
  noLoop();
}

void dbImportValules() {
  int val;
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
    int count = db.getInt("count");
    
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
}

void mousePressed() {
  redraw();
}

//background gradient, left to right
//*3 is SCALE BY 3
void drawGradients(int x, int y, float w, float h) {
  noFill();
  int j, k;
  int xShift, yShift; 
  int xStart = x;
  int yStart = y;
  //for each row of shapes
  for (j = 0; j < 3; j++) {
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
