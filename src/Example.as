package {

    import flash.display.MovieClip;
    import flash.text.TextField;

    import TextFieldHealer;

    public class Example extends MovieClip {

        public function Example():void {
            var tf:TextField = new TextField();
            tf.border = true;
            tf.width = 300;
            tf.height = 150;
            tf.x = 15;
            tf.y = 15;

            addChild(tf);


            var healedTF:TextField = new TextField();
            healedTF.border = true;
            healedTF.width = 300;
            healedTF.height = 150;

            healedTF.x = 15;
            healedTF.y = 180;

            var healedTFHealer:TextFieldHealer = new TextFieldHealer(healedTF);
            addChild(healedTF);         
        }


    }



}