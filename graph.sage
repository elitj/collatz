import numpy as np

def collatzSeq(integer):
    try:
        assert integer>0 and isinstance(integer,int)
        seq = [integer]
        current = integer
        while current>1:
            if current % 2 == 0:
                current //= 2
            else:
                current = 3*current+1
            seq.append(current)
        return seq
    except AssertionError:
        print("Function collatzSeq was passed a value that was not a positive integer.")
        
def collatzAdjacency(upper_bound):
    adj_array = np.zeros((upper_bound+1,),dtype=int)
    for i in range(1,upper_bound+1):
        j = i
        while adj_array[j]==0:
            if j % 2 == 0:
                k = j//2
                adj_array[j] = k
                j = k
            else:
                k = 3*j+1
                if k>adj_array.size-1:
                    new_range = np.zeros((k-adj_array.size+1,),dtype=int)   
                    adj_array = np.concatenate((adj_array,new_range))
                adj_array[j] = k
                j = k
    return adj_array

#this excludes the edge (1,4), meaning the digraph will always be a tree (at least if the Collatz conjecture is true!)
def collatzDigraph(greatest_initial_integer):
    adj = collatzAdjacency(greatest_initial_integer)
    verts = np.nonzero(adj)[0]
    edges = [(verts[i],adj[verts[i]]) for i in range(1,len(verts))]
    graf = DiGraph(edges)
    return graf
    
    
# Digraphs can be plotted in Sage using my_graph.plot().  If plotted using layout = 'tree', 
# the root should automatically be the vertex 1.
