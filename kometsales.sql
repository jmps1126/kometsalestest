-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2016 a las 01:11:57
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kometsales`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IDPRODUCTO` int(11) NOT NULL,
  `DESCPRODUCTO` varchar(100) NOT NULL,
  `VALORPRODUCTO` int(50) NOT NULL,
  `CANTIDAD` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_sistema`
--

CREATE TABLE `usuario_sistema` (
  `ID_USUARIO` int(10) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `APELLIDOS` varchar(100) NOT NULL,
  `FECHA_NACIMIENTO` varchar(20) DEFAULT NULL,
  `USUARIO_ACCESO` varchar(100) NOT NULL,
  `CLAVE_ACCESO` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_sistema`
--

INSERT INTO `usuario_sistema` (`ID_USUARIO`, `NOMBRE`, `APELLIDOS`, `FECHA_NACIMIENTO`, `USUARIO_ACCESO`, `CLAVE_ACCESO`) VALUES
(10, 'Juan', 'Serna', '2015-11-11', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(11, 'Juan Manuel', 'Perez', '2015-11-11', 'lol', '9cdfb439c7876e703e307864c9167a15'),
(12, 'asdj', 'alskdjsa', '2015-11-11', 'lol', '9cdfb439c7876e703e307864c9167a15'),
(13, 'lolo', 'lolo', '2015-11-11', 'juan', 'a94652aa97c7211ba8954dd15a3cf838'),
(14, 'po', 'po', '2015-11-11', 'po', 'f6122c971aeb03476bf01623b09ddfd4'),
(15, 'kili', 'kili', '1222-12-11', 'lolp', '49ea4b62d40a3c4448a35ad9fe9ac711'),
(16, 'lleve', 'lleve', '5222-08-05', '12', 'c20ad4d76fe97759aa27a0c99bff6710'),
(17, 'serna', 'serna', '2016-12-31', 'affa', 'fc9d40c09663a61f00eaba0dd64e14bc'),
(18, 'cual ', 'cual', '2016-12-11', '123', '202cb962ac59075b964b07152d234b70'),
(19, 'cual ', 'cual', '2016-12-11', '123', '202cb962ac59075b964b07152d234b70'),
(20, 'cual ', 'cual', '2016-12-11', '123', '202cb962ac59075b964b07152d234b70'),
(21, 'cual ', 'cual', '2016-12-11', '123', '202cb962ac59075b964b07152d234b70'),
(22, 'cual ', 'cual', '2016-12-11', '123', '202cb962ac59075b964b07152d234b70'),
(23, 'cual ', 'cual', '2016-12-11', '123', '202cb962ac59075b964b07152d234b70'),
(24, 'Juan', 'Serna', '2016-01-01', 'lolo', 'd6581d542c7eaf801284f084478b5fcc'),
(25, 'puta', 'puta', '2016-01-01', 'puta', '9a9c933853ec22a209c7cb6cb04ebee8'),
(26, 'l', 'l', '2016-12-31', '1', 'c4ca4238a0b923820dcc509a6f75849b');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IDPRODUCTO`);

--
-- Indices de la tabla `usuario_sistema`
--
ALTER TABLE `usuario_sistema`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IDPRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `usuario_sistema`
--
ALTER TABLE `usuario_sistema`
  MODIFY `ID_USUARIO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
