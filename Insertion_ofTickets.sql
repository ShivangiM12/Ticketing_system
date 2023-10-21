-- Insert records into the Users table
INSERT INTO Users (UserID, Username, Password, Email)
VALUES
    (1, 'user1', 'password1', 'user1@example.com'),
    (2, 'user2', 'password2', 'user2@example.com'),
    (3, 'user3', 'password3', 'user3@example.com'),
    (4, 'user4', 'password4', 'user4@example.com'),
    (5, 'user5', 'password5', 'user5@example.com'),
    (6, 'user6', 'password6', 'user6@example.com'),
    (7, 'user7', 'password7', 'user7@example.com'),
    (8, 'user8', 'password8', 'user8@example.com'),
    (9, 'user9', 'password9', 'user9@example.com'),
    (10, 'user10', 'password10', 'user10@example.com'),
    (11, 'user11', 'password11', 'user11@example.com'),
    (12, 'user12', 'password12', 'user12@example.com'),
    (13, 'user13', 'password13', 'user13@example.com'),
    (14, 'user14', 'password14', 'user14@example.com'),
    (15, 'user15', 'password15', 'user15@example.com');

-- Insert records into the Tickets table
INSERT INTO Tickets (TicketID, Title, Description, Status, Priority, CreatorID, AssigneeID)
VALUES
    (1, 'Ticket 1', 'Description for Ticket 1', 'Open', 'High', 1, 2),
    (2, 'Ticket 2', 'Description for Ticket 2', 'In Progress', 'Medium', 2, NULL),
    (3, 'Ticket 3', 'Description for Ticket 3', 'Closed', 'Low', 3, NULL),
    (4, 'Ticket 4', 'Description for Ticket 4', 'Open', 'High', 4, 1),
    (5, 'Ticket 5', 'Description for Ticket 5', 'In Progress', 'High', 5, NULL),
    (6, 'Ticket 6', 'Description for Ticket 6', 'Open', 'Medium', 1, 2),
    (7, 'Ticket 7', 'Description for Ticket 7', 'In Progress', 'Low', 2, NULL),
    (8, 'Ticket 8', 'Description for Ticket 8', 'Closed', 'High', 3, 4),
    (9, 'Ticket 9', 'Description for Ticket 9', 'Open', 'Medium', 4, 1),
    (10, 'Ticket 10', 'Description for Ticket 10', 'In Progress', 'High', 5, NULL),
    (11, 'Ticket 11', 'Description for Ticket 11', 'Open', 'High', 1, 2),
    (12, 'Ticket 12', 'Description for Ticket 12', 'In Progress', 'Medium', 2, NULL),
    (13, 'Ticket 13', 'Description for Ticket 13', 'Closed', 'Low', 3, NULL),
    (14, 'Ticket 14', 'Description for Ticket 14', 'Open', 'High', 4, 1),
    (15, 'Ticket 15', 'Description for Ticket 15', 'In Progress', 'High', 5, NULL);

-- Insert records into the Comments table
INSERT INTO Comments (CommentID, TicketID, CommentText, CommenterID)
VALUES
    (1, 1, 'Comment for Ticket 1', 2),
    (2, 1, 'Another comment for Ticket 1', 3),
    (3, 2, 'Comment for Ticket 2', 1),
    (4, 3, 'Comment for Ticket 3', 2),
    (5, 4, 'Comment for Ticket 4', 4),
    (6, 1, 'Additional comment for Ticket 1', 5),
    (7, 2, 'Yet another comment for Ticket 2', 1),
    (8, 3, 'More comments for Ticket 3', 3),
    (9, 4, 'Extra comment for Ticket 4', 2),
    (10, 5, 'Final comment for Ticket 5', 1),
    (11, 1, 'Last comment for Ticket 1', 4),
    (12, 2, 'Final remark for Ticket 2', 3),
    (13, 3, 'Wrap-up comment for Ticket 3', 5),
    (14, 4, 'End comment for Ticket 4', 4),
    (15, 5, 'Closing comment for Ticket 5', 2);

-- Insert records into the UserRoles table
INSERT INTO UserRoles (RoleID, RoleName)
VALUES
    (1, 'Admin'),
    (2, 'Agent'),
    (3, 'User'),
    (4, 'Manager'),
    (5, 'Supervisor'),
    (6, 'Support'),
    (7, 'Developer'),
    (8, 'Team Lead'),
    (9, 'Tester'),
    (10, 'Analyst'),
    (11, 'Designer'),
    (12, 'Engineer'),
    (13, 'Architect'),
    (14, 'Scrum Master'),
    (15, 'Product Owner');

-- Insert records into the TicketCategories table
INSERT INTO TicketCategories (CategoryID, CategoryName)
VALUES
    (1, 'Bug'),
    (2, 'Feature Request'),
    (3, 'Question'),
    (4, 'Enhancement'),
    (5, 'Other'),
    (6, 'Feedback'),
    (7, 'Maintenance'),
    (8, 'Documentation'),
    (9, 'Security'),
    (10, 'Performance'),
    (11, 'User Interface'),
    (12, 'Integration'),
    (13, 'Compliance'),
    (14, 'Legal'),
    (15, 'Research');

-- Insert records into the Permissions table
INSERT INTO Permissions (PermissionID, PermissionName)
VALUES
    (1, 'Create Ticket'),
    (2, 'Edit Ticket'),
    (3, 'View Ticket'),
    (4, 'Comment on Ticket'),
    (5, 'Assign Ticket'),
    (6, 'Close Ticket'),
    (7, 'Reopen Ticket'),
    (8, 'Delete Ticket'),
    (9, 'Assign User Role'),
    (10, 'Remove User Role'),
    (11, 'View User Information'),
    (12, 'Edit User Information'),
    (13, 'Create Comment'),
    (14, 'Delete Comment'),
    (15, 'Change Ticket Status');


	-- Insert records into the RolePermission table
INSERT INTO RolePermission (RolePermissionID, RoleID, PermissionID)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 2, 1),
    (7, 2, 3),
    (8, 2, 5),
    (9, 3, 2),
    (10, 3, 4),
    (11, 3, 6),
    (12, 4, 7),
    (13, 4, 8),
    (14, 5, 9),
    (15, 5, 10);



   -- Insert records into the TicketHistory table
INSERT INTO TicketHistory (HistoryID, TicketID, ModificationDate, ModifiedBy, FieldName, OldValue, NewValue)
VALUES
    (1, 1, '2023-10-21 10:00:00', 1, 'Status', 'Open', 'In Progress'),
    (2, 2, '2023-10-21 11:00:00', 2, 'Priority', 'Medium', 'High'),
    (3, 3, '2023-10-21 12:00:00', 3, 'Status', 'Open', 'Closed'),
    (4, 4, '2023-10-21 13:00:00', 4, 'Description', 'Initial description', 'Updated description'),
    (5, 5, '2023-10-21 14:00:00', 5, 'AssigneeID', NULL, '3'),
    (6, 1, '2023-10-21 15:00:00', 1, 'Status', 'In Progress', 'Closed'),
    (7, 2, '2023-10-21 16:00:00', 2, 'Status', 'In Progress', 'Open'),
    (8, 3, '2023-10-21 17:00:00', 3, 'Priority', 'Low', 'Medium'),
    (9, 4, '2023-10-21 18:00:00', 4, 'Status', 'Open', 'In Progress'),
    (10, 5, '2023-10-21 19:00:00', 5, 'AssigneeID', '3', NULL),
    (11, 1, '2023-10-21 20:00:00', 1, 'Status', 'Closed', 'Reopened'),
    (12, 2, '2023-10-21 21:00:00', 2, 'Status', 'Open', 'Closed'),
    (13, 3, '2023-10-21 22:00:00', 3, 'Description', 'Updated description', 'Final description'),
    (14, 4, '2023-10-21 23:00:00', 4, 'Status', 'In Progress', 'Closed'),
    (15, 5, '2023-10-22 10:00:00', 5, 'AssigneeID', '2', NULL);

select * from Users
select * from Comments
select * from permissions
select * from RolePermission
select * from TicketCategories
select * from TicketHistory
select * from Tickets
select * from UserRoles

