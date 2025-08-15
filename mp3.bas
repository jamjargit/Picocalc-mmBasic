'mp3 Player by Paul Walsh
'set up directory name music on sd
'add mp3 with title max length 33
'work in progress. Hope to add more
Dim mp3$(100)
Dim STRING k$
f1=1
CLS
path$ = "b:\music\"
f$=Dir$(path$ + "*.mp3",FILE)
    Do While f$<>""
    mp3$(f1)=f$
    f$=Dir$()
    Print f1 ,"- ";
    Print mp3$(f1)
    f1=f1+1
    Loop
  Chdir "b:\music"
x=120
y=f1*12
Print @(x,y) "Select Track"
Print @(0,y+17) "(1 to";
Print @(39,y+17) f1-1;")","  (s)STOP"
  Do
    skip:
    Print @(0,y+40) "          "
    Print @(0,y+40) "";
    Input k$
    last$ = k$
    If Val(k$) >= f1 Then GoTo skip
    If k$="s" Then Exit
    'Will add If k$="n" for (n)next
    If Val(k$) = 0 Then GoTo skip
    If k$ = "" Then k$="1"
    skip2:
    Play Stop
    Print @(x,y) "            "
    Print @(x,y) "Playing "; k$
    Play mp3 mp3$(Val(k$))
  Loop
  CLS
  Chdir ".."
  End
