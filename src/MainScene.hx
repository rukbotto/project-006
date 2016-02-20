import com.haxepunk.graphics.Text;
import com.haxepunk.Scene;

class MainScene extends Scene
{
    public override function begin()
    {
        addGraphic(new Text("Hello world!"));
    }
}
