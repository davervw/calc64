1 M=15:DN$=CHR$(17):HM$=CHR$(19):CL$=CHR$(147):LT$=CHR$(157)
2 RV$=CHR$(18):RO$=CHR$(146)
5 PRINTCHR$(147)"C64 CALCULATOR"
6 PRINT"COPYRIGHT (C) 2024 BY DAVE VAN WAGNER"
7 PRINT"MIT LICENSE"
8 PRINT"GITHUB.COM/DAVERVW/CALC64"
9 PRINT"DAVEVW.COM"DN$DN$
10 PRINT SPC(M)RV$"           "
20 PRINT SPC(M)RV$" "RO$"        0"RV$" "
25 PRINT SPC(M)RV$"           "
30 PRINT SPC(M)RV$"           "
40 PRINT SPC(M)RV$"           "
50 PRINT SPC(M)RV$"           "
60 PRINT SPC(M)RV$"           "
70 PRINT SPC(M)RV$"           "
80 PRINT SPC(M)RV$"           "
90 PRINT SPC(M)RV$"           "
95 GOSUB 1300
100 V$="":C=0
110 GET K$:IF K$="" THEN 110
111 IF K$=CHR$(13) THEN K$="="
112 IF K$="X" THEN K$="*"
113 IF K$=CHR$(20) THEN K$="_"
119 GOSUB1500
120 IF K$<"0" OR K$>"9" THEN 130
121 IF LEN(V$)>=9 THEN 130
122 IFC=1ANDS$(0)="ERROR"THEN130
123 V$=V$+K$:GOSUB 500
130 IF K$="_" AND LEN(V$)>0 THEN V$=LEFT$(V$,LEN(V$)-1):GOSUB 500
140 IF K$="C" THEN T$="":V$="":C=0:GOSUB 500:GOSUB 550
141 IFK$<>"N"THEN150
142 IFV$<>""THENV$=STR$(-VAL(V$)):IFLEFT$(V$,1)=" "THENV$=MID$(V$,2)
143 IFV$<>""ORC=0THENGOSUB500:GOTO150
144 IFVAL(S$(C-1))=0THEN150
145 S$(C-1)=STR$(-VAL(S$(C-1)))
146 IFLEFT$(S$(C-1),1)=" "THENS$(C-1)=MID$(S$(C-1),2)
147 V$=S$(C-1):GOSUB500:V$="":GOSUB550
150 IF K$<>"+" AND K$<>"-" AND K$<>"=" AND K$<>"*" AND K$<>"/" THEN 498
165 IF LEN(V$)=0 THEN 170
166 IFC=0THEN168
167 IFLEFT$(S$(C-1),1)>="0"ANDLEFT$(S$(C-1),1)<="9"THENC=C-1
168 S$(C)=V$:V$="":C=C+1
170 R$="":IFC>0THENR$=S$(C-1)
180 IF R$="+" OR R$="-" OR R$="*" OR R$="/" THEN C=C-1
189 IFC=0ORS$(0)="ERROR"THEN498
190 S$(C)=K$:C=C+1
200 GOSUB 550
210 IFC=6OR(C=4AND(K$="+"ORK$="-"ORS$(1)="*"ORS$(1)="/"))ORK$="="THEN GOSUB 600
498 GOTO 110
499 END
500 PRINTHM$DN$DN$DN$DN$DN$DN$DN$DN$SPC(M+1);
505 IFLEN(V$)>1ANDLEFT$(V$,1)="0"THENV$=MID$(V$,2)
506 IFLEN(V$)>9ORVAL(V$)>999999999ORVAL(V$)<=-100000000THENV$="OVERFLOW"
510 R=9-LEN(V$):IF R>0 THEN FOR I=1 TO R:PRINT " ";:NEXT
520 IF V$="" THEN PRINT LT$"0";
530 PRINT V$
540 RETURN
550 PRINTHM$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$;
560 IFC=0THEN580
565 PRINTSTR$(C)":";
570 FORI=0TOC-1:PRINTS$(I);:NEXT
580 PRINT"                                        ";
590 RETURN
600 IFC=2ANDK$="="THENC=1:GOTO970
610 IFC=6THEN740
620 V1=VAL(S$(0))
630 O$=S$(1)
640 V2=VAL(S$(2))
650 N1=V1:N2=V2:GOSUB 1000
690 S$(0)=STR$(A):IFLEFT$(S$(0),1)=" "THENS$(0)=MID$(S$(0),2)
700 S$(1)=S$(3)
710 C=2
711 IF E=1 THEN S$(0)="ERROR":C=1
720 IFK$="="THENC=1:GOTO970
730 GOTO970
740 V1=VAL(S$(0))
750 O1$=S$(1):P1=2+(O1$="+"ORO1$="-")
760 V2=VAL(S$(2))
770 O2$=S$(3):P2=2+(O2$="+"ORO2$="-")
780 V3=VAL(S$(4))
790 IFP1>=P2THEN870
800 O$=O2$:N1=V2:N2=V3:GOSUB 1000
840 S$(2)=STR$(A):IFLEFT$(S$(2),1)=" "THENS$(2)=MID$(S$(2),2)
845 S$(3)=S$(5)
850 C=4
851 IF E=1 THEN S$(0)="ERROR":C=1:GOTO970
860 P2=2+(K$="+"ORK$="-")
861 IFK$="="ORP1=P2THEN600
865 GOTO970
870 O$=O1$:N1=V1:N2=V2:GOSUB 1000
910 S$(0)=STR$(A):IFLEFT$(S$(0),1)=" "THENS$(0)=MID$(S$(0),2)
920 S$(1)=S$(3)
930 S$(2)=S$(4)
940 S$(3)=S$(5)
950 C=4
951 IF E=1 THEN S$(0)="ERROR":C=1:GOTO970
960 GOTO860
970 IFC<=2THENV$=S$(0):GOSUB500:V$=""
980 GOSUB550
990 RETURN
1000 E=0
1010 IFO$="+"THENA=N1+N2
1020 IFO$="-"THENA=N1-N2
1030 IFO$="*"THENA=N1*N2
1040 IFO$="/"ANDN2=0THENE=1
1050 IFO$="/"ANDN2<>0THENA=INT(N1/N2)
1060 RETURN
1070 DATA "C",3,0
1080 DATA "/",3,1
1090 DATA "*",3,2
1100 DATA "-",3,3
1110 DATA "+",3,4
1120 DATA "=",3,5
1130 DATA "7",0,2
1140 DATA "8",1,2
1150 DATA "9",2,2
1160 DATA "4",0,3
1170 DATA "5",1,3
1180 DATA "6",2,3
1190 DATA "1",0,4
1200 DATA "2",1,4
1210 DATA "3",2,4
1220 DATA "N",0,5
1230 DATA "0",1,5
1240 DATA "_",2,5
1250 DATA "",-1,-1
1300 DIM KB$(3,5),XC%(255),YC%(255)
1310 READ N$,X,Y
1320 IF N$="" THEN 1365
1330 KB$(X,Y)=N$
1340 XC%(ASC(N$))=X
1350 YC%(ASC(N$))=Y
1360 GOTO 1310
1365 PRINT HM$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$;
1370 FOR Y=0 TO 5:PRINTSPC(M+2);
1380 FOR X=0 TO 3
1390 K$=KB$(X,Y)
1400 IF K$="" THEN K$=" "
1405 PRINT RV$K$" ";
1410 NEXT X:PRINT:NEXT
1415 PRINT
1420 RETURN
1500 X=XC%(ASC(K$)):Y=YC%(ASC(K$))
1501 IFKB$(X,Y)="" THEN 1550
1502 PRINT HM$DN$DN$DN$DN$DN$DN$DN$DN$DN$DN$;
1505 IFY>0THENFORI=1TOY:PRINT:NEXT
1510 PRINTSPC(M+2+2*X);
1520 PRINTK$;:TM=TI
1530 IFTI-TM<5THEN1530
1540 PRINT LT$RV$K$
1550 RETURN
