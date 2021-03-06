USE [JGBS_Interview]
GO
/****** Object:  Table [dbo].[tbl_Department]    Script Date: 11/16/2016 7:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Designation]    Script Date: 11/16/2016 7:50:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Designation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_tbl_Designation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Department] ON 

GO
INSERT [dbo].[tbl_Department] ([ID], [DepartmentName], [IsActive]) VALUES (1, N'Human Resource', 1)
GO
INSERT [dbo].[tbl_Department] ([ID], [DepartmentName], [IsActive]) VALUES (2, N'IT', 1)
GO
INSERT [dbo].[tbl_Department] ([ID], [DepartmentName], [IsActive]) VALUES (3, N'Account', 1)
GO
INSERT [dbo].[tbl_Department] ([ID], [DepartmentName], [IsActive]) VALUES (4, N'Admin', 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_Department] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Designation] ON 

GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (1, N'Admin', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (2, N'Jr. Sales', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (3, N'Jr Project Manager', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (4, N'Office Manager', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (5, N'Recruiter', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (6, N'Sales Manager', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (7, N'Sr. Sales', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (8, N'IT - Network Admin', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (9, N'IT - Jr .Net Developer', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (10, N'IT - Sr .Net Developer', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (11, N'IT - Android Developer', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (12, N'IT - PHP Developer', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (13, N'IT - SEO / BackLinking', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (14, N'Installer - Helper', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (15, N'Installer - Journeyman', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (16, N'Installer - Mechanic', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (17, N'Installer - Lead mechanic', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (18, N'Installer - Foreman', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (19, N'Commercial Only', 1, 1)
GO
INSERT [dbo].[tbl_Designation] ([ID], [DesignationName], [IsActive], [DepartmentID]) VALUES (20, N'SubContractor', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_Designation] OFF
GO
ALTER TABLE [dbo].[tbl_Designation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Designation_tbl_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tbl_Department] ([ID])
GO
ALTER TABLE [dbo].[tbl_Designation] CHECK CONSTRAINT [FK_tbl_Designation_tbl_Department]
GO
/****** Object:  StoredProcedure [dbo].[UDP_GetAllDesignationsForHumanResource]    Script Date: 11/16/2016 7:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shekhar Pawar
-- Create date: 15-Nov-2016
-- Description:	Returns all Designation Names from database table
-- =============================================
CREATE PROCEDURE [dbo].[UDP_GetAllDesignationsForHumanResource]
	-- Add the parameters for the stored procedure here
	AS
BEGIN
	SET NOCOUNT ON;	
  SELECT [ID]
      ,[DesignationName]
      ,[IsActive]
  FROM [dbo].[tbl_Designation] WITH(NOLOCK)
  WHERE [IsActive] = 1 AND DepartmentID = 1
  ORDER BY [DesignationName]

END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetUsersNDesignationForSalesFilter]    Script Date: 11/16/2016 7:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Shekhar Pawar
-- Create date: 16/11/2016
-- Description:	Fetch all sales and install users for who are in edit user in system
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUsersNDesignationForSalesFilter] 
AS
BEGIN

SET NOCOUNT ON;

	SELECT  
		DISTINCT Users.Id, FristName + ' ' + LastName AS FirstName,[Status]
	FROM tblInstallUsers AS Users 
	WHERE 
		Users.FristName IS NOT NULL AND 
		Users.FristName <> '' AND
		(
			[Status] = 'OfferMade' OR 
			[Status] = 'Offer Made' OR 
			[Status] = 'Active' OR 
			[Status] = 'Interview Date' OR 
			[Status] = 'InterviewDate' OR
			[Status] = 'Deactive'
		)
	ORDER BY [Status], FristName + ' ' + LastName
END

GO
