package _04_animals_inheritance;

public class Animal {
	String colorOfAnimal;
	String name;
	boolean isGirl;
public Animal(String name, String colorOfAnimal, boolean isGirl) {
	this.name = name;
	this.colorOfAnimal = colorOfAnimal;
	this.isGirl = isGirl;
}
	
	public void printName() {
	System.out.println("My name is " + name);
	System.out.println(":D");
}public void play() {
	System.out.println("I am playing");
	}public void eat() {
	System.out.println("I am eating food, which tastes very good");
}public void sleep() {
	System.out.println("I am sleeping. Do not disturb. ");
}
	
}
