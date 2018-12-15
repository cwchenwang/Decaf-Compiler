package decaf.tac;

public class VTable {
	public String name;
	
	public VTable parent;
	
	public String className;

	public Label[] entries; //各虚函数入口标号
}
