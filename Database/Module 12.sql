															-- FINAL EXAM
                                               
CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(50),
    TotalCopies INT NOT NULL,
    AvailableCopies INT NOT NULL
);

CREATE TABLE Borrowing (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ISBN VARCHAR(13),
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);
																														
                                               
														-- 1. Make an ER Diagram of this Schema
                                
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
							-- 2. Insert a new borrowing record for a student (e.g., StudentID 3) for a book with the most available copies.                                       
                                                            
INSERT INTO Borrowing( StudentID,ISBN,BorrowDate,DueDate,ReturnDate)
VALUES (
		3,
		(SELECT ISBN FROM Book ORDER BY AvailableCopies DESC LIMIT 1 ),
		'29-3-24',
        '29-3-24',
		'1-4-23'
);

INSERT INTO Borrowing (BorrowID, StudentID, ISBN, BorrowDate, DueDate, ReturnDate)
VALUES (
    1,
    3,
    (SELECT ISBN FROM Book ORDER BY AvailableCopies DESC LIMIT 1),
    '2024-03-29',
    '2024-04-01',
    '2024-04-23'
);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
							-- 3. Using Update Query, decrease the available copies of a book (e.g., ISBN '9781234567890') by 1 when a student borrows it.
                                                        
UPDATE BOOK
SET AvailableCopies = AvailableCopies - 1
WHERE ISBN = '9781234567890';				

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                           -- 4. Retrieve the names of students who have borrowed the most books.										
                                                            
SELECT S.Name,COUNT(B.StudentID) AS TotalBorrowedBooks
FROM Student AS S INNER JOIN Borrowing AS B ON S.StudentID=B.StudentID
GROUP bY S.Name
ORDER BY TotalBorrowedBooks DESC
LIMIT 1;
                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
							-- 5. Retrieve the books that are overdue (i.e., the return date is before the current date).
						
SELECT B.ISBN,B.Title
FROM Book AS B JOIN Borrowing AS BR ON B.ISBN = BR.ISBN
WHERE BR.ReturnDate < CURDATE();

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                             -- 8. There is a table named Employee. In that table there is a field named Salary. Determine the second lowest salary. 
                     
SELECT DISTINCT Salary
FROM Employee
GROUP BY Salary
ORDER BY Salary ASC
LIMIT 1,1;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
							-- 9. There are tables named Employee, Job History, Department.
									-- a.Use ON DELETE CASCADE on Job History for deleting Employee
									-- b.Use ON DELETE SET NULL on Employee for deleting Department
                                    
-- a 

ALTER TABLE job_history
ADD CONSTRAINT FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ;
                                    
-- b 

ALTER TABLE employees
ADD CONSTRAINT FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL;



                                    
                        
                        
                        
                        
                        
                        
                                                            