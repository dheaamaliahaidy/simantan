/*
 Navicat Premium Data Transfer

 Source Server         : My-Mysql
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : earsip

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 18/08/2021 14:46:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for arsip_dokumen
-- ----------------------------
DROP TABLE IF EXISTS `arsip_dokumen`;
CREATE TABLE `arsip_dokumen`  (
  `id_dokumen` int NOT NULL,
  `nama_dokumen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_dokumen` date NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_dokumen`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of arsip_dokumen
-- ----------------------------

-- ----------------------------
-- Table structure for arsip_formulir
-- ----------------------------
DROP TABLE IF EXISTS `arsip_formulir`;
CREATE TABLE `arsip_formulir`  (
  `id_formulir` int NOT NULL AUTO_INCREMENT,
  `nama_formulir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_formulir` date NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_formulir`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of arsip_formulir
-- ----------------------------

-- ----------------------------
-- Table structure for disposisi_eksternal
-- ----------------------------
DROP TABLE IF EXISTS `disposisi_eksternal`;
CREATE TABLE `disposisi_eksternal`  (
  `id_disposisi_eksternal` int NOT NULL AUTO_INCREMENT,
  `isi_disposisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_disposisi` date NOT NULL,
  `tujuan_disposisi` int NULL DEFAULT NULL,
  `id_surat_eksternal` int NULL DEFAULT NULL,
  `id_perintah` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_disposisi_eksternal`) USING BTREE,
  INDEX `fk_surat_eksternal`(`id_surat_eksternal`) USING BTREE,
  INDEX `fk_user`(`tujuan_disposisi`) USING BTREE,
  INDEX `fk_perintah_eksternal`(`id_perintah`) USING BTREE,
  CONSTRAINT `fk_perintah_eksternal` FOREIGN KEY (`id_perintah`) REFERENCES `perintah_disposisi` (`id_perintah`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_surat_eksternal` FOREIGN KEY (`id_surat_eksternal`) REFERENCES `surat_eksternal` (`id_surat_eksternal`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_user` FOREIGN KEY (`tujuan_disposisi`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of disposisi_eksternal
-- ----------------------------

-- ----------------------------
-- Table structure for disposisi_internal
-- ----------------------------
DROP TABLE IF EXISTS `disposisi_internal`;
CREATE TABLE `disposisi_internal`  (
  `id_disposisi_internal` int NOT NULL AUTO_INCREMENT,
  `isi_disposisi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_disposisi` date NOT NULL,
  `id_surat_internal` int NULL DEFAULT NULL,
  `id_perintah` int NULL DEFAULT NULL,
  `tujuan_disposisi` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_disposisi_internal`) USING BTREE,
  INDEX `fk_disposisi`(`id_surat_internal`) USING BTREE,
  INDEX `fk_perintah`(`id_perintah`) USING BTREE,
  INDEX `fk_tujuan`(`tujuan_disposisi`) USING BTREE,
  CONSTRAINT `fk_disposisi` FOREIGN KEY (`id_surat_internal`) REFERENCES `surat_internal` (`id_surat_internal`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_perintah` FOREIGN KEY (`id_perintah`) REFERENCES `perintah_disposisi` (`id_perintah`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_tujuan` FOREIGN KEY (`tujuan_disposisi`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of disposisi_internal
-- ----------------------------

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan`  (
  `id_jabatan` int NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_unit` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_jabatan`) USING BTREE,
  INDEX `fk_jabatan_unit`(`id_unit`) USING BTREE,
  CONSTRAINT `fk_jabatan_unit` FOREIGN KEY (`id_unit`) REFERENCES `unit_kerja` (`id_unit`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jabatan
-- ----------------------------
INSERT INTO `jabatan` VALUES (1, 'administrator', 'admin sistem', 3);

-- ----------------------------
-- Table structure for jenis_surat
-- ----------------------------
DROP TABLE IF EXISTS `jenis_surat`;
CREATE TABLE `jenis_surat`  (
  `id_jenis` int NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_surat
-- ----------------------------
INSERT INTO `jenis_surat` VALUES (1, 'Keuangan', 'Keuangan');

-- ----------------------------
-- Table structure for media_surat
-- ----------------------------
DROP TABLE IF EXISTS `media_surat`;
CREATE TABLE `media_surat`  (
  `id_media` int NOT NULL AUTO_INCREMENT,
  `nama_media` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_media`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_surat
-- ----------------------------
INSERT INTO `media_surat` VALUES (1, 'apa', 'apa');

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai`  (
  `id_pegawai` int NOT NULL AUTO_INCREMENT,
  `nama_pegawai` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kontak_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kontak_telepon` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_unit` int NULL DEFAULT NULL,
  `id_jabatan` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`) USING BTREE,
  INDEX `fk_pegawai_unit`(`id_unit`) USING BTREE,
  INDEX `fk_pegawai_jabatan`(`id_jabatan`) USING BTREE,
  CONSTRAINT `fk_pegawai_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_pegawai_unit` FOREIGN KEY (`id_unit`) REFERENCES `unit_kerja` (`id_unit`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pegawai
-- ----------------------------
INSERT INTO `pegawai` VALUES (1, 'Yusuf Eka Wicaksana', 'ekayusuf.wicaksana@gmail.com', '085212520595', 3, 1);

-- ----------------------------
-- Table structure for perintah_disposisi
-- ----------------------------
DROP TABLE IF EXISTS `perintah_disposisi`;
CREATE TABLE `perintah_disposisi`  (
  `id_perintah` int NOT NULL AUTO_INCREMENT,
  `nama_perintah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_perintah`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of perintah_disposisi
-- ----------------------------

-- ----------------------------
-- Table structure for prioritas_surat
-- ----------------------------
DROP TABLE IF EXISTS `prioritas_surat`;
CREATE TABLE `prioritas_surat`  (
  `id_prioritas` int NOT NULL AUTO_INCREMENT,
  `nama_prioritas` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_prioritas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prioritas_surat
-- ----------------------------
INSERT INTO `prioritas_surat` VALUES (1, 'penting', 'penting');

-- ----------------------------
-- Table structure for sifat_surat
-- ----------------------------
DROP TABLE IF EXISTS `sifat_surat`;
CREATE TABLE `sifat_surat`  (
  `id_sifat` int NOT NULL AUTO_INCREMENT,
  `nama_sifat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_sifat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sifat_surat
-- ----------------------------
INSERT INTO `sifat_surat` VALUES (1, 'Penting', 'Penting');

-- ----------------------------
-- Table structure for surat_eksternal
-- ----------------------------
DROP TABLE IF EXISTS `surat_eksternal`;
CREATE TABLE `surat_eksternal`  (
  `id_surat_eksternal` int NOT NULL AUTO_INCREMENT,
  `nomor_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isi_ringkas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `perihal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `asal_surat_pengguna` int NULL DEFAULT NULL,
  `asal_surat_luar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tujuan_surat_pengguna` int NULL DEFAULT NULL,
  `tujuan_surat_luar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_jenis` int NULL DEFAULT NULL,
  `id_media` int NULL DEFAULT NULL,
  `id_prioritas` int NULL DEFAULT NULL,
  `id_sifat` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_surat_eksternal`) USING BTREE,
  INDEX `fk_asal_surat_pengguna`(`asal_surat_pengguna`) USING BTREE,
  INDEX `fk_tujuan_surat_pengguna`(`tujuan_surat_pengguna`) USING BTREE,
  INDEX `fk_jenis`(`id_jenis`) USING BTREE,
  INDEX `fk_prioritas`(`id_prioritas`) USING BTREE,
  INDEX `fk_sifat`(`id_sifat`) USING BTREE,
  INDEX `fk_media`(`id_media`) USING BTREE,
  CONSTRAINT `fk_asal_surat_pengguna` FOREIGN KEY (`asal_surat_pengguna`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_jenis` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_surat` (`id_jenis`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_media` FOREIGN KEY (`id_media`) REFERENCES `media_surat` (`id_media`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_prioritas` FOREIGN KEY (`id_prioritas`) REFERENCES `prioritas_surat` (`id_prioritas`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_sifat` FOREIGN KEY (`id_sifat`) REFERENCES `sifat_surat` (`id_sifat`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_tujuan_surat_pengguna` FOREIGN KEY (`tujuan_surat_pengguna`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of surat_eksternal
-- ----------------------------

-- ----------------------------
-- Table structure for surat_internal
-- ----------------------------
DROP TABLE IF EXISTS `surat_internal`;
CREATE TABLE `surat_internal`  (
  `id_surat_internal` int NOT NULL AUTO_INCREMENT,
  `nomor_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `destinasi_surat` int NULL DEFAULT NULL,
  `isi_ringkas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `perihal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_jenis` int NULL DEFAULT NULL,
  `id_prioritas` int NULL DEFAULT NULL,
  `id_sifat` int NULL DEFAULT NULL,
  `id_media` int NULL DEFAULT NULL,
  `asal_surat` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_surat_internal`) USING BTREE,
  INDEX `fk_masuk_jenis`(`id_jenis`) USING BTREE,
  INDEX `fk_masuk_sifat`(`id_sifat`) USING BTREE,
  INDEX `fk_masuk_prioritas`(`id_prioritas`) USING BTREE,
  INDEX `fk_masuk_media`(`id_media`) USING BTREE,
  INDEX `fk_masuk_user`(`asal_surat`) USING BTREE,
  INDEX `fk_destinasi_surat_user`(`destinasi_surat`) USING BTREE,
  CONSTRAINT `fk_destinasi_surat_user` FOREIGN KEY (`destinasi_surat`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_jenis` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_surat` (`id_jenis`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_kategori` FOREIGN KEY (`id_media`) REFERENCES `media_surat` (`id_media`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_prioritas` FOREIGN KEY (`id_prioritas`) REFERENCES `prioritas_surat` (`id_prioritas`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_sifat` FOREIGN KEY (`id_sifat`) REFERENCES `sifat_surat` (`id_sifat`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_user` FOREIGN KEY (`asal_surat`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of surat_internal
-- ----------------------------
INSERT INTO `surat_internal` VALUES (4, '21312', 1, 'sadsad', '2021-08-18', '2021-08-18', 'asdas', 'files/surat-internal/SOAL_UAS-SP_20202021.pdf', 'sadas', 1, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for unit_kerja
-- ----------------------------
DROP TABLE IF EXISTS `unit_kerja`;
CREATE TABLE `unit_kerja`  (
  `id_unit` int NOT NULL AUTO_INCREMENT,
  `nama_unit` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kepala_unit` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_unit`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unit_kerja
-- ----------------------------
INSERT INTO `unit_kerja` VALUES (3, 'Administrator', 'adminstrator', 'Admin sistem');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_pegawai` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  INDEX `fk_user_pegawai`(`id_pegawai`) USING BTREE,
  CONSTRAINT `fk_user_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin@admin.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '1', 1);

-- ----------------------------
-- Table structure for view_eksternal_jenis
-- ----------------------------
DROP TABLE IF EXISTS `view_eksternal_jenis`;
CREATE TABLE `view_eksternal_jenis`  (
  `id` int NOT NULL,
  `jenis_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_eksternal_jenis
-- ----------------------------

-- ----------------------------
-- Table structure for view_eksternal_media
-- ----------------------------
DROP TABLE IF EXISTS `view_eksternal_media`;
CREATE TABLE `view_eksternal_media`  (
  `id` int NOT NULL,
  `media_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_eksternal_media
-- ----------------------------

-- ----------------------------
-- Table structure for view_eksternal_prioritas
-- ----------------------------
DROP TABLE IF EXISTS `view_eksternal_prioritas`;
CREATE TABLE `view_eksternal_prioritas`  (
  `id` int NOT NULL,
  `prioritas_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_eksternal_prioritas
-- ----------------------------

-- ----------------------------
-- Table structure for view_eksternal_sifat
-- ----------------------------
DROP TABLE IF EXISTS `view_eksternal_sifat`;
CREATE TABLE `view_eksternal_sifat`  (
  `id` int NOT NULL,
  `sifat_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_eksternal_sifat
-- ----------------------------

-- ----------------------------
-- Table structure for view_internal_jenis
-- ----------------------------
DROP TABLE IF EXISTS `view_internal_jenis`;
CREATE TABLE `view_internal_jenis`  (
  `id` int NOT NULL,
  `jenis_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_internal_jenis
-- ----------------------------

-- ----------------------------
-- Table structure for view_internal_media
-- ----------------------------
DROP TABLE IF EXISTS `view_internal_media`;
CREATE TABLE `view_internal_media`  (
  `id` int NOT NULL,
  `media_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_internal_media
-- ----------------------------

-- ----------------------------
-- Table structure for view_internal_prioritas
-- ----------------------------
DROP TABLE IF EXISTS `view_internal_prioritas`;
CREATE TABLE `view_internal_prioritas`  (
  `id` int NOT NULL,
  `prioritas_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_internal_prioritas
-- ----------------------------

-- ----------------------------
-- Table structure for view_internal_sifat
-- ----------------------------
DROP TABLE IF EXISTS `view_internal_sifat`;
CREATE TABLE `view_internal_sifat`  (
  `id` int NOT NULL,
  `sifat_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of view_internal_sifat
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
