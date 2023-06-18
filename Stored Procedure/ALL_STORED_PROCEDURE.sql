-------------------------------------------Select_student----------------------------------------
CREATE PROCEDURE Select_student (@std_id int = Null)
AS
Begin 
	if @std_id is Null  
		Select * From Students

	else if exists(Select Std_ID From Students Where Std_ID=@std_id)
		Select * From Students Where Std_ID=@std_id

	else
		Select 'ID You have entered not exists' 

END

GO
------------------------------------------
CREATE PROCEDURE delete_Student (@std_id int)
AS
Begin 

	IF exists(Select Std_ID from Students where Std_ID=@std_id)
		delete Students Where Std_ID = @std_id 

	ELSE
		Select 'ID You have entered Not exist'
		
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Student (@std_id int,@Fname varchar(50),@Lname varchar(50),@Email varchar(50),
@Password varchar(50),@phone varchar(50),@Address varchar(100),@D_Birth varchar(50),@Gender varchar(10),
@Faculty varchar(50),@Graduation_Year varchar(50),@StartDate varchar(50),@ITI_Graduation_Date varchar(50),
@Dept_ID varchar(50),@Ins_ID varchar(50))
AS
begin 

	IF exists(Select Std_ID From Students Where Std_ID=@std_id)
		Select 'ID You have entered is already used' 

	ELSE
		Insert Into Students Values(@std_id,@Fname,@Lname,@Email,@Password,@phone,@Address,
		                            @D_Birth,@Gender,@Faculty,@Graduation_Year,@StartDate,
									@ITI_Graduation_Date,@Dept_ID,@Ins_ID)
END

GO
------------------------------------------
create PROCEDURE Update_Student (@std_id int,@Fname varchar(50),@Lname varchar(50),@Email varchar(50),
@Password varchar(50),@phone varchar(50),@Address varchar(100),@D_Birth varchar(50),@Gender varchar(10),
@Faculty varchar(50),@Graduation_Year varchar(50),@StartDate varchar(50),@ITI_Graduation_Date varchar(50),
@Dept_ID varchar(50),@Ins_ID varchar(50))
AS
Begin 
	IF Exists(select Std_ID from Students where Std_ID=@std_id)
		Begin
			IF @Fname is not null
				Update Students Set Fname=@Fname
				        Where Std_ID = @std_id
			IF @Lname is not null
				Update Students Set Lname=@Lname
				        Where Std_ID = @std_id
		    IF @Email is not null
				Update Students Set Email=@Email
				        Where Std_ID = @std_id
			IF @Password is not null
				Update Students Set Password=@Password
				        Where Std_ID = @std_id
			IF @phone is not null
				Update Students Set Phone=@phone
					    Where Std_ID = @std_id
			IF @Address is not null
				Update Students Set Address=@Address
				        Where Std_ID = @std_id
			IF @D_Birth is not null
				Update Students Set D_Birth=@D_Birth
				        Where Std_ID = @std_id
			IF @Gender	 is not null
				Update Students Set Gender=@Gender
					    Where Std_ID = @std_id
			IF @Faculty	 is not null
				Update Students Set Faculty=@Faculty
				        Where Std_ID = @std_id
			IF @Graduation_Year	 is not null
				Update Students Set Graduation_Year=@Graduation_Year
					    Where Std_ID = @std_id
			IF @StartDate is not null
				Update Students Set StartDate=@StartDate
						Where Std_ID = @std_id
			IF @ITI_Graduation_Date is not null
				Update Students Set ITI_Graduation_Date=@ITI_Graduation_Date
						Where Std_ID = @std_id
			IF @Dept_ID is not null
				Update Students Set Dept_ID=@Dept_ID
						Where Std_ID = @std_id
			IF @Ins_ID is not null
				Update Students Set Ins_ID=@Ins_ID
						Where Std_ID = @std_id
		END
	ELSE
		Select 'ID You have entered not exists' 
END

GO
------------------------------------------

-------------------------------------------instructor-------------------------------------------
CREATE PROCEDURE Select_instructor (@ins_id varchar(50) = 'all')
AS
Begin 
	IF @ins_id = 'all' 
		Select * From Instructor

	ELSE IF exists(Select Ins_ID From Instructor Where Ins_ID=@ins_id)
		Select * From Instructor Where Ins_ID=@ins_id

	ELSE
		Select 'ID You have entered not exists' 

END

GO
------------------------------------------
CREATE PROCEDURE delete_Instructor (@Ins_ID varchar(50))
AS
Begin 

	IF exists(Select Ins_ID From Instructor where Ins_ID=@Ins_ID)
		delete Instructor where Ins_ID = @Ins_ID 

	else
		Select 'ID You have entered Not exist'
		
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Instructor (@Ins_ID varchar(50),@Fname varchar(50),@Lname varchar(50),
@Email varchar(100),@Password varchar(50),@phone varchar(50),@Branch varchar(50),@Address varchar(50),
@D_Birth varchar(50),@Gender varchar(50),@Dept_ID varchar(50),@Hire_Date varchar(50),
@Hours int = NULL)
AS
begin 

	if exists(select Ins_ID from Instructor where Ins_ID=@Ins_ID)
		select 'ID You have entered is already used' 

	else
		insert into Instructor values(@Ins_ID,@Fname,@Lname,@Email,@Password,@phone,@Branch,
		                                @Address,@D_Birth,@Gender,@Dept_ID,@Hire_Date,@Hours)
		
end

go
------------------------------------------
CREATE PROCEDURE Update_Instructor (@Ins_ID varchar(50),@Fname varchar(50),@Lname varchar(50),
@Email varchar(100),@Password varchar(50),@phone varchar(50),@Branch varchar(50),@Address varchar(50),
@D_Birth varchar(50),@Gender varchar(50),@Dept_ID varchar(50),@Hire_Date varchar(50),
@Hours int = NULL)
AS
begin 
	if exists(select Ins_ID from Instructor where Ins_ID=@Ins_ID)
		begin
			if @Fname is not null
				update Instructor set Fname=@Fname
				        where Ins_ID = @Ins_ID
			if @Lname is not null
				update Instructor set Lname=@Lname
				        where Ins_ID = @Ins_ID
		    if @Email is not null
				update Instructor set Email=@Email
				        where Ins_ID = @Ins_ID
			if @Password is not null
				update Instructor set Password=@Password
				        where Ins_ID = @Ins_ID
			if @phone is not null
				update Instructor set Phone=@phone
					    where Ins_ID = @Ins_ID
			if @Branch is not null
				update Instructor set Branch=@Branch
				        where Ins_ID = @Ins_ID
			if @Address is not null
				update Instructor set Address=@Address
				        where Ins_ID = @Ins_ID
			if @D_Birth	 is not null
				update Instructor set D_Birth=@D_Birth
					    where Ins_ID = @Ins_ID
			if @Gender	 is not null
				update Instructor set Gender=@Gender
				        where Ins_ID = @Ins_ID
			if @Dept_ID	 is not null
				update Instructor set Dept_ID=@Dept_ID
					    where Ins_ID = @Ins_ID
			if @Hire_Date	 is not null
				update Instructor set Hire_date=@Hire_Date
						where Ins_ID = @Ins_ID
			if @Hours	 is not null
				update Instructor set Hours=@Hours
						where Ins_ID = @Ins_ID
		end
	else
		select 'ID You have entered not exists' 
end

go
------------------------------------------

----------------------------------------------choices-----------------------------------------
CREATE PROCEDURE Select_Choice (@Qous_ID varchar(50) = 'all')
AS
Begin
	IF @Qous_ID = 'all' 
			Select * from Choices 
	ELSE IF exists ( Select Q_Id from Choices Where Q_Id = @Qous_ID )
				Select * from Choices Where Q_Id = @Qous_ID
	ELSE 
		Select 'question is not founded' 
End

go
------------------------------------------
CREATE PROCEDURE Delete_choice (@Qous_ID varchar(50))
AS 
Begin 
	IF exists(Select Q_Id from Choices where Q_Id = @Qous_ID)
		delete from Choices Where Q_Id = @Qous_ID 
	ELSE
		Select 'Question ID That You have entered Not exist'

End

GO
------------------------------------------
CREATE PROCEDURE Insert_choice(@Qous_ID varchar(50) , @Choice varchar(200))
AS
Begin
	IF exists ( select Q_Id from Choices where Q_Id = @Qous_ID )
		Select 'Question ID That You have entered already exist'
	ELSE
		insert into Choices values (@Qous_ID , @Choice )
End

GO
------------------------------------------
CREATE PROCEDURE Update_choice (@Qous_ID varchar(50) , @Old_Choice varchar(200) ,
                                  @New_Choice varchar(200))
AS 
Begin 
	IF exists ( select Q_Id from Choices where Q_Id = @Qous_ID )
		Update Choices Set Choice =@New_Choice 
		     Where Q_Id = @Qous_ID and Choice =@Old_Choice 
	ELSE
		Select 'Question ID That You have entered already exist' 
End

GO
------------------------------------------

-----------------------------------------Course--------------------------------------------------
CREATE PROCEDURE Select_course (@Crs_Id varchar(50) = 'all')
AS
Begin
	IF @Crs_Id = 'all'
		Select * From Course
	ELSE IF exists ( Select Crs_Id From Course Where Crs_Id = @Crs_Id )
		Select * From Course Where Crs_Id = @Crs_Id
	ELSE 
		Select 'Course ID Not Existed'
End	
GO
------------------------------------------
CREATE PROCEDURE Delete_course (@crs_ID varchar(50))
AS
Begin 
	IF exists ( Select Crs_Id From Course Where Crs_Id = @Crs_Id )
		Delete From Course Where Crs_Id = @crs_ID
	ELSE 
		Select 'course_id not existed'
End	
GO
------------------------------------------
CREATE PROCEDURE Insert_course (@Crs_Id varchar(50) , @Crs_Name varchar(50),
                                  @Duration int , @Type varchar(50) , @Topic_ID int)
AS
Begin 
	IF Exists (Select Crs_Id From Course Where Crs_Id = @Crs_Id)
		Select 'Course ID That You have entered already exist'
	ELSE
		Insert Into Course Values (@Crs_Id ,@Crs_Name ,@Duration ,@Type ,@Topic_ID)			  
END

GO
------------------------------------------
CREATE PROCEDURE update_course (@Crs_Id varchar(50) , @Crs_Name varchar(50) = Null,
                            @Duration int = Null, @Type varchar(50) = Null, @Topic_ID int = Null)
AS
Begin
	IF Exists (Select Crs_Id From Course Where Crs_Id = @Crs_Id)
		Begin
		IF @Crs_Name IS NOT NULL
			update Course Set Crs_Name=@Crs_Name
			        Where Crs_Id = @Crs_Id
		IF @Duration IS NOT NULL
			update Course Set Duration=@Duration
			        Where Crs_Id = @Crs_Id
		IF @Type IS NOT NULL
			update Course Set Type=@Type
			        Where Crs_Id = @Crs_Id
		IF @Topic_ID IS NOT NULL
			update Course Set Topic_ID=@Topic_ID
			        Where Crs_Id = @Crs_Id
		END
	ELSE
		select 'Course ID Is Not Existed'
END

GO
------------------------------------------

------------------------------------------------Department-------------------------------------
CREATE PROCEDURE Select_dept (@dept_id varchar(50) = 'all')
AS
Begin
	IF @dept_id = 'all'
		Select * From Department
	ELSE IF Exists (Select Dept_Id From Department Where Dept_Id = @dept_id)
		Select * From Department Where Dept_Id = @dept_id
	ELSE
		select 'Department ID NOT Existed'
END

GO
------------------------------------------
CREATE PROCEDURE Delete_Dept (@dept_id varchar(50))
AS
Begin 
	IF Exists (Select Dept_Id From Department Where Dept_Id = @dept_id)
		Delete from Department where Dept_Id = @dept_id
	ELSE
		Select 'Department ID Is Not Existed'
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Dept (@dept_id varchar(50) , @dept_Name varchar(100),
									@branch varchar(50) , @manager_id varchar(50))
AS
Begin 
	IF Exists (Select Dept_Id From Department Where Dept_Id = @dept_id)
		select 'Department ID IS Already Existed'
	ELSE
		Insert Into Department Values (@dept_id ,@dept_Name ,@branch ,@manager_id)			 
END 

GO
------------------------------------------
CREATE PROCEDURE Update_dept (@dept_id varchar(50) , @dept_Name varchar(100) = NULL,
									@branch varchar(50) = NULL, @manager_id varchar(50)= NULL)
AS
Begin 
	IF Exists (Select Dept_Id From Department Where Dept_Id = @dept_id)
		Begin
		IF @dept_Name IS NOT NULL
			update Department Set Dept_Name=@dept_Name
			        Where Dept_Id = @dept_id
		IF @branch IS NOT NULL
			update Department Set branch=@branch
			        Where Dept_Id = @dept_id
		IF @manager_id IS NOT NULL
			update Department Set Manager_ID=@manager_id
			        Where Dept_Id = @dept_id
		END
	ELSE
		Select 'Department ID Is Not Existed'
END

GO
------------------------------------------

-------------------------------------------------Exam---------------------------------------------
CREATE PROCEDURE Select_Exam (@ex_id int = 0)
AS
Begin
	IF @ex_id = 0
		Select * From Exam
	ELSE IF Exists (Select Ex_Id From Exam Where Ex_Id = @ex_id)
		Select * From Exam where Ex_Id = @ex_id
	ELSE
		select 'Exam ID Is Not Found'
END

GO
------------------------------------------
CREATE PROCEDURE Delete_Exam (@ex_id int)
AS
Begin
	IF Exists (Select Ex_Id From Exam Where Ex_Id = @ex_id)
		Delete From Exam where Ex_Id = @ex_id
	ELSE
		select 'Exam ID Is Not Found'
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Exam (@ex_id int , @crs_id varchar(50))
AS
Begin
		IF Exists (Select Ex_Id From Exam Where Ex_Id = @ex_id)
			select 'Exam ID Is Already Existed' 
		ELSE
			Insert Into Exam Values (@ex_id , @crs_id) 
END

GO
------------------------------------------
CREATE PROCEDURE Update_Exam (@ex_id int , @crs_id varchar(50))
AS
Begin
	IF Exists (Select Ex_Id From Exam Where Ex_Id = @ex_id) 
		update Exam set  Crs_ID = @crs_id where Ex_Id = @ex_id
	ELSE
		select 'Exam ID Is Not Found'
END

GO
------------------------------------------

------------------------------------------Instructor Course-------------------------------------
CREATE PROCEDURE Select_Ins_Crs (@ins_id varchar(50) = 'all', @crs_id varchar(50) = 'all')
AS
Begin
	IF @ins_id = 'all' and @crs_id = 'all'
		Select * From Ins_Crs
	ELSE IF @ins_id = 'all' or @crs_id = 'all'
		Begin
			IF @ins_id = 'all' And Exists (Select Crs_Id From Ins_Crs Where Crs_Id = @crs_id)
				Select * From Ins_Crs Where Crs_Id = @crs_id
			ELSE IF @crs_id = 'all' And Exists (Select Ins_ID From Ins_Crs Where Ins_ID = @ins_id)
				Select * From Ins_Crs Where Ins_ID = @ins_id
			ELSE
				Select 'There Is No Instructor With This Course'
		END
	ELSE IF Exists (Select Ins_ID,Crs_Id From Ins_Crs Where Ins_ID = @ins_id and Crs_Id = @crs_id) 
		Select * From Ins_Crs Where Ins_ID = @ins_id and Crs_Id = @crs_id
	ELSE
		Select 'There Is No Instructor With This Course'
	
END

GO
------------------------------------------
CREATE PROCEDURE Delete_Ins_Crs (@ins_id varchar(50) , @crs_id varchar(50))
AS
Begin 
	IF Exists (Select Ins_ID,Crs_Id From Ins_Crs Where Ins_ID = @ins_id and Crs_Id = @crs_id)
		Delete From Ins_Crs Where Ins_ID = @ins_id and Crs_Id = @crs_id
	ELSE
		Select 'There Is No Instructor With This Course'
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Ins_Crs (@ins_id varchar(50) , @crs_id varchar(50))
AS
Begin 
	IF Exists (Select Ins_ID,Crs_Id From Ins_Crs Where Ins_ID = @ins_id and Crs_Id = @crs_id)
		select 'Instructor and Course are already existed'
	ELSE
		Insert Into Ins_Crs Values (@ins_id , @crs_id) 
END

GO
------------------------------------------
CREATE PROCEDURE Update_Ins_Crs (@ins_id varchar(50) , @old_crs_id varchar(50) , @new_crs_id varchar(50))
AS
Begin
	IF Exists (Select Ins_ID,Crs_Id From Ins_Crs Where Ins_ID = @ins_id and Crs_Id = @old_crs_id)
		Update Ins_Crs Set  Crs_ID = @new_crs_id where Ins_ID = @ins_id and Crs_Id = @old_crs_id 
	ELSE
		select 'Instructor and Course are already existed'
END

GO
------------------------------------------

----------------------------------------------STD_CRS--------------------------------------------
CREATE PROCEDURE Select_Std_Crs (@Std_id int = 0, @crs_id varchar(50) = 'all')
AS
Begin
	IF @Std_id = 0 and @crs_id = 'all'
		Select * From Std_Crs
	ELSE IF @Std_id = 0 or @crs_id = 'all'
		Begin
			IF @Std_id = 0 And Exists (Select Crs_Id From Std_Crs Where Crs_Id = @crs_id)
				Select * From Std_Crs Where Crs_Id = @crs_id
			ELSE IF @crs_id = 'all' And Exists (Select @Std_id From Std_Crs Where Std_ID = @Std_id)
				Select * From Std_Crs Where Std_ID = @Std_id
			ELSE
				Select 'There Is No Student With This Course'
		END
	ELSE IF Exists (Select Std_ID,Crs_Id From Std_Crs Where Std_ID = @Std_id and Crs_Id = @crs_id) 
		Select * From Std_Crs Where Std_ID = @Std_id and Crs_Id = @crs_id
	ELSE
		Select 'There Is No Student ID With This Course'
END

GO
------------------------------------------
CREATE PROCEDURE Delete_Std_Crs (@Std_id int , @crs_id varchar(50))
AS
Begin
	IF Exists (Select Std_ID,Crs_Id From Std_Crs Where Std_ID = @Std_id and Crs_Id = @crs_id)
		Delete From Std_Crs Where Std_ID = @Std_id and Crs_Id = @crs_id
	ELSE
		Select 'There Is No Student ID With This Course'
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Std_Crs (@Std_id int , @crs_id varchar(50) , @Crs_Garde int = NULL)
AS
Begin
	IF Exists (Select Std_ID,Crs_Id From Std_Crs Where Std_ID = @Std_id and Crs_Id = @crs_id)
		select 'There Is Student ID With This Course Already Exist'
	ELSE
		Insert Into Std_Crs Values (@std_id , @crs_id , @Crs_Garde)
END

GO
------------------------------------------
CREATE PROCEDURE Update_Std_Crs (@Std_id int , @old_crs_id varchar(50) ,
                                  @new_crs_id varchar(50) ,@Crs_Garde int = NULL)
AS
Begin
	IF Exists (Select Std_ID,Crs_Id From Std_Crs Where Std_ID = @Std_id and Crs_Id = @old_crs_id)
		Update Std_Crs Set  Crs_ID = @new_crs_id , Crs_Grade = @Crs_Garde
						where Std_ID = @Std_id and Crs_Id = @old_crs_id 
	ELSE
		select 'There Is Student ID With This Course Already Exist'
END

GO
------------------------------------------

-------------------------------------------------Topic -------------------------------------------
CREATE PROCEDURE Select_Topic (@topic_id int)
AS
Begin
	IF Exists (select Topic_Id From Topic Where Topic_Id = @topic_id)
		Select * From Topic Where Topic_Id = @topic_id
	ELSE
		Select 'Topic ID not Found'
END

GO
------------------------------------------
CREATE PROCEDURE Delete_Topic (@topic_id int)
AS
Begin
	IF Exists (select Topic_Id From Topic Where Topic_Id = @topic_id)
		Delete From Topic Where Topic_Id = @topic_id
	ELSE
		Select 'exam_id not existed'
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Topic (@topic_id int , @topic_name varchar(50))
AS
Begin
	IF Exists (select Topic_Id From Topic Where Topic_Id = @topic_id)
		Select 'Topic ID is already existed'
	ELSE
		Insert Into Topic Values (@topic_id , @topic_name) 
END

GO
------------------------------------------
CREATE PROCEDURE Update_Topic (@topic_id int , @topic_name varchar(50))
AS
Begin
	IF Exists (select Topic_Id From Topic Where Topic_Id = @topic_id)
		update Topic set Topic_Name = @topic_name where Topic_Id = @topic_id
	ELSE
		Select 'Topic Id not existed'
END

GO
------------------------------------------
--------------------------------------------Question---------------------------------------------
CREATE PROCEDURE Select_Question (@QuesID varchar(50)='all')
AS
Begin
	IF @QuesID = 'all'
		Select * From Question
	ELSE IF EXISTS (Select Q_Id From Question Where Q_Id = @QuesID)
		Select * From Question Where Q_Id = @QuesID
	ELSE
		Select 'Question ID Not Found'
END

GO
------------------------------------------
CREATE PROCEDURE Delete_Question (@QuesID varchar(50))
AS
Begin
	IF EXISTS (Select Q_Id From Question Where Q_Id = @QuesID)
		Delete From Question Where Q_Id = @QuesID
	ELSE
		Select 'The Question ID That you have Entered Not Exists'
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Question (@QuesID varchar(50) ,@Question varchar(250),
		@Correct_Answer varchar(200) ,@Type varchar(50) ,@Crs_ID varchar(50) ,@Grade int)
AS
Begin
	IF EXISTS (Select Q_Id From Question Where Q_Id = @QuesID)
		Select 'The Question ID That you have Entered Already Exists'
	ELSE
		Insert Into Question Values (@QuesID,@Question,@Correct_Answer,@Type,@Crs_ID,@Grade)
END

GO
------------------------------------------
CREATE PROCEDURE Update_Question (@QuesID varchar(50) ,@Question varchar(250) = NULL ,
		@Correct_Answer varchar(200) = NULL ,@Type varchar(50) = NULL ,
		@Crs_ID varchar(50) = NULL ,@Grade int = NULL)
AS
Begin
	IF EXISTS (Select Q_Id From Question Where Q_Id = @QuesID)
		BEGIN
			IF @question IS NOT NULL
				UPDATE Question SET Question = @question WHERE Q_Id = @QuesID
			IF @Correct_Answer IS NOT NULL
				UPDATE Question SET Correct_Answer = @Correct_Answer WHERE Q_Id = @QuesID
			IF @Type IS NOT NULL
				UPDATE Question SET Type = @Type WHERE Q_Id = @QuesID
			IF @Crs_ID IS NOT NULL
				UPDATE Question SET Crs_ID = @Crs_ID WHERE Q_Id = @QuesID
			IF @Grade IS NOT NULL
				UPDATE Question SET Grade = @Grade WHERE Q_Id = @QuesID
		END
	ELSE
		Select 'The Question ID That you have Entered Not Exists'
END

GO
------------------------------------------

----------------------------------------Std_Exam-------------------------------------------------
CREATE PROCEDURE Select_Std_Exam (@Std_ID int = 0, @Ex_Id int =0, @Q_Id varchar(50) ='all')
AS
Begin
	IF @Std_ID = 0 and @Ex_Id = 0 and @Q_Id = 'all'
		Select * From Std_Exam
	ELSE IF @Std_ID = 0 or @Ex_Id = 0 or @Q_Id = 'all'
		Begin
			IF @Std_ID = 0 And @Ex_Id = 0 And Exists (Select Q_Id From Std_Exam Where Q_Id = @Q_Id)
				Select * From Std_Exam Where Q_Id = @Q_Id
			ELSE IF @Ex_Id = 0 And @Q_Id = 'all' And Exists (Select Std_ID From Std_Exam Where Std_ID = @Std_ID)
				Select * From Std_Exam Where Std_ID = @Std_ID
			ELSE IF @Std_ID = 0 And @Q_Id = 'all' And Exists (Select Ex_Id From Std_Exam Where Ex_Id = @Ex_Id)
				Select * From Std_Exam Where Ex_Id = @Ex_Id
			ELSE IF @Q_Id = 'all' And Exists (Select Std_ID , Q_Id From Std_Exam Where Std_ID = @Std_ID and Ex_Id = @Ex_Id)
				Select * From Std_Exam Where Std_ID = @Std_ID and Ex_Id = @Ex_Id
			ELSE IF @Ex_Id = 0 And Exists (Select Std_ID , Q_Id From Std_Exam Where Std_ID = @Std_ID and Q_Id = @Q_Id)
				Select * From Std_Exam Where Std_ID = @Std_ID and Q_Id = @Q_Id
			ELSE IF @Std_ID = 0 And Exists (Select Ex_Id , Q_Id From Std_Exam Where Ex_Id = @Ex_Id and Q_Id = @Q_Id)
				Select * From Std_Exam Where Ex_Id = @Ex_Id and Q_Id = @Q_Id
			ELSE
				Select 'There Is No Question ID TO This Student ID In This Course'
		END
	ELSE IF Exists (Select Std_ID,Ex_Id,Q_Id From Std_Exam Where Std_ID = @Std_ID and Ex_Id = @Ex_Id and Q_Id = @Q_Id) 
		Select * From Std_Exam Where Std_ID = @Std_ID and Ex_Id = @Ex_Id and Q_Id = @Q_Id
	ELSE
		Select 'There Is No Question ID TO This Student ID In This Course'
END

GO
------------------------------------------
CREATE PROCEDURE Delete_Std_Exam (@Std_ID int , @Ex_Id int)
AS
Begin
	IF EXISTS (Select Std_ID,Ex_Id From Std_Exam Where Std_ID = @Std_ID and Ex_Id=@Ex_Id)
		Delete From Std_Exam Where Std_ID = @Std_ID and Ex_Id=@Ex_Id
	ELSE
		Select 'There Is No Exam ID With This Student ID Exists'
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Std_Exam (@Std_ID int ,@Ex_Id int ,@Q_Id varchar(50) ,
									@Answer varchar(200) ,@Q_Grade int)
AS
Begin
	IF EXISTS (Select Std_ID,Ex_Id,Q_Id From Std_Exam Where Std_ID = @Std_ID and Ex_Id = @Ex_Id and Q_Id = @Q_Id)
		Select 'The Question ID That you have Entered In The Exam To This Student Already Exists'
	ELSE
		Insert Into Std_Exam Values (@Std_ID,@Ex_Id,@Q_Id,@Answer,@Q_Grade)
END

GO
------------------------------------------
CREATE PROCEDURE Update_Std_Exam (@Std_ID int ,@Ex_Id int ,@Q_Id varchar(50) ,
									@Answer varchar(200) ,@Q_Grade int)
AS
Begin
	IF EXISTS (Select Std_ID,Ex_Id,Q_Id From Std_Exam Where Std_ID = @Std_ID and Ex_Id = @Ex_Id and Q_Id = @Q_Id)
		Update Std_Exam Set Answer = @Answer , Q_Grade =@Q_Grade
				Where Std_ID = @Std_ID and Ex_Id = @Ex_Id and Q_Id = @Q_Id
	ELSE 
		select 'Error'
END

GO
------------------------------------------

-------------------------------------------KPIS-------------------------------------------
CREATE PROCEDURE Select_KPIS (@Std_ID int = NULL, @kpi_id int = NULL)
AS
Begin
	IF @Std_ID IS NULL and @kpi_id IS NULL
		Select * from KPIS
	ELSE IF @Std_ID IS NULL or @kpi_id IS NULL
		Begin
			IF @Std_ID IS NULL
				Select * from KPIS Where KPI_ID = @kpi_id
			ELSE IF @kpi_id IS NULL
				Select * from KPIS Where Std_ID = @Std_ID
			ELSE
				Select 'There is No KPI Exist With This Student'
		END
	ELSE IF Exists (Select Std_ID,KPI_ID From KPIS Where Std_ID = @Std_ID and KPI_ID = @kpi_id)
		Select * From KPIS Where Std_ID = @Std_ID and KPI_ID = @kpi_id
	ELSE
		Select 'There is No KPI Exist With This Student'
END

GO
------------------------------------------
CREATE PROCEDURE Delete_KPIS (@Std_ID int , @kpi_id int)
AS
Begin
	IF Exists (Select Std_ID,KPI_ID From KPIS Where Std_ID = @Std_ID and KPI_ID = @kpi_id)
		Delete From KPIS Where Std_ID = @Std_ID and KPI_ID = @kpi_id
	ELSE
		Select 'There is No KPI Exist With This Student'
END

GO
------------------------------------------
CREATE PROCEDURE Insert_KPIS (@Std_ID int ,@kpi_id int ,@Final_project varchar(50) = NULL,
     @Freelance varchar(50) = NULL,@Cert_Name varchar(50) = NULL,
	 @Cert_website varchar(50) = NULL ,@Cert_Duration int = NULL)
AS
Begin
	IF Exists (Select Std_ID,KPI_ID From KPIS Where Std_ID = @Std_ID and KPI_ID = @kpi_id)
		Select 'The KPI Exist With This Student'
	ELSE
		Insert Into KPIS Values(@Std_ID,@kpi_id,@Final_project,@Freelance,@Cert_Name,
									@Cert_website,@Cert_Duration)

END

GO
------------------------------------------
CREATE PROCEDURE Update_KPIS (@Std_ID int ,@kpi_id int ,@Final_project varchar(50) = NULL,
     @Freelance varchar(50) = NULL,@Cert_Name varchar(50) = NULL,
	 @Cert_website varchar(50) = NULL ,@Cert_Duration int = NULL)
AS
Begin
	IF Exists (Select Std_ID,KPI_ID From KPIS Where Std_ID = @Std_ID and KPI_ID = @kpi_id)
		Begin
			IF @Final_project IS NOT NULL
				Update KPIS Set Final_project = @Final_project
						Where Std_ID = @Std_ID and KPI_ID = @kpi_id
			IF @Freelance IS NOT NULL
				Update KPIS Set Freelance = @Freelance
						Where Std_ID = @Std_ID and KPI_ID = @kpi_id
			IF @Cert_Name IS NOT NULL
				Update KPIS Set Cert_Name = @Cert_Name
						Where Std_ID = @Std_ID and KPI_ID = @kpi_id
			IF @Cert_website IS NOT NULL
				Update KPIS Set Cert_website = @Cert_website
						Where Std_ID = @Std_ID and KPI_ID = @kpi_id
			IF @Cert_Duration IS NOT NULL
				Update KPIS Set Cert_Duration = @Cert_Duration
						Where Std_ID = @Std_ID and KPI_ID = @kpi_id
		END
	ELSE
		Select 'There is No KPI Exist With This Student'
END

GO
------------------------------------------

---------------------------------------------Q_Eam-----------------------------------------------
CREATE PROCEDURE Select_Q_Exam (@q_Id nvarchar(50) = NULL, @ex_id int = NULL)
AS
Begin
	IF @q_Id IS NULL and @ex_id IS NULL
		Select * from Q_Exam
	ELSE IF @q_Id IS NULL or @ex_id IS NULL
		Begin
			IF @q_Id IS NULL
				Select * from Q_Exam Where Ex_Id = @ex_id
			ELSE IF @ex_id IS NULL
				Select * from Q_Exam Where Q_Id = @q_Id
			ELSE
				Select 'There is No Question Exist With This Exam'
		END
	ELSE IF Exists (Select Q_Id,Ex_Id From Q_Exam Where Q_Id = @q_Id and Ex_Id = @ex_id)
		Select * From Q_Exam Where Q_Id = @q_Id and Ex_Id = @ex_id
	ELSE
		Select 'There is No Question Exist With This Exam'
END

GO
------------------------------------------
CREATE PROCEDURE Delete_Q_Exam (@q_Id nvarchar(50) , @ex_id int)
AS
Begin
	IF Exists (Select Q_Id,Ex_Id From Q_Exam Where Q_Id = @q_Id and Ex_Id = @ex_id)
		Delete From Q_Exam Where Q_Id = @q_Id and Ex_Id = @ex_id
	ELSE
		Select 'There is No Question Exist With This Exam'
END

GO
------------------------------------------
CREATE PROCEDURE Insert_Q_Exam (@q_Id nvarchar(50) , @ex_id int )
AS
Begin
	IF Exists (Select Q_Id,Ex_Id From Q_Exam Where Q_Id = @q_Id and Ex_Id = @ex_id)
		Select 'The Question Is Already Exist With This Exam'
	ELSE
		Insert Into Q_Exam Values (@q_Id,@ex_id)	
END

GO
------------------------------------------
CREATE PROCEDURE Update_Q_Exam (@q_Id nvarchar(50) , @ex_id int )
AS
Begin
	IF Exists (Select Q_Id,Ex_Id From Q_Exam Where Q_Id = @q_Id and Ex_Id = @ex_id)
		Update Q_Exam Set Q_Id = @q_Id Where Ex_Id = @ex_id		
	ELSE
		Select 'There is No Question Exist With This Exam'
END

GO
------------------------------------------