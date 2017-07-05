#!/bin/bash -f
WYSZUKAJ=""
tekst()
{
echo "1) Plik o nazwie"
echo "2) Plik o katalogu"
echo "3) Plik utworzony w ciagu n dni"
echo "4) Plik utworony w ciagu m minut"
echo "5) Plik o rozmiarze"
echo "6) Zawartosc"
echo "7) wyszukaj"
echo "8) Wyjscie"
}
menu()
{
case $ZMIENNA in
1) nazwa;;
2) katalog;;
3) n;;
4) m;;
5) size;;
6) zawartosc;;
7) wyszukaj;;
8) wyjscie;;
*) echo "zly wobor";;
esac
}
 
m()
{
read m
}
 
nazwa()
{
read NAZWA
}
 
zawartosc()
{
echo "Podaj zawartosc ktorej szukasz"
read ZAWARTOSC
 }
 
 
katalog()
{
read KATALOG
}
 
n()
{
read n
}
 
size()
{
read size
}
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
echo find $WYSZUKAJ
find $WYSZUKAJ
}
 
wyjscie()
{
exit
}
 
ZMIENNA="0"
 
while [ $ZMIENNA != 8 ]
do
tekst
read ZMIENNA
menu ZMIENNA
done
 
exit
