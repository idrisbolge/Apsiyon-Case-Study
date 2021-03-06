USE [Urun]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 6.10.2020 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KategoriID] [int] NOT NULL,
	[Adi] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KategoriDetaylari]    Script Date: 6.10.2020 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KategoriDetaylari](
	[KategoriID] [int] NOT NULL,
	[Detay] [varchar](100) NULL,
 CONSTRAINT [PK_KategoriDetaylari] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marka]    Script Date: 6.10.2020 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marka](
	[MarkaID] [int] NOT NULL,
	[Adi] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Marka] PRIMARY KEY CLUSTERED 
(
	[MarkaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarkaDetayları]    Script Date: 6.10.2020 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarkaDetayları](
	[MarkaID] [int] NOT NULL,
	[Detaylar] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MarkaDetayları] PRIMARY KEY CLUSTERED 
(
	[MarkaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satici]    Script Date: 6.10.2020 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satici](
	[SaticiID] [int] NOT NULL,
	[Adi] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Satici] PRIMARY KEY CLUSTERED 
(
	[SaticiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaticiDetaylar]    Script Date: 6.10.2020 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaticiDetaylar](
	[SaticiID] [int] NOT NULL,
	[Detay] [varchar](100) NULL,
 CONSTRAINT [PK_SaticiDetaylar] PRIMARY KEY CLUSTERED 
(
	[SaticiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 6.10.2020 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[UrunID] [int] NOT NULL,
	[Adi] [varchar](100) NOT NULL,
	[Fiyati] [nchar](10) NOT NULL,
	[KategoriID] [int] NOT NULL,
	[MarkaID] [int] NOT NULL,
	[SaticiID] [int] NOT NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunDetaylar]    Script Date: 6.10.2020 13:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunDetaylar](
	[UrunId] [int] NOT NULL,
	[Detay] [varchar](100) NULL,
 CONSTRAINT [PK_UrunDetaylar] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Kategori] ([KategoriID], [Adi]) VALUES (1, N'Erkek')
INSERT [dbo].[Kategori] ([KategoriID], [Adi]) VALUES (2, N'Kadın')
INSERT [dbo].[Kategori] ([KategoriID], [Adi]) VALUES (3, N'Çocuk')
GO
INSERT [dbo].[KategoriDetaylari] ([KategoriID], [Detay]) VALUES (1, N'Erkek Ayakkabıları')
INSERT [dbo].[KategoriDetaylari] ([KategoriID], [Detay]) VALUES (2, N'Kadın Ayakkabıları')
INSERT [dbo].[KategoriDetaylari] ([KategoriID], [Detay]) VALUES (3, N'Çocuk Ayakkabıları')
GO
INSERT [dbo].[Marka] ([MarkaID], [Adi]) VALUES (1, N'Adidas')
INSERT [dbo].[Marka] ([MarkaID], [Adi]) VALUES (2, N'Nike')
INSERT [dbo].[Marka] ([MarkaID], [Adi]) VALUES (3, N'Lumberjack')
GO
INSERT [dbo].[MarkaDetayları] ([MarkaID], [Detaylar]) VALUES (1, N'Adidas Marka Ayakkabılar')
INSERT [dbo].[MarkaDetayları] ([MarkaID], [Detaylar]) VALUES (2, N'Nike Marka Ayakkabılar')
INSERT [dbo].[MarkaDetayları] ([MarkaID], [Detaylar]) VALUES (3, N'Lumberjack Marka Ayakkabılar')
GO
INSERT [dbo].[Satici] ([SaticiID], [Adi]) VALUES (1, N'A Mağazası')
INSERT [dbo].[Satici] ([SaticiID], [Adi]) VALUES (2, N'B Mağazası')
INSERT [dbo].[Satici] ([SaticiID], [Adi]) VALUES (3, N'C Mağazası')
GO
INSERT [dbo].[SaticiDetaylar] ([SaticiID], [Detay]) VALUES (1, N'Ankara merkezli mağazamız')
INSERT [dbo].[SaticiDetaylar] ([SaticiID], [Detay]) VALUES (2, N'Bursa merkezli mağazamız')
INSERT [dbo].[SaticiDetaylar] ([SaticiID], [Detay]) VALUES (3, N'İstanbul merkezli mağazamız')
GO
INSERT [dbo].[Urun] ([UrunID], [Adi], [Fiyati], [KategoriID], [MarkaID], [SaticiID]) VALUES (1, N'Adds1', N'250       ', 1, 1, 1)
INSERT [dbo].[Urun] ([UrunID], [Adi], [Fiyati], [KategoriID], [MarkaID], [SaticiID]) VALUES (2, N'Adds2', N'300       ', 2, 1, 2)
INSERT [dbo].[Urun] ([UrunID], [Adi], [Fiyati], [KategoriID], [MarkaID], [SaticiID]) VALUES (3, N'Adds3', N'170       ', 3, 1, 3)
INSERT [dbo].[Urun] ([UrunID], [Adi], [Fiyati], [KategoriID], [MarkaID], [SaticiID]) VALUES (4, N'Nk1', N'230       ', 1, 2, 2)
INSERT [dbo].[Urun] ([UrunID], [Adi], [Fiyati], [KategoriID], [MarkaID], [SaticiID]) VALUES (5, N'Nk2', N'215       ', 2, 2, 3)
INSERT [dbo].[Urun] ([UrunID], [Adi], [Fiyati], [KategoriID], [MarkaID], [SaticiID]) VALUES (6, N'Nk3', N'140       ', 3, 2, 1)
INSERT [dbo].[Urun] ([UrunID], [Adi], [Fiyati], [KategoriID], [MarkaID], [SaticiID]) VALUES (7, N'Jck1', N'120       ', 1, 3, 3)
INSERT [dbo].[Urun] ([UrunID], [Adi], [Fiyati], [KategoriID], [MarkaID], [SaticiID]) VALUES (8, N'Jck2', N'180       ', 2, 3, 1)
INSERT [dbo].[Urun] ([UrunID], [Adi], [Fiyati], [KategoriID], [MarkaID], [SaticiID]) VALUES (9, N'Jck3', N'100       ', 3, 3, 2)
GO
INSERT [dbo].[UrunDetaylar] ([UrunId], [Detay]) VALUES (1, N'Ayakkabı Detay 1')
INSERT [dbo].[UrunDetaylar] ([UrunId], [Detay]) VALUES (2, N'Ayakkabı Detay 2')
INSERT [dbo].[UrunDetaylar] ([UrunId], [Detay]) VALUES (3, N'Ayakkabı Detay 3')
INSERT [dbo].[UrunDetaylar] ([UrunId], [Detay]) VALUES (4, N'Ayakkabı Detay 4')
INSERT [dbo].[UrunDetaylar] ([UrunId], [Detay]) VALUES (5, N'Ayakkabı Detay 5')
INSERT [dbo].[UrunDetaylar] ([UrunId], [Detay]) VALUES (6, N'Ayakkabı Detay 6')
INSERT [dbo].[UrunDetaylar] ([UrunId], [Detay]) VALUES (7, N'Ayakkabı Detay 7')
INSERT [dbo].[UrunDetaylar] ([UrunId], [Detay]) VALUES (8, N'Ayakkabı Detay 8')
INSERT [dbo].[UrunDetaylar] ([UrunId], [Detay]) VALUES (9, N'Ayakkabı Detay 9')
GO
ALTER TABLE [dbo].[KategoriDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_KategoriDetaylari_Kategori] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategori] ([KategoriID])
GO
ALTER TABLE [dbo].[KategoriDetaylari] CHECK CONSTRAINT [FK_KategoriDetaylari_Kategori]
GO
ALTER TABLE [dbo].[MarkaDetayları]  WITH CHECK ADD  CONSTRAINT [FK_MarkaDetayları_Marka] FOREIGN KEY([MarkaID])
REFERENCES [dbo].[Marka] ([MarkaID])
GO
ALTER TABLE [dbo].[MarkaDetayları] CHECK CONSTRAINT [FK_MarkaDetayları_Marka]
GO
ALTER TABLE [dbo].[SaticiDetaylar]  WITH CHECK ADD  CONSTRAINT [FK_SaticiDetaylar_Satici] FOREIGN KEY([SaticiID])
REFERENCES [dbo].[Satici] ([SaticiID])
GO
ALTER TABLE [dbo].[SaticiDetaylar] CHECK CONSTRAINT [FK_SaticiDetaylar_Satici]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_Kategori] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategori] ([KategoriID])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_Kategori]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_Marka] FOREIGN KEY([MarkaID])
REFERENCES [dbo].[Marka] ([MarkaID])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_Marka]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_Satici] FOREIGN KEY([SaticiID])
REFERENCES [dbo].[Satici] ([SaticiID])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_Satici]
GO
ALTER TABLE [dbo].[UrunDetaylar]  WITH CHECK ADD  CONSTRAINT [FK_UrunDetaylar_Urun] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urun] ([UrunID])
GO
ALTER TABLE [dbo].[UrunDetaylar] CHECK CONSTRAINT [FK_UrunDetaylar_Urun]
GO
