USE [BDFactura]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/12/2021 02:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CedRuc] [nchar](15) NOT NULL,
	[Nombres] [nvarchar](100) NULL,
	[Apellidos] [nvarchar](100) NULL,
	[Telefono] [nchar](15) NULL,
	[Direccion] [nvarchar](200) NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Factura]    Script Date: 17/12/2021 02:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Factura](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Fac] [int] NOT NULL,
	[ID_Pro] [int] NOT NULL,
	[Precio] [decimal](12, 4) NOT NULL,
	[Cant] [decimal](12, 4) NOT NULL,
	[SubTotal] [decimal](12, 4) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Detall_Factura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 17/12/2021 02:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Total] [decimal](12, 4) NOT NULL,
	[IVA] [decimal](12, 4) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 17/12/2021 02:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Url] [varchar](50) NOT NULL,
	[Icono] [varchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 17/12/2021 02:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Precio] [decimal](12, 4) NOT NULL,
	[Costo] [decimal](12, 4) NOT NULL,
	[Stock] [decimal](12, 4) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 17/12/2021 02:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RollName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRolesMapping]    Script Date: 17/12/2021 02:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRolesMapping](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/12/2021 02:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserPassword] [varchar](50) NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK__Users__3214EC27B4B25379] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Menu]    Script Date: 17/12/2021 02:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[ID_Menu] [int] NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (1, N'18001          ', N'Vannesa', N'Llerena', N'0985263147     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (2, N'18002          ', N'Elizabeth', N'Agila', N'0987456321     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (4, N'18003          ', N'Juan', N'Perez', N'0987412369     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (5, N'18004          ', N'Fernando', N'Ortega', N'0963258741     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (6, N'18005          ', N'Camila', N'Freire', N'0874523691     ', N'Ambato', 0)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (7, N'180            ', N'a', N'a', N'099            ', N'aaaa', 0)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (8, N'18008          ', N'Prueba', N'Prueba', N'098526413      ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (9, N'19001          ', N'Prueba2', N'Prueba1', N'0985632145     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (10, N'19001          ', N'Prueba2', N'Prueba1', N'0985632145     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (11, N'19003          ', N'Prueba3', N'Prueba3', N'087452         ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (12, N'19003          ', N'Prueba3', N'Prueba3', N'087452         ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (13, N'ww             ', N'ww', N'ww', N'32             ', N'www', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (15, N'0555           ', N'aa', N'aaa', N'8652           ', N'aaa', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (16, N'562            ', N'iojk', N'kj', N'522            ', N'iuhjk', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (17, N'2001           ', N'Pruebaaaaa', N'aaaaaaaaaa', N'7896           ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (19, N'18003          ', N'Juan', N'Perez', N'0987412369     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (20, N'18001          ', N'Vannesa', N'Llerena', N'0985263147     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (21, N'18002          ', N'Elizabeth', N'Agila', N'0987456321     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (22, N'18001          ', N'Vannesa', N'Llerena', N'0985263147     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (23, N'18001          ', N'Vannesa', N'Llerena', N'0985263147     ', N'Ambato', 1)
INSERT [dbo].[Cliente] ([ID], [CedRuc], [Nombres], [Apellidos], [Telefono], [Direccion], [Estado]) VALUES (24, N'18001          ', N'Vannesa', N'Llerena', N'0985263147     ', N'Ambato', 1)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle_Factura] ON 

INSERT [dbo].[Detalle_Factura] ([ID], [ID_Fac], [ID_Pro], [Precio], [Cant], [SubTotal], [Estado]) VALUES (1, 3, 2, CAST(8.0000 AS Decimal(12, 4)), CAST(2.0000 AS Decimal(12, 4)), CAST(15.0000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Detalle_Factura] ([ID], [ID_Fac], [ID_Pro], [Precio], [Cant], [SubTotal], [Estado]) VALUES (2, 3, 3, CAST(4.0000 AS Decimal(12, 4)), CAST(2.0000 AS Decimal(12, 4)), CAST(8.0000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Detalle_Factura] ([ID], [ID_Fac], [ID_Pro], [Precio], [Cant], [SubTotal], [Estado]) VALUES (6, 7, 5, CAST(12.3000 AS Decimal(12, 4)), CAST(3.0000 AS Decimal(12, 4)), CAST(36.9000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Detalle_Factura] ([ID], [ID_Fac], [ID_Pro], [Precio], [Cant], [SubTotal], [Estado]) VALUES (7, 8, 6, CAST(18.6000 AS Decimal(12, 4)), CAST(3.0000 AS Decimal(12, 4)), CAST(55.8000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Detalle_Factura] ([ID], [ID_Fac], [ID_Pro], [Precio], [Cant], [SubTotal], [Estado]) VALUES (8, 9, 3, CAST(12.3000 AS Decimal(12, 4)), CAST(55.0000 AS Decimal(12, 4)), CAST(676.5000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Detalle_Factura] ([ID], [ID_Fac], [ID_Pro], [Precio], [Cant], [SubTotal], [Estado]) VALUES (9, 10, 5, CAST(12.3000 AS Decimal(12, 4)), CAST(3.0000 AS Decimal(12, 4)), CAST(36.9000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Detalle_Factura] ([ID], [ID_Fac], [ID_Pro], [Precio], [Cant], [SubTotal], [Estado]) VALUES (10, 11, 5, CAST(12.3000 AS Decimal(12, 4)), CAST(3.0000 AS Decimal(12, 4)), CAST(36.9000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Detalle_Factura] ([ID], [ID_Fac], [ID_Pro], [Precio], [Cant], [SubTotal], [Estado]) VALUES (11, 12, 2, CAST(10.2500 AS Decimal(12, 4)), CAST(80.0000 AS Decimal(12, 4)), CAST(820.0000 AS Decimal(12, 4)), 1)
SET IDENTITY_INSERT [dbo].[Detalle_Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([ID], [ID_Cliente], [Usuario], [Fecha], [Total], [IVA], [Estado]) VALUES (3, 1, N'admin', CAST(N'2021-12-20T00:00:00.000' AS DateTime), CAST(15.3000 AS Decimal(12, 4)), CAST(2.5000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Factura] ([ID], [ID_Cliente], [Usuario], [Fecha], [Total], [IVA], [Estado]) VALUES (5, 2, N'admin', CAST(N'2021-12-14T00:00:00.000' AS DateTime), CAST(20.6000 AS Decimal(12, 4)), CAST(3.2000 AS Decimal(12, 4)), 0)
INSERT [dbo].[Factura] ([ID], [ID_Cliente], [Usuario], [Fecha], [Total], [IVA], [Estado]) VALUES (7, 19, N'admin', CAST(N'2021-12-17T02:18:30.403' AS DateTime), CAST(41.3280 AS Decimal(12, 4)), CAST(4.4280 AS Decimal(12, 4)), 0)
INSERT [dbo].[Factura] ([ID], [ID_Cliente], [Usuario], [Fecha], [Total], [IVA], [Estado]) VALUES (8, 20, N'admin', CAST(N'2021-12-17T02:28:26.937' AS DateTime), CAST(62.4960 AS Decimal(12, 4)), CAST(6.6960 AS Decimal(12, 4)), 1)
INSERT [dbo].[Factura] ([ID], [ID_Cliente], [Usuario], [Fecha], [Total], [IVA], [Estado]) VALUES (9, 21, N'admin', CAST(N'2021-12-17T02:41:34.407' AS DateTime), CAST(757.6800 AS Decimal(12, 4)), CAST(81.1800 AS Decimal(12, 4)), 1)
INSERT [dbo].[Factura] ([ID], [ID_Cliente], [Usuario], [Fecha], [Total], [IVA], [Estado]) VALUES (10, 22, N'admin', CAST(N'2021-12-17T02:44:08.920' AS DateTime), CAST(41.3280 AS Decimal(12, 4)), CAST(4.4280 AS Decimal(12, 4)), 1)
INSERT [dbo].[Factura] ([ID], [ID_Cliente], [Usuario], [Fecha], [Total], [IVA], [Estado]) VALUES (11, 23, N'admin', CAST(N'2021-12-17T02:44:18.250' AS DateTime), CAST(41.3280 AS Decimal(12, 4)), CAST(4.4280 AS Decimal(12, 4)), 1)
INSERT [dbo].[Factura] ([ID], [ID_Cliente], [Usuario], [Fecha], [Total], [IVA], [Estado]) VALUES (12, 24, N'admin', CAST(N'2021-12-17T02:47:08.993' AS DateTime), CAST(918.4000 AS Decimal(12, 4)), CAST(98.4000 AS Decimal(12, 4)), 1)
SET IDENTITY_INSERT [dbo].[Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Nombre], [Url], [Icono], [Estado]) VALUES (1, N'Inicio', N'Principal', N'bi bi-grid-fill', 1)
INSERT [dbo].[Menu] ([ID], [Nombre], [Url], [Icono], [Estado]) VALUES (2, N'Clientes', N'Cliente', N'bi bi-person-lines-fill', 1)
INSERT [dbo].[Menu] ([ID], [Nombre], [Url], [Icono], [Estado]) VALUES (5, N'Productos', N'Producto', N'bi bi-bookmark-fill', 1)
INSERT [dbo].[Menu] ([ID], [Nombre], [Url], [Icono], [Estado]) VALUES (6, N'Factura', N'Facturar', N'bi bi-receipt-cutoff', 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([ID], [Nombre], [Precio], [Costo], [Stock], [Estado]) VALUES (2, N'Producto1', CAST(10.2500 AS Decimal(12, 4)), CAST(10.5000 AS Decimal(12, 4)), CAST(2920.0000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Producto] ([ID], [Nombre], [Precio], [Costo], [Stock], [Estado]) VALUES (3, N'Producto2', CAST(12.3000 AS Decimal(12, 4)), CAST(12.8000 AS Decimal(12, 4)), CAST(195.0000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Producto] ([ID], [Nombre], [Precio], [Costo], [Stock], [Estado]) VALUES (4, N'Prueba', CAST(12.3000 AS Decimal(12, 4)), CAST(0.0000 AS Decimal(12, 4)), CAST(20.0000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Producto] ([ID], [Nombre], [Precio], [Costo], [Stock], [Estado]) VALUES (5, N'Producto4', CAST(12.3000 AS Decimal(12, 4)), CAST(0.0000 AS Decimal(12, 4)), CAST(11.0000 AS Decimal(12, 4)), 1)
INSERT [dbo].[Producto] ([ID], [Nombre], [Precio], [Costo], [Stock], [Estado]) VALUES (6, N'Prueba3', CAST(18.6000 AS Decimal(12, 4)), CAST(20.3000 AS Decimal(12, 4)), CAST(47.0000 AS Decimal(12, 4)), 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [UserPassword], [Nombres], [Estado]) VALUES (1, N'admin', N'admin2022', N'Vanessa Llerena', 1)
INSERT [dbo].[Users] ([ID], [UserName], [UserPassword], [Nombres], [Estado]) VALUES (2, N'user', N'user2002', N'Usuario ', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario_Menu] ON 

INSERT [dbo].[Usuario_Menu] ([ID], [UserName], [ID_Menu], [Estado]) VALUES (1, N'admin', 1, 1)
INSERT [dbo].[Usuario_Menu] ([ID], [UserName], [ID_Menu], [Estado]) VALUES (2, N'admin', 2, 1)
INSERT [dbo].[Usuario_Menu] ([ID], [UserName], [ID_Menu], [Estado]) VALUES (4, N'admin', 5, 1)
INSERT [dbo].[Usuario_Menu] ([ID], [UserName], [ID_Menu], [Estado]) VALUES (5, N'admin', 6, 1)
INSERT [dbo].[Usuario_Menu] ([ID], [UserName], [ID_Menu], [Estado]) VALUES (6, N'user', 6, 1)
INSERT [dbo].[Usuario_Menu] ([ID], [UserName], [ID_Menu], [Estado]) VALUES (7, N'user', 2, 1)
SET IDENTITY_INSERT [dbo].[Usuario_Menu] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 17/12/2021 02:57:18 a. m. ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Detalle_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Factura_Factura] FOREIGN KEY([ID_Fac])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[Detalle_Factura] CHECK CONSTRAINT [FK_Detalle_Factura_Factura]
GO
ALTER TABLE [dbo].[Detalle_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Factura_Producto] FOREIGN KEY([ID_Pro])
REFERENCES [dbo].[Producto] ([ID])
GO
ALTER TABLE [dbo].[Detalle_Factura] CHECK CONSTRAINT [FK_Detalle_Factura_Producto]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Users] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Users]
GO
ALTER TABLE [dbo].[UserRolesMapping]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleMaster] ([ID])
GO
ALTER TABLE [dbo].[UserRolesMapping]  WITH CHECK ADD  CONSTRAINT [FK__UserRoles__UserI__286302EC] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserRolesMapping] CHECK CONSTRAINT [FK__UserRoles__UserI__286302EC]
GO
ALTER TABLE [dbo].[Usuario_Menu]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Menu_Menu] FOREIGN KEY([ID_Menu])
REFERENCES [dbo].[Menu] ([ID])
GO
ALTER TABLE [dbo].[Usuario_Menu] CHECK CONSTRAINT [FK_Usuario_Menu_Menu]
GO
ALTER TABLE [dbo].[Usuario_Menu]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Menu_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Usuario_Menu] CHECK CONSTRAINT [FK_Usuario_Menu_Users]
GO
