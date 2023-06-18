------------------------------------Exam_Generation----------------------------------------------
CREATE PROCEDURE Exam_Generation (@crs_name varchar(50),@mcq int = 7, @tf int = 3)
AS
Begin
	IF Exists (Select Crs_Id From Course Where Crs_Name = @crs_name)
		Begin
			declare @exam_id int,@crs_id varchar(50)
			Set @crs_id = (Select Crs_Id From Course Where Crs_Name = @crs_name)
			IF (Select Count(Ex_Id) From Exam) = 0
				Set @exam_id = 1
			ELSE 
				Set @exam_id = (Select Max (Ex_Id) From Exam ) + 1

			IF @mcq + @tf = 10
				Begin
					Insert Into Exam Values(@exam_id , @crs_id)
						
					Insert Into Q_Exam Select Top(@mcq) Q_Id , @exam_id from Question
												   Where Crs_Id = @crs_id and Type = 'MCQ'
													Order By NEWID()

					Insert Into Q_Exam Select Top(@tf) Q_Id , @exam_id from Question
												   Where Crs_Id = @crs_id and Type = 'TF'
													  Order By NEWID()
				END

			ELSE 
				Select 'Number Of Question Must Be 10'

		END

	ELSE
		select 'Course Name Not Found'
END

Go
-------------------------------------------------------

-------------------------------------Answer_and_Correction---------------------------------------
CREATE PROCEDURE Answer_and_Correction (@std_id int , @ex_id int , @q_id varchar(50)  ,
												@ans varchar(200) = 'No answer')
AS
Begin
	IF Exists  (Select Std_ID From Students Where Std_ID = @std_id)
		Begin
			IF Exists (Select Ex_Id From Exam Where Ex_Id=@ex_id)
				Begin
					IF Exists(Select Q_Id From Question Where Q_Id=@q_id)
						Begin
							declare @grade int
							IF (Select Correct_Answer From Question Where Q_Id=@q_id) = @ans
								Set @grade = 1
							ELSE
								Set @grade = 0
							Insert Into Std_Exam Values (@std_id,@ex_id, @q_id, @ans , @grade)
						END
					ELSE
						select 'Question_ID Not Found'
				END
			ELSE
				Select 'There is no Exam With This ID'
		END
	ELSE
		Select 'Student Id That you have Enterened Not Found'
END

Go
-------------------------------------------------------

------------------------------------------------total_grade-------------------------------------------------
CREATE PROCEDURE Total_Grade(@st_id int,@ex_id int,@crs_id varchar(50))
AS
Begin  
	IF Exists (Select se.Std_ID,Ex_Id,Crs_Id From Std_Exam SE JOIN Std_Crs SC ON SE.Std_ID = SC.Std_ID
					Where se.Std_ID = @st_id and se.Ex_Id = @ex_id and sc.Crs_Id = @crs_id)    

		Update Std_Crs Set Crs_Grade = (Select sum(Q_Grade) From Std_Exam
										Where Std_ID=@st_id and Ex_Id=@ex_id )
		Where Std_ID = @st_id and Crs_Id = @crs_id 
 
	ELSE
		Select 'Question_ID Not Found'
END

Go
-------------------------------------------------------
	
