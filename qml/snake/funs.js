var poscom=1
var posplay=1
var pturn=0
var started=0

function toss(choice)
    {
        var compchoice=Math.floor((Math.random()*2)+1);
        if(compchoice==choice)
        {
            wel.text= qsTr("You won the toss, your turn first\nYou are green");
            pturn=1
        }
        else
        {
            wel.text= qsTr("You lost the toss\nYou are green");
            pturn=0
        }
        head.opacity=0
        head.z=-5
        tails.opacity=0
        tails.z=-5
    }
    function getnum(num)
    {
        var caseNo;
        if(num>=31&&num<=36)
        {
            caseNo=1;
        }
        else
        if(num>=19&&num<=24)
        {
            caseNo=2;
        }
        else
        if(num>=7&&num<=12)
        {
            caseNo=3;
        }

        else
        {
            caseNo=4;
        }
        switch(caseNo)
        {
        case 1:return 7-(37-num);
        case 2:return 31-(37-num);
        case 3:return 55-(37-num);
        case 4:return 37-num;
        }
    }

    function chktimer(sec)
    {
        time.start();
        if (sec==0)
        {
            time.stop();
            timertext.text=qsTr("Press Dice")
            if(pturn==0)
                wel.text=qsTr("Computer's turn")
            else
                wel.text=qsTr("Player's turn")
            face.opacity=1
            return 0;
        }
        else
        {
            return sec-1;
        }
    }

    function diceroll(sec)
    {
        rolltime.start();
        if(sec==0)
        {
            rolltime.stop();
            changeImage();
            return 2;
        }
        else
        {
            return sec-1;
        }
    }

    function changeImage()
    {
        var turn=Math.floor((Math.random()*6)+1);
        switch (turn)
        {
        case 1:faceimg.source="pics/d1.png"
            break;
        case 2:faceimg.source="pics/d2.png"
            break;
        case 3:faceimg.source="pics/d3.png"
            break;
        case 4:faceimg.source="pics/d4.png"
            break;
        case 5:faceimg.source="pics/d5.png"
            break;
        case 6:faceimg.source="pics/d6.png"
            break;
        }
        dicefunction(0)
        newf(turn)
    }

    function dicefunction(num)
    {
        if(num==1)
        {
            animdice.opacity=1;
           face.opacity=0
            animdice.z=5
            face.z=0
            diceroll()
        }
        else
        {
            face.opacity=1;
            animdice.opacity=0;
            face.z=5;
            animdice.z=0;
        }
    }

    function newf(turn)
    {
    switch(started)
        {
            case 0:started=1
                    break;
            default:
            if (pturn==0)
            {
                if(poscom+turn<37)
                poscom=poscom+turn;
                if(poscom<getdetail(poscom))
                {
                    wel.text=qsTr("Got the ladder\n [Player's turn]")
                }
                else if(poscom>getdetail(poscom))
                {
                    wel.text=qsTr("Sorry, snake bite\n [Player's turn]")
                }

                poscom=getdetail(poscom)
                changeposition(0);
                if (turn==6)
                {
                    pturn=0;
                    wel.text=qsTr("Computer's turn")
                }
                else
                {
                    pturn=1;
                    wel.text=qsTr("Player's turn")
                }
                if(poscom==36)
                {
                    wel.text=qsTr("Computer is winner")
                    finish()
                }
            }
            else
            {
                if(posplay+turn<37)
                posplay=posplay+turn;
                if(posplay<getdetail(posplay))
                {
                    wel.text=qsTr("Got the ladder\n [Computer's turn]")
                }
                else if(posplay>getdetail(posplay))
                {
                    wel.text=qsTr("Sorry, snake bite\n [Computer's turn]")
                }
                posplay=getdetail(posplay)
                changeposition(1);
                if(turn==6)
                {
                    pturn=1;
                    wel.text=qsTr("Player's turn")
                }
                else
                {
                    pturn=0;
                    wel.text=qsTr("Computer's turn")
                }
                if(posplay==36)
                {
                    wel.text=qsTr("You are winner")
                    finish()
                }
            }
        }
    }

    function changeposition(p)
    {
        var xcoord;
        var ycoord;
        if(p==0)
        {
            xcoord=getx(poscom)
            ycoord=gety(poscom)
            computer.x=27+(xcoord-1)*55
            computer.y=215-(ycoord-1)*38
        }
        else
        {
            xcoord=getx(posplay)
            ycoord=gety(posplay)
            player.x=27+(xcoord-1)*55
            player.y=197-(ycoord-1)*38
        }
    }

    function getx(a)
    {
        if(a==1||a==12||a==13||a==24||a==25||a==36)
            return 1;
        else
            if(a==2||a==11||a==14||a==23||a==26||a==35)
                return 2;
        else
                if(a==3||a==10||a==15||a==22||a==27||a==34)
                    return 3;
        else
                    if(a==4||a==9||a==16||a==21||a==28||a==33)
                        return 4;
        else
                        if(a==5||a==8||a==17||a==20||a==29||a==32)
                            return 5;
        else
                            if(a==6||a==7||a==18||a==19||a==30||a==31)
                                return 6;
    }

    function gety(a)
    {
        if(a>=1&&a<=6)
            return 1;
        else
            if(a>=7&&a<=12)
                return 2;
        else
                if(a>=13&&a<=18)
                    return 3;
        else
                    if(a>=19&&a<=24)
                        return 4;
        else
                        if(a>=25&&a<=30)
                            return 5;
        else
                            if(a>=31&&a<=36)
                                return 6;
    }

    function getdetail(p)
    {
        switch(p)
        {
        case 12: return 12  //snake
            break;
        case 14:return 11
            break;
        case 17:return 4
            break;
        case 31:return 19
            break;
        case 35:return 22
            break;
        case 5:return 7 //ladder
            break;
        case 3:return 16
            break;
        case 15:return 25
            break;
        case 18:return 20
            break;
        case 21:return 32
            break;
        default:return p
        }
    }

    function finish()
    {
        face.opacity=0
        animdice.opacity=0
    }
