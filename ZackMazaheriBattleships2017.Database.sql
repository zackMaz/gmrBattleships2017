USE [master]
GO
/****** Object:  Database [ZackMazaheriBattleships2017]    Script Date: 6/23/2017 1:00:56 PM ******/
CREATE DATABASE [ZackMazaheriBattleships2017]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ZackMazaheriBattleships2017', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ZackMazaheriBattleships2017.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ZackMazaheriBattleships2017_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ZackMazaheriBattleships2017_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZackMazaheriBattleships2017].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET  MULTI_USER 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ZackMazaheriBattleships2017] SET  READ_WRITE 
GO
