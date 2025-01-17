%1- Utilize o predicado no_interno/1 para construir uma regra
%que retorne True se o nó passado como argumento da consulta
%for um nó interno.

raiz(15).
no(10, 15, 20).
no(5, 10, 9).
no(17, 20, 27).
no(nil, 5, 7).
no(25,27, nil).

no_interno(No) :- no(_,No,_), \+ no(nil,No,_), \+ no(_,No,nil).


%2- Utilize o predicado no_folha/1 para construir uma regra que
%retorne True se o nó passado como argumento da consulta for
%um nó folha. Se um determinado nó não possuir um dos filhos,
%a ausência é representada pelo átomo nil.

no_folha(No) :- no(nil,No,_), no(_,No,nil).


%3- Utilize o predicado filhos/1 para construir uma regra que
%informe os filhos da esquerda e da direita de um determinado
%nó. Para informar os filhos, utilize o predicado write/1. Utilize o
%seguinte padrão de mensagem:

filhos(No) :- 
(no_interno(No), write('filho da esquerda e direita') );
(no(_,No,nil), \+ no(nil,No,_), \+ no_interno(No), write('Nó esquerdo')) ;
\+ (no(_,No,nil), no(nil,No,_), \+ no_interno(No), write('Nó direito')). 


% 4- Utilize os predicados pre_ordem/0, pre_ordem/1, visita/1 e
% write/1 para construir regras que realizem a leitura da árvore
% em pré-ordem. O predicado de consulta é o pre_ordem/0. Para
% a árvore de base de conhecimento, a saída esperada é: 15 - 10
% - 5 - 7 - 9 - 20 - 17 - 27 - 25 -


pre_ordem(No) :- visita(No), 
				(no(Esq, No, Dir) -> 
                (Esq \= nil -> pre_ordem(Esq); true),
        		(Dir \= nil -> pre_ordem(Dir); true); true).

pre_ordem :- raiz(No), pre_ordem(No).

visita(No):- write(No), write(" - ").

% 5- Utilize os predicados in_ordem/0, in_ordem/1, visita/1 e
% write/1 para construir regras que realizem a leitura da árvore
% em ordem. O predicado de consulta é o in_ordem/0. Para a
% árvore de base de conhecimento, a saída esperada é: 5 - 7 - 10
% - 9 - 15 - 17 - 20 - 25 - 27 -


in_ordem:- raiz(No), in_ordem(No).

in_ordem(No) :- (no(Esq, No, Dir) -> 
        		(Esq \= nil -> in_ordem(Esq); true),
        		visita(No),
        		(Dir \= nil -> in_ordem(Dir); true);
                visita(No)).                    


% 6- Utilize os predicados pos_ordem/0, pos_ordem/1, visita/1 e
% write/1 para construir regras que realizem a leitura da árvore
% em pós-ordem. O predicado de consulta é o pos_ordem/0. Para
% a árvore de base de conhecimento, a saída esperada é: 7 - 5 - 9
% - 10 - 17 - 25 - 27 - 20 - 15 -

pos_ordem(No) :-
    (no(Esq, No, Dir) ->
        (Esq \= nil -> pos_ordem(Esq); true),
        (Dir \= nil -> pos_ordem(Dir); true),
        visita(No); 
    	visita(No)).

% Predicado pos_ordem/0 que inicia a leitura a partir da raiz.
pos_ordem :-
    raiz(No),
    pos_ordem(No).


% 7- Utilize os predicados nivel/2, nivel/3, para calcular o nível de
% um determinado nó. O predicado de consulta é o nivel/2, tal que
% o primeiro termo corresponde ao nó e o segundo termo à
% variável de resposta não instanciada. Se necessário, você pode
% criar mais regras com novos predicados.

nivel(No, NoAtual, NivelAtual, Nivel) :- 
    	(No = NoAtual -> Nivel = NivelAtual;
    	(no(Esq, NoAtual, Dir),      
        (Esq \= nil, nivel(No, Esq, NivelAtual + 1, Nivel)) ; 
        (Dir \= nil, nivel(No, Dir, NivelAtual + 1, Nivel)) 
      )
    ).

nivel(No, Nivel) :-
    raiz(Raiz),
    nivel(No, Raiz, 0, Nivel).

% 8- Utilize o predicado grau/2 para calcular o grau de um
% determinado nó da árvore. Ao realizar a consulta, o primeiro
% termo corresponde ao nó e o segundo termo à variável de
% resposta não instanciada.

grau(No, Grau) :-
    (no(Esq, No, Dir) ->
        ((Esq \= nil, Dir \= nil) -> Grau = 2 ;
         (Esq \= nil ; Dir \= nil) -> Grau = 1 ; 
         Grau = 0); 
    	 Grau = 0).  

%9- Utilize o predicado irmao/2 para informar o irmão de um
%determinado nó da árvore. Ao realizar a consulta, o primeiro
%termo corresponde ao nó e o segundo termo à variável de
%resposta não instanciada.

irmao(No, Irmao) :-
    no(No, Pai, Irmao),No \= nil,Irmao \= nil;
    no(Irmao, Pai, No),No \= nil,Irmao \= nil.


% 10- Utilize os predicados altura/1 e altura/2 para informar a
% altura da árvore. O predicado de consulta é o altura/1 e o seu
% termo corresponde à variável de resposta não instanciada.

altura(No, Altura) :-(no(Esq, No, Dir) ->
        (Esq \= nil -> altura(Esq, AlturaEsq); AlturaEsq = 0),
        (Dir \= nil -> altura(Dir, AlturaDir); AlturaDir = 0),
        Altura is max(AlturaEsq, AlturaDir) + 1 ; Altura = 0).

altura(Altura) :-
    raiz(Raiz),
    altura(Raiz, Altura).


%11- Utilize os predicados mais_a_esquerda/1 e
%mais_a_esquerda/2 para informar o nó mais a esquerda da
%árvore. O predicado de consulta é o mais_a_esquerda/1 e o seu
%termo corresponde à variável de resposta não instanciada.

mais_a_esquerda(No, MaisEsq) :-
    (no(Esq, No, _) ->
        (Esq \= nil -> mais_a_esquerda(Esq, MaisEsq); MaisEsq = No);
     MaisEsq = No).

% Predicado principal para encontrar o nó mais à esquerda da árvore.
mais_a_esquerda(MaisEsq) :-
    raiz(Raiz),
    mais_a_esquerda(Raiz, MaisEsq).
