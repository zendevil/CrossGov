/*1:*/
#line 4 "combinations.w"

/*2:*/
#line 11 "combinations.w"

#include<stdio.h>  
#include<stdlib.h>  

/*:2*/
#line 5 "combinations.w"

/*3:*/
#line 16 "combinations.w"

#define T 7
#define V 4


/*:3*/
#line 6 "combinations.w"

/*4:*/
#line 22 "combinations.w"

int a[T+1];


/*:4*/
#line 7 "combinations.w"

/*5:*/
#line 27 "combinations.w"

int main(){
/*9:*/
#line 41 "combinations.w"

int i;for(int k= 1;k<=T;k++)a[k]= 1;
/*:9*/
#line 29 "combinations.w"
;
ended:/*10:*/
#line 44 "combinations.w"

if(i==0)exit(0);

/*:10*/
#line 30 "combinations.w"
;
combine:/*11:*/
#line 48 "combinations.w"

for(int m= 1;m<=T;m++)printf("%d",a[m]);printf("\n");/*:11*/
#line 31 "combinations.w"
;
i= T;
next:/*6:*/
#line 36 "combinations.w"

if(a[i]<V){/*7:*/
#line 38 "combinations.w"
a[i]++;
/*:7*/
#line 37 "combinations.w"
;/*8:*/
#line 39 "combinations.w"
for(int j= i+1;j<=T;j++)a[j]= 1;
/*:8*/
#line 37 "combinations.w"
;goto ended;}else{i--;goto next;}
/*:6*/
#line 33 "combinations.w"
;
}

/*:5*/
#line 8 "combinations.w"


/*:1*/
