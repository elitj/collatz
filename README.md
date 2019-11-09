# collatz
A short Sagemath script that generates the Collatz (directed) graph of all integers up to a set value.

To understand a Collatz sequence, start with any positive integer n.  If n happens to be even, the next number in the sequence will be n/2.  If n is odd, the next number will be 3n+1.  For example, starting with n=6, we get the sequence

6,3,10,5,16,8,4,2,1,4,2,1,4,2,1,...

It should be clear that the sequence eventually cycles through the numbers 4,2,1 without deviating.  A famous unsolved problem in mathematics says we will eventually arrive at this loop, no matter which positive integer we began with.  Some numbers take a very long time to get there!

This script contains functions:

collatzSeq(n) --- produces the Collatz Sequence beginning with the positive integer n

collatzAdjacency(n) --- begins with a (length n+1, one-dimensional) np.array of all zeros, then 
                        replaces the i-th value with either i/2 or 3i+1 depending on whether i is
                        even or odd respectively.  The array is lengthened as needed.  Terminates
                        when the sequences have been filled in for the first n positive integers.
                        This is more efficient than running collatzSeq n times, since computation
                        ends when a previously explored subsequence is reached.
                        
collatzDigraph(n) --- produces a directed graph (digraph) using the information present in 
                      collatzAdjacency(n). Each integer whose Collatz sequence has been checked 
                      becomes a vertex in the digraph, and there is an edge from i to j if the
                      integer j follows i in some sequence.  This function requires Sagemath, not 
                      simply Python.  The edge 1-->4 is not included, so unless you happen to
                      find a counterexample to the Collatz conjecture with this script (spoiler: 
                      you won't), the resulting object will always be a tree.
                      

More information on the mathematics can be found here:
https://en.wikipedia.org/wiki/Collatz_conjecture
https://en.wikipedia.org/wiki/Directed_graph
