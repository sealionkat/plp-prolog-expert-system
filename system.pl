:- dynamic car/15.

car("Nissan", "Primera", "P11", "1.6", "D", "GB", 1996, 2002, "FWD", "GA16DE", 1597, 90, 136, 12, 178).

add_car() :-
	write("Marka: "), read(Marka),
	write("Model: "), read(Model),
	write("Generacja: "), read(Gene),
	write("Typ: "), read(Typ),
	write("Segment: "), read(Seg),
	write("Kraj produkcji: "), read(Kraj),
	write("Rozpoczecie produkcji: "), read(Rozp),
	write("Zakonczenie produkcji: "), read(Zak),
	write("Naped: "), read(Naped),
	write("Silnik: "), read(Silnik),
	write("Pojemnosc: "), read(Poj),
	write("Moc max: "), read(Moc),
	write("Moment: "), read(Moment),
	write("Przyspieszenie 0-100 (s): "), read(Accel),
	write("V-Max: "), read(Vmax),
	assertz(car(Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax)).

remove_all_cars() :-
	write("Marka: "), read(Marka),
	write("Model: "), read(Model),
	write("Generacja: "), read(Gene),
	write("Typ: "), read(Typ),
	write("Segment: "), read(Seg),
	write("Kraj produkcji: "), read(Kraj),
	write("Rozpoczecie produkcji: "), read(Rozp),
	write("Zakonczenie produkcji: "), read(Zak),
	write("Naped: "), read(Naped),
	write("Silnik: "), read(Silnik),
	write("Pojemnosc: "), read(Poj),
	write("Moc max: "), read(Moc),
	write("Moment: "), read(Moment),
	write("Przyspieszenie 0-100 (s): "), read(Accel),
	write("V-Max: "), read(Vmax),
	retractall(car(Marka, Model, Gene, Typ, Seg, Kraj, Rozp, Zak, Naped, Silnik, Poj, Moc, Moment, Accel, Vmax)).
