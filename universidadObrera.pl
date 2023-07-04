

% trabaja(Persona , Trabajo(empleoPrivado(Empresa, Rubro),empleoPublico(Organismo, Dependencia, Rubro),planSocial(Organizacion)), CantHoras).
% estudia(Nombre,Carrera,Universidad).
% organizacion(Organizacion,Rubro).
% habilitacionProfesional(Carrera,ListaDeRubros).

trabaja(pedro, (empleoPrivado(ferrari, automotriz),_,_),_).
trabaja(lara,(_ , _ , planSocial(anses)),_).
trabaja(santiago, (_,empleoPublico(minesterioEducacion , profesor , educacion), _), _).

estudia(pedro,mecanica,utn).
estudia(lara,biologia,uba).
estudia(hugo,sistemas,utn).
estudia(santiago,filosofia,uba).
estudia(agustina,gastronomia,uade).
estudia(juan,matematica,itba).



% Punto 1

universidadesObreras(Universidad) :- 
estudia(Persona,_,Universidad),trabaja(Persona,(_,_,_),_).


% Punto 3

cantEstudiantes(Universidades , Total) :-
    findall(Universidad, estudia(_ ,_ ,Universidad), Universidades),
    length(Universidades, Total).

cantEstudiantesTrabajadores(Universidades , Total) :-
    findall(Universidad, universidadesObreras(Universidad), Universidades),
    length(Universidades , Total).
    
 calcularPorcentaje(Universidad , Porcentaje) :-
    
    cantEstudiantes(Universidades ,Total1) , cantEstudiantesTrabajadores(Universidades , Total2) ,
    member(Universidad, Universidades),
    Porcentaje is  Total2 / Total1 * 100 .
    










%  Punto 4 
% Ambiente Laboral



% organizacion(anses, _).
% organizacion(progresar, _).
% organizacion(_ ,automotriz).
% organizacion(_ ,sanidad).

% habilitacionProfesional(mecanica,[automotriz , energia , automatizacion ]).
% habilitacionProfesional(biologia,[botanica , bioquimica , fisiologia]).
% habilitacionProfesional(matematica,[informatica , contabilidad]).



% personasQueTrabajanEnAlgoVinculado(Persona) :-
%     trabaja(Persona, (empleoPrivado(Empresa, Rubro),empleoPublico(Organismo, Dependencia, Rubro),planSocial(Organizacion)), _),
%     estudia(Persona , Carrera , _),
%     organizacion(OrganizacionAsociada, RubroAsociado),
%     habilitacionProfesional(CarreraRelacionada , ListaDeRubros),
%     Rubro = RubroAsociado , Carrera = CarreraRelacionada , Organizacion = OrganizacionAsociada.




