:- dynamic car/15.

car('Nissan', 'Primera', 'P11', '1.6', 'D', 'GB', '1996', '2002', 'FWD', 'GA16DE', '1597', '90', '136', '12', '178').
car('Nissan', 'Primera', 'P10', '1.6', 'D', 'GB', '1990', '1998', 'FWD', 'R4/16', '1597', '90', '139', '11.9', '180').

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
    get_value_from_input(Typ, "Typ: ", SetIfNotEmpty),
    get_value_from_input(Seg, "Segment: ", SetIfNotEmpty),
    get_value_from_input(Kraj, "Kraj produkcji: ", SetIfNotEmpty),
    get_value_from_input(Rozp, "Rozpoczecie produkcji: ", SetIfNotEmpty),
    get_value_from_input(Zak, "Zakonczenie produkcji: ", SetIfNotEmpty),
    get_value_from_input(Naped, "Naped: ", SetIfNotEmpty),
    get_value_from_input(Silnik, "Silnik: ", SetIfNotEmpty),
    get_value_from_input(Poj, "Pojemnosc: ", SetIfNotEmpty),
    get_value_from_input(Moc, "Moc max: ", SetIfNotEmpty),
    get_value_from_input(Moment, "Moment: ", SetIfNotEmpty),
    get_value_from_input(Accel, "Przyspieszenie 0-100: ", SetIfNotEmpty),
    get_value_from_input(Vmax, "V-Max: ", SetIfNotEmpty).

add_car() :-
    write("Dodawanie nowego samochodu do bazy."), nl, nl,
    ask_for_input(false, Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax),
    assertz(car(Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax)).

remove_all_cars() :-
    write("Usuwanie samochodu z bazy."), nl, nl,
    ask_for_input(true, Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax),
    retractall(car(Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax)).
