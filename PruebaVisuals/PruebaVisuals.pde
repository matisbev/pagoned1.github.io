//int x, y;
//boolean [] keys = new boolean [128];

float widthgap;
float heightgap;
int cols = 10;
int rows = 10;
int numOfCubes;

Cube[] cubes;
float backgroundOpacity = 10;
float totalSpinOffset = 0;
float totalHueOffset = 0;

int animationSpeed = 20;

void setup(){
  //size(600, 600);
  //x=300;
 // y=300;
 size(1200,800,P3D);
  colorMode(HSB, 100);
  background(0);
  
  // Set up gap to lay out spacing between the cubes
  widthgap = width/(cols + 1);
  heightgap = height/(rows + 1);
  
  // Calculate total number of cubes from rows/cols
  numOfCubes = cols*rows;
  
  // Create an array of all the cubes
  cubes = new Cube[numOfCubes]; 
  for (int i=0; i<numOfCubes; i++){
     int row = i/cols;
     int col = i%cols;     
     cubes[i] = new Cube(col, row);     
  }  
}


void draw (){
  //background(0);
  //move();
  //ellipse(x,y,20,20);
  fill(0,0,0,backgroundOpacity);
  translate(-width*2, -height*2, -500); 
  rect(0,0,width*5,height*5);
  translate(width*2, height*2, 500);
  
    for (int i=0; i<numOfCubes; i++){
    cubes[i].update();
    if (cubes[i].row < rows && cubes[i].col < cols){
      cubes[i].display();
    }
  }

}

//void move(){
  //if (keys['a'])
  //x--;
  
  //if (keys['d'])
  //x++;
  
  //if (keys['w'])
  //y--;
  
  //if (keys['s'])
  //y++;
  

//}

void keyPressed() {
  //keys[key] =true;
  
  if (key == 'v'){ 
      println("hi");
      if (backgroundOpacity < 1){
        backgroundOpacity += 0.1; 
      }
      else if(backgroundOpacity<10){  
        backgroundOpacity += 1; 
      }
      else if (backgroundOpacity<50){
        backgroundOpacity += 10;       
      }    
    }
    
    if (key == 'c'){ 
      if(backgroundOpacity>10){
         backgroundOpacity -= 10; 
      }
      else if (backgroundOpacity > 1){
         backgroundOpacity -=1;  
      }
      else if (backgroundOpacity > 0){
         backgroundOpacity -=0.1;  
      }
    }  
      
    if (key == '2'){   
      if (cubes[1].newSize < 500){    
        for (int i=0; i<numOfCubes; i++){
          cubes[i].newSize+=30;
        }
      }
    }
    if (key == '1'){   
      if (cubes[0].newSize > 30){
        for (int i=0; i<numOfCubes; i++){
          cubes[i].newSize-=30;
        }
      }
    }  
      
    if (key == 'r'){ 
      if (cols<10){
        cols++;  
        widthgap = width/(cols+1);
        for (int i=0; i<numOfCubes; i++){
          cubes[i].reCalcX();
        }
      }
    }
      
    if (key == 'e'){ 
      if (cols>1){
        cols--;  
        widthgap = width/(cols+1);
        for (int i=0; i<numOfCubes; i++){
          cubes[i].reCalcX();
        }
      }
    }
    
    if (key == 'f'){ 
      if (rows<10){
        rows++;  
        heightgap = height/(rows+1);
        for (int i=0; i<numOfCubes; i++){
          cubes[i].reCalcY();
        }
      }
    }
    
    if (key == 'd'){ 
      if (rows>1){
        rows--;  
        heightgap = height/(rows+1);
        for (int i=0; i<numOfCubes; i++){
          cubes[i].reCalcY();
        }
      }
    }  
    
    if (key == '4'){   
      for (int i=0; i<numOfCubes; i++){
        cubes[i].newThickness+=5;
       }
    }
    
    if (key == '3'){   
      if (cubes[0].newThickness >0){
        for (int i=0; i<numOfCubes; i++){ 
          cubes[i].newThickness-=5;
        }
      }
    }
    
    if (key == 'w'){
      if (cubes[0].spinChange < 0.02){
        for (int i=0; i<numOfCubes; i++){
          cubes[i].spinChange  += 0.001;
         }  
      }
      else if (cubes[0].spinChange < 0.05){
        for (int i=0; i<numOfCubes; i++){
          cubes[i].spinChange  += 0.003;
         }  
      }
      else if (cubes[0].spinChange < 0.08){
        for (int i=0; i<numOfCubes; i++){
          cubes[i].spinChange  += 0.005;
         }  
      }
    }
    
    if (key == 'q'){
      if (cubes[0].spinChange > 0.05){
        for (int i=0; i<numOfCubes; i++){
          cubes[i].spinChange  -= 0.005;
         }  
      }
      else if (cubes[0].spinChange > 0.02){
        for (int i=0; i<numOfCubes; i++){
          cubes[i].spinChange  -= 0.003;
         }  
      }
      else if (cubes[0].spinChange > 0){
        for (int i=0; i<numOfCubes; i++){
          cubes[i].spinChange  -= 0.001;
         }  
      }
    } 
    
    
    if (key == 's'){
      if (totalSpinOffset < 0.5){
         totalSpinOffset += 0.01;
         for (int i=0; i<numOfCubes; i++){
           cubes[i].newSpinOffset = i*totalSpinOffset;
         }
      }
    }
    if (key == 'a'){
      if (totalSpinOffset > 0){
        totalSpinOffset -= 0.01;
         for (int i=0; i<numOfCubes; i++){
           cubes[i].newSpinOffset = i*totalSpinOffset;
         }  
      }
    } 
    
    if (key == 'x'){
      if (totalHueOffset < 4.5){
        totalHueOffset += 0.2;
        for (int i=0; i<numOfCubes; i++){
          cubes[i].newHueOffset = i*totalHueOffset;
        }
      }
    }
    if (key == 'z'){
      if (totalHueOffset > 0){
        totalHueOffset -= 0.2;
        for (int i=0; i<numOfCubes; i++){
          cubes[i].newHueOffset = i*totalHueOffset;
        } 
      } 
    }
}


//void keyReleased(){
  //keys[key] =false;

//}
