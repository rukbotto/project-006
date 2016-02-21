import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import TribeMember;


class MainScene extends Scene
{
    public override function begin()
    {
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
