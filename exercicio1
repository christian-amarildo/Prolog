homem(ivo).
homem(gil).
homem(raí).
homem(ary).
homem(noé).

mulher(ana).
mulher(bia).
mulher(eva).
mulher(clô).
mulher(lia).
mulher(gal).

pai(ivo,eva).
pai(gil,raí).
pai(gil,clô).
pai(gil,ary).
pai(raí,noé).
pai(ary,gal).

mãe(ana,eva).
mãe(bia,raí).
mãe(bia,clô).
mãe(bia,ary).
mãe(eva,noé).
mãe(lia,gal).

% R3:
gerou(X,Y) :- pai(X, Y); mãe(X,Y).

% R4 e 5:
irmão(X, Y) :- pai(P, X), pai(P, Y), X \== Y, homem(X).
irmã(X, Y) :- pai(P, X), pai(P, Y), X \== Y, mulher(X).

% R6 e 7: to em duvida na ordem dos irmaos
tio(X , Y) :- pai(P, Y), mãe(M,Y), irmão(P, X), irmão(M,X) X \== Y, homem(X).
tia(X , Y) :- pai(P, Y), mãe(M,Y), irmão(X, P), irmão(X,M), X \== Y, mulher(X).

% R8 e 9:
avô(X, Y) :- pai(P, Y), mãe(M, Y), pai(X,P),mãe(X,M), homem(X).
avó(X, Y) :- pai(P, Y), mãe(M, Y), pai(X,P),mãe(X,M), mulher(X).

% R10:
casal(X,Y) :- pai(X, Z), mãe(Y, Z) ; pai(Y, Z), mãe(X, Z), X\== y.

% R11:
feliz(P) :- pai(P, X) ; mãe(P, X).
