
comercioAdherido(iguazu, grandHotelIguazu).
comercioAdherido(iguazu, gargantaDelDiabloTour).
comercioAdherido(bariloche, aerolineas).

%factura(Persona, DetalleFactura).
%Detalles de facturas posibles:
% hotel(ComercioAdherido, ImportePagado)
% excursion(ComercioAdherido, ImportePagadoTotal, CantidadPersonas)
% vuelo(NroVuelo,NombreCompleto)
factura(estanislao, hotel(grandHotelIguazu, 2000)).
factura(antonieta, excursion(gargantaDelDiabloTour, 5000, 4)).
factura(antonieta, vuelo(1515, antonietaPerez)).

valorMaximoHotel(5000).

%registroVuelo(NroVuelo,Destino,ComercioAdherido,Pasajeros,Precio)
registroVuelo(1515, iguazu, aerolineas, [estanislaoGarcia, antonietaPerez, danielIto], 10000).

% facturas  validas se devuelve: 
% hotles 50% del monto pagado , vuelos 30% del monto(salvo que el destino sea buenos aires , que no se devuelve nada) 
% y las excursiones un 80% del monto por persona (dividir cantidad de personas que participo ) , comercio no adherido (trucha),
% monto > precio por habitacion maximo(trucha). corresponde a vuelo donde no aparece nombre completo de la persona en el registro de vuelo(trucha).


saberMontoHotel(Persona , MontoHotel) :-
        factura(Persona , hotel(ComercioAdherido , ImportePagado) ),
        valorMaximoHotel(A), ImportePagado =< A ,
        MontoHotel is ImportePagado * 0.5 .

saberMontoExcursion(Persona , MontoExcursion) :-
        factura(Persona , excursion(ComercioAdherido , ImportePagadoTotal , CantidadPersonas) ),
        
        MontoExcursion is ImportePagado * 0.8 .

saberMontoVuelo(Persona , MontoVuelo) :-
        factura(Persona , vuelo(NroVuelo , NombreCompleto) ),
        registroVuelo(NroVuelo,Destino,ComercioAdherido,Pasajeros,Precio),
        
        MontoVuelo is ImportePagado * 0.5 .




montoAdevolveR(Persona , Monto) :-
       comercioAdherido(Destino , Comercio),
       factura(Persona , hotel(ComercioAdherido , ImportePagado) ), 
       Comercio = ComercioAdherido,
       saberMontoHotel(Persona, Monto);
       saberMontoExcuersion(Persona, Monto);
       saberMontoVuelo(Persona, Monto).


