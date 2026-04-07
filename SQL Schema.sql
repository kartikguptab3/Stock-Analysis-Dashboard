CREATE DATABASE US_Stocks;
USE US_Stocks;

CREATE TABLE Dim_Date (
    Date DATE PRIMARY KEY,
    Year INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    Quarter INT NOT NULL,
    Weekday VARCHAR(10) NOT NULL
);

CREATE TABLE Dim_Stock (
    Stock_ID INT IDENTITY(1,1) PRIMARY KEY,
    Stock_Name VARCHAR(10) NOT NULL UNIQUE,
    Company_Name VARCHAR(100) NOT NULL,
    Sector VARCHAR(50) NOT NULL
);

CREATE TABLE Fact_StockPrices (
    Date DATE NOT NULL,
    Stock_ID INT NOT NULL,
    Close_Price DECIMAL(12,4) NOT NULL,
    Daily_Return DECIMAL(10,6),

    CONSTRAINT PK_Fact_StockPrices PRIMARY KEY (Date, Stock_ID),

    CONSTRAINT FK_Fact_StockPrices_Date
        FOREIGN KEY (Date)
        REFERENCES Dim_Date(Date)
        ON DELETE CASCADE,

    CONSTRAINT FK_Fact_StockPrices_Stock
        FOREIGN KEY (Stock_ID)
        REFERENCES Dim_Stock(Stock_ID)
        ON DELETE CASCADE
);

CREATE TABLE Fact_SP500 (
    Date DATE PRIMARY KEY,
    Close_Price DECIMAL(12,4) NOT NULL,
    Daily_Return DECIMAL(10,6),

    CONSTRAINT FK_Fact_SP500_Date
        FOREIGN KEY (Date)
        REFERENCES Dim_Date(Date)
        ON DELETE CASCADE
)


