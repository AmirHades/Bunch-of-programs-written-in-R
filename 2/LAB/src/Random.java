import java.io.*;
import java.util.*;
public class Random {
    public static void main(String[] args) {
    
    
    int[][] data = new int[1000][3];
    for(int i=0;i<1000;i++)
    {
        data[i][0]=getRandomNumberWithin(1000, 1200);
        data[i][1]=getRandomNumberWithin(1,30);
        data[i][2]=getRandomNumberWithin(1,10);
    }
try{
    StringBuilder builder = new StringBuilder();
for(int i = 0; i < data.length; i++)//for each row
{
   for(int j = 0; j < data.length; j++)//for each column
   {
      builder.append(data[i][j]+"");//append to the output string
      if(j < data.length - 1)//if this is not the last row element
         builder.append(" ");//then add comma (if you don't like commas you can use spaces)
   }
   builder.append("\n");//append new line at the end of the row
}
BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\notty\\Desktop\\SNU\\Semester 6\\Data Mining & Data Warehousing\\data.txt"));
writer.write(builder.toString());//save the string representation of the board
writer.close();
}
catch (IOException e) {

}
    }
    public static int getRandomNumberWithin(int lower, int upper) {
        Random rand = new Random();
        int randomNumber = rand.nextInt((upper - lower)) + lower;
        if(randomNumber == lower) {
            return lower + 1;
        }
        else {
            return randomNumber;
        }
 
    }

    private int nextInt(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
