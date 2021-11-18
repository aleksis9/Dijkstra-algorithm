function [cost] = dijkstra (G)
  PocetniCvor = input('Pocetni cvor: ')
  v = 1 : length(G.AdjMatrix);
  for u = v
    G.V(u).minTime = Inf;
    G.V(u).pred = NaN;
  end
  G.V(PocetniCvor).minTime = 0;
  
  Q = [];
  Q = [Q PocetniCvor];
  
  while ~isempty(Q)
    u = Q(1);
    Q(1) = [];
    
    for v = find(G.AdjMatrix(u, :))
      if (G.V(v).minTime > G.V(u).minTime + G.AdjMatrix(u, v))
        G.V(v).minTime = G.V(u).minTime + G.AdjMatrix(u, v);
        G.V(v).pred = u;
        Q = [Q v];
      end
    end
  end
  cost = []
  v = 1 : length(G.AdjMatrix);
  for u = v
    cost = [cost G.V(u).minTime];
  end
endfunction
