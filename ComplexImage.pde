PImage orig,comp;
float torusMod(float a,float b){
  return (b+(a%b))%b;
}
PImage morph(PImage im){
  PImage i=im.copy();
  i.loadPixels();
  im.loadPixels();
  for(int x=-i.width/2;x<i.width/2;x++){ //Translate points beforehand
    for(int y=-i.height/2;y<i.height/2;y++){
      Complex c=new Complex(x,-y);
      c=c.power(new Complex(0,3)).ePower().csin().mult(200); //Perform complex function
      color col=im.pixels[int(torusMod(c.real+im.width/2,im.width-1)+torusMod(-c.imag+im.height/2,im.height-1)*im.height)]; //Have to untranslate the points
      i.pixels[x+i.width/2+(y+i.height/2)*i.height]=col;
    }
  }
  i.updatePixels();
  return i;
}
void keyPressed(){
  if(key=='s')
    saveFrame("result.png");
}
void setup(){
  orig=loadImage("test.jpg");
  surface.setSize(2*orig.width,orig.height);
  comp=morph(orig);
}
void draw(){
  image(orig,0,0);
  image(comp,width/2,0);
  noLoop();
}