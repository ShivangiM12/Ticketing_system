--Retrieve all the open tickets
SELECT * FROM Tickets WHERE Status = 'Open';


-- Count Comments for a Specific Ticket:
select count(*) from comments where TicketID = 4

--retrieve tickethistory for the specific user
SELECT * FROM TicketHistory WHERE TicketID = 2;
--retrieve assigned ticket
SELECT * FROM Tickets WHERE AssigneeID = 2;
--user comment
SELECT * FROM Comments WHERE CommenterID = 4;


--high priority tickets
SELECT * FROM Tickets WHERE Priority = 'High';

-- What permissions are associated with a specific role (eg. RoleID = 1)?
SELECT P.PermissionName
FROM Permissions P
JOIN RolePermission RP
ON P.PermissionID = RP.PermissionID
WHERE RP.RoleID = 1;

--update status of the ticket
UPDATE Tickets
SET Status = 'In Progress'
WHERE TicketID = 3;

--insert new comment
INSERT INTO Comments (TicketID, CommentText, CommenterID)
VALUES (4, 'This is a new comment', 6);

--which user have tickets assigned
SELECT * FROM Users
WHERE UserID IN (SELECT DISTINCT AssigneeID FROM Tickets WHERE AssigneeID IS NOT NULL);

--not assigned tickets
SELECT * FROM Users
WHERE UserID NOT IN (SELECT DISTINCT AssigneeID FROM Tickets WHERE AssigneeID IS NOT NULL);

--which tkt updated within 24 hour
SELECT * FROM Tickets
WHERE UpdatedAt >= DATEADD(HOUR, -24, GETDATE());



--insert new comment
INSERT INTO Comments (CommentID, TicketID, CommentText, CommenterID)
VALUES (16, 4, 'This is a new comment', 6);


--ticket,title and their description
SELECT TicketID, Title, Description
FROM Tickets;

--count the no of status of each ticket
SELECT Status, COUNT(*) AS Total
FROM Tickets
GROUP BY Status;

--search tickets 
SELECT TicketID, Title, Description
FROM Tickets
WHERE Title LIKE '%titl%' OR Description LIKE '%fo%';

--ticket created by specific user
SELECT TicketID, Title, Status
FROM Tickets
WHERE CreatorID = 2;

--user made comments 
SELECT DISTINCT T.TicketID, T.Title, T.Status
FROM Tickets T
JOIN Comments C ON T.TicketID = C.TicketID
WHERE C.CommenterID = 3;


--count the no of comments
SELECT T.TicketID, T.Title, COUNT(C.CommentID) AS CommentCount
FROM Tickets T
LEFT JOIN Comments C ON T.TicketID = C.TicketID
GROUP BY T.TicketID, T.Title;

--most recently created ticket
SELECT TOP 5 TicketID, Title, CreatedAt
FROM Tickets
ORDER BY CreatedAt DESC;

--user and their roles
SELECT U.UserID, U.Username, R.RoleName
FROM Users U
LEFT JOIN UserRolesToUser UR ON U.UserID = UR.UserID
LEFT JOIN UserRoles R ON UR.RoleID = R.RoleID;

--count each user in each role
SELECT R.RoleName, COUNT(U.UserID) AS UserCount
FROM Users U
LEFT JOIN UserRolesToUser UR ON U.UserID = UR.UserID
LEFT JOIN UserRoles R ON UR.RoleID = R.RoleID
GROUP BY R.RoleName;

--Listall those users who have made comments, along with the number of comments they've made.
SELECT U.UserID, U.Username, COUNT(C.CommentID) AS CommentCount
FROM Users U
LEFT JOIN Comments C ON U.UserID = C.CommenterID
GROUP BY U.UserID, U.Username;

--with no comments by the user
SELECT U.UserID, U.Username
FROM Users U
LEFT JOIN Comments C ON U.UserID = C.CommenterID
WHERE C.CommentID IS NULL;


--List users and the most recent date they made a comment.
SELECT U.UserID, U.Username, MAX(C.CommentedAt) AS MostRecentCommentDate
FROM Users U
LEFT JOIN Comments C ON U.UserID = C.CommenterID
GROUP BY U.UserID, U.Username;

--To list users along with their roles using the GROUP BY function
SELECT U.Username, R.RoleName
FROM Users U
LEFT JOIN UserRolesToUser UR ON U.UserID = UR.UserID
LEFT JOIN UserRoles R ON UR.RoleID = R.RoleID
GROUP BY U.Username, R.RoleName;

--those user do not having any role
SELECT U.Username
FROM Users U
LEFT JOIN UserRolesToUser UR ON U.UserID = UR.UserID
WHERE UR.RoleID IS NULL;

--list of all open issues from ticketHistory table
SELECT *
FROM TicketHistory
WHERE NewValue = 'Open';

--open tkt from issue table
SELECT IssueID, Title, Description, Assignee
FROM Issues
WHERE Status = 'Open';

--count the no of issues
SELECT Priority, COUNT(*) AS IssueCount
FROM Issues
GROUP BY Priority;


--list of assigend issue
SELECT IssueID, Title, Status
FROM Issues
WHERE Assignee IS not NULL;

--list of user along with their associate roles using joins
SELECT U.Username, R.RoleName
FROM Users U
INNER JOIN UserRolesToUser UR ON U.UserID = UR.UserID
INNER JOIN UserRoles R ON UR.RoleID = R.RoleID;

--user along with comments
SELECT U.Username, C.CommentText
FROM Users U
LEFT JOIN Comments C ON U.UserID = C.CommenterID;

--list of tkt with modification history
SELECT T.TicketID, T.Title, TH.ModificationDate, TH.FieldName, TH.OldValue, TH.NewValue
FROM Tickets T
RIGHT JOIN TicketHistory TH ON T.TicketID = TH.TicketID;

--List all users and their associated roles, including users without roles and roles without users.
SELECT U.Username, R.RoleName
FROM Users U
FULL OUTER JOIN UserRolesToUser UR ON U.UserID = UR.UserID
FULL OUTER JOIN UserRoles R ON UR.RoleID = R.RoleID order by RoleName;

--
SELECT Parent.Title AS ParentTicket, Sub.Title AS SubTask
FROM Tickets Parent
LEFT JOIN Tickets Sub ON Parent.TicketID = Sub.TicketID;

--ticked not assigned to anyone
SELECT TicketID, Title
FROM Tickets
WHERE AssigneeID IS NULL;
--we can update to assign a ticket to the user 
UPDATE Tickets
SET AssigneeID = 15
WHERE TicketID = [TicketID] AND AssigneeID IS Not NULL;


--Calculate the average number of comments per ticket, considering null values where there are no comments.

WITH CommentCounts AS (
    SELECT TicketID, COUNT(*) AS CommentCount
    FROM Comments
    GROUP BY TicketID
)
SELECT AVG(1.0 * CommentCount) AS AverageCommentCount
FROM CommentCounts;
