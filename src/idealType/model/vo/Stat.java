package idealType.model.vo;

public class Stat implements Comparable<Stat>{

	private String item;
	private double prop;
	
	public Stat() {
		super();
	}

	public Stat(String item, double prop) {
		super();
		this.item = item;
		this.prop = prop;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public double getProp() {
		return prop;
	}

	public void setProp(double prop) {
		this.prop = prop;
	}	
	
	public void addProp() {
		this.prop++;
	}
	
	public void divProp(int num) {
		this.prop = prop/num;
	}
	
	@Override
	public int compareTo(Stat s) {
		double p1 = this.getProp();
		double p2 = s.getProp();
		if (p1 == p2)
			return 0;
		else if (p1 > p2)
			return 1;
		else
			return -1;
	}
	
	
}
