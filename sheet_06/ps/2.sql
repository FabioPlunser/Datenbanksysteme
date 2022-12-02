SELECT StudentName 
FROM Student 
WHERE EXISTS ( 
    SELECT 1 
    FROM attends 
    WHERE Student.StudentID = attends.StudentID
    AND attends.grade = 2
)

(SIGMA Student.StudentID = attends.StudentID && attends.grade = 2 (attends))
PI StudentName(((Student (Student.StudentID = attends.StudentID) JOIN (SIGMA attends.grade = 2 (attends)))))