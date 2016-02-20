import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Text;

import TribeMember;

class MainScene extends Scene
{
    private var tribe:Array<TribeMember> = new Array<TribeMember>();

    public override function begin()
    {
        createTribe();
    }

    private function createTribe()
    {
        tribe.push(new TribeMember(HXP.halfWidth, HXP.halfHeight,
            TribeMember.WOMAN));

        tribe.push(new TribeMember(HXP.halfWidth - 30, HXP.halfHeight - 30,
            TribeMember.WOMAN));

        tribe.push(new TribeMember(HXP.halfWidth + 30, HXP.halfHeight - 30,
            TribeMember.WOMAN));

        tribe.push(new TribeMember(HXP.halfWidth - 30, HXP.halfHeight + 30,
            TribeMember.MAN));

        tribe.push(new TribeMember(HXP.halfWidth + 30, HXP.halfHeight + 30,
            TribeMember.MAN));

        for (i in 0...tribe.length)
            add(tribe[i]);
    }

}
