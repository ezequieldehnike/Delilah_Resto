/*
  Navicat Premium Data Transfer

  Source Server         : mysql
  Source Server Type    : MySQL
  Source Server Version : 100420
  Source Host           : localhost:3306
  Source Schema         : delilah

  Target Server Type    : MySQL
  Target Server Version : 100420
  File Encoding         : 65001

  Date: 05/02/2022 22:03:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for detalle_pedidos
-- ----------------------------
DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE `detalle_pedidos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_ped`(`id_pedido`) USING BTREE,
  INDEX `id_prod`(`id_producto`) USING BTREE,
  CONSTRAINT `id_ped` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `id_prod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalle_pedidos
-- ----------------------------
INSERT INTO `detalle_pedidos` VALUES (12, 26, 1, 12, 300);
INSERT INTO `detalle_pedidos` VALUES (13, 26, 10, 1, 200);
INSERT INTO `detalle_pedidos` VALUES (14, 27, 9, 3, 600);
INSERT INTO `detalle_pedidos` VALUES (15, 28, 4, 1, 500);

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `total` float NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `estado` enum('pedido','preparando','completado','entregado') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_estado` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `usuario`(`id_usuario`) USING BTREE,
  CONSTRAINT `usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pedidos
-- ----------------------------
INSERT INTO `pedidos` VALUES (26, 1, 500, '2022-02-22 00:00:00', 'pedido', '2022-01-06 00:00:00');
INSERT INTO `pedidos` VALUES (27, 2, 600, '2022-02-02 00:00:00', 'pedido', '2022-02-02 00:00:00');
INSERT INTO `pedidos` VALUES (28, 3, 800, '2022-03-02 00:00:00', 'pedido', '2022-02-03 00:00:00');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 'Empanada Carne', 60, 'empanada_carne.png', 'Empanada de Carne cortada a cuchillo y especias dulces');
INSERT INTO `productos` VALUES (2, 'Ensalada Caprese', 112, 'ensalada_caprese.png', 'Ensalada de Tomate, queso y albahaca ');
INSERT INTO `productos` VALUES (3, 'Empanada de Pollo', 61, 'empanada_pollo.png', 'Empanada de Pollo con salsa roja');
INSERT INTO `productos` VALUES (4, 'Ensalada de Lechuga y Tomate', 130, 'ensalada_lechuga.png', 'Ensalada de lechuga con Tomates cherry y especias');
INSERT INTO `productos` VALUES (9, 'Ensalada de Rucula y Pomelo', 100, 'ensalada_rucula.png', 'Ensalada de Rucula y Pomelo con salsa ranch');
INSERT INTO `productos` VALUES (10, 'Milanesa Napolitana con papas Fritas', 300, 'milanesa.png', 'Milanesa napolitana acompañada de papas rusticas');
INSERT INTO `productos` VALUES (12, 'Empanada de Verdura', 64, 'empanada_verdura.png', 'Empanada de Verdura y salsa bechamel con pimienta cayena');
INSERT INTO `productos` VALUES (13, 'Empanada de cebolla', 64, 'empanada_cebolla.png', 'Empanada de cebolla con queso y especias orientales');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `domicilio` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'Ezequiel', 'Dehnike', 'Ezequieldehnike', 'ezequieldehnike@gmai', '1234', '1145588963', 'Cancun1234, Buenos Aires, Argentina', 1);
INSERT INTO `usuarios` VALUES (2, 'walter', 'Tan', 'Wallytan', 'wtan@gmail.com', '1470', '1123568974', 'Cancun123, Buenos Aires, Argentina', 0);
INSERT INTO `usuarios` VALUES (3, 'Gabriel', 'Nietti', 'gabon', 'gnietti@gmail.com.', '3690', '1145788552', 'Cancun12, Buenos Aires, Argentina', 0);
INSERT INTO `usuarios` VALUES (5, 'Renzo', 'Pera', 'Peraren', 'renzopera@gmail.com', 'secret', '1123568620', 'Cancun1, Buenos Aires, Argentina', 0);
INSERT INTO `usuarios` VALUES (6, 'Nicolas', 'Virr', 'Virrn', 'nicovirr@gmail.com', 'secret', '1123969514', 'Cancun12345, Buenos Aires, Argentina', 0);

SET FOREIGN_KEY_CHECKS = 1;
