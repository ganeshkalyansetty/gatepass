package request;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime; 
public class date {   
	  public static void main(String[] args) {    
	   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");  
	   LocalDateTime now = LocalDateTime.now();  
	   System.out.println(dtf.format(now));  
	  }    
	}