freq(X, [X|T], F) :- freq(X, T, F1), F is F1 + 1, !.
freq(X, [_H|T], F) :- freq(X, T, F), !.
freq(_X, [], 0).

concat([H1|T1], L2, [H1| T3]) :- concat(T1, L2, T3), !.
concat([], L2, L2).

concat_2([H1|T1], [H2|T2], [H1, H2| T3]) :- concat_2(T1, T2, T3), !.
concat_2([], L2, L2).
concat_2(L1, [], L1).

somar([H|T], S) :- somar(T, S1), S is S1 + H, !.
somar([], 0).

somar_linhas_matriz([H1|T1], [S|T]) :- somar(H1, S),somar_linhas_matriz(T1, T), !.
somar_linhas_matriz([], []).

ultimo([_H|T], U) :- ultimo(T, U), !.
ultimo([H|[]], H).

contar_contiguos([A, A|T], R) :- contar_contiguos([A|T], R1), R is R1 + 1, !.
contar_contiguos([_A, B|T], R) :- contar_contiguos([B|T], R), !.
contar_contiguos([_H|[]], 0).

lista_reversa(L, R) :- lista_reversa(L, [], R).
lista_reversa([H|T], Aux, R) :- lista_reversa(T, [H|Aux], R), !.
lista_reversa([], R, R).

contem(X, [X|_T]) :- !.
contem(X, [_H|T]) :- contem(X, T).

duplicados(L, R) :- duplicados(L, [], R).
duplicados([H|T], Aux, R) :- freq(H, T, F), F > 0, \+contem(H, Aux), duplicados(T, [H|Aux], R), !.
duplicados([_H|T], Aux, R) :- duplicados(T, Aux, R), !.
duplicados([], Aux, R) :- lista_reversa(Aux, R).

eliminar_duplicados(L, R) :- eliminar_duplicados(L, [], R).
eliminar_duplicados([H|T], Aux, R) :- \+contem(H, Aux), eliminar_duplicados(T, [H|Aux], R), !.
eliminar_duplicados([_H|T], Aux, R) :- eliminar_duplicados(T, Aux, R), !.
eliminar_duplicados([], Aux, R) :- lista_reversa(Aux, R).




























