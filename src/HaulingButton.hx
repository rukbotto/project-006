import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;


class HaulingButton extends Entity
{
    public static inline var HEIGHT = 16;
    public static inline var WIDTH = 16;

    public function new(tribeMember:TribeMember)
    {
        super(0, 0);

        graphic = Image.createRect(HaulingButton.WIDTH, HaulingButton.HEIGHT,
            0xFF0000);

        _tribeMember = tribeMember;

        setHitbox(HaulingButton.WIDTH, HaulingButton.HEIGHT);
        centerOrigin();
    }

    public override function update()
    {
        x = _tribeMember.x + _tribeMember.halfWidth + 5 + halfWidth;
        y = _tribeMember.y - _tribeMember.halfHeight + halfHeight;

        graphic.x = -halfWidth;
        graphic.y = -halfHeight;
    }

    private var _tribeMember:TribeMember;
}
