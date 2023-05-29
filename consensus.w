\datethis

@** CrossGov Foundation. MIT License. Consensus about a piece of information. This is the consensus algorithm for nodes in a blockchain to agree on a certain value. We are using this algorithm to determine the price of the Big Mac in each unique govermental jurisdiction. This will allow us to create a stable coin that's not pegged to the dollar and isn't beholden to supply and demand volatility because the nodes will issue coin to increase free fleat supply that will stabilize the free float price of the coin.
@c
@ The structure of the program.
@<Include statements@>@;
@<Definitions@>@;
@<Global variables@>@;
@<Dummy values@>@;
@<Main function@>@;
@<Procedures@>@;
@ Include the libraries required in this program.
@<Include...@>=
#include <stdio.h>
@ Defining the constants like the number of nodes n.
@<Definitions@>=
#define n 10
#define MAX_CONSENSUS_BITS 10000000
#define MAX_VAL 1-1<<MAX_CONSENSUS_BITS+1
@ Declaring the global variables |nodes_records| to store the information to be consensed, and |confirm_permutation| for the permutation of the chornology of that node's value entry.
@<Global variables@>=
int nodes_records[n],confirm_permutation[n],count[MAX_VAL][n]
@ Dummy values to run the algorithm for n=10.
@<Dummy values@>=
nodes_records={23,2,87,869,23,23,87,869,126,2},confirm_permutation={8,3,4,0,1,5,6,2,7,9};

@ The main function, which is the entry point.
int main(int argc,char** argv){
@<Run consensus@>;}

@ We need to find the counts of each unique value and the permutations of those counts.
@<Run consensus@>=
@<Get permutations@>;












@ Index the nodes_records in |uniques|. The |count|, count[j][k]=1 where j is the index in unique and k are the |confirm_permutations| of the uniques[j].
@<Get permutations.@>=
@<Initialize.@>;
findmatch:@<Find match in uniques.@>;
@<Terminate?@>;
@ Initialize
@<Initialize.@>=
int uniques[n],count[n][n],l=0,s=0;for(int i;i<n;i++)uniques[i]=-1;for(int j;j<n;j++)for(int k;k<n;k++)count[j][k]=0;
@<Find match...@>=
for(int i=0;i<n;i++)if(nodes_records[l]==uniques[i])count[l][confirm_permutation[i]]=1 else uniques[s]=nodes_records[l];s++;
@<Terminate?@>=
l++;if(l!=n)goto findmatch;

