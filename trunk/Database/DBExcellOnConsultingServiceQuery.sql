/*
* Database: DBExcellOnConsultingServices
* Author: Hoangdp_c00473
* Start Date: 30.6.2011
* */

/*
* 1. CREATE DATABASE
* */
USE [master]
GO
IF EXISTS (SELECT * FROM sys.databases WHERE NAME = 'DBExcellOnConsultingServices')
	BEGIN
		DROP DATABASE DBExcellOnConsultingServices
	END
GO
CREATE DATABASE DBExcellOnConsultingServices
GO
USE DBExcellOnConsultingServices
GO

/*
* 2. CREATE TABLE
* */
CREATE TABLE Account
(
	Account_Id VARCHAR(10) NOT NULL,
	Employee_Id VARCHAR(10) NOT NULL,
	Role_Name VARCHAR(10) NOT NULL,
	Account_UserName NVARCHAR(50) NOT NULL,
	Account_Password NVARCHAR(MAX) NOT NULL,
	Account_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
	(
		[Account_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

)
GO
CREATE TABLE Category
(
	Category_Id VARCHAR(10) NOT NULL,
	Category_Name NVARCHAR(50) NOT NULL,
	Category_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
	(
		[Category_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Company
(
	Company_Id VARCHAR(10) NOT NULL,
	Company_Name VARCHAR(50) NOT NULL,
	Company_Logo NVARCHAR(MAX),
	Company_Description NVARCHAR(MAX),
	Company_Phone NVARCHAR(15) NOT NULL,
	Company_Email NVARCHAR(50) NOT NULL,
	Company_Address NVARCHAR(100) NOT NULL,
	Company_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
	(
		[Company_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Contact
(
	Contact_Id VARCHAR(10) NOT NULL,
	Contact_Title NVARCHAR(100),
	Contact_Content NVARCHAR(MAX) NOT NULL,
	Contact_Name NVARCHAR(50),
	Contact_Email NVARCHAR(50) NOT NULL,
	Contact_Date SMALLDATETIME NOT NULL,
	Contact_Status INT NOT NULL,
	Contact_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
	(
		[Contact_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Customer
(
	Customer_Id VARCHAR(10) NOT NULL,
	Customer_FulName NVARCHAR(100) NOT NULL,
	Customer_Phone NVARCHAR(15),
	Customer_Address NVARCHAR(100) NOT NULL,
	Customer_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
	(
		[Customer_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE CustomerOfCompany
(
	Customer_Id VARCHAR(10) NOT NULL,
	Company_Id VARCHAR(10) NOT NULL,
	CustomerOfCompany_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_CustomerOfCompany] PRIMARY KEY CLUSTERED 
	(
		[Customer_Id] ASC,
		[Company_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Dealer
(
	Dealer_Id VARCHAR(10) NOT NULL,
	Company_Id VARCHAR(10) NOT NULL,
	Dealer_Name NVARCHAR(50) NOT NULL,
	Dealer_Address NVARCHAR(100) NOT NULL,
	Dealer_Phone NVARCHAR(15),
	Dealer_Email NVARCHAR(50) NOT NULL,
	Dealer_IsDelete	BIT NOT NULL,
	CONSTRAINT [PK_Dealer] PRIMARY KEY CLUSTERED 
	(
		[Dealer_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Department
(
	Department_Id VARCHAR(10) NOT NULL,
	Department_Name NVARCHAR(50) NOT NULL,
	Department_Description NVARCHAR(MAX),
	Department_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
	(
		[Department_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Employee
(
	Employee_Id VARCHAR(10) NOT NULL,
	Department_Id VARCHAR(10) NOT NULL,
	Employee_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
	(
		[Employee_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE News
(
	News_Id VARCHAR(10) NOT NULL,
	News_Title NVARCHAR(100) NOT NULL,
	News_Content NVARCHAR(MAX) NOT NULL,
	News_Date SMALLDATETIME NOT NULL,
	News_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
	(
		[News_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE OrderOfService
(
	OrderOfService_Id VARCHAR(10) NOT NULL,
	Company_Id VARCHAR(10) NOT NULL,
	Employee_Id VARCHAR(10) NOT NULL,
	OrderService_TotalServices INT NOT NULL,
	OrderService_TotalCharges NVARCHAR(MAX) NOT NULL,
	OrderService_Description NVARCHAR(MAX),
	OrderService_PaymentMethod NVARCHAR(50) NOT NULL,
	OrderService_PaymentDate SMALLDATETIME NOT NULL,
	OrderService_BillDate SMALLDATETIME NOT NULL,
	OrderService_Status INT NOT NULL,
	OrderService_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_OrderOfService] PRIMARY KEY CLUSTERED 
	(
		[OrderOfService_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE OrderOfServiceDetail
(
	OrderService_Id VARCHAR(10) NOT NULL,
	Servive_Id VARCHAR(10) NOT NULL,
	OrderServiceDetail_FromDate SMALLDATETIME NOT NULL,
	OrderServiceDetail_ToDate SMALLDATETIME NOT NULL,
	OrderServiceDetail_NumberOfEmployee INT NOT NULL,
	OrderServiceDetail_Price NVARCHAR(MAX) NOT NULL,
	OrderServiceDetail_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_OrderServiceDetail] PRIMARY KEY CLUSTERED 
	(
		[OrderService_Id] ASC,
		[Servive_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Problem
(
	Problem_Id VARCHAR(10) NOT NULL,
	Customer_Id VARCHAR(10) NOT NULL,
	Problem_Title NVARCHAR(100),
	Problem_Content NVARCHAR(MAX) NOT NULL,
	Problem_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED 
	(
		[Problem_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE ProblemOfCustomer
(
	ProblemOfCustomer_Id VARCHAR(10) NOT NULL,
	Customer_Id VARCHAR(10) NOT NULL,
	Company_Id VARCHAR(10) NOT NULL,
	Problem_Id VARCHAR(10) NOT NULL,
	ProblemOfCustomer_Date SMALLDATETIME NOT NULL,
	ProblemOfCustomer_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_ProblemOfCustomer] PRIMARY KEY CLUSTERED 
	(
		[ProblemOfCustomer_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Product
(
	Product_Id VARCHAR(10) NOT NULL,
	Company_Id VARCHAR(10) NOT NULL,
	Category_Id VARCHAR(10) NOT NULL,
	Product_Name NVARCHAR(50) NOT NULL,
	Product_Price NVARCHAR(MAX) NOT NULL,
	Product_Description NVARCHAR(MAX),
	Product_Image NVARCHAR(MAX),
	Product_ManufactureDate SMALLDATETIME,
	Product_ExpiryDate SMALLDATETIME,
	Product_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
	(
		[Product_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE [Profile]
(
	Profile_Id VARCHAR(10) NOT NULL,
	Employee_Id VARCHAR(10) NOT NULL,
	Profile_FirtName NVARCHAR(50),
	Profile_LastName NVARCHAR(50),
	Profile_Gender BIT,
	Profile_DateOfBirth SMALLDATETIME,
	Profile_Address NVARCHAR(100),
	Profile_PhoneNumber NVARCHAR(15),
	Profile_Email NVARCHAR(50),
	Profile_Avatar NVARCHAR(MAX),
	Profile_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
	(
		[Profile_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE [Role]
(
	Role_Name VARCHAR(10) NOT NULL,
	Role_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
	(
		[Role_Name] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE [Service]
(
	Service_Id VARCHAR(10) NOT NULL,
	[Service_Name] NVARCHAR(50) NOT NULL,
	Service_Image NVARCHAR(MAX),
	Service_Description NVARCHAR(MAX),
	Service_Charge NVARCHAR(MAX) NOT NULL,
	Service_IsDelete BIT NOT NULL,
	CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
	(
		[Service_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO

/*
* 3. CREATE CONSTRAINT
* */
/*------------------------------TABLE ACCOUNT------------------------------*/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Employee]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([Role_Name])
REFERENCES [dbo].[Role] ([Role_Name])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
/*------------------------------#END TABLE ACCOUNT------------------------------*/
GO
/*------------------------------TABLE CUSTOMER OF COMPANY------------------------------*/
ALTER TABLE [dbo].[CustomerOfCompany]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOfCompany_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[CustomerOfCompany] CHECK CONSTRAINT [FK_CustomerOfCompany_Company]
GO
ALTER TABLE [dbo].[CustomerOfCompany]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOfCompany_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_Id])
GO
ALTER TABLE [dbo].[CustomerOfCompany] CHECK CONSTRAINT [FK_CustomerOfCompany_Customer]
/*------------------------------#END TABLE CUSTOMER OF COMPANY------------------------------*/
GO
/*------------------------------TABLE DEALER------------------------------*/
ALTER TABLE [dbo].[Dealer]  WITH CHECK ADD  CONSTRAINT [FK_Dealer_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[Dealer] CHECK CONSTRAINT [FK_Dealer_Company]
/*------------------------------#END TABLE DEALER------------------------------*/
GO
/*------------------------------TABLE EMPLOYEE------------------------------*/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Department_Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
/*------------------------------#END TABLE EMPLOYEE------------------------------*/
GO
/*------------------------------TABLE ORDER SERVICE------------------------------*/
ALTER TABLE [dbo].[OrderOfService]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfService_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[OrderOfService] CHECK CONSTRAINT [FK_OrderOfService_Company]
GO
ALTER TABLE [dbo].[OrderOfService]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfService_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[OrderOfService] CHECK CONSTRAINT [FK_OrderOfService_Employee]
/*------------------------------#END TABLE ORDER SERVICE------------------------------*/
GO
/*------------------------------TABLE ORDER SERVICE DETAIL------------------------------*/
ALTER TABLE [dbo].[OrderOfServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfServiceDetail_OrderOfService] FOREIGN KEY([OrderService_Id])
REFERENCES [dbo].[OrderOfService] ([OrderOfService_Id])
GO
ALTER TABLE [dbo].[OrderOfServiceDetail] CHECK CONSTRAINT [FK_OrderOfServiceDetail_OrderOfService]
GO
ALTER TABLE [dbo].[OrderOfServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfServiceDetail_Service] FOREIGN KEY([Servive_Id])
REFERENCES [dbo].[Service] ([Service_Id])
GO
ALTER TABLE [dbo].[OrderOfServiceDetail] CHECK CONSTRAINT [FK_OrderOfServiceDetail_Service]
/*------------------------------#END TABLE ORDER SERVICE DETAIL------------------------------*/
GO
/*------------------------------TABLE PROBLEM------------------------------*/
ALTER TABLE [dbo].[ProblemOfCustomer]  WITH CHECK ADD  CONSTRAINT [FK_ProblemOfCustomer_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[ProblemOfCustomer] CHECK CONSTRAINT [FK_ProblemOfCustomer_Company]
GO
ALTER TABLE [dbo].[ProblemOfCustomer]  WITH CHECK ADD  CONSTRAINT [FK_ProblemOfCustomer_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_Id])
GO
ALTER TABLE [dbo].[ProblemOfCustomer] CHECK CONSTRAINT [FK_ProblemOfCustomer_Customer]
GO
ALTER TABLE [dbo].[ProblemOfCustomer]  WITH CHECK ADD  CONSTRAINT [FK_ProblemOfCustomer_Problem] FOREIGN KEY([Problem_Id])
REFERENCES [dbo].[Problem] ([Problem_Id])
GO
ALTER TABLE [dbo].[ProblemOfCustomer] CHECK CONSTRAINT [FK_ProblemOfCustomer_Problem]
/*------------------------------#END TABLE PROBLEM------------------------------*/
GO
/*------------------------------TABLE PRODUCT------------------------------*/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
/*------------------------------#END TABLE PRODUCT------------------------------*/
GO
/*------------------------------TABLE PROFILE------------------------------*/
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Employee]
/*------------------------------#END TABLE PROFILE------------------------------*/