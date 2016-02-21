import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Tilemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;


class WorldScene extends Scene
{
    private var _worldResources:Array<Array<Int>>;
    private var _resourceType:Array<Int>;

    public function new()
    {
        super();
        _worldResources = new Array<Array<Int>>();
        _resourceType = [0,1,2];
    }

    public override function begin()
    {
        for (i in 0...100)
        {
            var row = new Array<Int>();
            for (j in 0...100)
            {   
                var type = Std.random(_resourceType.length);
                row.push(type);
            }
            _worldResources.push(row);
        }

        var tilemap:Tilemap = new Tilemap("graphics/sprite_sheet.png", _worldResources[0].length * 32,
                                          _worldResources.length * 32, 32, 32);

        for (i in 0..._worldResources.length)
        {
            for (j in 0..._worldResources[0].length)
            {
                tilemap.setTile(i, j, _worldResources[i][j]);
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

    private var _tribe:Array<TribeMember> = new Array<TribeMember>();
}
