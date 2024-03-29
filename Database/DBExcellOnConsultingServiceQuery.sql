/*
* Database: DBExcellOnConsultingServices
* Author: Hoangdp_c00473
* Start Date: 30.06.2011
* */

/*
* 1. CREATE DATABASE
* */
USE [master]
GO
IF EXISTS ( SELECT  *
            FROM    sys.databases
            WHERE   NAME = 'DBExcellOnConsultingServices' ) 
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
      Account_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Employee_Id UNIQUEIDENTIFIER UNIQUE
                                   NOT NULL ,
      Role_Name NVARCHAR(256) NOT NULL ,
      Account_UserName NVARCHAR(256) UNIQUE
                                     NOT NULL ,
      Account_Password NVARCHAR(128) NOT NULL ,
      Account_IsLocked BIT NOT NULL
                           DEFAULT 0 ,
      Account_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ( [Account_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Category
    (
      Category_Id UNIQUEIDENTIFIER NOT NULL
                                   DEFAULT ( NEWID() ) ,
      Category_Name NVARCHAR(256) UNIQUE
                                  NOT NULL ,
      Category_IsDelete BIT NOT NULL
                            DEFAULT 0 ,
      CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ( [Category_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Company
    (
      Company_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Company_Name NVARCHAR(256) UNIQUE
                                 NOT NULL ,
      Company_Logo NVARCHAR(MAX) ,
      Company_Description NVARCHAR(MAX) ,
      Company_Phone NVARCHAR(16) ,
      Company_Email NVARCHAR(256) UNIQUE ,
      Company_Address NVARCHAR(256) ,
      Company_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ( [Company_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Contact
    (
      Contact_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Contact_Title NVARCHAR(256) NOT NULL ,
      Contact_Content NVARCHAR(MAX) ,
      Contact_Name NVARCHAR(256) ,
      Contact_Email NVARCHAR(256) UNIQUE
                                  NOT NULL ,
      Contact_Date SMALLDATETIME NOT NULL ,
      Contact_Status INT NOT NULL ,
      Contact_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ( [Contact_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Customer
    (
      Customer_Id UNIQUEIDENTIFIER NOT NULL
                                   DEFAULT ( NEWID() ) ,
      Customer_FulName NVARCHAR(256) NOT NULL ,
      Customer_Phone NVARCHAR(16) ,
      Customer_Address NVARCHAR(256) ,
      Customer_IsDelete BIT NOT NULL
                            DEFAULT 0 ,
      CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ( [Customer_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE CustomerOfCompany
    (
      Customer_Id UNIQUEIDENTIFIER NOT NULL ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      CustomerOfCompany_IsDelete BIT NOT NULL
                                     DEFAULT 0 ,
      CONSTRAINT [PK_CustomerOfCompany] PRIMARY KEY CLUSTERED
        ( [Customer_Id] ASC, [Company_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Dealer
    (
      Dealer_Id UNIQUEIDENTIFIER NOT NULL
                                 DEFAULT ( NEWID() ) ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      Dealer_Name NVARCHAR(256) NOT NULL ,
      Dealer_Address NVARCHAR(256) ,
      Dealer_Phone NVARCHAR(16) ,
      Dealer_Email NVARCHAR(256) ,
      Dealer_IsDelete BIT NOT NULL
                          DEFAULT 0 ,
      CONSTRAINT [PK_Dealer] PRIMARY KEY CLUSTERED ( [Dealer_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Department
    (
      Department_Id UNIQUEIDENTIFIER NOT NULL
                                     DEFAULT ( NEWID() ) ,
      Department_Name NVARCHAR(256) UNIQUE
                                    NOT NULL ,
      Department_Description NVARCHAR(MAX) ,
      Department_IsDelete BIT NOT NULL
                              DEFAULT 0 ,
      CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ( [Department_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Employee
    (
      Employee_Id UNIQUEIDENTIFIER NOT NULL
                                   DEFAULT ( NEWID() ) ,
      Department_Id UNIQUEIDENTIFIER NOT NULL ,
      Employee_FirtName NVARCHAR(256) ,
      Employee_LastName NVARCHAR(256) ,
      Employee_Gender BIT ,
      Employee_DateOfBirth SMALLDATETIME ,
      Employee_Address NVARCHAR(256) ,
      Employee_PhoneNumber NVARCHAR(16) ,
      Employee_Email NVARCHAR(256) NOT NULL ,
      Employee_Avatar NVARCHAR(MAX) ,
      Employee_IsDelete BIT NOT NULL
                            DEFAULT 0 ,
      CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ( [Employee_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE News
    (
      News_Id UNIQUEIDENTIFIER NOT NULL
                               DEFAULT ( NEWID() ) ,
      News_Title NVARCHAR(256) NOT NULL ,
      News_Content NVARCHAR(MAX) ,
      News_Date SMALLDATETIME NOT NULL ,
      News_IsDelete BIT NOT NULL
                        DEFAULT 0 ,
      CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED ( [News_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE OrderOfService
    (
      OrderOfService_Id UNIQUEIDENTIFIER NOT NULL
                                         DEFAULT ( NEWID() ) ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      Employee_Id UNIQUEIDENTIFIER NOT NULL ,
      OrderOfService_Description NVARCHAR(MAX) ,
      OrderOfService_PaymentMethod NVARCHAR(256) NOT NULL ,
      OrderOfService_PaymentDate SMALLDATETIME NOT NULL ,
      OrderOfService_BillDate SMALLDATETIME NOT NULL ,
      OrderOfService_Status INT NOT NULL ,
      OrderOfService_IsDelete BIT NOT NULL
                                DEFAULT 0 ,
      CONSTRAINT [PK_OrderOfService] PRIMARY KEY CLUSTERED
        ( [OrderOfService_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE OrderOfServiceDetail
    (
      OrderOfService_Id UNIQUEIDENTIFIER NOT NULL ,
      Service_Id UNIQUEIDENTIFIER NOT NULL ,
      OrderOfServiceDetail_FromDate SMALLDATETIME NOT NULL ,
      OrderOfServiceDetail_ToDate SMALLDATETIME NOT NULL ,
      OrderOfServiceDetail_NumberOfEmployee INT NOT NULL ,
      OrderOfServiceDetail_IsDelete BIT NOT NULL
                                      DEFAULT 0 ,
      CONSTRAINT [PK_OrderServiceDetail] PRIMARY KEY CLUSTERED
        ( [OrderOfService_Id] ASC, [Service_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Problem
    (
      Problem_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Problem_Title NVARCHAR(256) NOT NULL ,
      Problem_Content NVARCHAR(MAX) ,
      Problem_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED ( [Problem_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE ProblemOfCustomer
    (
      ProblemOfCustomer_Id UNIQUEIDENTIFIER NOT NULL
                                            DEFAULT ( NEWID() ) ,
      Customer_Id UNIQUEIDENTIFIER NOT NULL ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      Problem_Id UNIQUEIDENTIFIER NOT NULL ,
      ProblemOfCustomer_Date SMALLDATETIME NOT NULL ,
      ProblemOfCustomer_IsDelete BIT NOT NULL
                                     DEFAULT 0 ,
      CONSTRAINT [PK_ProblemOfCustomer] PRIMARY KEY CLUSTERED
        ( [ProblemOfCustomer_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Product
    (
      Product_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      Category_Id UNIQUEIDENTIFIER NOT NULL ,
      Product_Name NVARCHAR(256) NOT NULL ,
      Product_Type NVARCHAR(256) NOT NULL ,
      Product_Price NVARCHAR(256) NOT NULL ,
      Product_Description NVARCHAR(MAX) ,
      Product_Image NVARCHAR(MAX) ,
      Product_ManufactureDate SMALLDATETIME ,
      Product_ExpiryDate SMALLDATETIME ,
      Product_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ( [Product_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
Go
CREATE TABLE [Role]
    (
      Role_Name NVARCHAR(256) NOT NULL ,
      Role_IsDelete BIT NOT NULL
                        DEFAULT 0 ,
      CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ( [Role_Name] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE [Service]
    (
      Service_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      [Service_Name] NVARCHAR(256) UNIQUE
                                   NOT NULL ,
      Service_Image NVARCHAR(MAX) ,
      Service_Description NVARCHAR(MAX) ,
      Service_Charge NVARCHAR(256) NOT NULL ,
      Service_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED ( [Service_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
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
ALTER TABLE [dbo].[OrderOfServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfServiceDetail_OrderOfService] FOREIGN KEY([OrderOfService_Id])
REFERENCES [dbo].[OrderOfService] ([OrderOfService_Id])
GO
ALTER TABLE [dbo].[OrderOfServiceDetail] CHECK CONSTRAINT [FK_OrderOfServiceDetail_OrderOfService]
GO
ALTER TABLE [dbo].[OrderOfServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfServiceDetail_Service] FOREIGN KEY([Service_Id])
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
/*
* Task: Insert data to database
* Author: cuongph_c00034
* Start Date: 03.07.2011
* */

/*
* Insert into table DEPARTMENT
* */
INSERT  INTO Department
VALUES  ( '42a8d8d1-eaa0-4a4f-a623-01b82bb20729', 'HR Management', '', 'False' ) ;
GO
INSERT  INTO Department
VALUES  ( '3aaa7421-439c-4bca-a370-353df83f5bb3', 'Administration', '',
          'False' ) ;
GO
INSERT  INTO Department
VALUES  ( 'd5e6196d-c293-4378-bc20-842f7f8a6de0', 'Service', N'', 'False' ) ;
GO
INSERT  INTO Department
VALUES  ( '90671226-5e6d-4a53-aa11-9ad07999e1b6', 'Training', N'', 'False' ) ;
GO
INSERT  INTO Department
VALUES  ( '0e17cd07-266f-4528-86fa-cd4eda254743', 'Internet Security', N'It will take care of any technical related issues and problems like PC of an employee is hanged, PC of an employee is not getting started, One of the software application is not running properly, installing and uninstalling software, etc.',
          'False' ) ;
GO
INSERT  INTO Department
VALUES  ( '3a0891fa-6dd9-4bd0-a0f9-d0fbd1b3a031', 'Auditors', N'', 'False' ) ;
GO

/*
* Insert into table EMPLOYEE
* */
INSERT  INTO Employee
VALUES  ( '71801c3f-5a51-45c4-a6db-0b3220677b85',
          '42a8d8d1-eaa0-4a4f-a623-01b82bb20729', N'', N'', 'True', '', N'',
          N'', N'huydk@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '37a61117-f2c5-46f5-a7bc-218310c9c2b1',
          '3a0891fa-6dd9-4bd0-a0f9-d0fbd1b3a031', N'', N'', 'True', '', N'',
          N'', N'kientm@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'b557074f-2612-4e86-b208-297f75922d86',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'False', '', N'',
          N'', N'hienth@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '9363c012-b4e3-473d-8848-2b114bca188c',
          '3aaa7421-439c-4bca-a370-353df83f5bb3', N'', N'', 'True', '', N'',
          N'', N'dungqn@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'd0cfcbdc-8e28-4368-aa05-36eb22f80608',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'tungvm@Exellon.com',
          N'iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAACHDwAAjA8AAP1SAACBQAAAfXkAAOmLAAA85QAAGcxzPIV3AAAKOWlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAEjHnZZ3VFTXFofPvXd6oc0wAlKG3rvAANJ7k15FYZgZYCgDDjM0sSGiAhFFRJoiSFDEgNFQJFZEsRAUVLAHJAgoMRhFVCxvRtaLrqy89/Ly++Osb+2z97n77L3PWhcAkqcvl5cGSwGQyhPwgzyc6RGRUXTsAIABHmCAKQBMVka6X7B7CBDJy82FniFyAl8EAfB6WLwCcNPQM4BOB/+fpFnpfIHomAARm7M5GSwRF4g4JUuQLrbPipgalyxmGCVmvihBEcuJOWGRDT77LLKjmNmpPLaIxTmns1PZYu4V8bZMIUfEiK+ICzO5nCwR3xKxRoowlSviN+LYVA4zAwAUSWwXcFiJIjYRMYkfEuQi4uUA4EgJX3HcVyzgZAvEl3JJS8/hcxMSBXQdli7d1NqaQffkZKVwBALDACYrmcln013SUtOZvBwAFu/8WTLi2tJFRbY0tba0NDQzMv2qUP91829K3NtFehn4uWcQrf+L7a/80hoAYMyJarPziy2uCoDOLQDI3fti0zgAgKSobx3Xv7oPTTwviQJBuo2xcVZWlhGXwzISF/QP/U+Hv6GvvmckPu6P8tBdOfFMYYqALq4bKy0lTcinZ6QzWRy64Z+H+B8H/nUeBkGceA6fwxNFhImmjMtLELWbx+YKuGk8Opf3n5r4D8P+pMW5FonS+BFQY4yA1HUqQH7tBygKESDR+8Vd/6NvvvgwIH554SqTi3P/7zf9Z8Gl4iWDm/A5ziUohM4S8jMX98TPEqABAUgCKpAHykAd6ABDYAasgC1wBG7AG/iDEBAJVgMWSASpgA+yQB7YBApBMdgJ9oBqUAcaQTNoBcdBJzgFzoNL4Bq4AW6D+2AUTIBnYBa8BgsQBGEhMkSB5CEVSBPSh8wgBmQPuUG+UBAUCcVCCRAPEkJ50GaoGCqDqqF6qBn6HjoJnYeuQIPQXWgMmoZ+h97BCEyCqbASrAUbwwzYCfaBQ+BVcAK8Bs6FC+AdcCXcAB+FO+Dz8DX4NjwKP4PnEIAQERqiihgiDMQF8UeikHiEj6xHipAKpAFpRbqRPuQmMorMIG9RGBQFRUcZomxRnqhQFAu1BrUeVYKqRh1GdaB6UTdRY6hZ1Ec0Ga2I1kfboL3QEegEdBa6EF2BbkK3oy+ib6Mn0K8xGAwNo42xwnhiIjFJmLWYEsw+TBvmHGYQM46Zw2Kx8lh9rB3WH8vECrCF2CrsUexZ7BB2AvsGR8Sp4Mxw7rgoHA+Xj6vAHcGdwQ3hJnELeCm8Jt4G749n43PwpfhGfDf+On4Cv0CQJmgT7AghhCTCJkIloZVwkfCA8JJIJKoRrYmBRC5xI7GSeIx4mThGfEuSIemRXEjRJCFpB+kQ6RzpLuklmUzWIjuSo8gC8g5yM/kC+RH5jQRFwkjCS4ItsUGiRqJDYkjiuSReUlPSSXK1ZK5kheQJyeuSM1J4KS0pFymm1HqpGqmTUiNSc9IUaVNpf+lU6RLpI9JXpKdksDJaMm4ybJkCmYMyF2TGKQhFneJCYVE2UxopFykTVAxVm+pFTaIWU7+jDlBnZWVkl8mGyWbL1sielh2lITQtmhcthVZKO04bpr1borTEaQlnyfYlrUuGlszLLZVzlOPIFcm1yd2WeydPl3eTT5bfJd8p/1ABpaCnEKiQpbBf4aLCzFLqUtulrKVFS48vvacIK+opBimuVTyo2K84p6Ss5KGUrlSldEFpRpmm7KicpFyufEZ5WoWiYq/CVSlXOavylC5Ld6Kn0CvpvfRZVUVVT1Whar3qgOqCmrZaqFq+WpvaQ3WCOkM9Xr1cvUd9VkNFw08jT6NF454mXpOhmai5V7NPc15LWytca6tWp9aUtpy2l3audov2Ax2yjoPOGp0GnVu6GF2GbrLuPt0berCehV6iXo3edX1Y31Kfq79Pf9AAbWBtwDNoMBgxJBk6GWYathiOGdGMfI3yjTqNnhtrGEcZ7zLuM/5oYmGSYtJoct9UxtTbNN+02/R3Mz0zllmN2S1zsrm7+QbzLvMXy/SXcZbtX3bHgmLhZ7HVosfig6WVJd+y1XLaSsMq1qrWaoRBZQQwShiXrdHWztYbrE9Zv7WxtBHYHLf5zdbQNtn2iO3Ucu3lnOWNy8ft1OyYdvV2o/Z0+1j7A/ajDqoOTIcGh8eO6o5sxybHSSddpySno07PnU2c+c7tzvMuNi7rXM65Iq4erkWuA24ybqFu1W6P3NXcE9xb3Gc9LDzWepzzRHv6eO7yHPFS8mJ5NXvNelt5r/Pu9SH5BPtU+zz21fPl+3b7wX7efrv9HqzQXMFb0ekP/L38d/s/DNAOWBPwYyAmMCCwJvBJkGlQXlBfMCU4JvhI8OsQ55DSkPuhOqHC0J4wybDosOaw+XDX8LLw0QjjiHUR1yIVIrmRXVHYqLCopqi5lW4r96yciLaILoweXqW9KnvVldUKq1NWn46RjGHGnIhFx4bHHol9z/RnNjDn4rziauNmWS6svaxnbEd2OXuaY8cp40zG28WXxU8l2CXsTphOdEisSJzhunCruS+SPJPqkuaT/ZMPJX9KCU9pS8Wlxqae5Mnwknm9acpp2WmD6frphemja2zW7Fkzy/fhN2VAGasyugRU0c9Uv1BHuEU4lmmfWZP5Jiss60S2dDYvuz9HL2d7zmSue+63a1FrWWt78lTzNuWNrXNaV78eWh+3vmeD+oaCDRMbPTYe3kTYlLzpp3yT/LL8V5vDN3cXKBVsLBjf4rGlpVCikF84stV2a9021DbutoHt5turtn8sYhddLTYprih+X8IqufqN6TeV33zaEb9joNSydP9OzE7ezuFdDrsOl0mX5ZaN7/bb3VFOLy8qf7UnZs+VimUVdXsJe4V7Ryt9K7uqNKp2Vr2vTqy+XeNc01arWLu9dn4fe9/Qfsf9rXVKdcV17w5wD9yp96jvaNBqqDiIOZh58EljWGPft4xvm5sUmoqbPhziHRo9HHS4t9mqufmI4pHSFrhF2DJ9NProje9cv+tqNWytb6O1FR8Dx4THnn4f+/3wcZ/jPScYJ1p/0Pyhtp3SXtQBdeR0zHYmdo52RXYNnvQ+2dNt293+o9GPh06pnqo5LXu69AzhTMGZT2dzz86dSz83cz7h/HhPTM/9CxEXbvUG9g5c9Ll4+ZL7pQt9Tn1nL9tdPnXF5srJq4yrndcsr3X0W/S3/2TxU/uA5UDHdavrXTesb3QPLh88M+QwdP6m681Lt7xuXbu94vbgcOjwnZHokdE77DtTd1PuvriXeW/h/sYH6AdFD6UeVjxSfNTws+7PbaOWo6fHXMf6Hwc/vj/OGn/2S8Yv7ycKnpCfVEyqTDZPmU2dmnafvvF05dOJZ+nPFmYKf5X+tfa5zvMffnP8rX82YnbiBf/Fp99LXsq/PPRq2aueuYC5R69TXy/MF72Rf3P4LeNt37vwd5MLWe+x7ys/6H7o/ujz8cGn1E+f/gUDmPP8usTo0wAAAAlwSFlzAAALEgAACxIB0t1+/AAABjdJREFUeF7tnXtPFTEQxfn+n0tjouKbSJQoXgGB8AoC8l49N1lyXe6y92477TntNPEfL/vozq/Tmel0uvJsdbPxf/V+gxUXfr3Ch+wdgMo1oAPgANStAmufAl0DuAZwDVCzFnAN4BrANYBrgMpHQR8Az9/8aFbXtpu1jb3m6+ZBszE5bL5vHRUVOPMpYAb+lx9+TgV9eHLRXF7dNHd390237R+dOQClqMxXH7ea9W/7ze7B70eCnvcfk52TooRfZSTw9aetZnvvtLm4vF5I6O0fHZ/+KU741QDwfv3XVOghDbZAKZpvth9F2wAw2pYd6X2Q4F4OgIi3gLnaor39vFMcBEVpABh0t7d3FrJ/uCeeUZImKAIAuG9n51emgp+9eUmuoDwAmJtzNMQJXrybyGsDaQAQsMndECVUnhIkAcDIu7q+zS37h+crh4flAEAgh7Gp2gVSAMANY26K0UIZABC3V2hqmkAGgHkrc6xAYEVRxTCUAMAqsmcJEHIJFCCQAMBSUFb3Vlk6pgcgV6AnBhiuASIsHsGyVm0KS8j0GoAp4LMsiAoBImoAsMij3BRcQmoA2AM/Q3Cenl3SewLUAGChRblhiZrdEHQADAm7+Zec4gAEeAIwopQbspPYA0LUGkAxAjgLLDSAAxCgARwA+32brgEM5xjXAAGjH8aTawDXAIbj0/7WrgECNYC6F+AABALw6cuu/TA1fIK7gYEAqEcCsXfAA0EBEKgD4KHgAOFj5KhPAQ5AIACsewAWNRscgEAA1JeDD47P3QYIMYKQUqXcHIBADYA9gEr7AbqwOgCVA4C6RCEaMMW11ItB+ADWFT8spxiFHUK0AGAdHR/w/nGtRkuZRb036hfAk0kxksc+gxIAzP2Io5fSmDUBJQDq/n8XXGZbgBIAdeu/CwDzBhFKADCfKe8I6gLAXEeIFoCUZd+sbQ0UtxhrpFlfRwsAtlWV0qyFGHJ/WgDUs4FaeBHHCBGQ9bW0AKjnArQAsBeOogVApSjU0DTF7ALSnxcw9HEVfmcvM0+rAUCnchi4hRNZTdbzeMj9qQGIddhDTk3BXiaGGgDlAlGADsGskNGZ4lpqAPABkFSh2JDIonDCCD0AgEAxKoiDqlKM4NBnSAAQeuJXDg2icpiEBABqQSEYr6EjM9X1EgColYtTKA/XAiYBAF5WySVUOllMBgAlOyCV+o7xHBkAYFUrNKX5n34toEu4QmiYOQF0nsaQ0QB4+UWPec+pKVTcPzkjEC/MvldQoTZwVwtIaQB2b4A5+bPPYJQDAC4WY1MoByNvA7QdgKpla+zLvsVoAHQE+waZPAL2tK+n4gVyU0DbGabAUIyATK57yALAYgtg3T+X8GI8VxYAlsigous3C44DEGhNqoV+5eMAbQdYpgAYozFUca57yGoAlq1jDkBgIaix5DN5AezHwhTpBjLtHmavA1QkAEzRQPbdP0UCgNg7S1PLAZB3Az0UHO8sIUkvAEkXTE0pC1g6DgDBw/9H0QWmhiogcEsVtoJJA8Dk+vUB6ClhhnEBtpE/DwI1LSBlAyiUjlfaFCKVFg7LX6Ehc3lsdDPHdTIaQGWDqEJRCMk4gMKegFZDKa0NyGgApfLx7JXB5DSA2ulhCsfFyewMglWtWDkc0UHmItH0AECNKrh9Q54Jjo1hjg1Q2QCIok12Toa+qeTvWL5m3DpGAQASKjBSamgwZpmMxKwAYH5nSuxIDSC0XW47IQsA6LiSW2cNBtY4ctkJyQBAB5ny+KyFOub+2GOQ+oApcwCg5pUqfI0RXOxrkGqOwYLyeNbrAyYAYKt0qdZ8bGEP3Q82kuUKY1QAkB1bs1E3JMyQ32EzISEmdsJJMAB4IcxbJQRtQgSU8lq4zLFS0UcDADVfi++eUrjLPAup8aFG49IA1O67LyOglH8Lm2uM0bgwANj8oLgok1IIDM9a9sj6QQAgeKZ6PAwfWeEdFgWhFwAsXPiIVxD10+84lKP4CACkMymkX+uLJm0P+mIJ/wGgkniZ9tOV8zRMC707gzxyV46gn+oJAkqzSatTDaCw5aoO8aTpJYJ2LQQrsPK91fcFoAmmO4Pq67r3uP0CWHF0ACrnwQFwACr/ApV33zWAA1D5F6i8+38BKtHG0vVrjZ8AAAAASUVORK5CYII=',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'efb8e475-9cc0-4854-bff3-3e1d4e8a91a5',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'hoangqm@Exellon.com',
          N'iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAMAAAAp4XiDAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAABgUExURfP1+dzh7eXp8tHY58jR4s3V5O7x9vn6/Oru9NTa6Pz9/uns8/b4+vX2+v7+//b3+trg7MvT5MfQ4vj5+9fd6t7k7uPn8MbO4czT5PHz+NXc6dbc6dLZ6MbP4f///8TN4BBFKZQAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFYSURBVEhLrZVtc4JADIRBKFKo9QVRxHL3//9lD7VCdkOAmd4XHceH3VySJepWn2g10UV+9flnJKmz6sgmplTS+ObCiRXbOtJG/f/DSRYizf4FhI/DImP1AIRvOTFsrBSEc3tkCNkAwQwiRyKoHkRYxLmdtIbIoxtwvm3kS0GcjWw1pBMMGlORq4lU61VGszLAdi1/8yjE1l9yYSM4Yb1aZSIf6o3drRvTRHAwoS8H7Y5daakkKiITAFROKvJjdl9FZDLhjGnFyFI8LbIik9qt9LxjsGGsEpNMBhFDxq6EfM4hPgMGhtKzMe8BoVhWYhwuYEHAetiyJQjMv4yX8ADFGNTSzMa4x8lsZ5GU+oIMGWsJ2cy1kqMfgp/LL3iU4UUujXUXdcVyAY2RJleB/sfbaJcH5K5m6/sh23dmvJDTRakBNctnVx9IggM/ZXB3fiJn9Z0yQRW1/wWi4CPCygNUYQAAAABJRU5ErkJggg==',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '5edbc3de-f4d7-407f-a879-4055d79aa823',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'tienpm@Exellon.com',
          N'iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAMAAAAp4XiDAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAABgUExURfP1+dzh7eXp8tHY58jR4s3V5O7x9vn6/Oru9NTa6Pz9/uns8/b4+vX2+v7+//b3+trg7MvT5MfQ4vj5+9fd6t7k7uPn8MbO4czT5PHz+NXc6dbc6dLZ6MbP4f///8TN4BBFKZQAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFYSURBVEhLrZVtc4JADIRBKFKo9QVRxHL3//9lD7VCdkOAmd4XHceH3VySJepWn2g10UV+9flnJKmz6sgmplTS+ObCiRXbOtJG/f/DSRYizf4FhI/DImP1AIRvOTFsrBSEc3tkCNkAwQwiRyKoHkRYxLmdtIbIoxtwvm3kS0GcjWw1pBMMGlORq4lU61VGszLAdi1/8yjE1l9yYSM4Yb1aZSIf6o3drRvTRHAwoS8H7Y5daakkKiITAFROKvJjdl9FZDLhjGnFyFI8LbIik9qt9LxjsGGsEpNMBhFDxq6EfM4hPgMGhtKzMe8BoVhWYhwuYEHAetiyJQjMv4yX8ADFGNTSzMa4x8lsZ5GU+oIMGWsJ2cy1kqMfgp/LL3iU4UUujXUXdcVyAY2RJleB/sfbaJcH5K5m6/sh23dmvJDTRakBNctnVx9IggM/ZXB3fiJn9Z0yQRW1/wWi4CPCygNUYQAAAABJRU5ErkJggg==',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '68680e64-cb0e-4e29-bfad-4a074d616399',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'False', '', N'',
          N'', N'quynhma@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '09ee85c6-e47a-499c-8118-4e4459110db1',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'minhlt@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '990fe281-b507-4a11-af85-a83175a8d344',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'haihn@gmail.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'e02ee6b8-8d06-4d94-9ce2-aa7a33fa454e',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Vũ Thế', N'Quang',
          'true', '12/04/1985', N'79 đê La Thành Hà Nội', N'0969218337',
          N'quangvt@Exellon.com.vn',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'f076b848-a7fd-4df5-8a75-b4d269f15344',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Trương Vĩnh', N'Tâm',
          'true', '06/14/1984', N'27 Lê Đại Hành Hà Nội', N'0948418811',
          N'tamtv@Exellon.com.vn',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '754f0733-b860-46ec-94a1-d9c0102c32c2',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Nguyễn Tiến', N'Anh',
          'true', N'06/04/1986', N'213 Kim Ngưu Hà Nội', N'0946447821',
          N'anhnt@Exellon.com.vn',
          N'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',
          'False' ) ;
 GO
INSERT  INTO [Employee]
VALUES  ( '26ec8d80-5cae-4c1c-9456-dff1e5148b2c',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Đỗ Phú', N'Hoàng',
          'true', '06/08/1989', N'211 trương Định Hà Nội', N'0916114275',
          N'admin@Exellon.com.vn',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '97200740-f4d1-4820-b089-f7a545367aaf',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Nguyễn Minh', N'Châu',
          'true', '06/04/1981', N'218 Phan Đình Phùng Hà Nội',
          N'0989219779', N'info@Exellon.com.vn',
          N'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',
          'False' ) ;
GO

/*
* Insert into table ROLE
* */ 
INSERT  INTO [Role]
VALUES  ( 'Administrator', 'False' ) ;
GO
INSERT  INTO [Role]
VALUES  ( 'HR Manager', 'False' ) ;
GO
INSERT  INTO [Role]
VALUES  ( 'Service Manager', 'False' ) ;
GO
INSERT  INTO [Role]
VALUES  ( 'Service Employee', 'False' ) ;
GO
INSERT  INTO [Role]
VALUES  ( 'Employee', 'False' ) ;
GO

/*
* Insert into table ACCOUNT
* */
INSERT  INTO Account
VALUES  ( 'f6bd432d-e1b8-469f-91fd-3ac2de9cb704',
          '754f0733-b860-46ec-94a1-d9c0102c32c2', 'Administrator', 'admin',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
GO
INSERT  INTO Account
VALUES  ( 'eeca2cef-7ffb-433f-a442-615d8858f966',
          'e02ee6b8-8d06-4d94-9ce2-aa7a33fa454e', 'HR Manager', 'hrmanager',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
GO
INSERT  INTO Account
VALUES  ( 'c26e159c-9216-4b3a-895f-695492e09540',
          '990fe281-b507-4a11-af85-a83175a8d344', 'Service Manager', 'servicemanager',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
GO
INSERT  INTO Account
VALUES  ( 'cc8341e3-fc81-407d-934c-7d6889d50324',
          '97200740-f4d1-4820-b089-f7a545367aaf', 'Service Employee', 'serviceemployee',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
GO
INSERT  INTO Account
VALUES  ( '20e9ffbc-7f5b-4c5b-9c15-d1735d1a01ea',
          'f076b848-a7fd-4df5-8a75-b4d269f15344', 'Employee', 'employee',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
/*
* Insert into table COMPANY
* */ 
INSERT  INTO Company
VALUES  ( 'd4d232b2-8986-4ac0-b7e6-0a591f465fa6', N'Công ty TNHH Simply', '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',
          N'công ty cung ứng dầu ăn.chất lượng', N'0432146614',
          N'info@simply.com.vn', N'118 Lạc Trung Hà Nội', 'False' ) ;
GO
INSERT  INTO Company
VALUES  ( '18713451-f569-4778-afa6-af0fce1bc1e0',
          N'Công ty TNHH Ngôi Sao Việt', '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',
          N'công ty cung cấp dịch vụ du lịch', N'0432155166',
          N'info@vietstar.com.vn', N'816 đê La Thành Hà Nội', 'False' ) ;
GO
INSERT  INTO Company
VALUES  ( '125ab0d6-4b35-4dda-80f7-fa744aff3045', N'Công ty TNHH Toàn Thắng','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',
		  N'công ty sản xuất và nhập khẩu thiết bị điện máy ',
          N'0436144412', N'info@toanthang.com.vn',
          N'81 Đường Thành Hà Nội', 'False' ) ;
 GO
 
 /*
* Insert into table ORDER OF SERVICE
* */ 
INSERT  INTO OrderOfService
VALUES  ( 'a673f36e-e792-4176-be90-16415c426ecc',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          '97200740-f4d1-4820-b089-f7a545367aaf', N'hợp đồng 6 tháng',
          N'chuyển khoản 100%', '6/6/2011', '6/6/2011', 1, 'False' ) ;
GO
INSERT  INTO OrderOfService
VALUES  ( '01cfe750-6ea8-419d-8da9-b954c196b042',
          '18713451-f569-4778-afa6-af0fce1bc1e0',
          '990fe281-b507-4a11-af85-a83175a8d344', N'hợp đồng 12 tháng',
          N'chuyển khoản 100%', '6/26/2011', '6/16/2011', 0, 'False' ) ;
GO
INSERT  INTO OrderOfService
VALUES  ( '2de09cae-a842-4561-9ae2-c7662ca5e474',
          'd4d232b2-8986-4ac0-b7e6-0a591f465fa6',
          '754f0733-b860-46ec-94a1-d9c0102c32c2', N'hợp đồng 12 tháng',
          N'chuyển khoản 100%', '7/3/2011', '7/1/2011', 99, 'False' ) ;
GO

/*
* Insert into table SERVICE
* */
INSERT  INTO [Service]
VALUES  ( '51b24177-da84-4a18-8637-16c93656c0ca', N'In-bound Services', 
		  'iVBORw0KGgoAAAANSUhEUgAAAFcAAABXCAMAAABGFileAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAMAUExURQAAAP////j6/vv7/vn7//f5/fX3+yaF2dDP0+Lh5v7+//z8/fDw8fj5/fT2/Ofp7+Xm6dbX2u/x9uvt8tHd9PP1+fDy9uzu8vr7/evs7s/c8/b5/sHU8Pj6/b/V8sDV8qrH6rLM7bTN7eDr+PH2/ICn0YOp04Kx4o245e/1+/D1+vX5/fv9/9ze4MvNz/z9/vv8/RVcnBVcmxVbmxVbmRdgohdgoRdfoBZdnBZcmxZbmhZbmRhhpBhhoxdenxddnhpmqxlkpxljphljpRhgoRhfoBtpsBtorxtnrhtorRplqhplqBpjpxpkpx1uth1tthxrshxpsRxqsRxqrxtnrB9zvh9yvR5vuB1ttB1ssxxorhxpriN/0iN/0SJ9zyJ7zCJ7yyF4xiB0vx9xvB9xuh9wuR5tth5uth5utR5ttSN+zyN8zCJ5xiF3xCF1wiF2wiF1wSBzviByvSBxvCByuyBxuyWD1iWB1CR9ziN7yiN5yCN6yCJ4xSJ3xCJ3wyJ1wiaE2CaD1iWA0iR7zCR9zCR8yyR7yiR7ySN6xyJ2wSFvtymBzyqB0Cl9yil9yS2E0i2D0TGI1TCG0y5/yS+Ayi12ujWM2TaN2jSI0zaL1y94uy93ujB4uzuM1j+S3D+R20CT3UCS3Dp9uTt+ukeV3Dx+ukeU2UCEwUqX3UuY3kuY3UqW2kyZ30SIxUaFwVGb3lKc3kmKxUiJxFmh4V+Xyl+XyWCYynCl1H+y4nyu3YW35Ya45ZK+55XB6ZbC6ZrC6KfL7KjL7KrI5bPP6bTP6cbd8uTv+ebw+RZenRlmqRhioxpoqxllqBpmqR90vh1utR9yuyF4xCF2wSB0vSWC1CN8yiaF2DGBxzmFx0qX2FOe21eg3Vih3V+Yym+l03Gm1Hqx4Ym54+Lu+Ory+V+n4GCn4Guv5JjF5vb6/a/T7Mfg8e/2+7PY7drs9sDh8dXr9crn89bs9ej0+d3v9t3w9t7w9vf6+/3//9LT0////f39/fn5+ff39/X19fPz8////50w6SQAAAEAdFJOU////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////wBT9wclAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAMHUlEQVRYR52ZC3xbZRnGd3I5JbGaVHJZ0BEVrU4b6lbWy0jXdCs9vTga0tJ2dOtIT2eBrqStgltvTEe3ouJ1Oh1VJjgVnZdsEtRAJVJl4CY4B8wb9TrvsBZrt3bw83m/75zk5NYV3jQ56ck5/zzn+d7vfb+eLtMtHnr9nJAac3r9Rc7S6ZYtdoRBn8ZUd+gNi6MX4apK5w1G0W6fobDbRaNhnrPnFhWdlatQdfaZ2dSYsesuSs7C5VT9zPTZzDE9wyzKrjkzl51knLW5s4dt1si+OovNGbkFOKFg2h1bPNzT7LjM4Axc5sGse+Li4Z7N6kU6l3lwdiK6lJg4m82LNC5h7ZNnlhqT9swmp3IJOxNbKhXHxWYyglO4hJ2dOPpqYoJMTkuLFC6GbDZ6eMnxwDe/8cDhKMBzqVmRzEXizEQPLjG+cu+9X2aHRmFFarolccmFif2vPibSndByCRvLeS0RSwNruTD37OHXgs05jDxOtljDhVzjmdeEzck5g2KRlBMaLuQu0YXb078dTiQJTnAhd/bokuQ+m7N/8mzKlR1FsmlbSIILuRNp2DPaXfvjH0cLBPvEwZxnNccjJ7SC41wDUjdN7v4ZzTVMxD8+OE3lxr2vfWt7+5YtnH4USayZHMuMyi+wId1dyh8hxnUe1p/J2dLeHuqQ5SjtFiZP3+MLBDY1tHT2DG3enINjNSMX5+LAtGQ4ys4vmGEf2IRosLPVH5CkMJUaYTYyaTtSXlKxbl1Jsa9GkiPYp4pEnzfy95B7NtXd/VRRWLj3b44K5qjcUFfpk6RJti8amRcufbBm3epVq0qvKioq8sbmM3PTRg0HqiHmi4I5Jgc21klShHXj6bANr5e+o6SsaPXaqwgMwYpI6FT1IhtS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',
          N'The In-bound service is a service in which one can only receive the calls from the customers. These call centers provide 24 hours service to all customers. The primary goal of these call centers are to receive product orders, help customers both technically and non-technically, to find dealer location',
          '9Mt3y2TYg2A=', 'False' ) ;
GO
INSERT  INTO [Service]
VALUES  ( 'f40d7f1d-637e-4d55-a811-37579da818db', N'Out-bound Services', 
		  'iVBORw0KGgoAAAANSUhEUgAAAFcAAABXCAMAAABGFileAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAMAUExURQAAAP////j6/vv7/vn7//f5/fX3+yaF2dDP0+Lh5v7+//Dw8efp7+Xm6dbX2tHd9PHz9+zu8vr7/evs7sza88HS7cjX8IWk0rTJ58bX8bbO7rvS8LvR78DV8vb5/fL1+a7L7anI7Ojv9/L3/Ozx9vP3+/H1+fX4+/v9//r8/tze4MvNz/z9/hVcnBVbmhZdnhVbmRdgohdfoRZdnBZcmxZbmhZbmRhhpBhhoxdenhdenRpmqxlkqBlkpxljphlipRhgoRhfoBhfnxtpsBtorxtnrhtorRplqhplqBpjpxpkpx1uth1tthxqsRxpsBxqrxtnrCJ90CF6yx9zvh9yvR5vuB5utx1ttB1ssx1rshxprhxorSN/0iJ9zyJ7zCJ7yyF5ySB0vx9xvB9xuh9wuR5tth5utR5ttSN+0CN+zyN8zSJ4xiF3xCF1wiF2wiBzviByvSBxvCBxuyWD1iWC1SR9ziR9zSN8yyN7yiN6ySN5yCJ4xSJ3xCJ3wyJ1wiF1wCaE2CaD1iR8yyR7yiR6ySN6xyN5xyJ1wSJ2wSV3wSVzuSp9ySp+ySt9xidvsTCH1S1+xyx8wy5/xypztDOK2DKI1Sx3ujGByC13uTaN2i53ui94uzeL1zB5uzF4uS9zsTqO2TB0tDaCxj6Q2kCT3TV5tkKS2jl8ujt+uzt9uzx+uz+CvkuY3kqW2kyZ31Kc31Se4Vec2UyIvlGNwlCLwFWSyF+h3FiTyFuVyVqTxlyVyF+Xymqo32mn3mCYym6k1Xqu3H6y4X6w3YW35Ia35Ii34ZO/55bC6ZXB6JvE6p7D5aPJ66bK7KjM7azK5rPP6d7p89zm7xdgoBhioxpmqRtoqx9yuySB0yF4xCF2wSWE1yaF2DqFx0GHxE2Y2keJw0iKxEqLxFmh4Fqe2lSPw2Ci3Gam3mur41+YynSx5pXC6evx9u7z9+3y9vX5/Ovx9fj7/bDJ17rd77ze8MLi8crn89bt9d/x9/3//9LT0/Pz8v39/fn5+ff39/X19f///1OghIYAAAEAdFJOU////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////wBT9wclAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAMPElEQVRYR52ZDVwbdxnHe3k5lpCQ0GzidDG+rpQBGS+1QGjLSgo4SIsd0MKKHaG1FMbLRtuRUiQrtE7dnDq32dXq3Jtuuto537ax6Fw06sRoWze7dk7qnOKMttNCK3Qff8//fxfuLgld96Tk6OXum9/9nuf//P93LNDNH3r9WUEbZ/X6C5yl0y2Y7wiDPoEp79Ab5kfPw5WVzhiMossVo3C5RKNhhrPPzis6JVei6lyx6Sl1TMdcuguSU3A5VR+bOpM8pmLMotSak3PZScZpmzN12KaN7KtT2JyUm40Tsqec4/OHc4odlxychMs8mHZGLhzO6ZReJHKZB7ZI+O1ExJbKiwQuYV3RybcbUVdyk7Vcwk5Hxt5+RMiLxOxpuBx78mIiOXiBUZVPpGw6fPDiIgzFZ7VVscCoBKNwYuGHLjbCscRyU3HJhci+i49IosXgxgUTdjztncR4AljJhbm2g+8Em3YQday2WMGFXOPkO8KmpU2iWaiKTcGF3FQuBIOa73tp2zb1HjihEjzHhdzpQ8nkAjoW6Vd9cnf0zNhLqj2HUGzKKWSOC7mRJNhg2qFxl3BSIe94sD+cLbgiD/a/HEQc5/EPtWDisoIwoHQT5AaDD7HhNM58OJ5GnP7+/genqN1Ev7T2E52dna3bsKe//7v/FgTF4IhzYYPW3eC+8Bk24cT2bSNisP/jra093Y2NYbY3euKApw5R29TWvXbtS79RZS7OxYFjShuCwUkn9W2KyX7kqbWTkE119Z4JjC8kIxS1TZQUsigvL1/3lBn1FFcscyH3jMrdk6IExdEHO2+4oa0NTEA9Hm+UfRIOzQiZIW/hylK3Ox9R+EIKrjprh+JYXF+kezMueN36Zo+nelWIzcaWCerpsazCsjJ3Wf6Sq6/OfwrcuGBZL6pBZUPaQwouLvqZ2mafr7LSU13tZ3OEkJXFNtOFZe6ioiUfzb86/65cYUaUjZC4qIbpfSofjmvWOtH7fKtbrocLWWxd4uQmC/ZCtzsvrxjg/Px3CYIoC5a4gDjVxRuk+lKGmNVUVeWpnrDQTmPoNP8sBr15RcXF5PBPk3KV9r6cFuznl6sM2wNIG9cZCUlpjRXAhqKi4iUgv2YWRNkISS8qKjynt39bMK2fZ10VY6s9nlUhlF9myCl9AG5ZURGMKF6S/3CucF7DRdpOxrnUZTa0UrNWh9NfBcH1+7NsIZ408qGktBRO5JETnoXCrEsyWNILrqrzdrR2T2qx+hNrYDDI1Y3ekOz+FHHLimDxkvyChYLensBVlEOwtWe47aSWG65rabm+vr7ec7SmZlUWH4vZp0tKV0JwERTn558SZtIlIyS9OGTO3o6NnxoeHv4z9o0rkjftR6G1XF8FvdU1y6Qyi2WVYLyVwuIicBcJM5mpuR2BoZ7u7uE7UNKf2TVG6xkWf/c1+9a0VFXB4+rymm+xchOcBwoOrwQZFoN7pSCk5rYGBnt6erqHB0XhR30NN3+B5kSSvnm9zwfF4JITj/JhkeWtuObwSm5xcf4/hRmHWi/yJvnbsbZr1xCBe6aivX0Nfr8/RN3Wdc/65mZf85oWAns8R59mq9/YY0tLKg5fU1paCoeL898A18VHsrYeOjbu6RocBLm7O/rF3t7r+vw3t3eFdcKz6DokuJJyB+7zbEF/2ltSUFFxuJBqzZ1X8IYwm8hl9buhM7AX3KGhnmPHHmhr6+1taPC3t7efiDRu2QIweg8prvesZ+NCF1p65EhJQSEEuyG4/ErhLQ1XGm8btg6A20V6ez7dPQwwHH6xfVPjpsamTwIMK5jFnqfZMHb6Vyw9UlJSUXgNNeG8ry8S/qfhou9Qf9iwYyDQtXcvjNhFqSNwQ1+fv30TuLVb6phg32pvFW/t2aFVy1esKIEVhejuZUXfWyg4ErnoZxu27h4J7GGCd90IMFPc2/die3vjpqbPbtqyDorJCS/vOk7/8uUrlgJcgWKD4J+YBYumHlj/3dCxfeNIILCXHN4FK247Bi6sAHiTP+zM8hOXwI+x+VgMrVq2DOASgCsOl7rz3m0WrJr61Z0VzN/p2Lq9cyAwupeDWbHBCsrdzf6QXtA7X6WpyOfbz1vdaW9NjQwugN7PoxxMWi4Mfp24GwcgeA+cABjk7jYC9910gOV/6mtUbBI2NrGqurycBFPuVrrd34e9Vk1/0IH7QkfH9s5bwN0Td0KyuM8/ye+STtzTeF9I6hlhLxpFOQSTFRWH3Xk/Nwsmq6af6TDH6r/csXXHLcgcgVETzApKXVvDCWaoLhSxjduk5wZOvxcdqKbm2o8tX770SEGh+66PCEKORdN/dRBs/hsZsXv3QGAnwMSVa8LPe/y4PPnQCJ7wUgOqroETKLaCle7XsgVr3F55HLP12X9vhRE7Bga4Yj7syImGCTthscBheApDltdLjeLo0ZprCVzo9lxmFnLi9s5xURG5f4XgHRAMj9lwRurQKIa7pAXOGL5biogXkz5rFACDW+B+DZNQjkW2V8FFZi6/FUbs2D0C7k4aHYM3MofH2NxgYwscHlE/G3bo8bB42bJlK1Z4LhMEkylTtlfBJcHkMFI3MBrYs4cVG4Hb2Fx2NouvIimcB/iwo1aMJk+19mS2MJthjWnXO9QyIfiD98upYxbzmmhjxeAM8U5Ovz7WTONuTSV1No+HHP7G7yF3rhri/Zf1Yoy5X8GJHZ1weHSUUscaxfDEuCjoQ9K8ARMO+Ph4BrfqD/Wk1/Mzs3A+Yy5rai4EG37IUjcyMgKHqSbQJ4Z6ukLRMDcZK6iw31eHRoEBvYa1TOI+uQi1q5TL/I0vhgFe9AgGR+cI1Ro1INYyURMN/okozTwztpDXV1uLzkaCfS1emkSXfxtDwqqSq+bqoOk/90Pw6MDIKDUKKrbBoR4qtoYTYafNNj7hrWxsrN3MOxsEE/bhywXBkWFyxIuBz2/KW3HUxPvv3rp9AGAIpvHMrTiGzob+g1l0NXp8I3q81IqB/cp7zMLsOdRuvBiIq77Bx7Md/a/v3Bog8CizgmqCJg9pVnoRkwfuMqCYptHVXmB/axb0OTnovEqFSZ6XGD7w1QDAIzTs+PCgBgTF6JjX9fW1E7i2lnErK73ffK9ZmDFlKIYEn+e1DySQu9w3HyFwIECTErOYUndMmu78UNy0GZMow756KZIJrMOldCHZc09YYX7fX26HCWSEnDtKHZs8aFJqbKyr49hncXOlB1ZtbjK96Gy4gVj8/J0EZbljgnf1HLuNWXyTv13Geh/9JUpvNodh1c9zkj6nNcIL8++egOSd5DDzgXcggIFtQjH4Vlf6n/0wsI5zybDJn/8a6Q7t1BWPfw56d4L6x8EhqcX39spY/zOsvVnP5ZgcCWplf/WaMOjghXnxm0/cGwjciCbM+ztmpLZebu3+1xn1fE4GCsxlNCjOl9Z9bKPl4kG3kW7Tcj/0i8fv3duNYFCkrbdunX//j19AupizOSYLZmDV6RKXPStP5OoNoshuAHP/dcVzf3rl9i7ULor3jld+8NyluTKVxGKUqc++ABeKRftbrIWZzbn6xQtPnVq4eLGeM9FsM86B6khHHWhEXYir14t2h9XqmJXbeXw7a8q46ipgkbAEqvynggWpfNCJ6Q6Hw2I1mXJM0HV+dkaYmX0r3WLKuISgoFqtFlSCjufMgGBb6alUCq7O5bBIYbWacnIyMjLOXcIDzIwcRrXgix1YkBFzLpL6YMAX4iVmWiw4j4XVYgUabDlMJkCJSlz8ZIrzc+OfGtMJKnOBzoyR03LMERkZYTcm6jXQUy/VF4pgyCZg66C6xxUQgHO4AcpIV0iWfEjg2mUmP9GSzr+VgfHD+Jn8lUk/tMmkZa+BH5iCa5d1cIBdxHhiR4vs/MzMdGnLfsWLItMur3vjz2E0el3S9/OTabklyvOWGEuP2dNjsXQ7+1sR3u12O/bRTvyi6etKriQKAviZ/FBRXsyJ4NjtLv6GDb3hRf/oTQVeAFvmwsiksNMppA9EuWnjz1oUtJF+2B68iRTKKU09v0EEp5Iol8zVxU9hp6eMlPMxXShdH78yxYXJ4Pm5KdcP0uXhbFyb6sKMOMdonMMaRXqJWITRG23ZL3NOKH3AnwXVghTG4yx8xmC0ZVx8Ewt5m4qrvUrFcVyOisEWjHzVqJmLtesSzmWXKyuRFceVgcFwbMukKstp7j//BzGpvQXJiK04AAAAAElFTkSuQmCC',
          N'The Out-bound service is a service in which the employees of Excell-on call the customers for product promotions, for checking with the customer satisfaction on the services they provide, and for the telemarketing. Outbound Call Centers depends on the technological solutions, extensive experience, quality assurance programs and commitment to customer service excellence that further ensures maximum results from the direct marketing efforts for its success',
          'GFK+dee7Q28=', 'False' ) ;
GO
INSERT  INTO [Service]
VALUES  ( 'e0d8cc13-18a9-4c13-88a5-5beeb124986a', N'Tele Marketing Services',
          'iVBORw0KGgoAAAANSUhEUgAAAFcAAABXCAMAAABGFileAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAMAUExURQAAAP////j6/vv7/vn7//f5/fX3+yeE2P/9/9DP0+Lh5v7+//Dw8efp7+Xm6dbX2tHd9PP1+fDy9uzu8uvs7sDV8r/W8uvy+rzX8src7trn9OHr9fP3+/v9/9ze4MvNz/z9/hVcnBVbmxVamBValxVZlhZcmxZbmhhhpBhhohdenhddnBljphhgoRhfoBtpsBtorxtnrhtorRplqRpkpxlipBlioxxqsBxprxtnrBtmqh9yvR5vuB5utx1ttR1ssx1rsiN/0iN/0SB0vx9xvB9xux9wuR5ttiR/0iJ4xiF3xCF2wiF1wSBzviBxvCByvCaF2SWB0yR+0CR+zyR9ziR9zSN8yyN7yiN6ySN5yCJ4xSJ3xCJ2wyaC1SWA0SR7yyR8yyeD1yaB0yJusyqG2Sd7xiV1vSRxtS2H2TGK2ip2vC+Ayi18witysjaM2zaN2jKAxzB4uzJ9wDqP2zaEyzR7uj6R3ECT3UCS3DmCw0OU3T2GyTp+vEaW3jx+ukmX3kKJyUyZ3kaMy0yT0kWFv0mKxVSd4EiHwEuKxFmg4VOV0lOSy1GNxF6j4mCk4liXz1qa01aSyGeo416az1yVyVySw2yr5GCYynKv5Wyk1muh03Ww5mug0HSr3GuezH2153So13Kl04S56IW5532t2Xmn0Ia45oa45X6s1o2+64Ku1Yay2ZLB64y435TC64654JXC6pbC6ZO944yz1pK53JvB45q+3qjN76nO8KjM7qjM7aLF5J7A36jL7K/R8KnK6KvJ5arG4LHO6LvY8rTP6cLc9LrT6sHW6svh9c3i9dLl9s3f8Nbn99fl8tTi7+Hu+uTv+efx+hVZlRpmqTmFxz6CvkyQzGiq42qt5HCv5Xmz5nGm1Iu12ZG42sjg9cTa7cje8djp+NHi8d/t+d3q9e71++zz+fD2+2uv5Gyv5Pb6/fj7/fr8/crn89bs9ej0+d7w9v3//9LT0////f39/fn5+ff39/X19fPz8////wAAAAAAAAAAAAAAAAAAAAAAAMEjhrQAAAD6dFJOU////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////wDeYEUjAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAJ2UlEQVRYR5WZe3wcVRXHM/sYyja7yexummrLUrbSLn1g7MO2MU0am5SubWw0hEZLQpIialsMATEqUJpKbQOFAqKlVNGKskgFCWoVNFBiLSpGrYJAq60WKKHkzablT3/n3jszd16bj2ezO/uY+e5vfvfMOXdv8ny5w+8fVewx6vdPcJTPl5drj4DfwdTf8Adyo3NwdaXZQFDVtGEKTVODgSxnj+YU7ckVVJ82PGKPYc03IdmDy6n+4aFB9xgaZhZ5a3bnsoOCI4VFPKZMmTp16u8osJ0yhb1XOBJkX+1hsyv3Ihxw0VBRD4tnn/mVPZ55lj4oGmL7uYNduMyDkaJuFk896R5P0YdFI55eOLnMg8HuDOLRR37oHY88msl0D3p54eASVjvSj3jn9f254/V3+vuPaO4m27mEHe4h7Guv3j9RvPpaf3/PsCvYxiXsSHfX/xPdZLIjLWxcDNlIpjNHHP/zyeO2jzMAj9qzwspF4gxnOhBf9Yivn1SUYz+9Xf60oyMDK+zpZuGSC91tiC95xfcHKAFOdsqft7V1O52QuYTtqUVc+wWP+MqfWGFQ9sufX1tb2+MAy1yYO9hJ3Au84icc+9dvfucmaZfa2k7ksdViiQu5wf6c2NuOce7xB5U/3mMB96NYWHJC4kIuc8FT7QXPcewfbvuvorz9oAUMJyyCTS7kjnTl5N5zlnPvZnacvd8E19Z2IdnkFmJyIbc7J/aLv+fY5zrfYts3LIK7rYINbgCpS3K9Xdg/g+GKO3/N+cpVzfX1dU2t7IjaLiSxdHHkBcUL2JDb3Zve4LSf7XlXcMvLy68oW1X9yZUbGupWU65JI2dwsS8lg5fclsYnOa3vlVMCq5QuXLgIt3mLF5UuWFK1F2/rItHng/w55A56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',
          N'The Tele Marketing service is a service which is purely for the promotion of marketing or sales of the products and services',
          'G3Ww0DMWCOk=', 'False' ) ;
GO

/*
* Insert into table ORDER OF SERVICE DETAIL
* */
INSERT  INTO OrderOfServiceDetail
VALUES  ( 'a673f36e-e792-4176-be90-16415c426ecc',
          '51b24177-da84-4a18-8637-16c93656c0ca', '6/12/2011', '12/12/2011', 1, 'False' ) ;
GO
INSERT  INTO OrderOfServiceDetail
VALUES  ( '01cfe750-6ea8-419d-8da9-b954c196b042',
          'f40d7f1d-637e-4d55-a811-37579da818db', '7/1/2011', '7/1/2012', 1,'False' ) ;
GO
INSERT  INTO OrderOfServiceDetail
VALUES  ( '01cfe750-6ea8-419d-8da9-b954c196b042',
          'e0d8cc13-18a9-4c13-88a5-5beeb124986a', '6/12/2011', '11/12/2011', 1, 'False' ) ;
GO

/*
* Insert into table CATEGORY
* */
INSERT  INTO Category
VALUES  ( '2e18d6f7-3187-4a1d-b3bd-6a89e858fcd2', N'Food', 'False' ) ;
GO
INSERT  INTO Category
VALUES  ( 'e3639a41-39be-4fb4-ae18-80d384f818e1', N'Travel', 'False' ) ;
GO

/*
* Insert into table PRODUCT
* */
INSERT  INTO Product
VALUES  ( '1bc3d5e0-b1c4-4967-bdd4-88d567e6271f',
          'd4d232b2-8986-4ac0-b7e6-0a591f465fa6',
          '2e18d6f7-3187-4a1d-b3bd-6a89e858fcd2',
          N'dầu ăn tinh chế đậu nành', 'Product', 'WimEXHocBME=',
          N'sản xuất tại VN Ngon bổ rẻ', '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', 
          '4/24/2011', '4/24/2014',
          'False' ) ;
GO
INSERT  INTO Product
VALUES  ( '34f7272e-0181-4874-a387-7f9e8f57d2f6',
          '18713451-f569-4778-afa6-af0fce1bc1e0',
          '2e18d6f7-3187-4a1d-b3bd-6a89e858fcd2', N'sữa đậu nành',
          'Product', 'TNc/MRe1r2A=', N'sản xuất tại VN Ngon bổ rẻ', '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',
          '6/21/2011', '12/21/2011', 'False' ) ;
GO
INSERT  INTO Product
VALUES  ( '33b29288-2181-44d3-b10d-736d5d694095',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          'e3639a41-39be-4fb4-ae18-80d384f818e1', N'gói du lịch nha trang',
          'Service', 'byqSFKAq5fk=',
          N'đảm bảo đầy đủ.an toàn trong 3 ngày', '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', 
          '1/1/2011', '1/1/2015', 'False' ) ;
GO
INSERT  INTO Product
VALUES  ( '13ce7b43-c0f5-4784-955f-430a0a503286',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          'e3639a41-39be-4fb4-ae18-80d384f818e1', N'gói du lịch Cát Bà',
          'Service', 'VVLjuk8zYwg=',
          N'đảm bảo đầy đủ.an toàn trong 3 ngày', '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', 
          '1/1/2011', '1/1/2015', 'False' ) ;
GO

/*
* Insert into table CUSTOMER
* */
INSERT  INTO Customer
VALUES  ( 'abb10eda-13cf-47ae-a0e7-0a7d472763e3', N'Hoàng Mạnh',
          N'0914551112', N'1129 Láng  Hà Nội', 'False' ) ;
GO
INSERT  INTO Customer
VALUES  ( '01cb9816-8339-4e1f-8818-3179527a30c3', N'Nguyễn Minh',
          N'0912 561 552', N'14 Thái Thịnh Đống Đa Hà Nội', 'False' ) ;
GO
INSERT  INTO Customer
VALUES  ( '12777dc2-6da1-4f8c-a5e9-7bb947e6a88b', N'Lê Thông', N'0944214442',
          N'145 Đại Cồ Việt-Hai Bà Trưng-Hà Nội', 'False' ) ;
GO
INSERT  INTO Customer
VALUES  ( '25d7e88e-109b-4b8e-853a-db9aba955cd2', N'Trần Giang',
          N'0123776776', N'212-Lê Duẩn-Hà Nội', 'False' ) ;
GO

/*
* Insert into table CUSTOMER OF COMPANY
* */
INSERT  INTO CustomerOfCompany
VALUES  ( '12777dc2-6da1-4f8c-a5e9-7bb947e6a88b',
          'd4d232b2-8986-4ac0-b7e6-0a591f465fa6', 'False' ) ;
GO
INSERT  INTO CustomerOfCompany
VALUES  ( '01cb9816-8339-4e1f-8818-3179527a30c3',
          '18713451-f569-4778-afa6-af0fce1bc1e0', 'False' ) ;
GO
INSERT  INTO CustomerOfCompany
VALUES  ( '25d7e88e-109b-4b8e-853a-db9aba955cd2',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045', 'False' ) ;
GO

/*
* Insert into table PROBLEM
* */
INSERT  INTO Problem
VALUES  ( 'c08c0081-789b-42d8-81d6-11dd98cbe09d', N'giá cả',
          N'giá cao quá đi', 'False' ) ;
GO
INSERT  INTO Problem
VALUES  ( '36bae9b9-4743-47b3-a33f-61a27aee6351', N'chất lượng',
          N'không ngon', 'False' ) ;
GO
INSERT  INTO Problem
VALUES  ( '2d48455b-e449-4637-aa77-bf0b10602f54', N'chất lượng',
          N'Phục vụ tour tốt', 'False' ) ;
GO

/*
* Insert into table PROBLEM OF CUSTOMER
* */
INSERT  INTO ProblemOfCustomer
VALUES  ( '11dc56cd-733d-42e0-a89b-1b5dfa353c17',
          '01cb9816-8339-4e1f-8818-3179527a30c3',
          '18713451-f569-4778-afa6-af0fce1bc1e0',
          'c08c0081-789b-42d8-81d6-11dd98cbe09d', '7/1/2011', 'False' ) ;
GO
INSERT  INTO ProblemOfCustomer
VALUES  ( 'a6f82f9f-e179-41ab-bf8c-41aed64dc7fe',
          '12777dc2-6da1-4f8c-a5e9-7bb947e6a88b',
          'd4d232b2-8986-4ac0-b7e6-0a591f465fa6',
          '36bae9b9-4743-47b3-a33f-61a27aee6351', '7/15/2011', 'False' ) ;
GO
INSERT  INTO ProblemOfCustomer
VALUES  ( '447a589f-740a-417a-9220-cf5329130599',
          '25d7e88e-109b-4b8e-853a-db9aba955cd2',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          '2d48455b-e449-4637-aa77-bf0b10602f54', '7/18/2011', 'False' ) ;
GO

/*
* Insert into table DEALER
* */
INSERT  INTO Dealer
VALUES  ( 'f7fd0e02-30be-4e0a-826f-1f9c6b0711e6',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          N'cửa hàng bách hóa Hướng Dương',
          N'310 Tôn Thất Tùng-Hà Nội', N'0432141156',
          N'bachhoahuongduong@gmail.com', 'False' ) ;

/*
* Task: Create Procerdure
* Author: anhlt_c00177
* Start Date: 03.07.2011
* */
GO

CREATE PROC [dbo].[Category_Update]
    @Category_Id UNIQUEIDENTIFIER ,
    @Category_Name NVARCHAR(50) ,
    @Category_IsDelete BIT
AS 
    UPDATE  dbo.Category
    SET     Category_Name = @Category_Name ,
            Category_IsDelete = @Category_IsDelete
    WHERE   Category_Id = @Category_Id

GO
CREATE PROC [dbo].[Category_UpdateStatus]
    @Category_Id UNIQUEIDENTIFIER ,
    @Category_IsDelete BIT
AS 
    UPDATE  dbo.Category
    SET     Category_IsDelete = @Category_IsDelete
    WHERE   Category_Id = @Category_Id

go

CREATE PROC [dbo].[Category_ShowOnewDisplay]
    @Category_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Category
    WHERE   Category_Id = @Category_Id
            AND Category_IsDelete = 0
go

CREATE PROC [dbo].[Category_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.Category
    WHERE   Category_IsDelete = 0
go
CREATE PROC [dbo].[Category_Insert]
    @Category_Id UNIQUEIDENTIFIER ,
    @Category_Name NVARCHAR(50)
AS 
    INSERT  INTO dbo.Category
            ( Category_Id, Category_Name )
    VALUES  ( @Category_Id, @Category_Name )
    GO

CREATE PROC [dbo].[Category_Delete]
    @Category_Id UNIQUEIDENTIFIER
AS 
    DELETE  FROM dbo.Category
    WHERE   Category_Id = @Category_Id
    go

CREATE PROC [dbo].[Category_CheckName]
    @Category_Name NVARCHAR(50)
AS 
    SELECT  *
    FROM    dbo.Category
    WHERE   Category_Name = @Category_Name
    go
CREATE PROC [dbo].[Category_Check]
    @Category_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Category
    WHERE   Category_Id = @Category_Id
            AND Category_IsDelete = 0
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
go


CREATE PROC [dbo].[Company_UpdateStatus]
    @Company_Id UNIQUEIDENTIFIER
AS 
    UPDATE  dbo.Company
    SET     Company_IsDelete = 0
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.Product
    SET     Product_IsDelete = 0
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.ProblemOfCustomer
    SET     ProblemOfCustomer_IsDelete = 0
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.CustomerOfCompany
    SET     CustomerOfCompany_IsDelete = 0
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.Dealer
    SET     Dealer_IsDelete = 0
    WHERE   Company_Id = @Company_Id
GO
CREATE PROC [dbo].[Company_UpdateStatusRemove]
    @Company_Id UNIQUEIDENTIFIER
AS 
    UPDATE  dbo.Company
    SET     Company_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.Product
    SET     Product_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.ProblemOfCustomer
    SET     ProblemOfCustomer_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.CustomerOfCompany
    SET     CustomerOfCompany_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.Dealer
    SET     Dealer_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    GO
CREATE PROC [dbo].[Company_Update]
    @Company_Id UNIQUEIDENTIFIER ,
    @Company_Name NVARCHAR(256) ,
    @Company_Logo NVARCHAR(MAX) ,
    @Company_Description NVARCHAR(MAX) ,
    @Company_Phone NVARCHAR(16) ,
    @Company_Email NVARCHAR(256) ,
    @Company_Address NVARCHAR(256) ,
    @Company_IsDelete BIT
AS 
    UPDATE  Company
    SET     Company_Name = @Company_Name ,
            Company_Logo = @Company_Logo ,
            Company_Description = @Company_Description ,
            Company_Phone = @Company_Phone ,
            Company_Email = @Company_Email ,
            Company_Address = @Company_Address ,
            Company_IsDelete = @Company_IsDelete
    WHERE   Company_Id = @Company_Id
GO
CREATE PROC [dbo].[Company_ShowOnewDisplay]
    @Company_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_Id = @Company_Id
            AND Company_IsDelete = 0
GO
CREATE PROC [dbo].[Company_ShowAllDisplayRemove]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_IsDelete = 1
            AND (Company_Address LIKE N'%' + @SearchKey + '%'
            OR Company_Email LIKE N'%' + @SearchKey + '%'
            OR Company_Name LIKE N'%' + @SearchKey + '%'
            OR Company_Phone LIKE N'%' + @SearchKey + '%')
                
GO
CREATE PROC [dbo].[Company_ShowAllDisplay]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_IsDelete = 0
            AND ( Company_Address LIKE N'%' + @SearchKey + '%'
                  OR Company_Email LIKE N'%' + @SearchKey + '%'
                  OR Company_Name LIKE N'%' + @SearchKey + '%'
                  OR Company_Phone LIKE N'%' + @SearchKey + '%'
                )
GO
CREATE PROC [dbo].[Company_Insert]
    @Company_Name NVARCHAR(256) ,
    @Company_Logo NVARCHAR(MAX) ,
    @Company_Description NVARCHAR(MAX) ,
    @Company_Phone NVARCHAR(16) ,
    @Company_Email NVARCHAR(256) ,
    @Company_Address NVARCHAR(256)
AS 
    INSERT  INTO dbo.Company
            ( Company_Name ,
              Company_Logo ,
              Company_Description ,
              Company_Phone ,
              Company_Email ,
              Company_Address           
            )
    VALUES  ( @Company_Name ,
              @Company_Logo ,
              @Company_Description ,
              @Company_Phone ,
              @Company_Email ,
              @Company_Address
            )
GO
CREATE PROCEDURE [dbo].[Company_Delete]
    @Company_Id UNIQUEIDENTIFIER
AS 
    DECLARE @isCheck INT
    SET @isCheck = 0
    SELECT  @isCheck = COUNT(Company_Id)
    FROM    OrderOfService
    WHERE   Company_Id = @Company_Id
    IF ( @isCheck = 0 ) 
        BEGIN
            DELETE  FROM dbo.Product
            WHERE   Company_Id = @Company_Id

            DELETE  FROM [dbo].ProblemOfCustomer
            WHERE   Company_Id = @Company_Id
            
            DELETE  FROM [dbo].CustomerOfCompany
            WHERE   Company_Id = @Company_Id
            
            DELETE  FROM dbo.Dealer
            WHERE   Company_Id = @Company_Id

            DELETE  FROM dbo.Company
            WHERE   Company_Id = @Company_Id
                    AND Company_Id NOT IN ( SELECT  Company_Id
                                            FROM    dbo.OrderOfService )
        END    
GO
CREATE PROC [dbo].[Company_CheckName]
    @Company_Name NVARCHAR(50)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_Name = @Company_Name
GO
CREATE PROC [dbo].[Company_CheckEmail]
    @Company_Email NVARCHAR(256)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_Email = @Company_Email   
go
       
CREATE PROC [dbo].[Customer_Insert]
    @Customer_FulName NVARCHAR(256) ,
    @Customer_Phone NVARCHAR(16) ,
    @Customer_Address NVARCHAR(256)
AS 
    INSERT  INTO dbo.Customer
            ( Customer_FulName ,
              Customer_Phone ,
              Customer_Address             
            )
    VALUES  ( @Customer_FulName , -- Customer_FulName - nvarchar(256)
              @Customer_Phone , -- Customer_Phone - nvarchar(16)
              @Customer_Address
            )
 Go
CREATE PROC [dbo].[CustomerOfCompany_Check]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.CustomerOfCompany
    WHERE   Company_Id = @Company_Id
            AND Customer_Id = @Customer_Id
GO            
CREATE PROC [dbo].[CustomerOfCompany_Insert]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER
AS 
    INSERT  INTO dbo.CustomerOfCompany
            ( Customer_Id, Company_Id )
    VALUES  ( @Customer_Id, -- Customer_Id - uniqueidentifier
              @Company_Id  -- Company_Id - uniqueidentifier              
              )

Go
CREATE PROC [dbo].[Dealer_Insert]
    @Company_Id UNIQUEIDENTIFIER ,
    @Dealer_Name NVARCHAR(256) ,
    @Dealer_Address NVARCHAR(256) ,
    @Dealer_Phone NVARCHAR(16) ,
    @Dealer_Email NVARCHAR(256)
AS 
    INSERT  INTO dbo.Dealer
            ( Company_Id ,
              Dealer_Name ,
              Dealer_Address ,
              Dealer_Phone ,
              Dealer_Email               
            )
    VALUES  ( @Company_Id ,
              @Dealer_Name ,
              @Dealer_Address ,
              @Dealer_Phone ,
              @Dealer_Email         
            )
GO

-------Problem
CREATE PROC [dbo].[Problem_Update]
    @Problem_Id UNIQUEIDENTIFIER ,
    @Problem_Title NVARCHAR(256) ,
    @Problem_Content NVARCHAR(MAX) ,
    @Problem_IsDelete BIT
AS 
    UPDATE  dbo.Problem
    SET     Problem_Title = @Problem_Title ,
            Problem_Content = @Problem_Content ,
            Problem_IsDelete = @Problem_IsDelete
    WHERE   Problem_Id = @Problem_Id
Go
CREATE PROC [dbo].[Problem_UpdateStatus]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    UPDATE  dbo.Problem
    SET     Problem_IsDelete = 0
    WHERE   Problem_Id = @Problem_Id
Go
CREATE PROC [dbo].[Problem_ShowOnewDisplay]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    SELECT  A.Problem_Id ,
            A.Problem_Title ,
            A.Problem_Content ,
            B.Customer_FulName ,
            D.Company_Name
    FROM    dbo.Problem AS A
            INNER JOIN dbo.ProblemOfCustomer AS C ON C.Problem_Id = A.Problem_Id
            INNER JOIN dbo.Customer AS B ON B.Customer_Id = C.Customer_Id
            INNER JOIN dbo.Company AS D ON C.Company_Id = D.Company_Id
    WHERE   A.Problem_Id = @Problem_Id
    
Go
CREATE PROC [dbo].[Problem_ShowAllDisplayRemove]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  A.Problem_Id ,
            A.Problem_Title ,
            A.Problem_Content ,
            B.Customer_FulName ,
            C.ProblemOfCustomer_Date ,
            D.Company_Name
    FROM    dbo.Problem AS A
            INNER JOIN dbo.ProblemOfCustomer AS C ON C.Problem_Id = A.Problem_Id
            INNER JOIN dbo.Customer AS B ON B.Customer_Id = C.Customer_Id
            INNER JOIN dbo.Company AS D ON D.Company_Id = C.Company_Id
    WHERE   A.Problem_IsDelete = 1
            AND ( A.Problem_Title LIKE '%' + @SearchKey + '%'
                  OR A.Problem_Content LIKE '%' + @SearchKey + '%'
                  OR B.Customer_FulName LIKE '%' + @SearchKey + '%'
                )
go
CREATE PROC [dbo].[Problem_ShowAllDisplay]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  A.Problem_Id ,
            A.Problem_Title ,
            A.Problem_Content ,
            B.Customer_FulName ,
            C.ProblemOfCustomer_Date ,
            D.Company_Name
    FROM    dbo.Problem AS A
            INNER JOIN dbo.ProblemOfCustomer AS C ON C.Problem_Id = A.Problem_Id
            INNER JOIN dbo.Customer AS B ON B.Customer_Id = C.Customer_Id
            INNER JOIN dbo.Company AS D ON D.Company_Id = C.Company_Id
    WHERE   A.Problem_IsDelete = 0
            AND ( A.Problem_Title LIKE '%' + @SearchKey + '%'
                  OR A.Problem_Content LIKE '%' + @SearchKey + '%'
                  OR B.Customer_FulName LIKE '%' + @SearchKey + '%'
                )
go
CREATE PROC [dbo].[Problem_Insert]
    @Problem_Id UNIQUEIDENTIFIER ,
    @Problem_Title NVARCHAR(256) ,
    @Problem_Content NVARCHAR(MAX)
AS 
    INSERT  INTO dbo.Problem
            ( Problem_Id ,
              Problem_Title ,
              Problem_Content           
            )
    VALUES  ( @Problem_Id ,
              @Problem_Title , -- Problem_Title - nvarchar(256)
              @Problem_Content  -- Problem_Content - nvarchar(max)
          
            )
go
CREATE PROC [dbo].[Problem_DeleteRemove]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    BEGIN
        UPDATE  dbo.Problem
        SET     Problem_IsDelete = 1
        WHERE   Problem_Id = @Problem_Id
     
        UPDATE  dbo.ProblemOfCustomer
        SET     ProblemOfCustomer_IsDelete = 1
        WHERE   Problem_Id = @Problem_Id

    END
go
CREATE PROC [dbo].[Problem_Delete]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    BEGIN
        DELETE  FROM dbo.ProblemOfCustomer
        WHERE   Problem_Id = @Problem_Id

        DELETE  FROM dbo.Problem
        WHERE   Problem_Id = @Problem_Id
    END
    
go
-------ProblemOfCustomer
CREATE PROC [dbo].[ProblemOfCustomer_Update]
    @ProblemOfCustomer_Id UNIQUEIDENTIFIER ,
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER ,
    @Problem_Id UNIQUEIDENTIFIER ,
    @ProblemOfCustomer_Date SMALLDATETIME ,
    @ProblemOfCustomer_IsDelete BIT
AS 
    UPDATE  dbo.ProblemOfCustomer
    SET     Customer_Id = @Customer_Id ,
            Company_Id = @Company_Id ,
            Problem_Id = @Problem_Id ,
            ProblemOfCustomer_Date = @ProblemOfCustomer_Date ,
            ProblemOfCustomer_IsDelete = @ProblemOfCustomer_IsDelete
    WHERE   ProblemOfCustomer_Id = @ProblemOfCustomer_Id
GO

CREATE PROC [dbo].[ProblemOfCustomer_Insert]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER ,
    @Problem_Id UNIQUEIDENTIFIER ,
    @ProblemOfCustomer_Date SMALLDATETIME
AS 
    INSERT  INTO dbo.ProblemOfCustomer
            ( Customer_Id ,
              Company_Id ,
              Problem_Id ,
              ProblemOfCustomer_Date 
              
            )
    VALUES  ( @Customer_Id , -- Customer_Id - uniqueidentifier
              @Company_Id , -- Company_Id - uniqueidentifier
              @Problem_Id , -- Problem_Id - uniqueidentifier
              @ProblemOfCustomer_Date  -- ProblemOfCustomer_Date - smalldatetime             
            )
go

    CREATE PROC [dbo].[ProblemOfCustomer_Delete]
        @ProblemOfCustomer_Id UNIQUEIDENTIFIER
    AS 
        DELETE  FROM dbo.ProblemOfCustomer
        WHERE   ProblemOfCustomer_Id = @ProblemOfCustomer_Id   

Go
CREATE PROC [dbo].[Product_Insert]
    @Company_Id UNIQUEIDENTIFIER ,
    @Category_Id UNIQUEIDENTIFIER ,
    @Product_Name NVARCHAR(256) ,
    @Product_Type NVARCHAR(256) ,
    @Product_Price NVARCHAR(MAX) ,
    @Product_Description NVARCHAR(MAX) ,
    @Product_Image NVARCHAR(MAX) ,
    @Product_ManufactureDate SMALLDATETIME ,
    @Product_ExpiryDate SMALLDATETIME
AS 
    INSERT  INTO dbo.Product
            ( Company_Id ,
              Category_Id ,
              Product_Name ,
              Product_Type ,
              Product_Price ,
              Product_Description ,
              Product_Image ,
              Product_ManufactureDate ,
              Product_ExpiryDate               
            )
    VALUES  ( @Company_Id , -- Company_Id - uniqueidentifier
              @Category_Id , -- Category_Id - uniqueidentifier
              @Product_Name , -- Product_Name - nvarchar(256)
              @Product_Type , -- Product_Type - nvarchar(256)
              @Product_Price , -- Product_Price - nvarchar(256)
              @Product_Description , -- Product_Description - nvarchar(max)
              @Product_Image , -- Product_Image - nvarchar(max)
              @Product_ManufactureDate , -- Product_ManufactureDate - smalldatetime
              @Product_ExpiryDate  -- Product_ExpiryDate - smalldatetime              
            )
GO
CREATE PROC [dbo].[Product_ShowAllDisplay]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  A.Product_Id ,
            A.Product_ExpiryDate ,
            A.Product_ManufactureDate ,
            A.Product_Image ,
            A.Product_Name ,
            A.Product_Price ,
            A.Product_Type ,
            A.Product_Description ,
            B.Company_Name ,
            C.Category_Name
    FROM    dbo.Product AS A
            INNER JOIN dbo.Company AS B ON A.Company_Id = B.Company_Id
            INNER JOIN dbo.Category AS C ON A.Category_Id = C.Category_Id
    WHERE   Product_IsDelete = 0
            AND ( Product_Name LIKE N'%' + @SearchKey + '%'
                  OR Product_Price LIKE N'%' + @SearchKey + '%'
                  OR Product_Type LIKE N'%' + @SearchKey + '%'
                  OR Product_Description LIKE N'%' + @SearchKey + '%'
                  OR Company_Name LIKE N'%' + @SearchKey + '%'
                  OR Category_Name LIKE N'%' + @SearchKey + '%'
                  OR Product_ManufactureDate LIKE N'%' + @SearchKey + '%'
                  OR Product_ExpiryDate LIKE N'%' + @SearchKey + '%'
                )
GO                
CREATE PROC [dbo].[Product_UpdateStatusRemove]
    @Product_Id UNIQUEIDENTIFIER     
AS 
    UPDATE  dbo.Product
    SET     Product_IsDelete = 1
    WHERE   Product_Id = @Product_Id                

GO
CREATE PROC [dbo].[Product_ShowAllDisplayRemove]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  A.Product_Id ,
            A.Product_ExpiryDate ,
            A.Product_ManufactureDate ,
            A.Product_Image ,
            A.Product_Name ,
            A.Product_Price ,
            A.Product_Type ,
            A.Product_Description ,
            B.Company_Name ,
            C.Category_Name
    FROM    dbo.Product AS A
            INNER JOIN dbo.Company AS B ON A.Company_Id = B.Company_Id
            INNER JOIN dbo.Category AS C ON A.Category_Id = C.Category_Id
    WHERE   Product_IsDelete = 1
            AND ( Product_Name LIKE N'%' + @SearchKey + '%'
                  OR Product_Price LIKE N'%' + @SearchKey + '%'
                  OR Product_Type LIKE N'%' + @SearchKey + '%'
                  OR Product_Description LIKE N'%' + @SearchKey + '%'
                  OR Company_Name LIKE N'%' + @SearchKey + '%'
                  OR Category_Name LIKE N'%' + @SearchKey + '%'
                  OR Product_ManufactureDate LIKE N'%' + @SearchKey + '%'
                  OR Product_ExpiryDate LIKE N'%' + @SearchKey + '%'
                )
GO
CREATE PROC [dbo].[Product_UpdateStatus]
    @Product_Id UNIQUEIDENTIFIER    
AS 
    UPDATE  dbo.Product
    SET     Product_IsDelete = 0
    WHERE   Product_Id = @Product_Id
GO
CREATE PROC [dbo].[Product_ShowOnewDisplay]
    @Product_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Product
    WHERE   Product_Id = @Product_Id         
    
GO
CREATE PROC [dbo].[Product_Delete]
    @Product_Id UNIQUEIDENTIFIER
AS 
    DELETE  FROM dbo.Product
    WHERE   Product_Id = @Product_Id
GO    
CREATE PROCEDURE [dbo].[Customer_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.Customer
    WHERE   Customer_IsDelete = 0
Go	
CREATE PROC [dbo].[Product_Update]
    @Product_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER ,
    @Category_Id UNIQUEIDENTIFIER ,
    @Product_Name NVARCHAR(256) ,
    @Product_Type NVARCHAR(256) ,
    @Product_Price NVARCHAR(MAX) ,
    @Product_Description NVARCHAR(MAX) ,
    @Product_Image NVARCHAR(MAX) ,
    @Product_ManufactureDate SMALLDATETIME ,
    @Product_ExpiryDate SMALLDATETIME ,
    @Product_IsDelete BIT
AS 
    UPDATE  dbo.Product
    SET     Company_Id = @Company_Id ,
            Category_Id = @Category_Id ,
            Product_Name = @Product_Name ,
            Product_Type = @Product_Type ,
            Product_Price = @Product_Price ,
            Product_Description = @Product_Description ,
            Product_Image = @Product_Image ,
            Product_ManufactureDate = @Product_ManufactureDate ,
            Product_ExpiryDate = @Product_ExpiryDate ,
            Product_IsDelete = @Product_IsDelete
    WHERE   Product_Id = @Product_Id    

