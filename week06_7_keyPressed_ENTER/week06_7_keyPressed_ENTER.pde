import processing.sound.*;
SoundFile correct_voice, typing_voice, Happiness, wrong_voice;

void setup() {
  size(640, 360);
  textSize(64);
  correct_voice = new SoundFile(this, "correct_voice.mp3");
  typing_voice = new SoundFile(this, "typing_voice.mp3");
  Happiness = new SoundFile(this, "Happiness.mp3");
  wrong_voice = new SoundFile(this, "wrong_voice.mp3");
}      
String line = "";
void draw()
{
  background(0);
  text("Input: "+line, 100, 100);
}
void keyPressed()
{
  if (key>='A' && key<='Z') { line += key; typing_voice.play(); }
  if (key>='a' && key<='z') { line += key; typing_voice.play(); }
  if (key==BACKSPACE && line.length()>0) { 
    line = line.substring(0, line.length()-1);
    wrong_voice.play();
  }
  if (key==ENTER) correct_voice.play();
}
