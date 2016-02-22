import com.haxepunk.graphics.Text;
import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.utils.Ease;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.tweens.misc.ColorTween;
import flash.text.TextFormatAlign;

import WorldScene;


class StartScene extends Scene
{
    private var title:Entity;
    private var description:Entity;

    public override function begin()
    {
        var textOptions = {size: 50, align: TextFormatAlign.CENTER};
        var text = new Text("Project_006", 0, 0, 640, 0, textOptions);
        title = addGraphic(text, 0, 0, 150);

        _showTween = new ColorTween(TweenType.Looping);
        addTween(_showTween);
        _showTween.tween(1, 0xFFFFFF, 0xFFFFFF, 0, 1);

        var textOptions = {size: 24, align: TextFormatAlign.CENTER};
        var text = new Text("Press SPACE BAR to continue.", 0, 0, 640, 0, textOptions);
    
        description = addGraphic(text, 0, 0, 250);
    }

    public override function update()
    {
        cast(description.graphic, Text).alpha = _showTween.alpha;

        if (Input.check(Key.SPACE)) {
            HXP.scene = new WorldScene();
        }
    }

    private var _showTween:ColorTween;
}
