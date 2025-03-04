USE [master]
GO
/****** Object:  Database [SklepInternetowy]    Script Date: 17.12.2023 04:43:16 ******/
CREATE DATABASE [SklepInternetowy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SklepInternetowy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SklepInternetowy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SklepInternetowy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SklepInternetowy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SklepInternetowy] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SklepInternetowy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SklepInternetowy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SklepInternetowy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SklepInternetowy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SklepInternetowy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SklepInternetowy] SET ARITHABORT OFF 
GO
ALTER DATABASE [SklepInternetowy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SklepInternetowy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SklepInternetowy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SklepInternetowy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SklepInternetowy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SklepInternetowy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SklepInternetowy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SklepInternetowy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SklepInternetowy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SklepInternetowy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SklepInternetowy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SklepInternetowy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SklepInternetowy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SklepInternetowy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SklepInternetowy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SklepInternetowy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SklepInternetowy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SklepInternetowy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SklepInternetowy] SET  MULTI_USER 
GO
ALTER DATABASE [SklepInternetowy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SklepInternetowy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SklepInternetowy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SklepInternetowy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SklepInternetowy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SklepInternetowy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SklepInternetowy] SET QUERY_STORE = ON
GO
ALTER DATABASE [SklepInternetowy] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SklepInternetowy]
GO
/****** Object:  Table [dbo].[AnalizyProduktow]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalizyProduktow](
	[ID_Analizy] [int] NOT NULL,
	[ID_Produktu] [int] NULL,
	[Sprzedaz] [int] NULL,
	[Zysk] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Analizy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnalizyProduktowMenadzerowie]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalizyProduktowMenadzerowie](
	[ID_Analizy] [int] NOT NULL,
	[ID_Menadzera] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Analizy] ASC,
	[ID_Menadzera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dostawcy]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dostawcy](
	[ID_Dostawcy] [int] NOT NULL,
	[NazwaDostawcy] [varchar](100) NULL,
	[Kontakt] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Dostawcy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KategorieProduktow]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KategorieProduktow](
	[ID_Kategorii] [int] NOT NULL,
	[NazwaKategorii] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Kategorii] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[ID_Klienta] [int] NOT NULL,
	[Imie] [varchar](50) NULL,
	[Nazwisko] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[NumerKontaktowy] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KlientPromocje]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KlientPromocje](
	[ID_Klienta] [int] NOT NULL,
	[ID_Promocji] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Klienta] ASC,
	[ID_Promocji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menadzerowie]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menadzerowie](
	[ID_Menadzera] [int] NOT NULL,
	[Imie] [varchar](50) NULL,
	[Nazwisko] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Menadzera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PozycjeZamowienia]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PozycjeZamowienia](
	[ID_PozycjiZamowienia] [int] NOT NULL,
	[ID_Zamowienia] [int] NULL,
	[ID_Produktu] [int] NULL,
	[Ilosc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PozycjiZamowienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduktKategorie]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduktKategorie](
	[ID_Produktu] [int] NOT NULL,
	[ID_Kategorii] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Produktu] ASC,
	[ID_Kategorii] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkty]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkty](
	[ID_Produktu] [int] NOT NULL,
	[NazwaProduktu] [varchar](100) NULL,
	[Cena] [decimal](10, 2) NULL,
	[Kategoria] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Produktu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocje]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocje](
	[ID_Promocji] [int] NOT NULL,
	[NazwaPromocji] [varchar](100) NULL,
	[Opis] [varchar](255) NULL,
	[Rabat] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Promocji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reklamacje]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reklamacje](
	[ID_Reklamacji] [int] NOT NULL,
	[ID_Klienta] [int] NULL,
	[Opis] [varchar](255) NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Reklamacji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StanMagazynowy]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StanMagazynowy](
	[ID_Produktu] [int] NULL,
	[ID_Dostawcy] [int] NULL,
	[Ilosc] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UlubioneProdukty]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UlubioneProdukty](
	[ID_UlubionegoProduktu] [int] NOT NULL,
	[ID_Klienta] [int] NULL,
	[ID_Produktu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_UlubionegoProduktu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zamowienia]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamowienia](
	[ID_Zamowienia] [int] NOT NULL,
	[ID_Klienta] [int] NULL,
	[DataZamowienia] [date] NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Zamowienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZapytaniaIKontakty]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZapytaniaIKontakty](
	[ID_Zapytania] [int] NOT NULL,
	[ID_Klienta] [int] NULL,
	[Temat] [varchar](100) NULL,
	[Tresc] [text] NULL,
	[Odpowiedz] [text] NULL,
	[DataZapytania] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Zapytania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZarzadzanieKategoriami]    Script Date: 17.12.2023 04:43:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZarzadzanieKategoriami](
	[ID_Menadzera] [int] NOT NULL,
	[ID_Kategorii] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Menadzera] ASC,
	[ID_Kategorii] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnalizyProduktow]  WITH CHECK ADD FOREIGN KEY([ID_Produktu])
REFERENCES [dbo].[Produkty] ([ID_Produktu])
GO
ALTER TABLE [dbo].[AnalizyProduktowMenadzerowie]  WITH CHECK ADD FOREIGN KEY([ID_Analizy])
REFERENCES [dbo].[AnalizyProduktow] ([ID_Analizy])
GO
ALTER TABLE [dbo].[AnalizyProduktowMenadzerowie]  WITH CHECK ADD FOREIGN KEY([ID_Menadzera])
REFERENCES [dbo].[Menadzerowie] ([ID_Menadzera])
GO
ALTER TABLE [dbo].[KlientPromocje]  WITH CHECK ADD FOREIGN KEY([ID_Klienta])
REFERENCES [dbo].[Klienci] ([ID_Klienta])
GO
ALTER TABLE [dbo].[KlientPromocje]  WITH CHECK ADD FOREIGN KEY([ID_Promocji])
REFERENCES [dbo].[Promocje] ([ID_Promocji])
GO
ALTER TABLE [dbo].[PozycjeZamowienia]  WITH CHECK ADD FOREIGN KEY([ID_Produktu])
REFERENCES [dbo].[Produkty] ([ID_Produktu])
GO
ALTER TABLE [dbo].[PozycjeZamowienia]  WITH CHECK ADD FOREIGN KEY([ID_Zamowienia])
REFERENCES [dbo].[Zamowienia] ([ID_Zamowienia])
GO
ALTER TABLE [dbo].[ProduktKategorie]  WITH CHECK ADD FOREIGN KEY([ID_Kategorii])
REFERENCES [dbo].[KategorieProduktow] ([ID_Kategorii])
GO
ALTER TABLE [dbo].[ProduktKategorie]  WITH CHECK ADD FOREIGN KEY([ID_Produktu])
REFERENCES [dbo].[Produkty] ([ID_Produktu])
GO
ALTER TABLE [dbo].[Reklamacje]  WITH CHECK ADD FOREIGN KEY([ID_Klienta])
REFERENCES [dbo].[Klienci] ([ID_Klienta])
GO
ALTER TABLE [dbo].[StanMagazynowy]  WITH CHECK ADD FOREIGN KEY([ID_Dostawcy])
REFERENCES [dbo].[Dostawcy] ([ID_Dostawcy])
GO
ALTER TABLE [dbo].[StanMagazynowy]  WITH CHECK ADD FOREIGN KEY([ID_Produktu])
REFERENCES [dbo].[Produkty] ([ID_Produktu])
GO
ALTER TABLE [dbo].[UlubioneProdukty]  WITH CHECK ADD FOREIGN KEY([ID_Klienta])
REFERENCES [dbo].[Klienci] ([ID_Klienta])
GO
ALTER TABLE [dbo].[UlubioneProdukty]  WITH CHECK ADD FOREIGN KEY([ID_Produktu])
REFERENCES [dbo].[Produkty] ([ID_Produktu])
GO
ALTER TABLE [dbo].[Zamowienia]  WITH CHECK ADD FOREIGN KEY([ID_Klienta])
REFERENCES [dbo].[Klienci] ([ID_Klienta])
GO
ALTER TABLE [dbo].[ZapytaniaIKontakty]  WITH CHECK ADD FOREIGN KEY([ID_Klienta])
REFERENCES [dbo].[Klienci] ([ID_Klienta])
GO
ALTER TABLE [dbo].[ZarzadzanieKategoriami]  WITH CHECK ADD FOREIGN KEY([ID_Kategorii])
REFERENCES [dbo].[KategorieProduktow] ([ID_Kategorii])
GO
ALTER TABLE [dbo].[ZarzadzanieKategoriami]  WITH CHECK ADD FOREIGN KEY([ID_Menadzera])
REFERENCES [dbo].[Menadzerowie] ([ID_Menadzera])
GO
USE [master]
GO
ALTER DATABASE [SklepInternetowy] SET  READ_WRITE 
GO
