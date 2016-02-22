import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Tilemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import Resource;


class WorldScene extends Scene
{
    public static inline var TILE_WIDTH = 32;
    public static inline var TILE_HEIGHT = 32;
    public var tilemap:Tilemap;

    public function new()
    {
        super();
        _worldResources = new Array<Array<Resource>>();
        _resourceType = [Resource.WATER,Resource.TREE,Resource.PLANT,
                         Resource.DIRT,Resource.HALF_PLANT]; 
    }

    public override function begin()
    {
        for (i in 0...100)
        {
            var row = new Array<Resource>();
            for (j in 0...100)
            {   
                var type = _resourceType[Std.random(_resourceType.length)];
                var type = new Resource(i, j, _resourceType[
                                        Std.random(_resourceType.length)]);
                row.push(type);
            }
            _worldResources.push(row);
        }

        tilemap = new Tilemap("graphics/sprite_sheet.png", 
                              _worldResources[0].length * TILE_WIDTH,
                              _worldResources.length * TILE_HEIGHT, TILE_WIDTH,
                              TILE_HEIGHT);

        for (i in 0..._worldResources.length)
        {
            for (j in 0..._worldResources[0].length)
            {
                tilemap.setTile(i, j, _worldResources[i][j].type);
            }
        }

        var entity:Entity = new Entity();
        entity.graphic = tilemap;
        add(entity);

        createTribe();
    }

    public override function update()
    {
        super.update();

        if (Input.mousePressed)
        {
            var tribeMember = collidePoint(TribeMember.TYPE, Input.mouseX,
                Input.mouseY);

            if (tribeMember != null)
            {
                cast(tribeMember, TribeMember).selected = true;
            }
        }

        if (Input.check(Key.ESCAPE))
        {
            for (i in 0..._tribe.length)
                _tribe[i].selected = false;
        }
    }

    private function createTribe()
    {
        _tribe.push(new TribeMember(HXP.halfWidth, HXP.halfHeight,
            TribeMember.WOMAN));

        _tribe.push(new TribeMember(HXP.halfWidth - 30, HXP.halfHeight - 30,
            TribeMember.WOMAN));

        _tribe.push(new TribeMember(HXP.halfWidth + 30, HXP.halfHeight - 30,
            TribeMember.WOMAN));

        _tribe.push(new TribeMember(HXP.halfWidth - 30, HXP.halfHeight + 30,
            TribeMember.MAN));

        _tribe.push(new TribeMember(HXP.halfWidth + 30, HXP.halfHeight + 30,
            TribeMember.MAN));

        for (i in 0..._tribe.length)
            add(_tribe[i]);
    }

    public function getTileByPosition(x:Int, y:Int):Resource
    {
        return _worldResources[Math.round(x/TILE_WIDTH)-1][
                               Math.round(y/TILE_HEIGHT)-1];
    }

    private var _worldResources:Array<Array<Resource>>;
    private var _resourceType:Array<Int>;
    private var _tribe:Array<TribeMember> = new Array<TribeMember>();
}
