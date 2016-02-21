import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.tweens.motion.LinearMotion;

import EatingButton;


class TribeMember extends Entity
{
    public static inline var MAN = "man";
    public static inline var WOMAN = "woman";

    public static inline var HEIGHT = 32;
    public static inline var WIDTH = 32;

    public static inline var TYPE = "tribeMember";

    public var linearMotion(get, null):LinearMotion;
    private function get_linearMotion():LinearMotion { return _linearMotion; }

    public var selected(get, set):Bool;
    private function get_selected():Bool { return _selected; }
    private function set_selected(value:Bool):Bool
    {
        return _selected = value;
    }

    public function new(x:Float, y:Float, gender:String)
    {
        super(x, y);

        type = TribeMember.TYPE;

        setHitbox(TribeMember.WIDTH, TribeMember.HEIGHT);
        centerOrigin();

        _linearMotion = new LinearMotion();
        _linearMotion.x = x;
        _linearMotion.y = y;
        addTween(_linearMotion);

        _selected = false;
        _toggleMenu = false;

        _gender = gender;
        _speed = 100;

        _eatingButton = new EatingButton(this);
    }

    public override function update()
    {
        scene.add(_eatingButton);

        if (Input.mousePressed)
        {
            if (_selected)
            {
                _linearMotion.setMotionSpeed(x, y, Input.mouseX, Input.mouseY,
                    _speed);
                _selected = false;
                _eatingButton.visible = false;
            }
        }

        if (Input.pressed(Key.M))
        {
            if (_selected)
                _eatingButton.toggle();
        }

        x = _linearMotion.x;
        y = _linearMotion.y;

        updateGraphics();
    }

    private function updateGraphics()
    {
        if (_gender == TribeMember.MAN)
        {
            graphic = new Image("graphics/man.png");
            if (_selected)
                graphic = new Image("graphics/man_selected.png");
        }
        else
        {
            graphic = new Image("graphics/woman.png");
            if (_selected)
                graphic = new Image("graphics/woman_selected.png");
        }

        graphic.x = -halfWidth;
        graphic.y = -halfHeight;
    }

    private var _linearMotion:LinearMotion;
    private var _selected:Bool;
    private var _toggleMenu:Bool;

    private var _gender:String;
    private var _speed:Float;

    private var _eatingButton:EatingButton;
}
