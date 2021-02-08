/*
 Navicat Premium Data Transfer

 Source Server         : laravel_swise
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : fstore

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 08/02/2021 13:41:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activations
-- ----------------------------
DROP TABLE IF EXISTS `activations`;
CREATE TABLE `activations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `activations_user_id_index`(`user_id`) USING BTREE,
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activations
-- ----------------------------
INSERT INTO `activations` VALUES (1, 1, 'nJrD4rKn4XePkaybpLfHIKJv7wsFq7TB', 1, '2021-02-08 06:58:59', '2021-02-08 06:58:59', '2021-02-08 06:58:59');

-- ----------------------------
-- Table structure for attribute_categories
-- ----------------------------
DROP TABLE IF EXISTS `attribute_categories`;
CREATE TABLE `attribute_categories`  (
  `attribute_id` int(0) UNSIGNED NOT NULL,
  `category_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`attribute_id`, `category_id`) USING BTREE,
  INDEX `attribute_categories_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `attribute_categories_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `attribute_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_categories
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_set_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_set_translations`;
CREATE TABLE `attribute_set_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_set_translations_attribute_set_id_locale_unique`(`attribute_set_id`, `locale`) USING BTREE,
  CONSTRAINT `attribute_set_translations_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_set_translations
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_sets
-- ----------------------------
DROP TABLE IF EXISTS `attribute_sets`;
CREATE TABLE `attribute_sets`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_sets
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_translations`;
CREATE TABLE `attribute_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_translations_attribute_id_locale_unique`(`attribute_id`, `locale`) USING BTREE,
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_translations
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_value_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value_translations`;
CREATE TABLE `attribute_value_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_value_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_value_translations_attribute_value_id_locale_unique`(`attribute_value_id`, `locale`) USING BTREE,
  CONSTRAINT `attribute_value_translations_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_value_translations
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE `attribute_values`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int(0) UNSIGNED NOT NULL,
  `position` int(0) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `attribute_values_attribute_id_index`(`attribute_id`) USING BTREE,
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_values
-- ----------------------------

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(0) UNSIGNED NOT NULL,
  `is_filterable` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attributes_slug_unique`(`slug`) USING BTREE,
  INDEX `attributes_attribute_set_id_index`(`attribute_set_id`) USING BTREE,
  CONSTRAINT `attributes_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attributes
-- ----------------------------

-- ----------------------------
-- Table structure for brand_translations
-- ----------------------------
DROP TABLE IF EXISTS `brand_translations`;
CREATE TABLE `brand_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` int(0) NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `brand_translations_brand_id_locale_unique`(`brand_id`, `locale`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand_translations
-- ----------------------------

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `brands_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(0) UNSIGNED NULL DEFAULT NULL,
  `is_searchable` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE,
  INDEX `categories_parent_id_foreign`(`parent_id`) USING BTREE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for category_translations
-- ----------------------------
DROP TABLE IF EXISTS `category_translations`;
CREATE TABLE `category_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_translations_category_id_locale_unique`(`category_id`, `locale`) USING BTREE,
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_translations
-- ----------------------------

-- ----------------------------
-- Table structure for coupon_categories
-- ----------------------------
DROP TABLE IF EXISTS `coupon_categories`;
CREATE TABLE `coupon_categories`  (
  `coupon_id` int(0) UNSIGNED NOT NULL,
  `category_id` int(0) UNSIGNED NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`coupon_id`, `category_id`, `exclude`) USING BTREE,
  INDEX `coupon_categories_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `coupon_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `coupon_categories_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_categories
-- ----------------------------

-- ----------------------------
-- Table structure for coupon_products
-- ----------------------------
DROP TABLE IF EXISTS `coupon_products`;
CREATE TABLE `coupon_products`  (
  `coupon_id` int(0) UNSIGNED NOT NULL,
  `product_id` int(0) UNSIGNED NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`coupon_id`, `product_id`) USING BTREE,
  INDEX `coupon_products_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `coupon_products_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `coupon_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_products
-- ----------------------------

-- ----------------------------
-- Table structure for coupon_translations
-- ----------------------------
DROP TABLE IF EXISTS `coupon_translations`;
CREATE TABLE `coupon_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coupon_translations_coupon_id_locale_unique`(`coupon_id`, `locale`) USING BTREE,
  CONSTRAINT `coupon_translations_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_translations
-- ----------------------------

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `is_percent` tinyint(1) NOT NULL,
  `free_shipping` tinyint(1) NOT NULL,
  `minimum_spend` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `maximum_spend` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `usage_limit_per_coupon` int(0) UNSIGNED NULL DEFAULT NULL,
  `usage_limit_per_customer` int(0) UNSIGNED NULL DEFAULT NULL,
  `used` int(0) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `coupons_code_index`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupons
-- ----------------------------

-- ----------------------------
-- Table structure for cross_sell_products
-- ----------------------------
DROP TABLE IF EXISTS `cross_sell_products`;
CREATE TABLE `cross_sell_products`  (
  `product_id` int(0) UNSIGNED NOT NULL,
  `cross_sell_product_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `cross_sell_product_id`) USING BTREE,
  INDEX `cross_sell_products_cross_sell_product_id_foreign`(`cross_sell_product_id`) USING BTREE,
  CONSTRAINT `cross_sell_products_cross_sell_product_id_foreign` FOREIGN KEY (`cross_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cross_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cross_sell_products
-- ----------------------------

-- ----------------------------
-- Table structure for currency_rates
-- ----------------------------
DROP TABLE IF EXISTS `currency_rates`;
CREATE TABLE `currency_rates`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8, 4) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `currency_rates_currency_unique`(`currency`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currency_rates
-- ----------------------------
INSERT INTO `currency_rates` VALUES (1, 'USD', 1.0000, '2021-02-08 06:59:03', '2021-02-08 06:59:03');
INSERT INTO `currency_rates` VALUES (2, 'UZS', 1.0000, '2021-02-08 12:08:25', '2021-02-08 12:08:25');

-- ----------------------------
-- Table structure for entity_files
-- ----------------------------
DROP TABLE IF EXISTS `entity_files`;
CREATE TABLE `entity_files`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_id` int(0) UNSIGNED NOT NULL,
  `entity_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(0) UNSIGNED NOT NULL,
  `zone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `entity_files_entity_type_entity_id_index`(`entity_type`, `entity_id`) USING BTREE,
  INDEX `entity_files_file_id_index`(`file_id`) USING BTREE,
  INDEX `entity_files_zone_index`(`zone`) USING BTREE,
  CONSTRAINT `entity_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entity_files
-- ----------------------------

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL,
  `filename` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `files_user_id_index`(`user_id`) USING BTREE,
  INDEX `files_filename_index`(`filename`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES (1, 1, 'crop.png', 'public_storage', 'media/JO0GkfPIgj94hEgCQxVaRnr0gWth7UF905PEkpnQ.png', 'png', 'image/png', '11254', '2021-02-08 13:00:22', '2021-02-08 13:00:22');

-- ----------------------------
-- Table structure for flash_sale_product_orders
-- ----------------------------
DROP TABLE IF EXISTS `flash_sale_product_orders`;
CREATE TABLE `flash_sale_product_orders`  (
  `flash_sale_product_id` int(0) UNSIGNED NOT NULL,
  `order_id` int(0) UNSIGNED NOT NULL,
  `qty` int(0) NOT NULL,
  PRIMARY KEY (`flash_sale_product_id`, `order_id`) USING BTREE,
  INDEX `flash_sale_product_orders_order_id_foreign`(`order_id`) USING BTREE,
  CONSTRAINT `flash_sale_product_orders_flash_sale_product_id_foreign` FOREIGN KEY (`flash_sale_product_id`) REFERENCES `flash_sale_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `flash_sale_product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flash_sale_product_orders
-- ----------------------------

-- ----------------------------
-- Table structure for flash_sale_products
-- ----------------------------
DROP TABLE IF EXISTS `flash_sale_products`;
CREATE TABLE `flash_sale_products`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flash_sale_id` int(0) UNSIGNED NOT NULL,
  `product_id` int(0) UNSIGNED NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(18, 4) UNSIGNED NOT NULL,
  `qty` int(0) NOT NULL,
  `position` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `flash_sale_products_flash_sale_id_foreign`(`flash_sale_id`) USING BTREE,
  INDEX `flash_sale_products_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `flash_sale_products_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `flash_sale_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flash_sale_products
-- ----------------------------

-- ----------------------------
-- Table structure for flash_sale_translations
-- ----------------------------
DROP TABLE IF EXISTS `flash_sale_translations`;
CREATE TABLE `flash_sale_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flash_sale_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flash_sale_translations_flash_sale_id_locale_unique`(`flash_sale_id`, `locale`) USING BTREE,
  CONSTRAINT `flash_sale_translations_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flash_sale_translations
-- ----------------------------

-- ----------------------------
-- Table structure for flash_sales
-- ----------------------------
DROP TABLE IF EXISTS `flash_sales`;
CREATE TABLE `flash_sales`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flash_sales
-- ----------------------------

-- ----------------------------
-- Table structure for menu_item_translations
-- ----------------------------
DROP TABLE IF EXISTS `menu_item_translations`;
CREATE TABLE `menu_item_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_item_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_item_translations_menu_item_id_locale_unique`(`menu_item_id`, `locale`) USING BTREE,
  CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_item_translations
-- ----------------------------

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(0) UNSIGNED NOT NULL,
  `parent_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `category_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `page_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `target` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(0) UNSIGNED NULL DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT 0,
  `is_fluid` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_items_parent_id_foreign`(`parent_id`) USING BTREE,
  INDEX `menu_items_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `menu_items_page_id_foreign`(`page_id`) USING BTREE,
  INDEX `menu_items_menu_id_index`(`menu_id`) USING BTREE,
  CONSTRAINT `menu_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `menu_items_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_items
-- ----------------------------

-- ----------------------------
-- Table structure for menu_translations
-- ----------------------------
DROP TABLE IF EXISTS `menu_translations`;
CREATE TABLE `menu_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_translations_menu_id_locale_unique`(`menu_id`, `locale`) USING BTREE,
  CONSTRAINT `menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_translations
-- ----------------------------

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------

-- ----------------------------
-- Table structure for meta_data
-- ----------------------------
DROP TABLE IF EXISTS `meta_data`;
CREATE TABLE `meta_data`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(0) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `meta_data_entity_type_entity_id_index`(`entity_type`, `entity_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meta_data
-- ----------------------------

-- ----------------------------
-- Table structure for meta_data_translations
-- ----------------------------
DROP TABLE IF EXISTS `meta_data_translations`;
CREATE TABLE `meta_data_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `meta_data_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `meta_data_translations_meta_data_id_locale_unique`(`meta_data_id`, `locale`) USING BTREE,
  CONSTRAINT `meta_data_translations_meta_data_id_foreign` FOREIGN KEY (`meta_data_id`) REFERENCES `meta_data` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meta_data_translations
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_07_02_230147_migration_cartalyst_sentinel', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_14_200250_create_settings_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_26_162751_create_files_table', 1);
INSERT INTO `migrations` VALUES (4, '2014_10_30_191858_create_pages_table', 1);
INSERT INTO `migrations` VALUES (5, '2014_11_31_125848_create_page_translations_table', 1);
INSERT INTO `migrations` VALUES (6, '2015_02_27_105241_create_entity_files_table', 1);
INSERT INTO `migrations` VALUES (7, '2015_11_20_184604486385_create_translations_table', 1);
INSERT INTO `migrations` VALUES (8, '2015_11_20_184604743083_create_translation_translations_table', 1);
INSERT INTO `migrations` VALUES (9, '2017_05_29_155126144426_create_products_table', 1);
INSERT INTO `migrations` VALUES (10, '2017_05_30_155126416338_create_product_translations_table', 1);
INSERT INTO `migrations` VALUES (11, '2017_08_02_153217_create_options_table', 1);
INSERT INTO `migrations` VALUES (12, '2017_08_02_153348_create_option_translations_table', 1);
INSERT INTO `migrations` VALUES (13, '2017_08_02_153406_create_option_values_table', 1);
INSERT INTO `migrations` VALUES (14, '2017_08_02_153736_create_option_value_translations_table', 1);
INSERT INTO `migrations` VALUES (15, '2017_08_03_156576_create_product_options_table', 1);
INSERT INTO `migrations` VALUES (16, '2017_08_17_170128_create_related_products_table', 1);
INSERT INTO `migrations` VALUES (17, '2017_08_17_175236_create_up_sell_products_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_08_17_175828_create_cross_sell_products_table', 1);
INSERT INTO `migrations` VALUES (19, '2017_11_09_141332910964_create_categories_table', 1);
INSERT INTO `migrations` VALUES (20, '2017_11_09_141332931539_create_category_translations_table', 1);
INSERT INTO `migrations` VALUES (21, '2017_11_26_083614526622_create_meta_data_table', 1);
INSERT INTO `migrations` VALUES (22, '2017_11_26_083614526828_create_meta_data_translations_table', 1);
INSERT INTO `migrations` VALUES (23, '2018_01_24_125642_create_product_categories_table', 1);
INSERT INTO `migrations` VALUES (24, '2018_02_04_150917488267_create_coupons_table', 1);
INSERT INTO `migrations` VALUES (25, '2018_02_04_150917488698_create_coupon_translations_table', 1);
INSERT INTO `migrations` VALUES (26, '2018_03_11_181317_create_coupon_products_table', 1);
INSERT INTO `migrations` VALUES (27, '2018_03_15_091937_create_coupon_categories_table', 1);
INSERT INTO `migrations` VALUES (28, '2018_04_18_154028776225_create_reviews_table', 1);
INSERT INTO `migrations` VALUES (29, '2018_05_17_115822452977_create_currency_rates_table', 1);
INSERT INTO `migrations` VALUES (30, '2018_07_03_124153537506_create_sliders_table', 1);
INSERT INTO `migrations` VALUES (31, '2018_07_03_124153537695_create_slider_translations_table', 1);
INSERT INTO `migrations` VALUES (32, '2018_07_03_133107770172_create_slider_slides_table', 1);
INSERT INTO `migrations` VALUES (33, '2018_07_03_133107770486_create_slider_slide_translations_table', 1);
INSERT INTO `migrations` VALUES (34, '2018_07_28_190524758357_create_attribute_sets_table', 1);
INSERT INTO `migrations` VALUES (35, '2018_07_28_190524758497_create_attribute_set_translations_table', 1);
INSERT INTO `migrations` VALUES (36, '2018_07_28_190524758646_create_attributes_table', 1);
INSERT INTO `migrations` VALUES (37, '2018_07_28_190524758877_create_attribute_translations_table', 1);
INSERT INTO `migrations` VALUES (38, '2018_07_28_190524759461_create_product_attributes_table', 1);
INSERT INTO `migrations` VALUES (39, '2018_08_01_001919718631_create_tax_classes_table', 1);
INSERT INTO `migrations` VALUES (40, '2018_08_01_001919718935_create_tax_class_translations_table', 1);
INSERT INTO `migrations` VALUES (41, '2018_08_01_001919723551_create_tax_rates_table', 1);
INSERT INTO `migrations` VALUES (42, '2018_08_01_001919723781_create_tax_rate_translations_table', 1);
INSERT INTO `migrations` VALUES (43, '2018_08_03_195922206748_create_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (44, '2018_08_03_195922207019_create_attribute_value_translations_table', 1);
INSERT INTO `migrations` VALUES (45, '2018_08_04_190524764275_create_product_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (46, '2018_08_07_135631306565_create_orders_table', 1);
INSERT INTO `migrations` VALUES (47, '2018_08_07_135631309451_create_order_products_table', 1);
INSERT INTO `migrations` VALUES (48, '2018_08_07_135631309512_create_order_product_options_table', 1);
INSERT INTO `migrations` VALUES (49, '2018_08_07_135631309624_create_order_product_option_values_table', 1);
INSERT INTO `migrations` VALUES (50, '2018_09_11_213926106353_create_transactions_table', 1);
INSERT INTO `migrations` VALUES (51, '2018_09_19_081602135631_create_order_taxes_table', 1);
INSERT INTO `migrations` VALUES (52, '2018_09_19_103745_create_setting_translations_table', 1);
INSERT INTO `migrations` VALUES (53, '2018_10_01_224852175056_create_wish_lists_table', 1);
INSERT INTO `migrations` VALUES (54, '2018_10_04_185608_create_search_terms_table', 1);
INSERT INTO `migrations` VALUES (55, '2018_11_03_160015_create_menus_table', 1);
INSERT INTO `migrations` VALUES (56, '2018_11_03_160138_create_menu_translations_table', 1);
INSERT INTO `migrations` VALUES (57, '2018_11_03_160753_create_menu_items_table', 1);
INSERT INTO `migrations` VALUES (58, '2018_11_03_160804_create_menu_item_translation_table', 1);
INSERT INTO `migrations` VALUES (59, '2019_02_05_162605_add_position_to_slider_slides_table', 1);
INSERT INTO `migrations` VALUES (60, '2019_02_09_164343_remove_file_id_from_slider_slides_table', 1);
INSERT INTO `migrations` VALUES (61, '2019_02_09_164434_add_file_id_to_slider_slide_translations_table', 1);
INSERT INTO `migrations` VALUES (62, '2019_02_14_103408_create_attribute_categories_table', 1);
INSERT INTO `migrations` VALUES (63, '2019_08_09_164759_add_slug_column_to_attributes_table', 1);
INSERT INTO `migrations` VALUES (64, '2019_11_01_201511_add_special_price_type_column_to_products_table', 1);
INSERT INTO `migrations` VALUES (65, '2019_11_23_193101_add_value_column_to_order_product_options_table', 1);
INSERT INTO `migrations` VALUES (66, '2020_01_04_211424_add_icon_column_to_menu_items_table', 1);
INSERT INTO `migrations` VALUES (67, '2020_01_05_160502_add_direction_column_to_slider_slide_translations_table', 1);
INSERT INTO `migrations` VALUES (68, '2020_01_05_234014_add_speed_column_to_sliders_table', 1);
INSERT INTO `migrations` VALUES (69, '2020_01_05_235014_add_fade_column_to_sliders_table', 1);
INSERT INTO `migrations` VALUES (70, '2020_01_15_000346259038_create_flash_sales_table', 1);
INSERT INTO `migrations` VALUES (71, '2020_01_15_000346259349_create_flash_sale_translations_table', 1);
INSERT INTO `migrations` VALUES (72, '2020_01_23_011234_create_flash_sale_products_table', 1);
INSERT INTO `migrations` VALUES (73, '2020_01_30_015722_create_flash_sale_product_orders_table', 1);
INSERT INTO `migrations` VALUES (74, '2020_02_22_215943_delete_meta_keywords_column_from_meta_data_translations_table', 1);
INSERT INTO `migrations` VALUES (75, '2020_03_05_214602901973_create_brands_table', 1);
INSERT INTO `migrations` VALUES (76, '2020_03_05_214602902369_create_brand_translations_table', 1);
INSERT INTO `migrations` VALUES (77, '2020_03_06_234605_add_brand_id_column_to_products_table', 1);
INSERT INTO `migrations` VALUES (78, '2020_04_06_211526_add_note_column_to_orders_table', 1);
INSERT INTO `migrations` VALUES (79, '2020_04_28_034118164376_create_tags_table', 1);
INSERT INTO `migrations` VALUES (80, '2020_04_28_034118164618_create_tag_translations_table', 1);
INSERT INTO `migrations` VALUES (81, '2020_04_28_225657_create_product_tags_table', 1);
INSERT INTO `migrations` VALUES (82, '2020_05_10_041616_create_updater_scripts_table', 1);

-- ----------------------------
-- Table structure for option_translations
-- ----------------------------
DROP TABLE IF EXISTS `option_translations`;
CREATE TABLE `option_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `option_translations_option_id_locale_unique`(`option_id`, `locale`) USING BTREE,
  CONSTRAINT `option_translations_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of option_translations
-- ----------------------------

-- ----------------------------
-- Table structure for option_value_translations
-- ----------------------------
DROP TABLE IF EXISTS `option_value_translations`;
CREATE TABLE `option_value_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_value_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `option_value_translations_option_value_id_locale_unique`(`option_value_id`, `locale`) USING BTREE,
  CONSTRAINT `option_value_translations_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of option_value_translations
-- ----------------------------

-- ----------------------------
-- Table structure for option_values
-- ----------------------------
DROP TABLE IF EXISTS `option_values`;
CREATE TABLE `option_values`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_id` int(0) UNSIGNED NOT NULL,
  `price` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `price_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(0) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `option_values_option_id_index`(`option_id`) USING BTREE,
  CONSTRAINT `option_values_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of option_values
-- ----------------------------

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(0) UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of options
-- ----------------------------

-- ----------------------------
-- Table structure for order_product_option_values
-- ----------------------------
DROP TABLE IF EXISTS `order_product_option_values`;
CREATE TABLE `order_product_option_values`  (
  `order_product_option_id` int(0) UNSIGNED NOT NULL,
  `option_value_id` int(0) UNSIGNED NOT NULL,
  `price` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`order_product_option_id`, `option_value_id`) USING BTREE,
  INDEX `order_product_option_values_option_value_id_foreign`(`option_value_id`) USING BTREE,
  CONSTRAINT `order_product_option_values_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_product_option_values_order_product_option_id_foreign` FOREIGN KEY (`order_product_option_id`) REFERENCES `order_product_options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_product_option_values
-- ----------------------------

-- ----------------------------
-- Table structure for order_product_options
-- ----------------------------
DROP TABLE IF EXISTS `order_product_options`;
CREATE TABLE `order_product_options`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_product_id` int(0) UNSIGNED NOT NULL,
  `option_id` int(0) UNSIGNED NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_product_options_order_product_id_option_id_unique`(`order_product_id`, `option_id`) USING BTREE,
  INDEX `order_product_options_option_id_foreign`(`option_id`) USING BTREE,
  CONSTRAINT `order_product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_product_options_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_product_options
-- ----------------------------

-- ----------------------------
-- Table structure for order_products
-- ----------------------------
DROP TABLE IF EXISTS `order_products`;
CREATE TABLE `order_products`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(0) UNSIGNED NOT NULL,
  `product_id` int(0) UNSIGNED NOT NULL,
  `unit_price` decimal(18, 4) UNSIGNED NOT NULL,
  `qty` int(0) NOT NULL,
  `line_total` decimal(18, 4) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_products_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_products_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_products
-- ----------------------------

-- ----------------------------
-- Table structure for order_taxes
-- ----------------------------
DROP TABLE IF EXISTS `order_taxes`;
CREATE TABLE `order_taxes`  (
  `order_id` int(0) UNSIGNED NOT NULL,
  `tax_rate_id` int(0) UNSIGNED NOT NULL,
  `amount` decimal(15, 4) UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`, `tax_rate_id`) USING BTREE,
  INDEX `order_taxes_tax_rate_id_foreign`(`tax_rate_id`) USING BTREE,
  CONSTRAINT `order_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_taxes_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_taxes
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(0) NULL DEFAULT NULL,
  `customer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `billing_city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(18, 4) UNSIGNED NOT NULL,
  `shipping_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` decimal(18, 4) UNSIGNED NOT NULL,
  `coupon_id` int(0) NULL DEFAULT NULL,
  `discount` decimal(18, 4) UNSIGNED NOT NULL,
  `total` decimal(18, 4) UNSIGNED NOT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(18, 4) NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_customer_id_index`(`customer_id`) USING BTREE,
  INDEX `orders_coupon_id_index`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for page_translations
-- ----------------------------
DROP TABLE IF EXISTS `page_translations`;
CREATE TABLE `page_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `page_translations_page_id_locale_unique`(`page_id`, `locale`) USING BTREE,
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of page_translations
-- ----------------------------

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pages_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pages
-- ----------------------------

-- ----------------------------
-- Table structure for persistences
-- ----------------------------
DROP TABLE IF EXISTS `persistences`;
CREATE TABLE `persistences`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `persistences_code_unique`(`code`) USING BTREE,
  INDEX `persistences_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persistences
-- ----------------------------
INSERT INTO `persistences` VALUES (1, 1, '9ugUpc65nZFrQL0z14sAT6mUdLadMR6H', '2021-02-08 12:59:42', '2021-02-08 12:59:42');

-- ----------------------------
-- Table structure for product_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE `product_attribute_values`  (
  `product_attribute_id` int(0) UNSIGNED NOT NULL,
  `attribute_value_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_attribute_id`, `attribute_value_id`) USING BTREE,
  INDEX `product_attribute_values_attribute_value_id_foreign`(`attribute_value_id`) USING BTREE,
  CONSTRAINT `product_attribute_values_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_attribute_values
-- ----------------------------

-- ----------------------------
-- Table structure for product_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE `product_attributes`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(0) UNSIGNED NOT NULL,
  `attribute_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_attributes_product_id_index`(`product_id`) USING BTREE,
  INDEX `product_attributes_attribute_id_index`(`attribute_id`) USING BTREE,
  CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories`  (
  `product_id` int(0) UNSIGNED NOT NULL,
  `category_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`) USING BTREE,
  INDEX `product_categories_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_categories
-- ----------------------------

-- ----------------------------
-- Table structure for product_options
-- ----------------------------
DROP TABLE IF EXISTS `product_options`;
CREATE TABLE `product_options`  (
  `product_id` int(0) UNSIGNED NOT NULL,
  `option_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `option_id`) USING BTREE,
  INDEX `product_options_option_id_foreign`(`option_id`) USING BTREE,
  CONSTRAINT `product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_options
-- ----------------------------

-- ----------------------------
-- Table structure for product_tags
-- ----------------------------
DROP TABLE IF EXISTS `product_tags`;
CREATE TABLE `product_tags`  (
  `product_id` int(0) UNSIGNED NOT NULL,
  `tag_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `tag_id`) USING BTREE,
  INDEX `product_tags_tag_id_foreign`(`tag_id`) USING BTREE,
  CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_tags
-- ----------------------------

-- ----------------------------
-- Table structure for product_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_translations`;
CREATE TABLE `product_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_translations_product_id_locale_unique`(`product_id`, `locale`) USING BTREE,
  FULLTEXT INDEX `name`(`name`),
  CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_translations
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `tax_class_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18, 4) UNSIGNED NOT NULL,
  `special_price` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `special_price_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `special_price_start` date NULL DEFAULT NULL,
  `special_price_end` date NULL DEFAULT NULL,
  `selling_price` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `manage_stock` tinyint(1) NOT NULL,
  `qty` int(0) NULL DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `viewed` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `new_from` datetime(0) NULL DEFAULT NULL,
  `new_to` datetime(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_slug_unique`(`slug`) USING BTREE,
  INDEX `products_brand_id_foreign`(`brand_id`) USING BTREE,
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for related_products
-- ----------------------------
DROP TABLE IF EXISTS `related_products`;
CREATE TABLE `related_products`  (
  `product_id` int(0) UNSIGNED NOT NULL,
  `related_product_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `related_product_id`) USING BTREE,
  INDEX `related_products_related_product_id_foreign`(`related_product_id`) USING BTREE,
  CONSTRAINT `related_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `related_products_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of related_products
-- ----------------------------

-- ----------------------------
-- Table structure for reminders
-- ----------------------------
DROP TABLE IF EXISTS `reminders`;
CREATE TABLE `reminders`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reminders_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reminders
-- ----------------------------

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `product_id` int(0) UNSIGNED NOT NULL,
  `rating` int(0) NOT NULL,
  `reviewer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reviews_reviewer_id_index`(`reviewer_id`) USING BTREE,
  INDEX `reviews_product_id_index`(`product_id`) USING BTREE,
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------

-- ----------------------------
-- Table structure for role_translations
-- ----------------------------
DROP TABLE IF EXISTS `role_translations`;
CREATE TABLE `role_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_translations_role_id_locale_unique`(`role_id`, `locale`) USING BTREE,
  CONSTRAINT `role_translations_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_translations
-- ----------------------------
INSERT INTO `role_translations` VALUES (1, 1, 'en', 'Admin');
INSERT INTO `role_translations` VALUES (2, 2, 'en', 'Customer');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '{\"admin.users.index\":true,\"admin.users.create\":true,\"admin.users.edit\":true,\"admin.users.destroy\":true,\"admin.roles.index\":true,\"admin.roles.create\":true,\"admin.roles.edit\":true,\"admin.roles.destroy\":true,\"admin.products.index\":true,\"admin.products.create\":true,\"admin.products.edit\":true,\"admin.products.destroy\":true,\"admin.brands.index\":true,\"admin.brands.create\":true,\"admin.brands.edit\":true,\"admin.brands.destroy\":true,\"admin.attributes.index\":true,\"admin.attributes.create\":true,\"admin.attributes.edit\":true,\"admin.attributes.destroy\":true,\"admin.attribute_sets.index\":true,\"admin.attribute_sets.create\":true,\"admin.attribute_sets.edit\":true,\"admin.attribute_sets.destroy\":true,\"admin.options.index\":true,\"admin.options.create\":true,\"admin.options.edit\":true,\"admin.options.destroy\":true,\"admin.filters.index\":true,\"admin.filters.create\":true,\"admin.filters.edit\":true,\"admin.filters.destroy\":true,\"admin.reviews.index\":true,\"admin.reviews.create\":true,\"admin.reviews.edit\":true,\"admin.reviews.destroy\":true,\"admin.categories.index\":true,\"admin.categories.create\":true,\"admin.categories.edit\":true,\"admin.categories.destroy\":true,\"admin.tags.index\":true,\"admin.tags.create\":true,\"admin.tags.edit\":true,\"admin.tags.destroy\":true,\"admin.orders.index\":true,\"admin.orders.show\":true,\"admin.orders.edit\":true,\"admin.flash_sales.index\":true,\"admin.flash_sales.create\":true,\"admin.flash_sales.edit\":true,\"admin.flash_sales.destroy\":true,\"admin.transactions.index\":true,\"admin.coupons.index\":true,\"admin.coupons.create\":true,\"admin.coupons.edit\":true,\"admin.coupons.destroy\":true,\"admin.menus.index\":true,\"admin.menus.create\":true,\"admin.menus.edit\":true,\"admin.menus.destroy\":true,\"admin.menu_items.index\":true,\"admin.menu_items.create\":true,\"admin.menu_items.edit\":true,\"admin.menu_items.destroy\":true,\"admin.media.index\":true,\"admin.media.create\":true,\"admin.media.destroy\":true,\"admin.pages.index\":true,\"admin.pages.create\":true,\"admin.pages.edit\":true,\"admin.pages.destroy\":true,\"admin.currency_rates.index\":true,\"admin.currency_rates.edit\":true,\"admin.taxes.index\":true,\"admin.taxes.create\":true,\"admin.taxes.edit\":true,\"admin.taxes.destroy\":true,\"admin.translations.index\":true,\"admin.translations.edit\":true,\"admin.sliders.index\":true,\"admin.sliders.create\":true,\"admin.sliders.edit\":true,\"admin.sliders.destroy\":true,\"admin.importer.index\":true,\"admin.importer.create\":true,\"admin.reports.index\":true,\"admin.settings.edit\":true,\"admin.storefront.edit\":true}', '2021-02-08 06:58:59', '2021-02-08 06:58:59');
INSERT INTO `roles` VALUES (2, NULL, '2021-02-08 06:59:00', '2021-02-08 06:59:00');

-- ----------------------------
-- Table structure for search_terms
-- ----------------------------
DROP TABLE IF EXISTS `search_terms`;
CREATE TABLE `search_terms`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int(0) UNSIGNED NOT NULL,
  `hits` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `search_terms_term_unique`(`term`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of search_terms
-- ----------------------------

-- ----------------------------
-- Table structure for setting_translations
-- ----------------------------
DROP TABLE IF EXISTS `setting_translations`;
CREATE TABLE `setting_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `setting_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `setting_translations_setting_id_locale_unique`(`setting_id`, `locale`) USING BTREE,
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_translations
-- ----------------------------
INSERT INTO `setting_translations` VALUES (1, 1, 'en', 's:6:\"FSTORE\";');
INSERT INTO `setting_translations` VALUES (2, 22, 'en', 's:13:\"Free Shipping\";');
INSERT INTO `setting_translations` VALUES (3, 23, 'en', 's:12:\"Local Pickup\";');
INSERT INTO `setting_translations` VALUES (4, 24, 'en', 's:9:\"Flat Rate\";');
INSERT INTO `setting_translations` VALUES (5, 25, 'en', 's:6:\"PayPal\";');
INSERT INTO `setting_translations` VALUES (6, 26, 'en', 's:28:\"Pay via your PayPal account.\";');
INSERT INTO `setting_translations` VALUES (7, 27, 'en', 's:6:\"Stripe\";');
INSERT INTO `setting_translations` VALUES (8, 28, 'en', 's:29:\"Pay via credit or debit card.\";');
INSERT INTO `setting_translations` VALUES (9, 29, 'en', 's:8:\"Razorpay\";');
INSERT INTO `setting_translations` VALUES (10, 30, 'en', 's:74:\"Pay securely by Credit or Debit card or Internet Banking through Razorpay.\";');
INSERT INTO `setting_translations` VALUES (11, 31, 'en', 's:9:\"Instamojo\";');
INSERT INTO `setting_translations` VALUES (12, 32, 'en', 's:16:\"CC/DB/NB/Wallets\";');
INSERT INTO `setting_translations` VALUES (13, 33, 'en', 's:16:\"Cash On Delivery\";');
INSERT INTO `setting_translations` VALUES (14, 34, 'en', 's:28:\"Pay with cash upon delivery.\";');
INSERT INTO `setting_translations` VALUES (15, 35, 'en', 's:13:\"Bank Transfer\";');
INSERT INTO `setting_translations` VALUES (16, 36, 'en', 's:100:\"Make your payment directly into our bank account. Please use your Order ID as the payment reference.\";');
INSERT INTO `setting_translations` VALUES (17, 37, 'en', 's:19:\"Check / Money Order\";');
INSERT INTO `setting_translations` VALUES (18, 38, 'en', 's:33:\"Please send a check to our store.\";');
INSERT INTO `setting_translations` VALUES (19, 40, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (20, 41, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (21, 42, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (22, 43, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (23, 44, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (24, 39, 'en', 's:92:\"Copyright © <a href=\"{{ store_url }}\">{{ store_name }}</a> {{ year }}. All rights reserved.\";');
INSERT INTO `setting_translations` VALUES (25, 45, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (26, 46, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (27, 47, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (28, 48, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (29, 49, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (30, 50, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (31, 51, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (32, 52, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (33, 53, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (34, 54, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (35, 55, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (36, 56, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (37, 57, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (38, 58, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (39, 59, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (40, 60, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (41, 61, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (42, 62, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (43, 63, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (44, 64, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (45, 65, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (46, 66, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (47, 67, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (48, 68, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (49, 69, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (50, 70, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (51, 71, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (52, 72, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (53, 73, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (54, 74, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (55, 75, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (56, 76, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (57, 77, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (58, 78, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (59, 79, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (60, 80, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (61, 81, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (62, 234, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (63, 235, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (64, 236, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (65, 288, 'en', 's:1:\"1\";');
INSERT INTO `setting_translations` VALUES (66, 289, 'en', 's:1:\"1\";');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_translatable` tinyint(1) NOT NULL DEFAULT 0,
  `plain_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 291 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'store_name', 1, NULL, '2021-02-08 06:58:59', '2021-02-08 06:58:59');
INSERT INTO `settings` VALUES (2, 'store_email', 0, 's:16:\"fstore@gmail.com\";', '2021-02-08 06:59:00', '2021-02-08 12:07:50');
INSERT INTO `settings` VALUES (3, 'search_engine', 0, 's:5:\"mysql\";', '2021-02-08 06:59:00', '2021-02-08 06:59:00');
INSERT INTO `settings` VALUES (4, 'algolia_app_id', 0, 'N;', '2021-02-08 06:59:00', '2021-02-08 06:59:00');
INSERT INTO `settings` VALUES (5, 'algolia_secret', 0, 'N;', '2021-02-08 06:59:00', '2021-02-08 06:59:00');
INSERT INTO `settings` VALUES (6, 'active_theme', 0, 's:10:\"Storefront\";', '2021-02-08 06:59:00', '2021-02-08 06:59:00');
INSERT INTO `settings` VALUES (7, 'supported_countries', 0, 'a:1:{i:0;s:2:\"UZ\";}', '2021-02-08 06:59:00', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (8, 'default_country', 0, 's:2:\"UZ\";', '2021-02-08 06:59:00', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (9, 'supported_locales', 0, 'a:2:{i:0;s:2:\"en\";i:1;s:2:\"uz\";}', '2021-02-08 06:59:00', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (10, 'default_locale', 0, 's:2:\"en\";', '2021-02-08 06:59:00', '2021-02-08 06:59:00');
INSERT INTO `settings` VALUES (11, 'default_timezone', 0, 's:13:\"Asia/Tashkent\";', '2021-02-08 06:59:00', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (12, 'customer_role', 0, 's:1:\"2\";', '2021-02-08 06:59:00', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (13, 'reviews_enabled', 0, 's:1:\"1\";', '2021-02-08 06:59:00', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (14, 'auto_approve_reviews', 0, 's:1:\"1\";', '2021-02-08 06:59:00', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (15, 'cookie_bar_enabled', 0, 's:1:\"1\";', '2021-02-08 06:59:01', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (16, 'supported_currencies', 0, 'a:2:{i:0;s:3:\"USD\";i:1;s:3:\"UZS\";}', '2021-02-08 06:59:01', '2021-02-08 12:08:25');
INSERT INTO `settings` VALUES (17, 'default_currency', 0, 's:3:\"USD\";', '2021-02-08 06:59:01', '2021-02-08 06:59:01');
INSERT INTO `settings` VALUES (18, 'send_order_invoice_email', 0, 'b:0;', '2021-02-08 06:59:01', '2021-02-08 06:59:01');
INSERT INTO `settings` VALUES (19, 'newsletter_enabled', 0, 's:1:\"0\";', '2021-02-08 06:59:01', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (20, 'local_pickup_cost', 0, 's:1:\"0\";', '2021-02-08 06:59:01', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (21, 'flat_rate_cost', 0, 's:1:\"0\";', '2021-02-08 06:59:01', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (22, 'free_shipping_label', 1, NULL, '2021-02-08 06:59:01', '2021-02-08 06:59:01');
INSERT INTO `settings` VALUES (23, 'local_pickup_label', 1, NULL, '2021-02-08 06:59:01', '2021-02-08 06:59:01');
INSERT INTO `settings` VALUES (24, 'flat_rate_label', 1, NULL, '2021-02-08 06:59:01', '2021-02-08 06:59:01');
INSERT INTO `settings` VALUES (25, 'paypal_label', 1, NULL, '2021-02-08 06:59:01', '2021-02-08 06:59:01');
INSERT INTO `settings` VALUES (26, 'paypal_description', 1, NULL, '2021-02-08 06:59:01', '2021-02-08 06:59:01');
INSERT INTO `settings` VALUES (27, 'stripe_label', 1, NULL, '2021-02-08 06:59:01', '2021-02-08 06:59:01');
INSERT INTO `settings` VALUES (28, 'stripe_description', 1, NULL, '2021-02-08 06:59:02', '2021-02-08 06:59:02');
INSERT INTO `settings` VALUES (29, 'razorpay_label', 1, NULL, '2021-02-08 06:59:02', '2021-02-08 06:59:02');
INSERT INTO `settings` VALUES (30, 'razorpay_description', 1, NULL, '2021-02-08 06:59:02', '2021-02-08 06:59:02');
INSERT INTO `settings` VALUES (31, 'instamojo_label', 1, NULL, '2021-02-08 06:59:02', '2021-02-08 06:59:02');
INSERT INTO `settings` VALUES (32, 'instamojo_description', 1, NULL, '2021-02-08 06:59:02', '2021-02-08 06:59:02');
INSERT INTO `settings` VALUES (33, 'cod_label', 1, NULL, '2021-02-08 06:59:02', '2021-02-08 06:59:02');
INSERT INTO `settings` VALUES (34, 'cod_description', 1, NULL, '2021-02-08 06:59:02', '2021-02-08 06:59:02');
INSERT INTO `settings` VALUES (35, 'bank_transfer_label', 1, NULL, '2021-02-08 06:59:02', '2021-02-08 06:59:02');
INSERT INTO `settings` VALUES (36, 'bank_transfer_description', 1, NULL, '2021-02-08 06:59:03', '2021-02-08 06:59:03');
INSERT INTO `settings` VALUES (37, 'check_payment_label', 1, NULL, '2021-02-08 06:59:03', '2021-02-08 06:59:03');
INSERT INTO `settings` VALUES (38, 'check_payment_description', 1, NULL, '2021-02-08 06:59:03', '2021-02-08 06:59:03');
INSERT INTO `settings` VALUES (39, 'storefront_copyright_text', 1, 's:92:\"Copyright © <a href=\"{{ store_url }}\">{{ store_name }}</a> {{ year }}. All rights reserved.\";', '2021-02-08 06:59:03', '2021-02-08 13:01:10');
INSERT INTO `settings` VALUES (40, 'storefront_welcome_text', 1, NULL, '2021-02-08 13:01:10', '2021-02-08 13:01:10');
INSERT INTO `settings` VALUES (41, 'storefront_address', 1, NULL, '2021-02-08 13:01:10', '2021-02-08 13:01:10');
INSERT INTO `settings` VALUES (42, 'storefront_navbar_text', 1, NULL, '2021-02-08 13:01:10', '2021-02-08 13:01:10');
INSERT INTO `settings` VALUES (43, 'storefront_footer_menu_one_title', 1, NULL, '2021-02-08 13:01:10', '2021-02-08 13:01:10');
INSERT INTO `settings` VALUES (44, 'storefront_footer_menu_two_title', 1, NULL, '2021-02-08 13:01:10', '2021-02-08 13:01:10');
INSERT INTO `settings` VALUES (45, 'storefront_feature_1_title', 1, NULL, '2021-02-08 13:01:11', '2021-02-08 13:01:11');
INSERT INTO `settings` VALUES (46, 'storefront_feature_1_subtitle', 1, NULL, '2021-02-08 13:01:11', '2021-02-08 13:01:11');
INSERT INTO `settings` VALUES (47, 'storefront_feature_2_title', 1, NULL, '2021-02-08 13:01:11', '2021-02-08 13:01:11');
INSERT INTO `settings` VALUES (48, 'storefront_feature_2_subtitle', 1, NULL, '2021-02-08 13:01:11', '2021-02-08 13:01:11');
INSERT INTO `settings` VALUES (49, 'storefront_feature_3_title', 1, NULL, '2021-02-08 13:01:11', '2021-02-08 13:01:11');
INSERT INTO `settings` VALUES (50, 'storefront_feature_3_subtitle', 1, NULL, '2021-02-08 13:01:11', '2021-02-08 13:01:11');
INSERT INTO `settings` VALUES (51, 'storefront_feature_4_title', 1, NULL, '2021-02-08 13:01:11', '2021-02-08 13:01:11');
INSERT INTO `settings` VALUES (52, 'storefront_feature_4_subtitle', 1, NULL, '2021-02-08 13:01:11', '2021-02-08 13:01:11');
INSERT INTO `settings` VALUES (53, 'storefront_feature_5_title', 1, NULL, '2021-02-08 13:01:11', '2021-02-08 13:01:11');
INSERT INTO `settings` VALUES (54, 'storefront_feature_5_subtitle', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (55, 'storefront_product_page_banner_file_id', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (56, 'storefront_slider_banner_1_file_id', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (57, 'storefront_slider_banner_2_file_id', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (58, 'storefront_three_column_full_width_banners_1_file_id', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (59, 'storefront_three_column_full_width_banners_2_file_id', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (60, 'storefront_three_column_full_width_banners_3_file_id', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (61, 'storefront_featured_categories_section_title', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (62, 'storefront_featured_categories_section_subtitle', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (63, 'storefront_product_tabs_1_section_tab_1_title', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (64, 'storefront_product_tabs_1_section_tab_2_title', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (65, 'storefront_product_tabs_1_section_tab_3_title', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (66, 'storefront_product_tabs_1_section_tab_4_title', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (67, 'storefront_two_column_banners_1_file_id', 1, NULL, '2021-02-08 13:01:12', '2021-02-08 13:01:12');
INSERT INTO `settings` VALUES (68, 'storefront_two_column_banners_2_file_id', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (69, 'storefront_product_grid_section_tab_1_title', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (70, 'storefront_product_grid_section_tab_2_title', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (71, 'storefront_product_grid_section_tab_3_title', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (72, 'storefront_product_grid_section_tab_4_title', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (73, 'storefront_three_column_banners_1_file_id', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (74, 'storefront_three_column_banners_2_file_id', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (75, 'storefront_three_column_banners_3_file_id', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (76, 'storefront_product_tabs_2_section_title', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (77, 'storefront_product_tabs_2_section_tab_1_title', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (78, 'storefront_product_tabs_2_section_tab_2_title', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (79, 'storefront_product_tabs_2_section_tab_3_title', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (80, 'storefront_product_tabs_2_section_tab_4_title', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (81, 'storefront_one_column_banner_file_id', 1, NULL, '2021-02-08 13:01:13', '2021-02-08 13:01:13');
INSERT INTO `settings` VALUES (82, 'storefront_theme_color', 0, 's:4:\"blue\";', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (83, 'storefront_custom_theme_color', 0, 's:7:\"#000000\";', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (84, 'storefront_mail_theme_color', 0, 's:4:\"blue\";', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (85, 'storefront_custom_mail_theme_color', 0, 's:7:\"#000000\";', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (86, 'storefront_slider', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (87, 'storefront_terms_page', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (88, 'storefront_privacy_page', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (89, 'storefront_primary_menu', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (90, 'storefront_category_menu', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (91, 'storefront_footer_menu_one', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (92, 'storefront_footer_menu_two', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (93, 'storefront_features_section_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (94, 'storefront_feature_1_icon', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (95, 'storefront_feature_2_icon', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (96, 'storefront_feature_3_icon', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (97, 'storefront_feature_4_icon', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (98, 'storefront_feature_5_icon', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (99, 'storefront_product_page_banner_call_to_action_url', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (100, 'storefront_product_page_banner_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (101, 'storefront_facebook_link', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (102, 'storefront_twitter_link', 0, 'N;', '2021-02-08 13:01:14', '2021-02-08 13:01:14');
INSERT INTO `settings` VALUES (103, 'storefront_instagram_link', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (104, 'storefront_youtube_link', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (105, 'storefront_slider_banner_1_call_to_action_url', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (106, 'storefront_slider_banner_1_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (107, 'storefront_slider_banner_2_call_to_action_url', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (108, 'storefront_slider_banner_2_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (109, 'storefront_three_column_full_width_banners_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (110, 'storefront_three_column_full_width_banners_1_call_to_action_url', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (111, 'storefront_three_column_full_width_banners_1_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (112, 'storefront_three_column_full_width_banners_2_call_to_action_url', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (113, 'storefront_three_column_full_width_banners_2_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (114, 'storefront_three_column_full_width_banners_3_call_to_action_url', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (115, 'storefront_three_column_full_width_banners_3_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (116, 'storefront_featured_categories_section_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (117, 'storefront_featured_categories_section_category_1_category_id', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (118, 'storefront_featured_categories_section_category_1_product_type', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (119, 'storefront_featured_categories_section_category_1_products_limit', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (120, 'storefront_featured_categories_section_category_2_category_id', 0, 'N;', '2021-02-08 13:01:15', '2021-02-08 13:01:15');
INSERT INTO `settings` VALUES (121, 'storefront_featured_categories_section_category_2_product_type', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (122, 'storefront_featured_categories_section_category_2_products_limit', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (123, 'storefront_featured_categories_section_category_3_category_id', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (124, 'storefront_featured_categories_section_category_3_product_type', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (125, 'storefront_featured_categories_section_category_3_products_limit', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (126, 'storefront_featured_categories_section_category_4_category_id', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (127, 'storefront_featured_categories_section_category_4_product_type', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (128, 'storefront_featured_categories_section_category_4_products_limit', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (129, 'storefront_featured_categories_section_category_5_category_id', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (130, 'storefront_featured_categories_section_category_5_product_type', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (131, 'storefront_featured_categories_section_category_5_products_limit', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (132, 'storefront_featured_categories_section_category_6_category_id', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (133, 'storefront_featured_categories_section_category_6_product_type', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (134, 'storefront_featured_categories_section_category_6_products_limit', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (135, 'storefront_product_tabs_1_section_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (136, 'storefront_product_tabs_1_section_tab_1_product_type', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (137, 'storefront_product_tabs_1_section_tab_1_category_id', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (138, 'storefront_product_tabs_1_section_tab_1_products_limit', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (139, 'storefront_product_tabs_1_section_tab_2_product_type', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (140, 'storefront_product_tabs_1_section_tab_2_category_id', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (141, 'storefront_product_tabs_1_section_tab_2_products_limit', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (142, 'storefront_product_tabs_1_section_tab_3_product_type', 0, 'N;', '2021-02-08 13:01:16', '2021-02-08 13:01:16');
INSERT INTO `settings` VALUES (143, 'storefront_product_tabs_1_section_tab_3_category_id', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (144, 'storefront_product_tabs_1_section_tab_3_products_limit', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (145, 'storefront_product_tabs_1_section_tab_4_product_type', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (146, 'storefront_product_tabs_1_section_tab_4_category_id', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (147, 'storefront_product_tabs_1_section_tab_4_products_limit', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (148, 'storefront_top_brands_section_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (149, 'storefront_flash_sale_and_vertical_products_section_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (150, 'storefront_flash_sale_title', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (151, 'storefront_active_flash_sale_campaign', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (152, 'storefront_vertical_products_1_title', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (153, 'storefront_vertical_products_1_product_type', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (154, 'storefront_vertical_products_1_category_id', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (155, 'storefront_vertical_products_1_products_limit', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (156, 'storefront_vertical_products_2_title', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (157, 'storefront_vertical_products_2_product_type', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (158, 'storefront_vertical_products_2_category_id', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (159, 'storefront_vertical_products_2_products_limit', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (160, 'storefront_vertical_products_3_title', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (161, 'storefront_vertical_products_3_product_type', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (162, 'storefront_vertical_products_3_category_id', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (163, 'storefront_vertical_products_3_products_limit', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (164, 'storefront_two_column_banners_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (165, 'storefront_two_column_banners_1_call_to_action_url', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (166, 'storefront_two_column_banners_1_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (167, 'storefront_two_column_banners_2_call_to_action_url', 0, 'N;', '2021-02-08 13:01:17', '2021-02-08 13:01:17');
INSERT INTO `settings` VALUES (168, 'storefront_two_column_banners_2_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (169, 'storefront_product_grid_section_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (170, 'storefront_product_grid_section_tab_1_product_type', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (171, 'storefront_product_grid_section_tab_1_category_id', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (172, 'storefront_product_grid_section_tab_1_products_limit', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (173, 'storefront_product_grid_section_tab_2_product_type', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (174, 'storefront_product_grid_section_tab_2_category_id', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (175, 'storefront_product_grid_section_tab_2_products_limit', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (176, 'storefront_product_grid_section_tab_3_product_type', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (177, 'storefront_product_grid_section_tab_3_category_id', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (178, 'storefront_product_grid_section_tab_3_products_limit', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (179, 'storefront_product_grid_section_tab_4_product_type', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (180, 'storefront_product_grid_section_tab_4_category_id', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (181, 'storefront_product_grid_section_tab_4_products_limit', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (182, 'storefront_three_column_banners_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (183, 'storefront_three_column_banners_1_call_to_action_url', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (184, 'storefront_three_column_banners_1_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (185, 'storefront_three_column_banners_2_call_to_action_url', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (186, 'storefront_three_column_banners_2_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (187, 'storefront_three_column_banners_3_call_to_action_url', 0, 'N;', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (188, 'storefront_three_column_banners_3_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:18', '2021-02-08 13:01:18');
INSERT INTO `settings` VALUES (189, 'storefront_product_tabs_2_section_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (190, 'storefront_product_tabs_2_section_tab_1_product_type', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (191, 'storefront_product_tabs_2_section_tab_1_category_id', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (192, 'storefront_product_tabs_2_section_tab_1_products_limit', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (193, 'storefront_product_tabs_2_section_tab_2_product_type', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (194, 'storefront_product_tabs_2_section_tab_2_category_id', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (195, 'storefront_product_tabs_2_section_tab_2_products_limit', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (196, 'storefront_product_tabs_2_section_tab_3_product_type', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (197, 'storefront_product_tabs_2_section_tab_3_category_id', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (198, 'storefront_product_tabs_2_section_tab_3_products_limit', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (199, 'storefront_product_tabs_2_section_tab_4_product_type', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (200, 'storefront_product_tabs_2_section_tab_4_category_id', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (201, 'storefront_product_tabs_2_section_tab_4_products_limit', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (202, 'storefront_one_column_banner_enabled', 0, 's:1:\"0\";', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (203, 'storefront_one_column_banner_call_to_action_url', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (204, 'storefront_one_column_banner_open_in_new_window', 0, 's:1:\"0\";', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (205, 'storefront_footer_tags', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (206, 'storefront_featured_categories_section_category_1_products', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (207, 'storefront_featured_categories_section_category_2_products', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (208, 'storefront_featured_categories_section_category_3_products', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (209, 'storefront_featured_categories_section_category_4_products', 0, 'N;', '2021-02-08 13:01:19', '2021-02-08 13:01:19');
INSERT INTO `settings` VALUES (210, 'storefront_featured_categories_section_category_5_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (211, 'storefront_featured_categories_section_category_6_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (212, 'storefront_product_tabs_1_section_tab_1_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (213, 'storefront_product_tabs_1_section_tab_2_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (214, 'storefront_product_tabs_1_section_tab_3_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (215, 'storefront_product_tabs_1_section_tab_4_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (216, 'storefront_top_brands', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (217, 'storefront_vertical_products_1_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (218, 'storefront_vertical_products_2_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (219, 'storefront_vertical_products_3_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (220, 'storefront_product_grid_section_tab_1_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (221, 'storefront_product_grid_section_tab_2_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (222, 'storefront_product_grid_section_tab_3_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (223, 'storefront_product_grid_section_tab_4_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (224, 'storefront_product_tabs_2_section_tab_1_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (225, 'storefront_product_tabs_2_section_tab_2_products', 0, 'N;', '2021-02-08 13:01:20', '2021-02-08 13:01:20');
INSERT INTO `settings` VALUES (226, 'storefront_product_tabs_2_section_tab_3_products', 0, 'N;', '2021-02-08 13:01:21', '2021-02-08 13:01:21');
INSERT INTO `settings` VALUES (227, 'storefront_product_tabs_2_section_tab_4_products', 0, 'N;', '2021-02-08 13:01:21', '2021-02-08 13:01:21');
INSERT INTO `settings` VALUES (228, 'welcome_email', 0, 's:1:\"0\";', '2021-02-08 13:06:28', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (229, 'admin_order_email', 0, 's:1:\"0\";', '2021-02-08 13:06:28', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (230, 'order_status_email', 0, 's:1:\"0\";', '2021-02-08 13:06:28', '2021-02-08 13:06:28');
INSERT INTO `settings` VALUES (231, 'invoice_email', 0, 's:1:\"0\";', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (232, 'maintenance_mode', 0, 's:1:\"0\";', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (233, 'allowed_ips', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (234, 'store_tagline', 1, NULL, '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (235, 'bank_transfer_instructions', 1, NULL, '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (236, 'check_payment_instructions', 1, NULL, '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (237, 'store_phone', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (238, 'store_address_1', 0, 's:70:\"100027, №2, Bog’ str., Shayxontohur district, Tashkent, Uzbekistan\";', '2021-02-08 13:06:29', '2021-02-08 12:07:50');
INSERT INTO `settings` VALUES (239, 'store_address_2', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (240, 'store_city', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (241, 'store_country', 0, 's:2:\"UZ\";', '2021-02-08 13:06:29', '2021-02-08 12:07:50');
INSERT INTO `settings` VALUES (242, 'store_state', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (243, 'store_zip', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (244, 'currency_rate_exchange_service', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (245, 'fixer_access_key', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (246, 'forge_api_key', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (247, 'currency_data_feed_api_key', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (248, 'auto_refresh_currency_rates', 0, 's:1:\"0\";', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (249, 'auto_refresh_currency_rate_frequency', 0, 's:5:\"daily\";', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (250, 'mail_from_address', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (251, 'mail_from_name', 0, 'N;', '2021-02-08 13:06:29', '2021-02-08 13:06:29');
INSERT INTO `settings` VALUES (252, 'mail_host', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (253, 'mail_port', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (254, 'mail_username', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (255, 'mail_password', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (256, 'mail_encryption', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (257, 'mailchimp_api_key', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (258, 'mailchimp_list_id', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (259, 'custom_header_assets', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (260, 'custom_footer_assets', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (261, 'facebook_login_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (262, 'facebook_login_app_id', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (263, 'facebook_login_app_secret', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (264, 'google_login_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (265, 'google_login_client_id', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (266, 'google_login_client_secret', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (267, 'free_shipping_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (268, 'free_shipping_min_amount', 0, 'N;', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (269, 'local_pickup_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (270, 'flat_rate_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (271, 'paypal_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:30', '2021-02-08 13:06:30');
INSERT INTO `settings` VALUES (272, 'paypal_test_mode', 0, 's:1:\"0\";', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (273, 'paypal_client_id', 0, 'N;', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (274, 'paypal_secret', 0, 'N;', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (275, 'stripe_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (276, 'stripe_publishable_key', 0, 'N;', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (277, 'stripe_secret_key', 0, 'N;', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (278, 'razorpay_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (279, 'razorpay_key_id', 0, 'N;', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (280, 'razorpay_key_secret', 0, 'N;', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (281, 'instamojo_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (282, 'instamojo_test_mode', 0, 's:1:\"0\";', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (283, 'instamojo_api_key', 0, 'N;', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (284, 'instamojo_auth_token', 0, 'N;', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (285, 'cod_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (286, 'bank_transfer_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (287, 'check_payment_enabled', 0, 's:1:\"0\";', '2021-02-08 13:06:31', '2021-02-08 13:06:31');
INSERT INTO `settings` VALUES (288, 'storefront_header_logo', 1, NULL, '2021-02-08 12:16:35', '2021-02-08 12:16:35');
INSERT INTO `settings` VALUES (289, 'storefront_mail_logo', 1, NULL, '2021-02-08 12:16:35', '2021-02-08 12:16:35');
INSERT INTO `settings` VALUES (290, 'storefront_favicon', 0, 's:1:\"1\";', '2021-02-08 12:16:35', '2021-02-08 12:16:35');

-- ----------------------------
-- Table structure for slider_slide_translations
-- ----------------------------
DROP TABLE IF EXISTS `slider_slide_translations`;
CREATE TABLE `slider_slide_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slider_slide_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `caption_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `call_to_action_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `direction` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slider_slide_translations_slider_slide_id_locale_unique`(`slider_slide_id`, `locale`) USING BTREE,
  CONSTRAINT `slider_slide_translations_slider_slide_id_foreign` FOREIGN KEY (`slider_slide_id`) REFERENCES `slider_slides` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slider_slide_translations
-- ----------------------------

-- ----------------------------
-- Table structure for slider_slides
-- ----------------------------
DROP TABLE IF EXISTS `slider_slides`;
CREATE TABLE `slider_slides`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slider_id` int(0) UNSIGNED NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `call_to_action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `open_in_new_window` tinyint(1) NULL DEFAULT NULL,
  `position` int(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `slider_slides_slider_id_foreign`(`slider_id`) USING BTREE,
  CONSTRAINT `slider_slides_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slider_slides
-- ----------------------------

-- ----------------------------
-- Table structure for slider_translations
-- ----------------------------
DROP TABLE IF EXISTS `slider_translations`;
CREATE TABLE `slider_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slider_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slider_translations_slider_id_locale_unique`(`slider_id`, `locale`) USING BTREE,
  CONSTRAINT `slider_translations_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slider_translations
-- ----------------------------

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `speed` int(0) NULL DEFAULT NULL,
  `autoplay` tinyint(1) NULL DEFAULT NULL,
  `autoplay_speed` int(0) NULL DEFAULT NULL,
  `fade` tinyint(1) NOT NULL DEFAULT 0,
  `dots` tinyint(1) NULL DEFAULT NULL,
  `arrows` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sliders
-- ----------------------------

-- ----------------------------
-- Table structure for tag_translations
-- ----------------------------
DROP TABLE IF EXISTS `tag_translations`;
CREATE TABLE `tag_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_translations_tag_id_locale_unique`(`tag_id`, `locale`) USING BTREE,
  CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_translations
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tags_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for tax_class_translations
-- ----------------------------
DROP TABLE IF EXISTS `tax_class_translations`;
CREATE TABLE `tax_class_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tax_class_translations_tax_class_id_locale_unique`(`tax_class_id`, `locale`) USING BTREE,
  CONSTRAINT `tax_class_translations_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tax_class_translations
-- ----------------------------

-- ----------------------------
-- Table structure for tax_classes
-- ----------------------------
DROP TABLE IF EXISTS `tax_classes`;
CREATE TABLE `tax_classes`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `based_on` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tax_classes
-- ----------------------------

-- ----------------------------
-- Table structure for tax_rate_translations
-- ----------------------------
DROP TABLE IF EXISTS `tax_rate_translations`;
CREATE TABLE `tax_rate_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_rate_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tax_rate_translations_tax_rate_id_locale_unique`(`tax_rate_id`, `locale`) USING BTREE,
  CONSTRAINT `tax_rate_translations_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tax_rate_translations
-- ----------------------------

-- ----------------------------
-- Table structure for tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE `tax_rates`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(0) UNSIGNED NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8, 4) UNSIGNED NOT NULL,
  `position` int(0) UNSIGNED NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tax_rates_tax_class_id_index`(`tax_class_id`) USING BTREE,
  CONSTRAINT `tax_rates_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tax_rates
-- ----------------------------

-- ----------------------------
-- Table structure for throttle
-- ----------------------------
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `throttle_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of throttle
-- ----------------------------
INSERT INTO `throttle` VALUES (1, NULL, 'global', NULL, '2021-02-08 12:59:37', '2021-02-08 12:59:37');
INSERT INTO `throttle` VALUES (2, NULL, 'ip', '127.0.0.1', '2021-02-08 12:59:37', '2021-02-08 12:59:37');
INSERT INTO `throttle` VALUES (3, 1, 'user', NULL, '2021-02-08 12:59:37', '2021-02-08 12:59:37');

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(0) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `transactions_order_id_unique`(`order_id`) USING BTREE,
  CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transactions
-- ----------------------------

-- ----------------------------
-- Table structure for translation_translations
-- ----------------------------
DROP TABLE IF EXISTS `translation_translations`;
CREATE TABLE `translation_translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `translation_id` int(0) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `translation_translations_translation_id_locale_unique`(`translation_id`, `locale`) USING BTREE,
  CONSTRAINT `translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of translation_translations
-- ----------------------------

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `translations_key_index`(`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of translations
-- ----------------------------

-- ----------------------------
-- Table structure for up_sell_products
-- ----------------------------
DROP TABLE IF EXISTS `up_sell_products`;
CREATE TABLE `up_sell_products`  (
  `product_id` int(0) UNSIGNED NOT NULL,
  `up_sell_product_id` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `up_sell_product_id`) USING BTREE,
  INDEX `up_sell_products_up_sell_product_id_foreign`(`up_sell_product_id`) USING BTREE,
  CONSTRAINT `up_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `up_sell_products_up_sell_product_id_foreign` FOREIGN KEY (`up_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of up_sell_products
-- ----------------------------

-- ----------------------------
-- Table structure for updater_scripts
-- ----------------------------
DROP TABLE IF EXISTS `updater_scripts`;
CREATE TABLE `updater_scripts`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `script` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of updater_scripts
-- ----------------------------
INSERT INTO `updater_scripts` VALUES (1, 'V2_0_0');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` int(0) UNSIGNED NOT NULL,
  `role_id` int(0) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_roles_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (1, 1, '2021-02-08 06:58:59', '2021-02-08 06:58:59');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Bekzod', 'Erkinov', 'erkinovbegzod.45@gmail.com', '$2y$10$7c63Rs580ba7dDEr0vpESuLxWOmESd2.PslniekHtPy6YPY1qDbqu', NULL, '2021-02-08 12:59:42', '2021-02-08 06:58:59', '2021-02-08 12:59:42');

-- ----------------------------
-- Table structure for wish_lists
-- ----------------------------
DROP TABLE IF EXISTS `wish_lists`;
CREATE TABLE `wish_lists`  (
  `user_id` int(0) UNSIGNED NOT NULL,
  `product_id` int(0) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `product_id`) USING BTREE,
  INDEX `wish_lists_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `wish_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wish_lists
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
