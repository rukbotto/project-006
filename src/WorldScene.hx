import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Tilemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import GameData;


class WorldScene extends Scene
{
    private var TYPES = ['w','t'];

    public function new()
    {
        super();
    }

    public override function begin()
    {
        var map:Array<Array<String>> = new Array<Array<String>>();
        for (i in 0...100)
        {
            var row = new Array<String>();
            for (j in 0...100)
            {
                var type = GameData.getInstance().resourceType[Std.random(GameData.getInstance().resourceType.length)];
                row.push(type);
            }
            map.push(row);
        }
        GameData.getInstance().worldResources = map;
        var gameData:GameData = GameData.getInstance();

        var tilemap:Tilemap = new Tilemap("graphics/sprite_sheet.png", gameData.worldResources[0].length * 32,
                                          gameData.worldResources.length * 32, 32, 32);

        for (i in 0...gameData.worldResources.length)
        {
            for (j in 0...gameData.worldResources[0].length)
            {
                tilemap.setTile(i, j, gameData.getResourceTypeTileIndex(gameData.worldResources[i][j]));
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
