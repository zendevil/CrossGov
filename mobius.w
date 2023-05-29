@** MetaverseX Copyright. We will find the arrangement of the mobius strip such that all letters pertianing to pentominoes fit on a mobius strip of size 15x4.

@c
@<Include libraries.@>;
@<Set definitions.@>@;
@<Set global variables.@>@;

@<Generate sequences in the table for the exact colored coloring problem.@>@;

@<Backtracking on generated table.@>@;

@ First we include libraries.
@<Include libraries.@>=
#include<stdio.h>
@ |MAX_ARRAY| is the maximum number of placings a letter pentomino can have on the $15 \mul 4$ mobius strip.
@<Set definitions.@>=
#define MAX_ARRAY 1000

@ And set the global variables.

@<Set global variables.@>=
int l=15,w=4;
@ Then we generate all the places where each letter can be.
O 11 12 13 14 15
O 12 13 14 15 16
O 13 14 15 16 17
O 14 15 16 17 18
...
O 1f 11 12 13 14
O 21 22 23 24 25
...
Z ...
The formula for O is ab_1, ab_2, ab_3, ab_4, ab_5 for a in 1-4, b_1=c for c from 1-15 and b_(i+1) = b_i + 1 (mod 15) for 1<i<=15.
@* We generate the coordinates in the array that can be thought of as sequences corresponding to the letter as the first element in the sequence for the exact covering problem followed by the coordinates of the five perpendicularly adjacent pentominoes.
@<Generate sequences...@>=
@<O@>;
@<P@>;
@<Q@>;
@* O is for setting the 3d array O with the five coordinates. These correspond to all placements of the pentomino on the mobius strip.
@<O@>=
int O[MAX_ARRAY][5][2],c=0;
for(@<All the width@>;){for(@<All x position in width@>;)
{@<Set O@>@;
@<Increment c@>;}}
@<Set sentinel for O.@>@;
@ Setting all the coordinates and the positions of O.
@<Set O@>=
for(@<All five consecutive boxes for O@>@;){O[c][b][0]=(x+b)%15;@<If x+b...@>@;O[c][b][1]=y;else O[c][b][1]=w-y+1}
@ Iteration for the consecutive horizontal boxes for O.
@<All five consecutive boxes...@>=int b=0;b<5;b++
@ Iterating across the width of the mobius strip. Only relevant if the width of the pentomino is two.
@<All the width@>=int y=0;y<4;y++
@ Iterating across the length 15 of the mobius strip.
@<All x position in width@>=int x=0;x<l;x++
@ Increment c to put the next sequence of pentomino coordinates in the 3d array.
@<Increment c@>=c++;
@ We've to set a sentinel in the array O to mark the end of positions of O in the mobius strip.
@<Set sentinel for O.@>=
O[c][0][0]=-1;
@ To deal with the overflow for the mobius strip to mirror back the Q across x axis.
@<If x+b is less than or equal to 15.@>=if(x+b<15)

@* P is four boxes and a tail. We need all rotations of P.
@<P@>=
c=0;
for(@<0 and 1 y coordinates.@>;)
for(@<All x position in width@>;){
@<Set P right@>@;
@<Increment c@>;
@<Set P left@>@;
@<Increment c@>;
}
@<Set sentinel for P.@>;
@<If x+1 is less than 15@>=
if(x+1<15)
@ We set P in the array P where P's tail is on the right-hand side that is it is the mirror image across y axis of what looks like a P pentameter configuration@<Set P right@>=
P[c][0][0]=x;P[c][0][1]=y;P[c][1][0]=(x+1)%15;@<If x+1...@>@;P[c][1][1]=y;else P[c][1][1]=w-y+1;
P[c][2][0]=x;P[c][2][1]=y+1;P[c][3][0]=(x+1)%15;@<If x+1...@>@;P[c][3][1]=y+1;else P[c][3][1]=w-(y+1)+1;
P[c][4][0]=(x+1)%15;@<If x+1...@>@;P[c][4][1]=y+2;else P[c][4][1]=w-(y+2)+1;
@ We set P in the array P where P's tail is on the left-hand side that is it is the mirror image across y axis of what looks like a P pentameter configuration.
@<Set P left@>=
P[c][0][0]=x;P[c][0][1]=y;P[c][1][0]=(x+1)%15;@<If x+1...@>@;P[c][1][1]=y;else P[c][1][1]=w-y+1;
P[c][2][0]=x;P[c][2][1]=y+1;P[c][3][0]=(x+1)%15;@<If x+1...@>@;P[c][3][1]=y+1;else P[c][3][1]=w-(y+1)+1;
P[c][4][0]=x;P[c][4][1]=y+2;
@ For the pentaminoes that have width of 3
@<0 and 1 y coordinates.@>=
int y=0;y<2;y++
@ We set a sentinel to mark the end of P positions in the array P.
@<Set sentinel for P.@>=
P[c][0][0]=-1;
@* Arranging pentomines for Q. We one by one proceed to put all rotations of Q across all positions.
@<Q@>=
c=0;
int Q[MAX_ARRAY][5][2];
for(@<0,1,2 y coordinates@>;){for(@<All x position in width@>;){
@<Set Q bottom right@>@;
@<Increment c@>;
@<Set Q bottom left@>@;
@<Increment c@>;}
}
for(@<0 and 1 y coordinates.@>;){for(@<All x position in width@>;){
@<Set Q top left@>@;
@<Increment c@>;
@<Set Q bottom left@>@;
@<Increment c@>;
}}

@<Set Q top left@>=for@<Four consecutive vertical boxes for Q@>;
@<If x minus one is less than one@>Q[c][0][0]=(x-1)%15;Q[c][0][1]=y-1;
@<Set sentinel for Q.@>;
@ For pentominoes that have width of 2.
@<0,1,2 y coordinates@>=int y=0;y<3;y++
@ For pentominoes that have width 2 and major horizontal center is one below the top extremity.
@<2,3,4 y coordinates@>=int y=1;y<4;y++
@ Similarly, we have 4 consecutive horizontal boxes and one box is below the third box.
@<Set Q bottom right@>=
for(@<Four consecutive boxes for Q@>@;){ Q[c][b][0]=(x+b)%15;@<If x+b...@>@;Q[c][b][1]=y;else Q[c][b][1]=w-y+1;}
Q[c][4][0]=(x+2)%15;@<If x+1...@>@;Q[c][4][1]=y+1;else Q[c][4][1]=w-(y+1)+1;
@ The pentomino that is 4 consecutive horizontal boxes and one box is below the second box.
@<Four consecutive boxes for Q@>=int b = 0; b< 4; b++
@ Set a Q where Q's main line is horizontally aligned and the appendage is on the bottom left.
@<Set Q bottom left@>=
for(@<Four consecutive boxes for Q@>;){ Q[c][b][0]=(x+b)%15;@<If x+b...@>@;Q[c][b][1]=y;else Q[c][b][1]=w-y+1;}
Q[c][4][0]=(x+1)%15;@<If x+1...@>@;Q[c][4][1]=y+1;else Q[c][4][1]=w-(y+1)+1;
@ Setting the sentinel so that we know when the number of placements terminate in the array Q.
@<Set sentinel for Q.@>=Q[c][0][0]=-1;
for(@<2,3,4 y coordinates@>;){for(@<All x position in width@>;){
@<Set Q top right@>@;
@<Increment c@>;
@<Set Q top left@>@;
@<Increment c@>;}
}
@ We flip the Q bottom left across x axis.
@<Set Q top right@>=
for(@<Four consecutive boxes for Q@>;){ Q[c][b][0]=(x+b)%15;@<If x+b...@>;Q[c][b][1]=y;else Q[c][b][1]=w-y+1;}
Q[c][4][0]=(x+2)%15;@<If x+2...@>;Q[c][4][1]=y+1;else Q[c][4][1]=w-(y+1)+1;
@* So that the overflow in the pentomino jigsaw satisfies the mobius strip property.
@<If x+2 is less than or equal to 15@>=if(x+2<=15)
@ We flip Q bottom left across x axis.
@<Set Q top left@>=
for(@<Four consecutive boxes for Q@>;){ Q[c][b][0]=(x+b)%15;@<If x+b...@>;Q[c][b][1]=y;else Q[c][b][1]=w-y+1;}
Q[c][4][0]=(x+1)%15;@<If x+1...@>;Q[c][4][1]=y-1;else Q[c][4][1]=w-(y-1)+1;
@ We need four consecutive vertical boxes for Q along Q's main line.
@<Four consecutive vertical boxes for Q@>=
int y=0;y<4;y++
@ We need that x -1 is less than one
@<If x minus one is less than one@>=if(x-1<1)
@ We need that x -1 is less than 15
@<If x+1 is less than 15@>=if(x+1<15)
@* Then we apply backtracking in which each pentomino letter represents a depth l in the tree and P_l stands for the set of x coordinates in extended hex notation and y coordinates in the strip that the letter occupies.
@<Backtracking on generated table.@>=
;

