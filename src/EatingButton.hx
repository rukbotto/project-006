import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import WorldScene;


class EatingButton extends Entity
{
    public static inline var HEIGHT = 16;
    public static inline var WIDTH = 16;

    public function new(tribeMember:TribeMember)
    {
        super(0, 0);

        graphic = Image.createRect(EatingButton.WIDTH, EatingButton.HEIGHT,
            0xFF0000);

        _tribeMember = tribeMember;

        setHitbox(EatingButton.WIDTH, EatingButton.HEIGHT);
        centerOrigin();
    }

    public override function update()
    {
        if (Input.mousePressed)
        {
            if (collidePoint(x, y, Input.mouseX, Input.mouseY))
                eating();
        }

        x = _tribeMember.x + _tribeMember.halfWidth + 5 + halfWidth;
        y = _tribeMember.y - _tribeMember.halfHeight + halfHeight;

        graphic.x = -halfWidth;
        graphic.y = -halfHeight;
    }

    private function eating()
    {   
        var worldScene = cast(scene, WorldScene);
        var resource = worldScene.getTileByPosition(Std.int(_tribeMember.x +
                       _tribeMember.halfWidth), Std.int(_tribeMember.y + 
                       _tribeMember.halfHeight));
        if (resource.type == Resource.PLANT ||
            resource.type == Resource.HALF_PLANT)
        {
            worldScene.tilemap.setTile(resource.x, resource.y, if (resource.type
                                       == Resource.PLANT) Resource.HALF_PLANT 
                                       else Resource.DIRT);
            resource.type = if (resource.type == Resource.PLANT)
                            Resource.HALF_PLANT else Resource.DIRT;
        }
        _tribeMember.linearMotion.active = false;
    }

    private var _tribeMember:TribeMember;
}
