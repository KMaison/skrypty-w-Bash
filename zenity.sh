#!/bin/bash

wyszukaj()
{
    WYSZUKAJ=" "
if [[ $KATALOG ]]; then
WYSZUKAJ+="$KATALOG " 
fi
 
if [[ $NAZWA ]]; then
WYSZUKAJ+="-name "$NAZWA" "
fi
 
if [ "$n" ]; then
WYSZUKAJ+="-ctime -$n "
fi
 
if [[ $m ]]; then
WYSZUKAJ+="-mmin -$m"
fi
 
if [[ $size ]]; then
WYSZUKAJ+="size $nc "
fi
 
if [[ $ZAWARTOSC ]]; then
WYSZUKAJ+=" -type f -exec grep -lH "$ZAWARTOSC" {} +"
fi
ZMIENNA=$(find $WYSZUKAJ)
odp=`zenity --info --title "tytuł" --text="$ZMIENNA"`
}
i=1
while [ $i == 1 ]
do
menu=("Nazwa $NAZWA" "Katalog" "Ile dni" "Ile minut" "Rozmiar" "Zawartosc $ZAWARTOSC" "Wyszukaj" "Wyjscie")
odp=`zenity --list --column=Menu "${menu[@]}" --height 370`

if [[ $odp == "Nazwa $NAZWA" ]]; then
NAZWA=`zenity --entry --title "WYSZUKIWARKA" --text "Podaj nazwe: "`
echo "Odpowiedź: $odp. Naciśnij Enter"
read
fi

if [[ $odp == "Katalog" ]]; then
KATALOG=`zenity --entry --title "WYSZUKIWARKA" --text "Podaj katalog: "`
echo "Odpowiedź: $odp. Naciśnij Enter"
read
fi

if [[ $odp == "Ile dni" ]]; then
n=`zenity --entry --title "WYSZUKIWARKA" --text "Podaj ilosc dni: "`
echo "Odpowiedź: $odp. Naciśnij Enter"
read
fi

if [[ $odp == "Ile minut" ]]; then
m=`zenity --entry --title "WYSZUKIWARKA" --text "Podaj ilosc minut: "`
echo "Odpowiedź: $odp. Naciśnij Enter"
read
fi

if [[ $odp == "Rozmiar" ]]; then
size=`zenity --entry --title "WYSZUKIWARKA" --text "Podaj rozmiar: "`
echo "Odpowiedź: $odp. Naciśnij Enter"
read
fi

if [[ $odp == "Zawartosc $ZAWARTOSC" ]]; then
ZAWARTOSC=`zenity --entry --title "WYSZUKIWARKA" --text "Podaj tekst: "`
echo "Odpowiedź: $odp. Naciśnij Enter"
read
fi

if [[ $odp == "Wyszukaj" ]]; then
wyszukaj
read
fi

if [[ $odp == "Wyjscie" ]]; then
exit
read
fi

done
