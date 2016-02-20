import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class TribeMember extends Entity
{
    public static var MAN = "man";
    public static var WOMAN = "woman";

    private var gender:String;

    public function new(x:Float, y:Float, gender:String)
    {
        super(x, y);

        if (gender == TribeMember.MAN)
            graphic = new Image("graphics/man.png");
        else
            graphic = new Image("graphics/woman.png");

        this.gender = gender;
    }
}
