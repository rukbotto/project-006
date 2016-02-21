class GameData
{

	public static var instance:GameData;
	public var worldResources:Array<Array<String>>;
	public var resourceType:Array<String>;

	private function new()
	{
		worldResources = new Array<Array<String>>();
		resourceType = ['w','t','p'];
	}

	public function getResourceTypeTileIndex(type:String):Int
	{
		switch (type) {
			case 'w':
				return 0;
			case 't':
				return 1;
			case 'p':
				return 2;
			default:
				return 0;
		}
	}

	public static function getInstance():GameData
	{
		if (instance == null) 
		{
			instance = new GameData();
		}
		return instance;
	}
}