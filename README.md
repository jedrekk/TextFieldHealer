# TextFieldHealer for Actionscript 3.

## The Problem

Nobody cares about Flash anymore, but you're still getting Flash work or you have an existing AS3 code base, and it's a steady source of income. Unfortunately, nobody caring means that nobody is fixing the bugs that crop up in the Flash ecosystem anymore. Namely, Google Chrome on Windows has broken all input TextFields for people who use modifier keys for diacritics. 

This is most evident when using the Polish Programmer's keyboard, which is by far the most popular keyboard setup for Poles. It uses the right alt key to create the nine diacritics (ĄĆĘŁÓŃŚŻŹ) that are (semi)unique to Polish. The most problematic combination is alt-A (Ą), which sends a ctrl-A and alt-A at the same time. This selects all the text (ctrl-A) and then overwrites it with the Ą character. A quick [Google search](https://www.google.com/search?q=flash+%C4%85+problem) bears witness to the scope of the issue.

## The Solution

The best solution I've found so far is to detect ctrl+alt being sent simultaneously and ignore it by moving reseting the position of the cursor to its current position. This is what the **TextFieldHealer** library (although that's a big word for it) does.

## Usage

It's as simple as importing the class and creating a new variable while passing your textfield as parameter. 


```ActionScript

    import TextFieldHealer;

    var healedTF:TextField = new TextField();
    healedTF.width = 300;
    healedTF.height = 150;

    var healedTFHealer:TextFieldHealer = new   TextFieldHealer(healedTF);
    addChild(healedTF);         
```

If you work with TextFields created in Flash Professional, just pass the field instance name to the function as if it had been created in code.

## Credit

I found the solution to his problem on a now-offline blog, credit for the code goes to "Fura", I just cleaned it up and put it on github so others wouldn't have to suffer through the hell I went through fighting with this dumb bug.
