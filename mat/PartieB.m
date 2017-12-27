function PartieB()

%Lance les variables du fichier 1.m 

run('1.m')

% Le problème (P)

m=length(AA);
n=length(MM);

% La fonction objective 
object= @(x) objective(x,m,n,a,c); %a et c donnés par les scripts 

% Les contraintes
[A,b]=contraintes(m,n,AA,MM);

%Les variables 
ub = ones(2*m*n,1)';
ub(1:m*n)=Inf; 
lb = zeros(2*m*n,1)';
intervalle = m*n+1:1:2*m*n;

%ga 

ga(object,2*m*n,A,b,[],[],lb,ub,[],intervalle);

%patternsearch 



end 

function object=objective(X,m,n,a,c) % X est celui que l'on cherche 

x = zeros(m,n); % x de la fonction objective 
y = zeros(m,n); % y deinteger_values = m*n+1:1:2*m*n; la fonction objective 
o= zeros(m,n); %fonction objective 

for i=1:m 
    for j=1:n
        x(i,j) = X((i-1)*m+j);
        y(i,j) = X(m*n+(i-1)*m+j);
    end
end

for i=1:m
    o(i,:) = y(i:m:n*m).*(a(i:m:n*m) + c(i:m:n*m).*x(i:m:n*m)); 
end

for i=1:m
    object = object + sum(o(i,:));
end

end 

function [A,b]=contraintes(m,n,AA,MM)

% pour les contraintes il faut créer une matrice A et un vecteur b
A=zeros(m,n); %matrice des contraintes 
b=zeros(m,1); %second membre 




end 