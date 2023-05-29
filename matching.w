@** We're testing an answer's correctness from TAOCP.
@c
@* Program Structure
@<Import statements@>@;
@<Definition@>@;
@<Global variables@>@;
@<Procedures@>@;

@ @<Import statements@>=#include<stdio.h>
@ @<Definition@>=#define N 4
@ @<Global variables@>=char* match,leftofmatch,rightofmatch;

@ @<Procedures@>=int main(int ac,char* av){
@<Initialize@>;
@<Run matching@>@;
}
@ @<Initialize@>=char* sigma=av[1];int j=0,inputsize=0;
while(sigma[k]!="\0")inputsize++;
char* theta[N]={"aab","abb","ab","a"},phi[N]={"a","a","bb","b"};int a[N]={1,2,3,4},b[N]={0,1,4,3},sizes[N]={3,3,2,1};
@ @<Run matching@>=if(j==N){printf("%s\n",sigma);exit(0);}if(@<There's a match that's not null@>@;){sigma=leftofmatch+phi[j]+rightofmatch;j=b[j];}else j=a[j];@<Run matching@>@;
@ @<There's a match...@>=if(@<Match starting from sigma[i]@>@;)for(int k=0;k<i;k++)leftofmatch+=sigma[k];for(int k=i;k<i+sizes[j];k++)match=sigma[k];for(int k=i+sizes[j];k<inputsize;k++)rightofmatch=sigma[k];