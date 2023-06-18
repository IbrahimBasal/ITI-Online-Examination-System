
-----------------------------------------SSRS Reports Procedures-------------------------------
--1
CREATE PROCEDURE Report1 (@dept_no varchar(50))
AS
Begin
	Select * From Students Where Dept_ID = @dept_no

END

GO
---------------------------------------------
--2

CREATE PROCEDURE Report2 (@Ins_ID varchar(50))
AS
Begin
	Select Crs_Name,COUNT(Std_ID) as "Student Numbers in the course"
		From Ins_Crs ic JOIN Course c ON c.Crs_Id = ic.Crs_Id JOIN Std_Crs sc ON sc.Crs_Id = c.Crs_Id
		where Ins_ID = @Ins_ID
		group by Crs_Name
 
END

GO
---------------------------------------------
--3

CREATE PROCEDURE report_3 (@Crs_ID varchar(50))
AS
Begin 
	Select Topic_Name From Course c JOIN Topic t ON c.Topic_ID = t.Topic_Id
		where Crs_Id = @Crs_ID
END

GO
---------------------------------------------
--4

CREATE PROCEDURE Report4 (@std_id int)
AS
Begin
	Select Std_ID , Crs_Name , Convert(varchar(50),Crs_Grade/10*100) + '%' as Percentage
	From Std_Crs s JOIN Course c ON s.Crs_Id = c.Crs_Id
	where Std_ID = @std_id
END

GO
---------------------------------------------
--5

CREATE PROCEDURE Report5 (@ex_no int)
AS
Begin
	Select Question , Choice From Question q JOIN Choices ch ON q.Q_Id = ch.Q_Id
			JOIN Q_Exam  qe ON ch.Q_Id = qe.Q_Id
	where Ex_Id = @ex_no
 
END

GO
---------------------------------------------
--6

CREATE PROCEDURE Report6 (@st_id int , @ex_no int)
AS
Begin
	Select Question , Answer From Question q JOIN Std_Exam s ON q.Q_Id = s.Q_Id
	where Ex_Id = @ex_no and Std_ID = @st_id
END

GO
---------------------------------------------