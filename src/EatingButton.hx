import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;


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
        trace("Eating...");
        _tribeMember.linearMotion.active = false;
    }

    private var _tribeMember:TribeMember;
}
