class Resource
{
	public static inline var WATER = 0;
	public static inline var TREE = 1;
	public static inline var PLANT = 2;
	public static inline var DIRT = 3;
	public static inline var HALF_PLANT = 6;
	public var x:Int;
	public var y:Int;
	public var type:Int;

	public function new(x:Int, y:Int, type:Int)
	{
		this.x = x;
		this.y = y;
		this.type = type;
	}

}
