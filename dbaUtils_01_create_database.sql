
USE [master] ;
GO

IF
(
		( SELECT @@VERSION ) NOT LIKE '%2016%'
	AND	( SELECT @@VERSION ) NOT LIKE '%2017%'
	AND	( SELECT @@VERSION ) NOT LIKE '%2019%'
)
BEGIN
	IF EXISTS ( SELECT * FROM sys.databases WHERE [name] = N'dbaUtils')
		DROP DATABASE [dbaUtils] ;
END
ELSE
BEGIN
	DROP DATABASE IF EXISTS [dbaUtils] ;
END
CREATE DATABASE [dbaUtils] ;
GO

USE [master] ;
GO
ALTER DATABASE [dbaUtils] SET RECOVERY SIMPLE WITH NO_WAIT ;
GO
ALTER DATABASE [dbaUtils] SET PAGE_VERIFY CHECKSUM WITH NO_WAIT ;
GO
ALTER DATABASE [dbaUtils] SET DELAYED_DURABILITY = FORCED WITH NO_WAIT ;
GO

USE [dbaUtils] ;
GO
ALTER AUTHORIZATION ON DATABASE::[dbaUtils] TO [sa] ;
GO

