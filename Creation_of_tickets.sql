create database Ticket_Management
use Ticket_Management

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    Status VARCHAR(50) NOT NULL,
    Priority VARCHAR(50) NOT NULL,
    CreatorID INT NOT NULL,
    AssigneeID INT,
    CreatedAt DATETIME2 DEFAULT GETDATE(),
    UpdatedAt DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (CreatorID) REFERENCES Users(UserID),
    FOREIGN KEY (AssigneeID) REFERENCES Users(UserID)
);


CREATE TABLE Comments (
    CommentID INT PRIMARY KEY,
    TicketID INT NOT NULL,
    CommentText TEXT NOT NULL,
    CommenterID INT NOT NULL,
    CommentedAt DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID),
    FOREIGN KEY (CommenterID) REFERENCES Users(UserID)
);
CREATE TABLE UserRoles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL
);
CREATE TABLE TicketCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE TicketHistory (
    HistoryID INT PRIMARY KEY,
    TicketID INT NOT NULL,
    ModificationDate DATETIME2 NOT NULL,
    ModifiedBy INT NOT NULL,
    FieldName VARCHAR(255) NOT NULL,
    OldValue VARCHAR(MAX),
    NewValue VARCHAR(MAX),
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID),
    FOREIGN KEY (ModifiedBy) REFERENCES Users(UserID)
);

CREATE TABLE Permissions (
    PermissionID INT PRIMARY KEY,
    PermissionName VARCHAR(50) NOT NULL
);


CREATE TABLE RolePermission (
    RolePermissionID INT PRIMARY KEY,
    RoleID INT NOT NULL,
    PermissionID INT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES UserRoles(RoleID),
    FOREIGN KEY (PermissionID) REFERENCES Permissions(PermissionID)
);











