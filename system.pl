:- dynamic car/15.

car('Opel', 'Meriva', 'A', 'MINIVAN', 'K', 'E', '2002', '2010', 'FWD', 'BENZYNOWY', '1598', '87', '138', '14.5', '169').
car('Nissan', 'Primera', 'P11',	'LIFTBACK', 'D', 'GB', '1996', '2002', 'FWD', 'BENZYNOWY', '1597', '90', '136', '12', '178').
car('Opel', 'Astra Classic', 'F', 'SEDAN', 'C', 'PL', '1991', '2002', 'FWD',
 'BENZYNOWY', '1389', '82', '115', '15', '160').
car('Volkswagen', 'Golf Variant', 'VI', 'KOMBI', 'C', 'DE', '2009', '2013', 'FWD', 'BENZYNOWY', '1390', '122', '200', '9.5', '200').
car('Skoda', 'Octavia', 'I', 'LIFTBACK', 'C', 'PL', '1996', '2010', 'FWD', 'DIESEL', '1896', '90', '210', '12.1', '195').
car('Ford', 'Focus', 'II', 'KOMBI', 'C', 'DE', '2004', '2011', 'FWD', 'BENZYNOWY', '1390', '80', '115', '12.5', '190').
car('Kia', 'CEED', 'I', 'HATCHBACK', 'C', 'SI', '2006', '2012', 'FWD', 'BENZYNOWY', '1396', '109', '137', '11.6', '187').
car('Opel', 'Insignia', 'A', 'SEDAN', 'D', 'DE', '2008', '2017', 'FWD', 'DIESEL', '1956', '110', '260', '12.1', '190').
car('Ford', 'Ka', 'II', 'HATCHBACK', 'A', 'PL', '2008', 'x', 'FWD', 'DIESEL', '1248', '69', '102', '13', '185').
car('Volkswagen', 'Lupo', 'I', 'HATCHBACK', 'A', 'DE', '1998', '2005', 'FWD', 'BENZYNOWY', '997', '50', '84',  '18', '152').




set_if_not_empty(Var, _, SetIfNotEmpty) :-
    SetIfNotEmpty,
    atom_length(Var, 0).

set_if_not_empty(Var, X, _) :-
    X = Var.

get_value_from_input(Var, Text, SetIfNotEmpty) :-
    write(Text),
    read_line_to_codes(user_input, VarCodes),
    atom_codes(VarAtom, VarCodes),
    set_if_not_empty(VarAtom, Var, SetIfNotEmpty).

ask_for_input(SetIfNotEmpty, Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax) :-
    get_value_from_input(Marka, "Marka: ", SetIfNotEmpty),
    get_value_from_input(Model, "Model: ", SetIfNotEmpty),
    get_value_from_input(Gene, "Generacja: ", SetIfNotEmpty),
    get_value_from_input(Typ, "Typ nadwozia: ", SetIfNotEmpty), % HATCHBACK/SEDAN/COMBI/CABRIO/MINIVAN/PICKUP/LIFTBACK
    get_value_from_input(Seg, "Segment: ", SetIfNotEmpty),
    get_value_from_input(Kraj, "Kraj produkcji (kod kraju): ", SetIfNotEmpty), % Kod kraju
    get_value_from_input(Rozp, "Rozpoczecie produkcji: ", SetIfNotEmpty),
    get_value_from_input(Zak, "Zakonczenie produkcji: ", SetIfNotEmpty),
    get_value_from_input(Naped, "Naped: ", SetIfNotEmpty), % FWD/RWD/4WD
    get_value_from_input(Silnik, "Silnik: ", SetIfNotEmpty), % DIESEL/BENZYNOWY/ELEKTRYCZNY/HYBRYDOWY
    get_value_from_input(Poj, "Pojemnosc: ", SetIfNotEmpty),
    get_value_from_input(Moc, "Moc maks. (konie mechaniczne): ", SetIfNotEmpty),
    get_value_from_input(Moment, "Moment (Nm na min.): ", SetIfNotEmpty),
    get_value_from_input(Accel, "Przyspieszenie 0-100 km/h (s): ", SetIfNotEmpty),
    get_value_from_input(Vmax, "Predkosc maks (km/h).: ", SetIfNotEmpty).

add_car() :-
    write("Dodawanie nowego samochodu do bazy."), nl, nl,
    ask_for_input(false, Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax),
    assertz(car(Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax)).

remove_cars() :-
    write("Usuwanie samochodu z bazy."), nl, nl,
    ask_for_input(true, Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax),
    retractall(car(Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax)).

search_by_mark() :-
    get_value_from_input(Marka, "Podaj marke: ", true), nl,
    findall([Marka, Model, Generacja], car(Marka, Model, Generacja, _, _, _, _, _, _, _, _, _, _, _, _), Cars),
    sort(Cars, UniqueCars),
    length(UniqueCars, CarsLen),
    writef('Znalezione samochody [%w]:\n', [CarsLen]),
    foreach(member(CarInfo, UniqueCars), writef('\t%w %w %w\n', CarInfo)).

search_by_mm() :-
    get_value_from_input(Marka, "Podaj marke: ", true),
    get_value_from_input(Model, "Podaj model: ", true),
    nl,
    findall([Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax], car(Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax), Cars),
    sort(Cars, UniqueCars),
    length(UniqueCars, CarsLen),
    writef('Znalezione samochody [%w]:\n', [CarsLen]),
    foreach(member(CarInfo, UniqueCars), writef('\t%w %w %w %w\n\tSegment: %w\n\tKraj produkcji: %w\n\tLata produkcji: %w - %w\n\tNaped: %w\n\tSilnik: %w; Pojemnosc: %w cm3\n\tMoc: %w KM; Moment: %w Nm\n\tPrzyspieszenie (0-100): %w s; Predkosc maks.: %w km/h\n\n', CarInfo)).

search_cars_by_segment() :-
    get_value_from_input(Segment, "Podaj segment: ", true), nl,
    findall([Marka, Model, Generacja], car(Marka, Model, Generacja, _, Segment, _, _, _, _, _, _, _, _, _, _), Cars),
    sort(Cars, UniqueCars),
    length(UniqueCars, CarsLen),
    writef('Znalezione samochody w segmencie %w [%w]:\n', [Segment, CarsLen]),
    foreach(member(CarInfo, UniqueCars), writef('\t%w %w %w\n', CarInfo)).

search_cars_by_country() :-
    get_value_from_input(Country, "Podaj kod kraju: ", true), nl,
    findall([Marka, Model, Generacja], car(Marka, Model, Generacja, _, _, Country, _, _, _, _, _, _, _, _, _), Cars),
    sort(Cars, UniqueCars),
    length(UniqueCars, CarsLen),
    writef('Znalezione samochody wyprodukowane w kraju %w [%w]:\n', [Country, CarsLen]),
    foreach(member(CarInfo, UniqueCars), writef('\t%w %w %w\n', CarInfo)).

search_cars_by_type() :-
    get_value_from_input(Type, "Podaj typ nadwozia: ", true), nl,
    findall([Marka, Model, Generacja], car(Marka, Model, Generacja, Type, _, _, _, _, _, _, _, _, _, _, _), Cars),
    sort(Cars, UniqueCars),
    length(UniqueCars, CarsLen),
    writef('Znalezione samochody z typem nadwozia %w [%w]:\n', [Type, CarsLen]),
    foreach(member(CarInfo, UniqueCars), writef('\t%w %w %w\n', CarInfo)).

search_cars_by_drive() :-
    get_value_from_input(Type, "Podaj typ napedu (FWD/RWD/4WD): ", true), nl,
    findall([Marka, Model, Generacja], car(Marka, Model, Generacja, _, _, _, _, _, Type, _, _, _, _, _, _), Cars),
    sort(Cars, UniqueCars),
    length(UniqueCars, CarsLen),
    writef('Znalezione samochody z typem napedu %w [%w]:\n', [Type, CarsLen]),
    foreach(member(CarInfo, UniqueCars), writef('\t%w %w %w\n', CarInfo)).
    
search_cars_by_engine() :-
    get_value_from_input(Type, "Podaj typ silnika (DIESEL/BENZYNOWY/ELEKTRYCZNY/HYBRYDOWY): ", true), nl,
    findall([Marka, Model, Generacja], car(Marka, Model, Generacja, _, _, _, _, _, _, Type, _, _, _, _, _), Cars),
    sort(Cars, UniqueCars),
    length(UniqueCars, CarsLen),
    writef('Znalezione samochody z typem silnika %w [%w]:\n', [Type, CarsLen]),
    foreach(member(CarInfo, UniqueCars), writef('\t%w %w %w\n', CarInfo)).