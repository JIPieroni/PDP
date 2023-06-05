% TP individual
% % TP: horoscopo pdep
% según en que parte del año nacio una persona, le toca un paradigma diferente:
% desde el inicio de clases hasta ayer, funcional
% desde hoy hasta las vacaciones de invierno, logico
% segundo cuatrimestre objetos
% % resto del año, nada. 



nacio(nacho,bsas,26,6,1989).
nacio(tito,bsas,26,4,2000).
nacio(tita,bsas,27,4,2000).
nacio(lola,bsas,1,1,2001).


horoscopoPdeP(P, funcional) :-
    comienzoDeClases(P).

horoscopoPdeP(P, logico) :-
    desdeAyerHastaLasVacaciones(P).

horoscopoPdeP(P, objetos) :-
    enElSegundoCuatrimestre(P).

horoscopoPdeP(P, nada) :-
    restoDelAño(P).



comienzoDeClases(P) :-
    nacio(P, _, D, M, _),
    M =< 5 ,
    M >= 3,
    D >= 1,
    D =< 31.

desdeAyerHastaLasVacaciones(P) :-
    nacio(P, _, D, M, _),
    M =< 7,
    M >= 6,
    D >= 1,
    D =< 31.

enElSegundoCuatrimestre(P) :-
    nacio(P, _, D, M, _),
    M =< 12 ,
    M >= 8,
    D >= 1,
    D =< 31.

restoDelAño(P) :-
    nacio(P, _, D, M, _),
    M =< 2,
    M >= 1,
    D >= 1,
    D =< 31.

