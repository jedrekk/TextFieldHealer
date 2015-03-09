package 
{
    import flash.events.KeyboardEvent;
    import flash.events.TextEvent;
    import flash.text.TextField;
    
    /**
     * Class which repairs Google Chrome browser bug which apears when user types alt_gr + a (polish letter 'ą') in text field.
     * Code originally taken from http://blog.mywebzz.com/?p=127 who took their entire blog offline during a redesign
     * @author <br>Fura<br><br>
     */

    public class TextFieldHealer
    {
        
        //------------------------------------------------------------------------//
        //  PRIVATE FIELDS
        //------------------------------------------------------------------------//
        
        /**
         * @private
         * target text field
         */
        
        private var _textField      : TextField         = null;
        
        /**
         * @private
         * flag which is set to true when ctrl + alt is pressed. When set to true then selection begin and end index is applied on TextEvent.TEXT_INPUT event.
         */
        
        private var _repair         : Boolean           = false;
        
        /**
         * @private
         * selected text begin index
         */
        
        private var _begin          : int               = 0;
        
        /**
         * @private
         * selected text end index
         */
        
        private var _end            : int               = 0;
        
        //------------------------------------------------------------------------//
        //  END OF PRIVATE FIELDS
        //------------------------------------------------------------------------//
        
        //------------------------------------------------------------------------//
        //  CONSTRUCTOR
        //------------------------------------------------------------------------//
        
        /**
         * Creates text field healer
         * @param   textField target text field to apply healer
         */
        
        public function TextFieldHealer( textField : TextField )
        {
            if ( ( _textField = textField ) == null )   
                throw new Error( "textField can not be null." );
            
            _textField.addEventListener( KeyboardEvent.KEY_DOWN , _keyHandler );
            _textField.addEventListener( TextEvent.TEXT_INPUT , _inputHandler );
        }
        
        //------------------------------------------------------------------------//
        //  END OF CONSTRUCTOR
        //------------------------------------------------------------------------//
        
        //------------------------------------------------------------------------//
        //  PUBLIC METHODS - API
        //------------------------------------------------------------------------//
        
        /**
         * destroys text field healer
         */
        
        public function destroy() : void
        {
            _textField.removeEventListener( KeyboardEvent.KEY_DOWN , _keyHandler );
            _textField.removeEventListener( TextEvent.TEXT_INPUT , _inputHandler );
            
            _textField  = null;
        }
        
        //------------------------------------------------------------------------//
        //  END OF PUBLIC METHODS - API
        //------------------------------------------------------------------------//
        
        //------------------------------------------------------------------------//
        //  EVENT HANDLERS
        //------------------------------------------------------------------------//
        
        /**
         * @private
         * method executed on key down event
         */
        
        function _keyHandler( event : KeyboardEvent ) : void
        {
            if ( !( _repair = event.ctrlKey && event.altKey ) )
                return;
            
            _begin  = _textField.selectionBeginIndex;
            _end    = _textField.selectionEndIndex;
        }
        
        /**
         * @private
         * handler executed on text input event.
         */
        
        function _inputHandler( event : TextEvent ) : void
        {
            if ( _repair )
                _textField.setSelection( _begin , _end );
        }
        
        //------------------------------------------------------------------------//
        //  END OF EVENT HANDLERS
        //------------------------------------------------------------------------//
        
    }

}