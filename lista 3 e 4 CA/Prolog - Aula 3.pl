raiz(15).
no(10, 15, 20).
no(5, 10, 9).
no(17, 20, 27).
no(nil, 5, 7).
no(25,27, nil).

% Questão 1
no_interno(No) :- no(_, No, _).

% Questão 2
no_folha(No) :- (no(No, _, _) ; no(_, _, No)), \+(no(_,No,_)), No \== nil.

% Questão 3
filhos(No) :- 	no(E, No, D), E \== nil, D \== nil,
    			write("Filho da esquerda e da direita: "),
    			write(E), write(" e "), write(D), !.
filhos(No) :- 	no(E, No, _), E \== nil,
    			write("Filho da esquerda: "),
    			write(E), !.
filhos(No) :- 	no(_, No, D), D \== nil,
    			write("Filho da direita: "),
    			write(D), !.
filhos(_No) :- 	write("Não tem filhos").

% Questão 4
visita(No) :- write(No), write(" - ").

pre_ordem :- raiz(Raiz), pre_ordem(Raiz).
pre_ordem(nil) :- !.
pre_ordem(No) :- no_folha(No), visita(No), !.
pre_ordem(No) :- no(E, No, D), visita(No), pre_ordem(E), pre_ordem(D).

% Questão 5
in_ordem :- raiz(Raiz), in_ordem(Raiz).
in_ordem(nil) :- !.
in_ordem(No) :- no_folha(No), visita(No), !.
in_ordem(No) :- no(E, No, D), in_ordem(E), visita(No), in_ordem(D).

% Questão 6 
pos_ordem :- raiz(Raiz), pos_ordem(Raiz).
pos_ordem(nil) :- !.
pos_ordem(No) :- no_folha(No), visita(No), !.
pos_ordem(No) :- no(E, No, D), pos_ordem(E), pos_ordem(D), visita(No).

% Questão 7
nivel(No, R) :- raiz(Raiz), nivel(No, Raiz, R).
% nivel(No, Atual, R)
nivel(No, No, 0) :- !.
nivel(No, Atual, R) :- no(E, Atual, _), nivel(No, E, R1), R is R1 + 1, !.
nivel(No, Atual, R) :- no(_, Atual, D), nivel(No, D, R1), R is R1 + 1.

% Questão 8
grau(No, 2) :- no(E, No, D), E \== nil, D \== nil, !.
grau(No, 1) :- no(E, No, _), E \== nil, !.
grau(No, 1) :- no(_, No, D), D \== nil, !.
grau(_No, 0).

% Questão 9
irmao(No, D) :- no(No, _, D), No \== nil, !.
irmao(No, E) :- no(E, _, No), No \== nil, !.
irmao(No, _R) :- raiz(No), write("O nó é a raiz, não possui irmão").

% Questão 10
altura(R) :- raiz(Raiz), altura(Raiz, R).
altura(nil, 0) :- !.
altura(Atual, 0) :- no_folha(Atual), !.
altura(Atual, R) :- no(E, Atual, D), altura(E, R1), altura(D, R2), R is 1 + max(R1, R2) .

% Questão 11
mais_a_esquerda(R) :- raiz(Raiz), mais_a_esquerda(Raiz, R).
mais_a_esquerda(nil, No) :- no(nil, No, _), !.
mais_a_esquerda(No, R) :- no(E, No, _), mais_a_esquerda(E, R1), R is R1.



























