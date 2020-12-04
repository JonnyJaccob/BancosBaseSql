-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2020 a las 20:23:25
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_bancos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `Id_Banco` int(8) NOT NULL COMMENT 'Numero de identifiacion del banco',
  `Nombre` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `Pais` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Codigo_Nacional` varchar(20) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Datos del banco a guardar';

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`Id_Banco`, `Nombre`, `Pais`, `Codigo_Nacional`) VALUES
(1, 'Azteca', 'Mexico', 'mex1'),
(2, 'Bancomex', 'Mexico', 'mex2'),
(3, 'Santander', 'Mexico', 'mex3'),
(4, 'Ahorro Famsa', 'Mexico', 'mex4'),
(5, 'InverMexico', 'Mexico', 'mex5'),
(6, 'Nafinsa', 'Mexico', 'mex6'),
(7, 'ICBC', 'China', 'chn1'),
(8, 'Morgan Chase', 'Estados Unidos', 'eu1'),
(9, 'HSBC', 'Inglaterra', 'ing1'),
(10, 'BNP Paribas', 'Francia', 'frn1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cliente` int(8) NOT NULL,
  `Nombre` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Apellido` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Direccion` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Datos del cliente';

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id_Cliente`, `Nombre`, `Apellido`, `Direccion`) VALUES
(0, 'Alejandro', 'Bolaños', 'Escriba #3'),
(1, 'Cristian', 'Ezquerro', 'Trinidad #5'),
(2, 'Adrian ', 'Jove', 'Parra #7'),
(3, 'Juan ', 'Revuelta', 'Peris #2'),
(4, 'Jose Miguel', 'Chaves', 'Cuervo #4'),
(5, 'Alicia ', 'Infante', 'Burgos #8'),
(6, 'Beatriz', 'Arnaiz', 'Piquer #1'),
(7, 'Belen ', 'Pozuelo', 'Arevalo #4'),
(8, 'Tomas', 'Bajo', 'Pajuelo #9'),
(9, 'Hector', 'Quero', 'Urrutia #6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta bancaria`
--

CREATE TABLE `cuenta_bancaria` (
  `Id_Cuenta_Bancaria` int(8) NOT NULL,
  `Numero_Cuenta` int(15) NOT NULL,
  `Periodo_Validez` date NOT NULL,
  `Id_Banco` int(11) NOT NULL,
  `Id_Cliente` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Datos de la cuenta de banco';

--
-- Volcado de datos para la tabla `cuenta bancaria`
--

INSERT INTO `cuenta_bancaria` (`Id_Cuenta_Bancaria`, `Numero_Cuenta`, `Periodo_Validez`, `Id_Banco`, `Id_Cliente`) VALUES
(0, 0, '2020-12-02', 7, 5),
(1, 1, '2020-12-03', 8, 6),
(2, 2, '2020-12-07', 9, 7),
(3, 3, '2020-12-15', 10, 8),
(4, 4, '2020-12-21', 3, 9),
(5, 5, '2020-12-20', 4, 4),
(6, 6, '2020-12-17', 5, 3),
(7, 7, '2020-12-14', 6, 0),
(8, 8, '2020-12-11', 1, 1),
(9, 9, '2020-12-08', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta de credito`
--

CREATE TABLE `tarjeta_de_credito` (
  `Id_TCredito` int(8) NOT NULL,
  `Numero_Seguridad` int(20) NOT NULL,
  `Clave_Acceso` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Fecha_Caducidad` date NOT NULL,
  `Id_Cliente` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Datos de la tarjeta de credito';

--
-- Volcado de datos para la tabla `tarjeta de credito`
--

INSERT INTO `tarjeta_de_credito` (`Id_TCredito`, `Numero_Seguridad`, `Clave_Acceso`, `Fecha_Caducidad`, `Id_Cliente`) VALUES
(0, 123, 'abc', '2020-12-29', 7),
(1, 456, 'qwe', '2020-12-30', 3),
(2, 789, 'rty', '2020-12-30', 3),
(3, 321, 'uio', '2020-12-30', 4),
(4, 638, 'opñ', '2020-12-26', 0),
(5, 857, 'ygb', '2020-12-29', 1),
(6, 835, 'rdc', '2020-12-13', 7),
(7, 946, 'ehg', '2020-12-28', 2),
(8, 56, 'ijn', '2020-12-31', 8),
(9, 746, 'gtv', '2020-12-28', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta de debito`
--

CREATE TABLE `tarjeta_de_debito` (
  `Id_TDebito` int(8) NOT NULL,
  `Numero_Seguridad` int(20) NOT NULL,
  `Clave_Acceso` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Fecha_Caducidad` date NOT NULL,
  `Id_Cliente` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Datos de la tarjeta de debito';

--
-- Volcado de datos para la tabla `tarjeta de debito`
--

INSERT INTO `tarjeta_de_debito` (`Id_TDebito`, `Numero_Seguridad`, `Clave_Acceso`, `Fecha_Caducidad`, `Id_Cliente`) VALUES
(0, 123, 'abc', '2020-12-29', 2),
(1, 456, 'qwe', '2020-12-30', 3),
(2, 789, 'rty', '2020-12-30', 5),
(3, 321, 'uio', '2020-12-30', 9),
(4, 638, 'opñ', '2020-12-26', 4),
(5, 857, 'ygb', '2020-12-29', 3),
(6, 835, 'rdc', '2020-12-13', 9),
(7, 946, 'ehg', '2020-12-28', 2),
(8, 56, 'ijn', '2020-12-31', 8),
(9, 746, 'gtv', '2020-12-28', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`Id_Banco`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cliente`);

--
-- Indices de la tabla `cuenta bancaria`
--
ALTER TABLE `cuenta_bancaria`
  ADD PRIMARY KEY (`Id_Cuenta_Bancaria`),
  ADD KEY `Id_Banco` (`Id_Banco`),
  ADD KEY `cuenta_bancaria_ibfk_2` (`Id_Cliente`);

--
-- Indices de la tabla `tarjeta de credito`
--
ALTER TABLE `tarjeta_de_credito`
  ADD PRIMARY KEY (`Id_TCredito`),
  ADD KEY `tarjeta_de_credito_ibfk_1` (`Id_Cliente`);

--
-- Indices de la tabla `tarjeta de debito`
--
ALTER TABLE `tarjeta_de_debito`
  ADD PRIMARY KEY (`Id_TDebito`),
  ADD KEY `Id_Cliente` (`Id_Cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta bancaria`
--
ALTER TABLE `cuenta_bancaria`
  ADD CONSTRAINT `cuenta_bancaria_ibfk_1` FOREIGN KEY (`Id_Banco`) REFERENCES `banco` (`Id_Banco`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cuenta_bancaria_ibfk_2` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tarjeta de credito`
--
ALTER TABLE `tarjeta_de_credito`
  ADD CONSTRAINT `tarjeta_de_credito_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`);

--
-- Filtros para la tabla `tarjeta de debito`
--
ALTER TABLE `tarjeta_de_debito`
  ADD CONSTRAINT `tarjeta_de_debito_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
