USE [KPI_TASK]
GO

/****** Object:  Table [dbo].[CHANNEL]    Script Date: 20-12-2021 17:06:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CHANNEL](
	[DATE_CREATED] [datetime] NULL,
	[IS_RECORD_INACTIVE] [nvarchar](255) NULL,
	[LAST_MODIFIED_DATE] [datetime] NULL,
	[LIST_ID] [float] ,
	[LIST_ITEM_NAME] [nvarchar](255) NULL
) ON [PRIMARY]
GO


ALTER TABLE transactions ADD PRIMARY KEY(TRANSACTION_ID);


alter table transactions modify TRANSACTION_ID INT default(1,1)


alter column TRANSACTION_ID INT default

alter table transactions add constraint df_transactions_TRANSACTION_ID default(TRANSACTION_ID)

alter table transactions add primary key(TRANSACTION_ID)

select * from transactions

with transactionsCTE as
(
   select *, ROW_NUMBER() over (partition by TRANSACTION_ID order by TRANSACTION_ID) as rownumber
   from transactions
)

Delete from transactionsCTE where ROWNUMBER>1

alter table transaction_lines add constraint PK_TRANSACTION_LINES Primary key(TRANSACTION_ID,TRANSACTION_LINE)

select * from items

with itemsCTE as
(
    select *, ROW_NUMBER() over (partition by ITEM_ID order by ITEM__ID) as rownumber
	from items
)

Delete from itemsCTE where rownumber >1

with itemsCTE as
(
  select *, ROW_NUMBER() over (Partition by item_id order by item_id) as dplcatenumbers
  from items
)
delete from itemsCTE where dplcatenumbers>1


alter table transactions add constraint FK_transactions_channel_id FOREIGN KEY(channel_id) References channel(list_id)

alter table TRANSACTION_LINES add constraint FK_TRANSACTION_LINES_LOCATION_ID
FOREIGN KEY(LOCATION_ID) References LOCATIONS(LOCATION_ID)

alter table TRANSACTION_LINES add constraint FK_TRANSACTION_LINES_ITEM_ID
FOREIGN KEY(ITEM_ID) References ITEMS(ITEM_ID)

alter table TRANSACTION_LINES with nocheck add constraint FK_TRANSACTION_LINES_DEPARTMENT_ID
FOREIGN KEY(DEPARTMENT_ID) References DEPARTMENTS(DEPARTMENT_ID)

alter table items add constraint FK_item_CLASS_ID FOREIGN KEY(CLASS_ID) References CLASSES(CLASS_ID)

alter table items add constraint FK_item_WS_MERCHANDISE_DEPARTMENT_ID FOREIGN KEY(WS_MERCHANDISE_DEPARTMENT_ID)
References ITEM_MERCHANDISE_DEPARTMENT(ITEM_MERCHANDISE_DEPARTMENT_ID)

alter table items with nocheck add constraint FK_item_WS_MERCHANDISE_COLLECTION_ID FOREIGN KEY(WS_MERCHANDISE_COLLECTION_ID)
References ITEM_MERCHANDISE_COLLECTION(ITEM_MERCHANDISE_COLLECTION_ID)

alter table items with nocheck add constraint FK_item_WS_MERCHANDISE_CLASS_ID FOREIGN KEY(WS_MERCHANDISE_CLASS_ID)
References ITEM_MERCHANDISE_CLASS(ITEM_MERCHANDISE_CLASS_ID)

alter table items with nocheck add constraint FK_item_WS_MERCHANDISE_SUBCLASS_ID FOREIGN KEY(WS_MERCHANDISE_SUBCLASS_ID)
References ITEM_MERCHANDISE_SUBCLASS(ITEM_MERCHANDISE_SUBCLASS_ID)





select * from TRANSACTION_LINES
