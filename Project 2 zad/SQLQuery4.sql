CREATE TABLE Klienci (
    ID_Klienta INT PRIMARY KEY,
    Imie VARCHAR(50),
    Nazwisko VARCHAR(50),
    Email VARCHAR(100),
    NumerKontaktowy VARCHAR(20)
);
CREATE TABLE Produkty (
    ID_Produktu INT PRIMARY KEY,
    NazwaProduktu VARCHAR(100),
    Cena DECIMAL(10, 2),
    Kategoria VARCHAR(50)
);
CREATE TABLE UlubioneProdukty (
    ID_UlubionegoProduktu INT PRIMARY KEY,
    ID_Klienta INT,
    ID_Produktu INT,
    FOREIGN KEY (ID_Klienta) REFERENCES Klienci(ID_Klienta),
    FOREIGN KEY (ID_Produktu) REFERENCES Produkty(ID_Produktu)
);
CREATE TABLE Promocje (
    ID_Promocji INT PRIMARY KEY,
    NazwaPromocji VARCHAR(100),
    Opis VARCHAR(255),
    Rabat DECIMAL(5, 2)
);
CREATE TABLE KlientPromocje (
    ID_Klienta INT,
    ID_Promocji INT,
    PRIMARY KEY (ID_Klienta, ID_Promocji),
    FOREIGN KEY (ID_Klienta) REFERENCES Klienci(ID_Klienta),
    FOREIGN KEY (ID_Promocji) REFERENCES Promocje(ID_Promocji)
);
CREATE TABLE KategorieProduktow (
    ID_Kategorii INT PRIMARY KEY,
    NazwaKategorii VARCHAR(50)
);
CREATE TABLE ProduktKategorie (
    ID_Produktu INT,
    ID_Kategorii INT,
    PRIMARY KEY (ID_Produktu, ID_Kategorii),
    FOREIGN KEY (ID_Produktu) REFERENCES Produkty(ID_Produktu),
    FOREIGN KEY (ID_Kategorii) REFERENCES KategorieProduktow(ID_Kategorii)
);
CREATE TABLE Zamowienia (
    ID_Zamowienia INT PRIMARY KEY,
    ID_Klienta INT,
    DataZamowienia DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ID_Klienta) REFERENCES Klienci(ID_Klienta)
);
CREATE TABLE PozycjeZamowienia (
    ID_PozycjiZamowienia INT PRIMARY KEY,
    ID_Zamowienia INT,
    ID_Produktu INT,
    Ilosc INT,
    FOREIGN KEY (ID_Zamowienia) REFERENCES Zamowienia(ID_Zamowienia),
    FOREIGN KEY (ID_Produktu) REFERENCES Produkty(ID_Produktu)
);
CREATE TABLE Dostawcy (
    ID_Dostawcy INT PRIMARY KEY,
    NazwaDostawcy VARCHAR(100),
    Kontakt VARCHAR(50)
);
CREATE TABLE StanMagazynowy (
    ID_Produktu INT,
    ID_Dostawcy INT,
    Ilosc INT,
    FOREIGN KEY (ID_Produktu) REFERENCES Produkty(ID_Produktu),
    FOREIGN KEY (ID_Dostawcy) REFERENCES Dostawcy(ID_Dostawcy)
);
CREATE TABLE Reklamacje (
    ID_Reklamacji INT PRIMARY KEY,
    ID_Klienta INT,
    Opis VARCHAR(255),
    Status VARCHAR(50),
    FOREIGN KEY (ID_Klienta) REFERENCES Klienci(ID_Klienta)
);
CREATE TABLE AnalizyProduktow (
    ID_Analizy INT PRIMARY KEY,
    ID_Produktu INT,
    Sprzedaz INT,
    Zysk DECIMAL(10, 2),
    FOREIGN KEY (ID_Produktu) REFERENCES Produkty(ID_Produktu)
);
CREATE TABLE Menadzerowie (
    ID_Menadzera INT PRIMARY KEY,
    Imie VARCHAR(50),
    Nazwisko VARCHAR(50)
);
CREATE TABLE ZarzadzanieKategoriami (
    ID_Menadzera INT,
    ID_Kategorii INT,
    PRIMARY KEY (ID_Menadzera, ID_Kategorii),
    FOREIGN KEY (ID_Menadzera) REFERENCES Menadzerowie(ID_Menadzera),
    FOREIGN KEY (ID_Kategorii) REFERENCES KategorieProduktow(ID_Kategorii)
);
CREATE TABLE AnalizyProduktowMenadzerowie (
    ID_Analizy INT,
    ID_Menadzera INT,
    PRIMARY KEY (ID_Analizy, ID_Menadzera),
    FOREIGN KEY (ID_Analizy) REFERENCES AnalizyProduktow(ID_Analizy),
    FOREIGN KEY (ID_Menadzera) REFERENCES Menadzerowie(ID_Menadzera)
);
CREATE TABLE ZapytaniaIKontakty (
    ID_Zapytania INT PRIMARY KEY,
    ID_Klienta INT,
    Temat VARCHAR(100),
    Tresc TEXT,
    Odpowiedz TEXT,
    DataZapytania DATE,
    FOREIGN KEY (ID_Klienta) REFERENCES Klienci(ID_Klienta)
);
