-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2022 at 12:43 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sheikh_mujib_50_years_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_customer_ledger`
--

CREATE TABLE `acc_customer_ledger` (
  `id` int(11) UNSIGNED NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `loan_info_id` int(11) DEFAULT NULL,
  `credit_amount` float NOT NULL DEFAULT 0,
  `debit_amount` float NOT NULL DEFAULT 0,
  `transaction_type` enum('loan_receive','loan_repayment','deposit','withdrawal') NOT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `acc_general_ledger`
--

CREATE TABLE `acc_general_ledger` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `transaction_parent_id` bigint(20) DEFAULT NULL,
  `debit_id` int(11) UNSIGNED DEFAULT NULL COMMENT 'Debit COA ID',
  `credit_id` int(11) UNSIGNED DEFAULT NULL COMMENT 'Credit COA ID',
  `amount` float UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `transaction_type` enum('customer_deposit','capital_investment','revenue','expense') DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_ip` varchar(15) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_by_ip` varchar(15) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_general_ledger`
--

INSERT INTO `acc_general_ledger` (`id`, `transaction_id`, `transaction_parent_id`, `debit_id`, `credit_id`, `amount`, `comment`, `transaction_type`, `status`, `created_at`, `created_by`, `created_by_ip`, `updated_at`, `updated_by`, `updated_by_ip`, `deleted_at`, `deleted_by`) VALUES
(1, 'TR#1220201060552', NULL, NULL, NULL, 5000, 'asdfsa', 'capital_investment', 'inactive', '2022-02-01 06:05:52', 1, '::1', '2022-02-01 14:15:24', 1, '::1', '2022-02-01 08:15:24', 1),
(2, NULL, 1, 18, NULL, 5000, NULL, 'capital_investment', 'inactive', '2022-02-01 06:05:52', 1, '::1', '2022-02-01 14:15:24', 1, '::1', '2022-02-01 08:15:24', 1),
(3, NULL, 1, NULL, 1, 5000, NULL, 'capital_investment', 'inactive', '2022-02-01 06:05:52', 1, '::1', '2022-02-01 14:15:24', 1, '::1', '2022-02-01 08:15:24', 1),
(4, 'TR#1220201060610', NULL, NULL, NULL, 6000, 'dfs', 'capital_investment', 'active', '2022-02-01 06:06:10', 1, '::1', '2022-02-01 06:06:10', 1, '::1', NULL, NULL),
(5, NULL, 4, 3, NULL, 6000, NULL, 'capital_investment', 'active', '2022-02-01 06:06:10', 1, '::1', '2022-02-01 06:06:10', 1, '::1', NULL, NULL),
(6, NULL, 4, NULL, 1, 6000, NULL, 'capital_investment', 'active', '2022-02-01 06:06:10', 1, '::1', '2022-02-01 06:06:10', 1, '::1', NULL, NULL),
(7, 'TR#1220201072043', NULL, NULL, NULL, 6000, 'sdfs', 'capital_investment', 'active', '2022-02-01 07:20:43', 1, '::1', '2022-02-01 07:20:43', 1, '::1', NULL, NULL),
(8, NULL, 7, 3, NULL, 6000, NULL, 'capital_investment', 'active', '2022-02-01 07:20:43', 1, '::1', '2022-02-01 07:20:43', 1, '::1', NULL, NULL),
(9, NULL, 7, NULL, 1, 6000, NULL, 'capital_investment', 'active', '2022-02-01 07:20:43', 1, '::1', '2022-02-01 07:20:43', 1, '::1', NULL, NULL),
(10, 'TR#1220201072103', NULL, NULL, NULL, 100, 'sdf', 'capital_investment', 'active', '2022-02-01 07:21:03', 1, '::1', '2022-02-01 07:21:03', 1, '::1', NULL, NULL),
(11, NULL, 10, 18, NULL, 100, NULL, 'capital_investment', 'active', '2022-02-01 07:21:03', 1, '::1', '2022-02-01 07:21:03', 1, '::1', NULL, NULL),
(12, NULL, 10, NULL, 1, 100, NULL, 'capital_investment', 'active', '2022-02-01 07:21:03', 1, '::1', '2022-02-01 07:21:03', 1, '::1', NULL, NULL),
(13, 'TR#1220201073811', NULL, NULL, NULL, 5000, 'asdfssa sdfasfsd sadfff', 'capital_investment', 'active', '2022-02-01 07:38:11', 1, '::1', '2022-02-01 07:38:11', 1, '::1', NULL, NULL),
(14, NULL, 13, 3, NULL, 5000, NULL, 'capital_investment', 'active', '2022-02-01 07:38:11', 1, '::1', '2022-02-01 07:38:11', 1, '::1', NULL, NULL),
(15, NULL, 13, NULL, 1, 5000, NULL, 'capital_investment', 'active', '2022-02-01 07:38:11', 1, '::1', '2022-02-01 07:38:11', 1, '::1', NULL, NULL),
(16, 'TR#1220201080221', NULL, NULL, NULL, 500, 'sdfa', 'capital_investment', 'active', '2022-02-01 08:02:21', 1, '::1', '2022-02-01 08:02:21', 1, '::1', NULL, NULL),
(17, NULL, 16, 3, NULL, 500, NULL, 'capital_investment', 'active', '2022-02-01 08:02:21', 1, '::1', '2022-02-01 08:02:21', 1, '::1', NULL, NULL),
(18, NULL, 16, NULL, 1, 500, NULL, 'capital_investment', 'active', '2022-02-01 08:02:21', 1, '::1', '2022-02-01 08:02:21', 1, '::1', NULL, NULL),
(19, 'TR#1220201080246', NULL, NULL, NULL, 6000, 'sdfsd sdfa', 'capital_investment', 'active', '2022-02-01 08:02:46', 1, '::1', '2022-02-01 08:02:46', 1, '::1', NULL, NULL),
(20, NULL, 19, 18, NULL, 6000, NULL, 'capital_investment', 'active', '2022-02-01 08:02:46', 1, '::1', '2022-02-01 08:02:46', 1, '::1', NULL, NULL),
(21, NULL, 19, NULL, 1, 6000, NULL, 'capital_investment', 'active', '2022-02-01 08:02:46', 1, '::1', '2022-02-01 08:02:46', 1, '::1', NULL, NULL),
(22, 'TR#1220201080342', NULL, NULL, NULL, 600, 'sdfa', 'capital_investment', 'active', '2022-02-01 08:03:42', 1, '::1', '2022-02-01 08:03:42', 1, '::1', NULL, NULL),
(23, NULL, 22, 3, NULL, 600, NULL, 'capital_investment', 'active', '2022-02-01 08:03:42', 1, '::1', '2022-02-01 08:03:42', 1, '::1', NULL, NULL),
(24, NULL, 22, NULL, 1, 600, NULL, 'capital_investment', 'active', '2022-02-01 08:03:42', 1, '::1', '2022-02-01 08:03:42', 1, '::1', NULL, NULL),
(25, 'TR#1220201080709', NULL, NULL, NULL, 5000, 'gf', 'capital_investment', 'active', '2022-02-01 08:07:09', 1, '::1', '2022-02-01 08:07:09', 1, '::1', NULL, NULL),
(26, NULL, 25, 3, NULL, 5000, NULL, 'capital_investment', 'active', '2022-02-01 08:07:09', 1, '::1', '2022-02-01 08:07:09', 1, '::1', NULL, NULL),
(27, NULL, 25, NULL, 1, 5000, NULL, 'capital_investment', 'active', '2022-02-01 08:07:09', 1, '::1', '2022-02-01 08:07:09', 1, '::1', NULL, NULL),
(28, 'TR#1220201082025', NULL, NULL, NULL, 90000, 'sdf sdf ds sdfsf', 'capital_investment', 'active', '2022-02-01 08:20:25', 1, '::1', '2022-02-01 08:20:25', 1, '::1', NULL, NULL),
(29, NULL, 28, 18, NULL, 90000, NULL, 'capital_investment', 'active', '2022-02-01 08:20:25', 1, '::1', '2022-02-01 08:20:25', 1, '::1', NULL, NULL),
(30, NULL, 28, NULL, 1, 90000, NULL, 'capital_investment', 'active', '2022-02-01 08:20:25', 1, '::1', '2022-02-01 08:20:25', 1, '::1', NULL, NULL),
(31, 'TR#1220201083558', NULL, NULL, NULL, 108, 'dssf sdf sd', 'capital_investment', 'active', '2022-02-01 08:35:58', 1, '::1', '2022-02-01 08:35:58', 1, '::1', NULL, NULL),
(32, NULL, 31, 3, NULL, 108, NULL, 'capital_investment', 'active', '2022-02-01 08:35:58', 1, '::1', '2022-02-01 08:35:58', 1, '::1', NULL, NULL),
(33, NULL, 31, NULL, 1, 108, NULL, 'capital_investment', 'active', '2022-02-01 08:35:58', 1, '::1', '2022-02-01 08:35:58', 1, '::1', NULL, NULL),
(34, 'TR#1220201111036', NULL, NULL, NULL, 50000, 'asdfa', 'capital_investment', 'active', '2022-02-01 11:10:36', 1, '::1', '2022-02-01 11:10:36', 1, '::1', NULL, NULL),
(35, NULL, 34, 3, NULL, 50000, NULL, 'capital_investment', 'active', '2022-02-01 11:10:36', 1, '::1', '2022-02-01 11:10:36', 1, '::1', NULL, NULL),
(36, NULL, 34, NULL, 1, 50000, NULL, 'capital_investment', 'active', '2022-02-01 11:10:36', 1, '::1', '2022-02-01 11:10:36', 1, '::1', NULL, NULL),
(37, 'TR#1220201111442', NULL, NULL, NULL, 50000, '85411', 'capital_investment', 'active', '2022-02-01 11:14:42', 1, '::1', '2022-02-01 11:14:42', 1, '::1', NULL, NULL),
(38, NULL, 37, 3, NULL, 50000, NULL, 'capital_investment', 'active', '2022-02-01 11:14:42', 1, '::1', '2022-02-01 11:14:42', 1, '::1', NULL, NULL),
(39, NULL, 37, NULL, 1, 50000, NULL, 'capital_investment', 'active', '2022-02-01 11:14:42', 1, '::1', '2022-02-01 11:14:42', 1, '::1', NULL, NULL),
(40, 'TR#1220201112944', NULL, NULL, NULL, 9000, 'asdf', 'capital_investment', 'inactive', '2022-02-01 11:29:44', 1, '::1', '2022-02-01 14:49:19', 1, '::1', '2022-02-01 08:49:19', 1),
(41, NULL, 40, 3, NULL, 9000, NULL, 'capital_investment', 'inactive', '2022-02-01 11:29:44', 1, '::1', '2022-02-01 14:49:19', 1, '::1', '2022-02-01 08:49:19', 1),
(42, NULL, 40, NULL, 1, 9000, NULL, 'capital_investment', 'inactive', '2022-02-01 11:29:44', 1, '::1', '2022-02-01 14:49:19', 1, '::1', '2022-02-01 08:49:19', 1),
(43, 'TR#1220201121629', NULL, NULL, NULL, 300, 'sdfgs', 'capital_investment', 'inactive', '2022-02-01 12:16:29', 1, '::1', '2022-02-01 14:48:30', 1, '::1', '2022-02-01 08:48:30', 1),
(44, NULL, 43, 3, NULL, 300, NULL, 'capital_investment', 'inactive', '2022-02-01 12:16:29', 1, '::1', '2022-02-01 14:48:30', 1, '::1', '2022-02-01 08:48:30', 1),
(45, NULL, 43, NULL, 1, 300, NULL, 'capital_investment', 'inactive', '2022-02-01 12:16:29', 1, '::1', '2022-02-01 14:48:30', 1, '::1', '2022-02-01 08:48:30', 1),
(46, 'TR#1220201121716', NULL, NULL, NULL, 4000, 'sdfs', 'capital_investment', 'inactive', '2022-02-01 12:17:16', 1, '::1', '2022-02-01 14:48:51', 1, '::1', '2022-02-01 08:48:51', 1),
(47, NULL, 46, 18, NULL, 4000, NULL, 'capital_investment', 'inactive', '2022-02-01 12:17:16', 1, '::1', '2022-02-01 14:48:51', 1, '::1', '2022-02-01 08:48:51', 1),
(48, NULL, 46, NULL, 1, 4000, NULL, 'capital_investment', 'inactive', '2022-02-01 12:17:16', 1, '::1', '2022-02-01 14:48:51', 1, '::1', '2022-02-01 08:48:51', 1),
(49, 'TR#1220201141524', NULL, NULL, NULL, 5000, 'asdfsa', 'capital_investment', 'inactive', '2022-02-01 14:15:24', 1, '::1', '2022-02-01 14:16:01', 1, '::1', '2022-02-01 08:16:01', 1),
(50, NULL, 49, 18, NULL, 5000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:15:24', 1, '::1', '2022-02-01 14:16:01', 1, '::1', '2022-02-01 08:16:01', 1),
(51, NULL, 49, NULL, 1, 5000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:15:24', 1, '::1', '2022-02-01 14:16:01', 1, '::1', '2022-02-01 08:16:01', 1),
(52, 'TR#1220201141601', NULL, NULL, NULL, 10, 'asdfsa', 'capital_investment', 'inactive', '2022-02-01 14:16:01', 1, '::1', '2022-02-01 14:23:31', 1, '::1', '2022-02-01 08:23:31', 1),
(53, NULL, 52, 18, NULL, 10, NULL, 'capital_investment', 'inactive', '2022-02-01 14:16:01', 1, '::1', '2022-02-01 14:23:31', 1, '::1', '2022-02-01 08:23:31', 1),
(54, NULL, 52, NULL, 1, 10, NULL, 'capital_investment', 'inactive', '2022-02-01 14:16:01', 1, '::1', '2022-02-01 14:23:31', 1, '::1', '2022-02-01 08:23:31', 1),
(55, 'TR#1220201142331', NULL, NULL, NULL, 20, 'asdfsa dsaf adsfa dfadf', 'capital_investment', 'inactive', '2022-02-01 14:16:01', 1, '::1', '2022-02-01 14:48:26', 1, '::1', '2022-02-01 08:48:26', 1),
(56, NULL, 55, 18, NULL, 20, NULL, 'capital_investment', 'inactive', '2022-02-01 14:16:01', 1, '::1', '2022-02-01 14:48:26', 1, '::1', '2022-02-01 08:48:26', 1),
(57, NULL, 55, NULL, 1, 20, NULL, 'capital_investment', 'inactive', '2022-02-01 14:16:01', 1, '::1', '2022-02-01 14:48:26', 1, '::1', '2022-02-01 08:48:26', 1),
(58, 'TR#1220201142450', NULL, NULL, NULL, 8000, 'sdfas', 'capital_investment', 'inactive', '2022-02-01 14:24:50', 1, '::1', '2022-02-01 14:24:58', 1, '::1', '2022-02-01 08:24:58', 1),
(59, NULL, 58, 18, NULL, 8000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:24:50', 1, '::1', '2022-02-01 14:24:58', 1, '::1', '2022-02-01 08:24:58', 1),
(60, NULL, 58, NULL, 1, 8000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:24:50', 1, '::1', '2022-02-01 14:24:58', 1, '::1', '2022-02-01 08:24:58', 1),
(61, 'TR#1220201142458', NULL, NULL, NULL, 8000, 'sdfas asdfasd', 'capital_investment', 'inactive', '2022-02-01 14:24:50', 1, '::1', '2022-02-01 14:49:49', 1, '::1', '2022-02-01 08:49:49', 1),
(62, NULL, 61, 18, NULL, 8000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:24:50', 1, '::1', '2022-02-01 14:49:49', 1, '::1', '2022-02-01 08:49:49', 1),
(63, NULL, 61, NULL, 1, 8000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:24:50', 1, '::1', '2022-02-01 14:49:49', 1, '::1', '2022-02-01 08:49:49', 1),
(64, 'TR#1220201144843', NULL, NULL, NULL, 500000, 'asdfasf', 'capital_investment', 'inactive', '2022-02-01 14:48:43', 1, '::1', '2022-02-01 14:48:47', 1, '::1', '2022-02-01 08:48:47', 1),
(65, NULL, 64, 3, NULL, 500000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:48:43', 1, '::1', '2022-02-01 14:48:47', 1, '::1', '2022-02-01 08:48:47', 1),
(66, NULL, 64, NULL, 1, 500000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:48:43', 1, '::1', '2022-02-01 14:48:47', 1, '::1', '2022-02-01 08:48:47', 1),
(67, 'TR#1220201144847', NULL, NULL, NULL, 500000, 'asdfasf', 'capital_investment', 'inactive', '2022-02-01 14:48:43', 1, '::1', '2022-02-01 14:49:47', 1, '::1', '2022-02-01 08:49:47', 1),
(68, NULL, 67, 3, NULL, 500000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:48:43', 1, '::1', '2022-02-01 14:49:47', 1, '::1', '2022-02-01 08:49:47', 1),
(69, NULL, 67, NULL, 1, 500000, NULL, 'capital_investment', 'inactive', '2022-02-01 14:48:43', 1, '::1', '2022-02-01 14:49:47', 1, '::1', '2022-02-01 08:49:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `acc_transactional_coa`
--

CREATE TABLE `acc_transactional_coa` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `economic_code` int(7) UNSIGNED NOT NULL,
  `group_name` enum('asset','revenue','expense','liability','capital','drawing') NOT NULL,
  `sub_group_name` enum('fixed_asset','current_asset','direct_income','indirect_income','operating_expense','capital_expense','loan_payable','tax_payable','owner_drawing','owner_invest','donation','customer_deposit_payable','unexcepted_expense','asset_depreciation') DEFAULT NULL,
  `is_default` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED NOT NULL,
  `created_by_ip` varchar(15) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_by_ip` varchar(15) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_transactional_coa`
--

INSERT INTO `acc_transactional_coa` (`id`, `name`, `economic_code`, `group_name`, `sub_group_name`, `is_default`, `created_at`, `created_by`, `created_by_ip`, `updated_at`, `updated_by`, `updated_by_ip`, `deleted_at`, `deleted_by`) VALUES
(1, 'Investment', 6100001, 'capital', 'owner_invest', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(2, 'Donation', 6200001, 'capital', 'donation', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(3, 'Cash Account', 1210001, 'asset', 'current_asset', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(4, 'Customer Loan Principal Receivable', 1230001, 'asset', 'current_asset', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(5, 'Customer Loan Interest Receivable', 1230002, 'asset', 'current_asset', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(6, 'Computer Laptop', 1100001, 'asset', 'fixed_asset', 'no', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(7, 'Interest on customer loan', 2200001, 'revenue', 'indirect_income', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(8, 'Customer Form Fee', 2100001, 'revenue', 'direct_income', 'no', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(9, 'Utility Bill', 3100001, 'expense', 'operating_expense', 'no', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(11, 'Computer Purchase', 3200001, 'expense', 'capital_expense', 'no', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(12, 'Customer Deposit Payable', 4100001, 'liability', 'customer_deposit_payable', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(13, 'Loan Payable', 4200001, 'liability', 'loan_payable', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(14, 'Tax Payable', 4300001, 'liability', 'tax_payable', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(15, 'Owner Drawing', 5000001, 'drawing', 'owner_drawing', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(16, 'Unexcepted Expense', 3300001, 'expense', 'unexcepted_expense', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(17, 'Asset Depreciation', 3400001, 'expense', 'asset_depreciation', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(18, 'Islami Bank Bangladesh LTD', 1220001, 'asset', 'current_asset', 'no', NULL, 0, '', NULL, NULL, '', NULL, NULL),
(19, 'Customer Due Receivable', 1230004, 'asset', 'current_asset', 'yes', NULL, 0, '', NULL, NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `all_settings`
--

CREATE TABLE `all_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `view_order` int(11) UNSIGNED DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_ip` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_ip` varchar(15) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `all_settings`
--

INSERT INTO `all_settings` (`id`, `title`, `type`, `view_order`, `is_active`, `created_by`, `created_at`, `created_ip`, `updated_by`, `updated_at`, `updated_ip`) VALUES
(1, 'Stage', 1, 2, 1, 1, '2022-03-22 22:30:05', '::1', 1, '2022-03-22 22:30:05', '::1'),
(2, 'Entertrainment', 1, 5, 1, 1, '2022-03-22 22:30:22', '::1', 1, '2022-03-22 22:30:22', '::1'),
(3, 'Decoration', 1, 3, 1, 1, '2022-03-22 22:30:10', '::1', 1, '2022-03-22 22:30:10', '::1'),
(4, 'Sound System', 1, 4, 1, 1, '2022-03-22 22:30:15', '::1', 1, '2022-03-22 22:30:15', '::1'),
(5, 'Student', 2, NULL, 1, NULL, '2022-03-12 11:01:16', NULL, NULL, '2022-03-12 11:01:16', NULL),
(6, 'Businessman', 2, NULL, 1, NULL, '2022-03-12 11:10:41', NULL, NULL, '2022-03-12 11:10:41', NULL),
(7, 'test', 1, 1, 1, 1, '2022-03-22 22:32:58', '::1', 1, '2022-03-22 22:32:58', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

CREATE TABLE `customer_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `account_no` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `present_address` varchar(255) NOT NULL,
  `permanent_address` varchar(255) NOT NULL,
  `national_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_info`
--

INSERT INTO `customer_info` (`id`, `account_no`, `name`, `mobile`, `email`, `present_address`, `permanent_address`, `national_id`) VALUES
(1, 1000001, 'Md Omar Faruk', '01840239203', 'omarlemua@gmail.com', '109/6,east rayer bazar,dhaka-1209', '109/6,east rayer bazar,dhaka-1209', '19943011495000254');

-- --------------------------------------------------------

--
-- Table structure for table `customer_loan_info`
--

CREATE TABLE `customer_loan_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `sanction_number` varchar(255) NOT NULL,
  `principal_amount` int(11) NOT NULL,
  `interest_amount` int(11) NOT NULL,
  `interest_percentage` int(11) NOT NULL,
  `loan_type` enum('product','money') NOT NULL DEFAULT 'money',
  `installment` int(11) NOT NULL,
  `installment_type` enum('monthly','weekly') NOT NULL DEFAULT 'monthly',
  `total_receivable` float NOT NULL DEFAULT 0,
  `paid_installment` int(11) NOT NULL DEFAULT 0,
  `paid_amount` float NOT NULL DEFAULT 0,
  `loan_sanction_date` date DEFAULT NULL,
  `installment_start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donarinfos`
--

CREATE TABLE `donarinfos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobileNumber` varchar(30) NOT NULL,
  `sscBatch` mediumint(6) UNSIGNED DEFAULT NULL,
  `sendNumber` int(11) UNSIGNED DEFAULT NULL,
  `donationBy` tinyint(3) UNSIGNED DEFAULT 2 COMMENT '1=Manual, 2=bKash',
  `TransactionID` varchar(30) DEFAULT NULL,
  `TransactionMobileNumber` varchar(15) DEFAULT NULL,
  `donationAmount` decimal(10,2) DEFAULT NULL,
  `approvedStatus` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Pending, 2=Approved,3=Decline',
  `processInfo` text DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_ip` varchar(15) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `donarinfos`
--

INSERT INTO `donarinfos` (`id`, `user_id`, `name`, `mobileNumber`, `sscBatch`, `sendNumber`, `donationBy`, `TransactionID`, `TransactionMobileNumber`, `donationAmount`, `approvedStatus`, `processInfo`, `isActive`, `created_at`, `created_by`, `created_ip`, `updated_at`, `updated_by`, `updated_ip`) VALUES
(4, 120, 'Nilufa Hoque', '+8801824120761', 1998, 109, NULL, '9B44J6B1C8', '+8801824120761', '10000.00', 3, NULL, 1, '2022-02-07 04:02:21', NULL, '27.147.206.116', '2022-02-06 22:02:21', NULL, NULL),
(5, 121, 'Nilufa Yesmin', '01824120761', 1998, 109, NULL, '9B52JXPTT2', '01824120761', '10200.00', 2, '{\"updated_at\":\"2022-02-08 23:14:20\",\"updated_by\":109,\"updated_ip\":\"58.145.189.236\"}', 1, '2022-02-07 05:11:24', NULL, '58.145.184.245', '2022-02-08 17:14:20', 109, '58.145.189.236'),
(6, 122, 'Belal', '+966553931608', 1993, 110, NULL, '4161174030', '04161174030', '1000.00', 2, '{\"updated_at\":\"2022-02-08 23:21:25\",\"updated_by\":110,\"updated_ip\":\"58.145.188.231\"}', 1, '2022-02-07 18:39:23', NULL, '95.187.39.73', '2022-02-08 17:21:25', 110, '58.145.188.231'),
(7, 123, 'Md Omar Faruk (Test for SMS Sending)', '01839707645', 2010, 108, NULL, 'ABSSSSEE', '01839707645', '5.00', 3, '{\"updated_at\":\"2022-02-08 02:30:32\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-08 02:20:21', NULL, '103.205.71.20', '2022-02-07 20:30:32', 1, '103.205.71.20'),
(8, 124, 'Palash Chandra Nath', '01824995355', 2000, 111, NULL, 'Web Transfer ( From  Bank Acco', '1291340016842', '1000.00', 2, '{\"updated_at\":\"2022-02-09 10:18:48\",\"updated_by\":111,\"updated_ip\":\"37.111.197.103\"}', 1, '2022-02-08 11:44:09', NULL, '103.30.191.50', '2022-02-09 04:18:48', 111, '37.111.197.103'),
(9, 125, 'Robiul Hoque Shobuj', '+6584386550', 1998, 109, NULL, '9B84MGBHEO', '01306743919', '5100.00', 2, '{\"updated_at\":\"2022-02-09 00:57:50\",\"updated_by\":109,\"updated_ip\":\"58.145.189.236\"}', 1, '2022-02-09 00:56:42', NULL, '58.145.189.236', '2022-02-08 18:57:50', 109, '58.145.189.236'),
(10, 126, 'নাম প্রকাশে অনিচ্ছুক (২০০৩)', '01819841209', 2003, 108, NULL, '9B91MP80J7', '01819841209', '2020.00', 2, '{\"updated_at\":\"2022-02-09 11:57:08\",\"updated_by\":108,\"updated_ip\":\"58.145.188.225\"}', 1, '2022-02-09 10:02:06', NULL, '103.155.184.156', '2022-02-09 05:57:08', 108, '58.145.188.225'),
(11, 127, 'আসাদুজ্জামান (আসাদ)', '+8801814376537', 2004, 108, NULL, '9B94N3V6P6', '+8801814376537', '2040.00', 2, '{\"updated_at\":\"2022-02-09 17:59:13\",\"updated_by\":108,\"updated_ip\":\"103.220.206.28\"}', 1, '2022-02-09 17:57:53', NULL, '103.220.206.28', '2022-02-09 11:59:13', 108, '103.220.206.28'),
(12, 128, 'Md. Myeen Uddin', '01819003611', 2003, 108, NULL, '9B96N5MKRE', '01819003611', '2500.00', 2, '{\"updated_at\":\"2022-02-09 18:51:25\",\"updated_by\":108,\"updated_ip\":\"103.220.206.28\"}', 1, '2022-02-09 18:30:43', NULL, '116.204.253.242', '2022-02-09 12:51:25', 108, '103.220.206.28'),
(13, 129, 'Nirmal Das', '01925177380', 1999, 109, NULL, '9B93MQIGO7', '01925177380', '1000.00', 2, '{\"updated_at\":\"2022-02-09 22:18:41\",\"updated_by\":109,\"updated_ip\":\"58.145.189.226\"}', 1, '2022-02-09 22:14:20', NULL, '58.145.189.226', '2022-02-09 16:18:41', 109, '58.145.189.226'),
(14, 130, 'Azad', '01869017735', 2004, 109, NULL, '9B90NDXTWO', '01869017735', '2000.00', 2, '{\"updated_at\":\"2022-02-09 22:18:32\",\"updated_by\":109,\"updated_ip\":\"58.145.189.226\"}', 1, '2022-02-09 22:17:09', NULL, '58.145.189.226', '2022-02-09 16:18:32', 109, '58.145.189.226'),
(15, 131, 'test', '01839707645', 2010, 108, NULL, NULL, '01839707645', '5.00', 3, NULL, 1, '2022-02-09 22:54:26', NULL, '103.205.71.20', '2022-02-09 16:54:26', NULL, NULL),
(16, 132, 'শরিফুল ইসলাম মুন্না', '+8801824549498', 2011, 108, NULL, '9BA0NPMIPW', '+8801824549498', '1020.00', 2, '{\"updated_at\":\"2022-02-10 12:47:12\",\"updated_by\":108,\"updated_ip\":\"58.145.188.238\"}', 1, '2022-02-10 12:41:05', NULL, '58.145.188.238', '2022-02-10 06:47:12', 108, '58.145.188.238'),
(17, 133, 'Debashish Bhowmick', '01619887867', 2000, 111, NULL, '9BA305S0SX', '01829345088', '1020.00', 3, '{\"updated_at\":\"2022-02-11 11:00:53\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-10 19:53:10', NULL, '119.30.35.15', '2022-02-11 05:00:53', 1, '103.205.71.20'),
(18, 134, 'Noman Pintu', '00601169327724', 2002, 109, NULL, '9BA5NSMHMKX', '01867438904', '2000.00', 2, '{\"updated_at\":\"2022-02-10 19:58:56\",\"updated_by\":109,\"updated_ip\":\"202.181.18.248\"}', 1, '2022-02-10 19:54:37', NULL, '202.181.18.248', '2022-02-10 13:58:56', 109, '202.181.18.248'),
(19, 135, 'Debashish Bhowmick', '01619887867', 2000, 111, NULL, NULL, '01829345088', '1020.00', 3, '{\"updated_at\":\"2022-02-11 11:00:50\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-10 19:57:18', NULL, '119.30.35.15', '2022-02-11 05:00:50', 1, '103.205.71.20'),
(20, 136, 'Debashish Bhowmick', '01619887867', 2000, 111, NULL, '9BA3O5S0SX', '01829345088', '1020.00', 2, '{\"updated_at\":\"2022-02-11 09:02:18\",\"updated_by\":111,\"updated_ip\":\"103.113.192.31\"}', 1, '2022-02-10 19:58:44', NULL, '119.30.35.15', '2022-02-11 03:02:18', 111, '103.113.192.31'),
(21, 137, 'Pipul Bhowmik', '00968785750', 2006, 109, NULL, '9BA6NLKO2', '01716283974', '2000.00', 2, '{\"updated_at\":\"2022-02-10 20:08:58\",\"updated_by\":109,\"updated_ip\":\"202.181.18.248\"}', 1, '2022-02-10 20:04:38', NULL, '202.181.18.248', '2022-02-10 14:08:58', 109, '202.181.18.248'),
(22, 138, 'MIR REZAUL KARIM LELIN', '01815426040', 1998, 109, NULL, '713J9XAP', '01815426040', '2000.00', 2, '{\"updated_at\":\"2022-02-10 20:08:47\",\"updated_by\":109,\"updated_ip\":\"202.181.18.248\"}', 1, '2022-02-10 20:07:36', NULL, '202.181.18.248', '2022-02-10 14:08:47', 109, '202.181.18.248'),
(23, 139, 'Saiful Islam', '01819086730', 2000, 111, NULL, '1111', '01791434947', '2000.00', 2, '{\"updated_at\":\"2022-02-11 14:13:06\",\"updated_by\":111,\"updated_ip\":\"103.113.192.31\"}', 1, '2022-02-11 14:11:41', NULL, '103.113.192.31', '2022-02-11 08:13:06', 111, '103.113.192.31'),
(24, 140, 'আলাউদ্দিন মুন্না', '009660583862048', 2012, 108, NULL, '9BB6OXN0RO', '01768512448', '2040.00', 2, '{\"updated_at\":\"2022-02-11 22:48:21\",\"updated_by\":108,\"updated_ip\":\"58.145.190.250\"}', 1, '2022-02-11 22:45:56', NULL, '58.145.190.250', '2022-02-11 16:48:21', 108, '58.145.190.250'),
(25, 141, 'শেখ ইমাম শরিফ', '01782563144', 2005, 111, NULL, '9BC7PB6TUB', '01782563144', '1000.00', 2, '{\"updated_at\":\"2022-02-12 15:20:37\",\"updated_by\":111,\"updated_ip\":\"119.30.38.223\"}', 1, '2022-02-12 11:24:17', NULL, '37.111.215.216', '2022-02-12 09:20:37', 111, '119.30.38.223'),
(26, 142, 'ডঃ শামছুদ্দিন ফরহাদ', '01919386831', 2000, 111, NULL, '111', '01919386831', '500.00', 3, '{\"updated_at\":\"2022-02-12 15:34:23\",\"updated_by\":1,\"updated_ip\":\"202.134.9.129\"}', 1, '2022-02-12 15:25:56', NULL, '119.30.38.223', '2022-02-12 09:34:23', 1, '202.134.9.129'),
(27, 143, 'ডঃ শামছুদ্দিন ফরহাদ', '01919386831', 2000, 111, NULL, '111', '01919386831', '500.00', 3, '{\"updated_at\":\"2022-02-12 15:34:28\",\"updated_by\":1,\"updated_ip\":\"202.134.9.129\"}', 1, '2022-02-12 15:25:59', NULL, '119.30.38.223', '2022-02-12 09:34:28', 1, '202.134.9.129'),
(28, 144, 'ডঃ শামছুদ্দিন ফরহাদ', '01919386831', 2000, 111, NULL, '111', '01919386831', '500.00', 3, '{\"updated_at\":\"2022-02-12 15:35:49\",\"updated_by\":1,\"updated_ip\":\"202.134.9.129\"}', 1, '2022-02-12 15:26:13', NULL, '119.30.38.223', '2022-02-12 09:35:49', 1, '202.134.9.129'),
(29, 145, 'ডঃ শামছুদ্দিন ফরহাদ', '01919386831', 2000, 111, NULL, '111', '01919386831', '500.00', 2, '{\"updated_at\":\"2022-02-12 15:27:31\",\"updated_by\":111,\"updated_ip\":\"119.30.38.223\"}', 1, '2022-02-12 15:26:13', NULL, '119.30.38.223', '2022-02-12 09:27:31', 111, '119.30.38.223'),
(30, 146, 'রায়হান উদ্দিন আহমেদ (রুবেল)', '00393284541573', 1994, 110, NULL, '00393284541573', '00393284541573', '5000.00', 2, '{\"updated_at\":\"2022-02-12 19:34:03\",\"updated_by\":110,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-02-12 17:32:04', NULL, '5.169.223.131', '2022-02-12 13:34:03', 110, '58.145.189.243'),
(31, 147, 'Emran Patwary', '01819610804', 1999, 109, NULL, '9BB3P53FPF', '01819610804', '1000.00', 2, '{\"updated_at\":\"2022-02-12 20:11:43\",\"updated_by\":109,\"updated_ip\":\"58.145.189.236\"}', 1, '2022-02-12 19:48:51', NULL, '58.145.189.236', '2022-02-12 14:11:43', 109, '58.145.189.236'),
(32, 148, 'Belal Hossain', '01617745194', 2001, 110, NULL, '9B90MYIPCE', '01617745194', '1000.00', 2, '{\"updated_at\":\"2022-02-12 20:13:30\",\"updated_by\":110,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-02-12 19:51:33', NULL, '58.145.189.236', '2022-02-12 14:13:30', 110, '58.145.189.243'),
(33, 149, 'Shahadat Hossain Bablu', '01819647394', 1997, 110, NULL, '9BA1NW2HCP', '01739553399', '1000.00', 2, '{\"updated_at\":\"2022-02-12 20:13:19\",\"updated_by\":110,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-02-12 19:54:38', NULL, '58.145.189.236', '2022-02-12 14:13:19', 110, '58.145.189.243'),
(34, 150, 'Nur Alam', '01815129512', 1997, 110, NULL, '9B90MYIPCE', '01813167424', '1000.00', 2, '{\"updated_at\":\"2022-02-12 20:12:57\",\"updated_by\":110,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-02-12 19:57:41', NULL, '58.145.189.236', '2022-02-12 14:12:57', 110, '58.145.189.243'),
(35, 151, 'Ashish kumar paul', '01854975329', 1998, 109, NULL, '9B60HSQI', '01854975329', '2000.00', 2, '{\"updated_at\":\"2022-02-12 20:31:08\",\"updated_by\":109,\"updated_ip\":\"58.145.189.236\"}', 1, '2022-02-12 20:30:35', NULL, '58.145.189.236', '2022-02-12 14:31:08', 109, '58.145.189.236'),
(36, 152, 'Anamul hoque', '01628942109', 1997, 110, NULL, '12345678911', '01628942109', '1000.00', 2, '{\"updated_at\":\"2022-02-12 20:42:14\",\"updated_by\":110,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-02-12 20:32:09', NULL, '58.145.189.243', '2022-02-12 14:42:14', 110, '58.145.189.243'),
(37, 153, 'erfanul hoque nayon', '01727555800', 1997, 110, NULL, '12345678123', '01727555800', '1000.00', 2, '{\"updated_at\":\"2022-02-12 20:41:42\",\"updated_by\":110,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-02-12 20:35:36', NULL, '58.145.189.243', '2022-02-12 14:41:42', 110, '58.145.189.243'),
(38, 154, 'Nur karim mitu', '01815129512', 1997, 110, NULL, '12951200000', '01711100000', '1000.00', 2, '{\"updated_at\":\"2022-02-12 20:41:18\",\"updated_by\":110,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-02-12 20:37:25', NULL, '58.145.189.243', '2022-02-12 14:41:18', 110, '58.145.189.243'),
(39, 155, 'ডাঃ বিশ্বজিৎ সুমন', '01911511883', 1997, 110, NULL, '01987654322', '01911511883', '5000.00', 2, '{\"updated_at\":\"2022-02-12 20:41:02\",\"updated_by\":110,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-02-12 20:39:48', NULL, '58.145.189.243', '2022-02-12 14:41:02', 110, '58.145.189.243'),
(40, 156, 'আলী হায়দার শিপন', '01815692330', 1994, 110, NULL, '1234556666', '01815692330', '5000.00', 2, '{\"updated_at\":\"2022-02-13 12:07:24\",\"updated_by\":110,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-02-13 12:05:28', NULL, '58.145.189.243', '2022-02-13 06:07:24', 110, '58.145.189.243'),
(41, 157, 'Apu Chandra Bhowmick', '+8801832057893', 2009, 108, NULL, '9BD2QN1NUO', '01305559017', '1020.00', 2, '{\"updated_at\":\"2022-02-13 22:53:03\",\"updated_by\":108,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-02-13 22:51:29', NULL, '202.181.18.250', '2022-02-13 16:53:03', 108, '202.181.18.250'),
(42, 158, 'Nikhil Chandra Das', '01824408767', 2005, 108, NULL, '9BD8QTR33U', '01819841209', '2045.00', 2, '{\"updated_at\":\"2022-02-13 23:56:32\",\"updated_by\":108,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-02-13 23:52:40', NULL, '202.134.14.157', '2022-02-13 17:56:32', 108, '202.181.18.250'),
(43, 159, 'সাইদুর রহমান জিবু', '01816363464', 2003, 110, NULL, '+880 1816-363464', '01816363464', '1000.00', 2, '{\"updated_at\":\"2022-02-15 09:02:16\",\"updated_by\":110,\"updated_ip\":\"58.145.189.237\"}', 1, '2022-02-15 09:00:56', NULL, '58.145.189.237', '2022-02-15 03:02:16', 110, '58.145.189.237'),
(44, 160, 'Abdullah Al Noman', '01628398800', 2009, 109, NULL, '9BH49VLKI', '01628398800', '5000.00', 2, '{\"updated_at\":\"2022-02-15 12:26:56\",\"updated_by\":109,\"updated_ip\":\"202.181.18.238\"}', 1, '2022-02-15 12:26:12', NULL, '202.181.18.238', '2022-02-15 06:26:56', 109, '202.181.18.238'),
(45, 161, 'জিয়া উদ্দিন বাবলু', '01815129512', 2011, 110, NULL, '12121222333', '01815129512', '1000.00', 2, '{\"updated_at\":\"2022-02-15 21:33:40\",\"updated_by\":110,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-02-15 21:25:17', NULL, '58.145.189.242', '2022-02-15 15:33:40', 110, '58.145.189.242'),
(46, 162, 'গিয়াস উদ্দিন', '01815129512', 1997, 110, NULL, '87544885555', '01888888844', '2000.00', 2, '{\"updated_at\":\"2022-02-15 21:33:25\",\"updated_by\":110,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-02-15 21:27:08', NULL, '58.145.189.242', '2022-02-15 15:33:25', 110, '58.145.189.242'),
(47, 163, 'জাহাঙ্গীর আলম', '01815129512', 1997, 110, NULL, '12223344567', '12121222233', '2000.00', 2, '{\"updated_at\":\"2022-02-15 21:32:15\",\"updated_by\":110,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-02-15 21:28:26', NULL, '58.145.189.242', '2022-02-15 15:32:15', 110, '58.145.189.242'),
(48, 164, 'মৃণাল কান্তি নাথ', '01718403285', 1992, 108, NULL, NULL, '01718403285', '2000.00', 3, '{\"updated_at\":\"2022-02-17 21:34:49\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-15 21:30:44', NULL, '202.181.18.248', '2022-02-17 15:34:49', 1, '103.205.71.20'),
(49, 165, 'মৃণাল কান্তি নাথ', '01718403285', 1991, 108, NULL, NULL, '01718403285', '2000.00', 2, '{\"updated_at\":\"2022-02-15 21:41:56\",\"updated_by\":108,\"updated_ip\":\"202.181.18.248\"}', 1, '2022-02-15 21:33:07', NULL, '202.181.18.248', '2022-02-15 15:41:56', 108, '202.181.18.248'),
(50, 166, 'রাজিব চন্দ্র নাথ', '01718403285', 2004, 108, NULL, 'বিপুল কাকার মাধ্যমে', '01718403285', '2000.00', 2, '{\"updated_at\":\"2022-02-15 21:41:04\",\"updated_by\":108,\"updated_ip\":\"202.181.18.248\"}', 1, '2022-02-15 21:34:18', NULL, '202.181.18.248', '2022-02-15 15:41:04', 108, '202.181.18.248'),
(51, 167, 'প্রদীপ দেব নাথ', '01718403285', 1988, 108, NULL, 'বিপুল কাকার মাধ্যমে', '01718403285', '2000.00', 2, '{\"updated_at\":\"2022-02-15 21:40:50\",\"updated_by\":108,\"updated_ip\":\"202.181.18.248\"}', 1, '2022-02-15 21:35:49', NULL, '202.181.18.248', '2022-02-15 15:40:50', 108, '202.181.18.248'),
(52, 168, 'আবুল কাশেম', '01762628915', 1964, 108, NULL, 'বিপুল কাকার মাধ্যমে', '01762628915', '5000.00', 2, '{\"updated_at\":\"2022-02-15 21:40:27\",\"updated_by\":108,\"updated_ip\":\"202.181.18.248\"}', 1, '2022-02-15 21:37:57', NULL, '202.181.18.248', '2022-02-15 15:40:27', 108, '202.181.18.248'),
(53, 169, 'Mitun Chandra Nath', '01718421747', 2000, 111, NULL, '111', '01718421747', '2000.00', 2, '{\"updated_at\":\"2022-02-17 17:54:30\",\"updated_by\":111,\"updated_ip\":\"119.30.32.135\"}', 1, '2022-02-17 17:51:44', NULL, '119.30.32.135', '2022-02-17 11:54:30', 111, '119.30.32.135'),
(54, 170, 'Rokshana pervin Mukta', '01811244656', 1998, 109, NULL, '9BG9RTS3TO', '01811244656', '2000.00', 2, '{\"updated_at\":\"2022-02-17 18:32:03\",\"updated_by\":109,\"updated_ip\":\"58.145.189.235\"}', 1, '2022-02-17 18:20:49', NULL, '58.145.189.235', '2022-02-17 12:32:03', 109, '58.145.189.235'),
(55, 171, 'MD SARWAR JAHAN RUBEL', '01741661066', 2006, 109, NULL, '9BG4SQR4PE', '01741661066', '1000.00', 2, '{\"updated_at\":\"2022-02-17 18:31:53\",\"updated_by\":109,\"updated_ip\":\"58.145.189.235\"}', 1, '2022-02-17 18:23:25', NULL, '58.145.189.235', '2022-02-17 12:31:53', 109, '58.145.189.235'),
(56, 172, 'MD HELAL UDDIN BADRI', '01741661066', 2004, 109, NULL, '9BG5SQR6PE', '01741661066', '1000.00', 2, '{\"updated_at\":\"2022-02-17 18:31:44\",\"updated_by\":109,\"updated_ip\":\"58.145.189.235\"}', 1, '2022-02-17 18:26:48', NULL, '58.145.189.235', '2022-02-17 12:31:44', 109, '58.145.189.235'),
(57, 173, 'REETA GOWSHMI', '01875243626', 2003, 109, NULL, '9BG2SNHRHA', '01811242547', '1000.00', 2, '{\"updated_at\":\"2022-02-17 18:31:36\",\"updated_by\":109,\"updated_ip\":\"58.145.189.235\"}', 1, '2022-02-17 18:29:32', NULL, '58.145.189.235', '2022-02-17 12:31:36', 109, '58.145.189.235'),
(58, 174, 'নাম প্রকাশে অনিচ্ছুক', '01978157850', 2004, 110, NULL, '09876543212', '01234445550', '2000.00', 2, '{\"updated_at\":\"2022-02-17 22:11:06\",\"updated_by\":110,\"updated_ip\":\"58.145.189.252\"}', 1, '2022-02-17 22:08:34', NULL, '58.145.189.252', '2022-02-17 16:11:06', 110, '58.145.189.252'),
(59, 175, 'আলী কাউছার', '01787673430', 1997, 110, NULL, '01787673430', '01787673430', '2000.00', 2, '{\"updated_at\":\"2022-02-17 23:23:31\",\"updated_by\":110,\"updated_ip\":\"58.145.189.252\"}', 1, '2022-02-17 23:22:45', NULL, '58.145.189.252', '2022-02-17 17:23:31', 110, '58.145.189.252'),
(60, 176, 'সালাউদ্দিন মানিক', '01324348648', 1993, 110, NULL, '12345678765', '01222223377', '2000.00', 2, '{\"updated_at\":\"2022-02-18 18:42:25\",\"updated_by\":110,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-02-18 18:41:28', NULL, '58.145.189.231', '2022-02-18 12:42:25', 110, '58.145.189.231'),
(61, 177, 'সিন্টু', '+8801824522157', 2006, 108, NULL, '9BI8UNUQJK', '+8801824522157', '1020.00', 2, '{\"updated_at\":\"2022-02-18 20:06:14\",\"updated_by\":108,\"updated_ip\":\"58.145.189.228\"}', 1, '2022-02-18 20:05:35', NULL, '58.145.189.228', '2022-02-18 14:06:14', 108, '58.145.189.228'),
(62, 178, 'Ehsan polash', '01741661066', 1995, 109, NULL, '9BIOUPWBLQ', '01871595666', '10000.00', 2, '{\"updated_at\":\"2022-02-19 00:07:36\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-02-19 00:03:40', NULL, '58.145.188.240', '2022-02-18 18:07:36', 109, '58.145.188.240'),
(63, 179, 'সাদ্দাম হোসেন', '01845120130', 2006, 110, NULL, '01845120130', '01845120130', '1000.00', 2, '{\"updated_at\":\"2022-02-19 12:36:08\",\"updated_by\":110,\"updated_ip\":\"58.145.189.246\"}', 1, '2022-02-19 12:35:07', NULL, '58.145.189.246', '2022-02-19 06:36:08', 110, '58.145.189.246'),
(64, 180, 'Wahidul Hasan Jabed', '01819841209', 2004, 108, NULL, '9BJ1V1WPR5', '01819841209', '2035.00', 2, '{\"updated_at\":\"2022-02-19 14:13:41\",\"updated_by\":108,\"updated_ip\":\"58.145.189.228\"}', 1, '2022-02-19 12:53:41', NULL, '103.155.184.130', '2022-02-19 08:13:41', 108, '58.145.189.228'),
(65, 181, 'মেজবাহ উদ্দিন আহমেদ', '01711080694', 2002, 111, NULL, '9BJ8V25SWK', '01711080694', '1000.00', 2, '{\"updated_at\":\"2022-02-19 15:18:29\",\"updated_by\":111,\"updated_ip\":\"119.30.32.86\"}', 1, '2022-02-19 12:57:46', NULL, '103.135.90.150', '2022-02-19 09:18:29', 111, '119.30.32.86'),
(66, 182, 'Md Ibrahim', '01713509298', 2000, 111, NULL, '111', '01713509298', '10000.00', 2, '{\"updated_at\":\"2022-02-19 15:21:13\",\"updated_by\":111,\"updated_ip\":\"119.30.32.86\"}', 1, '2022-02-19 15:20:46', NULL, '119.30.32.86', '2022-02-19 09:21:13', 111, '119.30.32.86'),
(67, 183, 'Jahangir Alam piplu', '01873370409', 1994, 109, NULL, '9BFSUKLI5D', '01873370409', '2000.00', 2, '{\"updated_at\":\"2022-02-19 18:11:32\",\"updated_by\":109,\"updated_ip\":\"58.145.188.252\"}', 1, '2022-02-19 18:08:41', NULL, '58.145.188.252', '2022-02-19 12:11:32', 109, '58.145.188.252'),
(68, 184, 'Nazrul Islam', '01732235978', 1998, 109, NULL, '9BJ4VGRHLM', '01703204672', '5000.00', 2, '{\"updated_at\":\"2022-02-19 21:31:20\",\"updated_by\":109,\"updated_ip\":\"58.145.188.252\"}', 1, '2022-02-19 21:25:03', NULL, '58.145.188.252', '2022-02-19 15:31:20', 109, '58.145.188.252'),
(69, 185, 'মুন্সী আসাদুল ইসলাম (রিয়াদ)', '01816363700', 2008, 108, NULL, '9BJ7V9PRNH', '01847110534', '2040.00', 2, '{\"updated_at\":\"2022-02-19 23:10:06\",\"updated_by\":108,\"updated_ip\":\"58.145.190.243\"}', 1, '2022-02-19 22:39:46', NULL, '202.181.18.242', '2022-02-19 17:10:06', 108, '58.145.190.243'),
(70, 186, 'নাম প্রকাশে অনিচ্ছুক', '+8801824522157', 2006, 108, NULL, 'ক্যাশ পেলাম', '+8801824522157', '10000.00', 2, '{\"updated_at\":\"2022-02-19 23:10:45\",\"updated_by\":108,\"updated_ip\":\"58.145.190.243\"}', 1, '2022-02-19 23:04:37', NULL, '58.145.190.243', '2022-02-19 17:10:45', 108, '58.145.190.243'),
(71, 187, 'ফারুকুল ইসলাম সাগর', '01816363700', 2008, 108, NULL, '9BK1VP9SSF', '01816778714', '1020.00', 2, '{\"updated_at\":\"2022-02-20 11:35:29\",\"updated_by\":108,\"updated_ip\":\"58.145.190.243\"}', 1, '2022-02-20 11:34:43', NULL, '58.145.190.243', '2022-02-20 05:35:29', 108, '58.145.190.243'),
(72, 188, 'Kazi sohag', '01627907724', 2000, 111, NULL, '111', '01627907724', '1000.00', 2, '{\"updated_at\":\"2022-02-20 12:12:25\",\"updated_by\":111,\"updated_ip\":\"37.111.212.235\"}', 1, '2022-02-20 12:06:37', NULL, '37.111.212.235', '2022-02-20 06:12:25', 111, '37.111.212.235'),
(73, 189, 'খোকন চন্দ্র দাস', '+8801711702137', 1993, 108, NULL, '9BK5VRLBHN(খরচ দেয়া হয় নি)', '01711702137', '2000.00', 2, '{\"updated_at\":\"2022-02-20 12:12:56\",\"updated_by\":108,\"updated_ip\":\"202.181.18.241\"}', 1, '2022-02-20 12:12:23', NULL, '202.181.18.241', '2022-02-20 06:12:56', 108, '202.181.18.241'),
(74, 190, 'Jamshed Alam', '01741661066', 2004, 109, NULL, '9BJ7VFPH6N', '01730797900', '1000.00', 2, '{\"updated_at\":\"2022-02-20 12:29:04\",\"updated_by\":109,\"updated_ip\":\"58.145.188.254\"}', 1, '2022-02-20 12:26:36', NULL, '58.145.188.254', '2022-02-20 06:29:04', 109, '58.145.188.254'),
(75, 191, 'সজীব দেব', '01816363700', 2008, 108, NULL, '9BK6VW7X94', '01930088174', '1020.00', 2, '{\"updated_at\":\"2022-02-20 14:23:47\",\"updated_by\":108,\"updated_ip\":\"202.181.18.241\"}', 1, '2022-02-20 14:22:44', NULL, '202.181.18.241', '2022-02-20 08:23:47', 108, '202.181.18.241'),
(76, 192, 'সাদিয়া ইবনাত', '01837616244', 2016, 108, NULL, '9BK2VTB64G', '01842422882', '510.00', 2, '{\"updated_at\":\"2022-02-20 14:36:50\",\"updated_by\":108,\"updated_ip\":\"202.181.18.241\"}', 1, '2022-02-20 14:36:06', NULL, '202.181.18.241', '2022-02-20 08:36:50', 108, '202.181.18.241'),
(77, 193, 'বিজয় দাস', '01978157850', 2011, 110, NULL, '09876543234', '01978157850', '1000.00', 2, '{\"updated_at\":\"2022-02-20 19:29:07\",\"updated_by\":110,\"updated_ip\":\"58.145.190.249\"}', 1, '2022-02-20 19:21:11', NULL, '58.145.190.249', '2022-02-20 13:29:07', 110, '58.145.190.249'),
(78, 194, 'নারায়ন চন্দ্র নাথ', '01819741132', 1994, 110, NULL, '01819741132', '01819741132', '2000.00', 2, '{\"updated_at\":\"2022-02-20 19:28:51\",\"updated_by\":110,\"updated_ip\":\"58.145.190.249\"}', 1, '2022-02-20 19:25:16', NULL, '58.145.190.249', '2022-02-20 13:28:51', 110, '58.145.190.249'),
(79, 195, 'ফজলুল হক', '01815129512', 1997, 110, NULL, '09876543234', '09876543223', '2000.00', 2, '{\"updated_at\":\"2022-02-20 19:28:36\",\"updated_by\":110,\"updated_ip\":\"58.145.190.249\"}', 1, '2022-02-20 19:26:35', NULL, '58.145.190.249', '2022-02-20 13:28:36', 110, '58.145.190.249'),
(80, 196, 'স্মৃতি চক্রবর্ত্তী', '01816237771', 2017, 108, NULL, 'বিপুল কাকার মাধ্যমে', '01816237771', '300.00', 2, '{\"updated_at\":\"2022-02-20 22:10:37\",\"updated_by\":108,\"updated_ip\":\"202.181.18.241\"}', 1, '2022-02-20 22:09:25', NULL, '202.181.18.241', '2022-02-20 16:10:37', 108, '202.181.18.241'),
(81, 197, 'একরামুল হক শিমুল', '01818690600', 2004, 110, NULL, '09876543234', '01456789789', '99999999.99', 3, '{\"updated_at\":\"2022-02-22 00:12:10\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-21 23:02:46', NULL, '58.145.189.231', '2022-02-21 18:12:10', 1, '103.205.71.20'),
(82, 198, 'স্বর্না পাল', '01978157859', 2015, 110, NULL, '01978157850', '01978157850', '500.00', 2, '{\"updated_at\":\"2022-02-21 23:13:56\",\"updated_by\":110,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-02-21 23:04:27', NULL, '58.145.189.231', '2022-02-21 17:13:56', 110, '58.145.189.231'),
(83, 199, 'মনিরুল ইসলাম সোহাগ', '01815129512', 2003, 110, NULL, '01815129512', '01815129512', '1000.00', 2, '{\"updated_at\":\"2022-02-21 23:31:09\",\"updated_by\":110,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-02-21 23:30:16', NULL, '58.145.189.231', '2022-02-21 17:31:09', 110, '58.145.189.231'),
(84, 200, 'একরামুল হক শিমুল', '01818690600', 2004, 110, NULL, '01818690600', '01818690600', '1000.00', 2, '{\"updated_at\":\"2022-02-21 23:34:06\",\"updated_by\":110,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-02-21 23:33:35', NULL, '58.145.189.231', '2022-02-21 17:34:06', 110, '58.145.189.231'),
(85, 201, 'মোবাশ্বের হোসেন', '01816363700', 2002, 108, NULL, '9BL2WYD9NG', '01815771646', '2140.00', 2, '{\"updated_at\":\"2022-02-21 23:37:35\",\"updated_by\":108,\"updated_ip\":\"58.145.190.245\"}', 1, '2022-02-21 23:36:01', NULL, '58.145.190.245', '2022-02-21 17:37:35', 108, '58.145.190.245'),
(86, 202, 'Nipa rai', '01301884410', 2000, 111, NULL, '112', '01301884410', '2000.00', 2, '{\"updated_at\":\"2022-02-22 16:43:26\",\"updated_by\":111,\"updated_ip\":\"119.30.32.22\"}', 1, '2022-02-22 16:42:44', NULL, '119.30.32.22', '2022-02-22 10:43:26', 111, '119.30.32.22'),
(87, 203, 'মোহাম্মদ হাসান', '01815129512', 2010, 110, NULL, '1815129512', '01815129512', '2000.00', 2, '{\"updated_at\":\"2022-02-22 22:01:54\",\"updated_by\":110,\"updated_ip\":\"58.145.188.241\"}', 1, '2022-02-22 21:36:37', NULL, '58.145.188.241', '2022-02-22 16:01:54', 110, '58.145.188.241'),
(88, 204, 'নিলুফা ইয়াসমিন টুম্পা', '01828516450', 2008, 108, NULL, '9BM90LQNPT', '01872576257', '1000.00', 2, '{\"updated_at\":\"2022-02-22 21:55:04\",\"updated_by\":108,\"updated_ip\":\"58.145.190.245\"}', 1, '2022-02-22 21:44:38', NULL, '58.145.190.245', '2022-02-22 15:55:04', 108, '58.145.190.245'),
(89, 205, 'তপন চন্দ্র নাথ', '01818900103', 1993, 108, NULL, 'বিপুল কাকার মাধ্যমে', '01818900103', '2000.00', 2, '{\"updated_at\":\"2022-02-22 21:55:26\",\"updated_by\":108,\"updated_ip\":\"58.145.190.245\"}', 1, '2022-02-22 21:46:57', NULL, '58.145.190.245', '2022-02-22 15:55:26', 108, '58.145.190.245'),
(90, 206, 'রতন চন্দ্র নাথ', '+8801718403285', 1999, 108, NULL, 'বিপুল কাকার মাধ্যমে', '+8801718403285', '5000.00', 2, '{\"updated_at\":\"2022-02-22 21:55:45\",\"updated_by\":108,\"updated_ip\":\"58.145.190.245\"}', 1, '2022-02-22 21:53:56', NULL, '58.145.190.245', '2022-02-22 15:55:45', 108, '58.145.190.245'),
(91, 207, 'Md. Ibrahim', '01819841209', 2002, 108, NULL, '9BN80XXPA2', '01819841209', '3055.00', 2, '{\"updated_at\":\"2022-02-23 10:20:08\",\"updated_by\":108,\"updated_ip\":\"58.145.189.248\"}', 1, '2022-02-23 10:04:10', NULL, '103.155.184.138', '2022-02-23 04:20:08', 108, '58.145.189.248'),
(92, 208, 'Afser Uddin Shahin', '01717383086', 2000, 111, NULL, '9B032E8MT3', '01717383076', '1000.00', 3, '{\"updated_at\":\"2022-02-24 22:45:47\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-24 22:23:40', NULL, '37.111.200.215', '2022-02-24 16:45:47', 1, '103.205.71.20'),
(93, 209, 'Afser Uddin Shahin', '01717383086', 2000, 111, NULL, '9B032E8MT3', '01717383076', '1000.00', 2, '{\"updated_at\":\"2022-02-24 22:39:53\",\"updated_by\":111,\"updated_ip\":\"103.113.192.5\"}', 1, '2022-02-24 22:23:41', NULL, '37.111.200.215', '2022-02-24 16:39:53', 111, '103.113.192.5'),
(94, 210, 'Rebeka Sultana Shompa', '01717383076', 1995, 111, NULL, '9B032E8MT3', '01717383076', '1000.00', 3, '{\"updated_at\":\"2022-02-24 22:42:02\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-24 22:25:49', NULL, '37.111.200.215', '2022-02-24 16:42:02', 1, '103.205.71.20'),
(95, 211, 'Rebeka Sultana Shompa', '01717383076', 1995, 111, NULL, '9B032E8MT3', '01717383076', '1000.00', 3, '{\"updated_at\":\"2022-02-24 22:45:44\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-24 22:25:50', NULL, '37.111.200.215', '2022-02-24 16:45:44', 1, '103.205.71.20'),
(96, 212, 'Rebeka Sultana Shompa', '01717383076', 1995, 111, NULL, '9B032E8MT3', '01717383076', '1000.00', 2, '{\"updated_at\":\"2022-02-24 22:39:39\",\"updated_by\":111,\"updated_ip\":\"103.113.192.5\"}', 1, '2022-02-24 22:25:51', NULL, '37.111.200.215', '2022-02-24 16:39:39', 111, '103.113.192.5'),
(97, 214, 'Sadia Afrose Shushama', '01717383076', 1998, 111, NULL, '9B032E8MT3', '01717383076', '1000.00', 2, '{\"updated_at\":\"2022-02-24 22:39:24\",\"updated_by\":111,\"updated_ip\":\"103.113.192.5\"}', 1, '2022-02-24 22:28:09', NULL, '37.111.200.215', '2022-02-24 16:39:24', 111, '103.113.192.5'),
(98, 213, 'Sadia Afrose Shushama', '01717383076', 1998, 111, NULL, '9B032E8MT3', '01717383076', '1000.00', 3, '{\"updated_at\":\"2022-02-24 22:45:41\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-24 22:28:09', NULL, '37.111.200.215', '2022-02-24 16:45:41', 1, '103.205.71.20'),
(99, 215, 'Salauddin kader', '01819169440', 2002, 111, NULL, '111', '01819169440', '1500.00', 2, '{\"updated_at\":\"2022-02-24 22:39:03\",\"updated_by\":111,\"updated_ip\":\"103.113.192.5\"}', 1, '2022-02-24 22:38:09', NULL, '103.113.192.5', '2022-02-24 16:39:03', 111, '103.113.192.5'),
(100, 216, 'Raihan Uddin', '01819335256', 2000, 111, NULL, '111', '01819335256', '1000.00', 2, '{\"updated_at\":\"2022-02-24 22:42:52\",\"updated_by\":111,\"updated_ip\":\"103.113.192.5\"}', 1, '2022-02-24 22:41:52', NULL, '103.113.192.5', '2022-02-24 16:42:52', 111, '103.113.192.5'),
(101, 217, 'Abul Kalam Mintu', '01818996392', 1998, 109, NULL, '9BN714S5FJ', '01818996392', '2000.00', 2, '{\"updated_at\":\"2022-02-24 23:14:44\",\"updated_by\":109,\"updated_ip\":\"202.181.18.225\"}', 1, '2022-02-24 23:13:50', NULL, '202.181.18.225', '2022-02-24 17:14:44', 109, '202.181.18.225'),
(102, 218, 'সুজল ঘোষ', '01743918340', 2008, 108, NULL, '9BP72NYRTR', '01743918340', '1020.00', 2, '{\"updated_at\":\"2022-02-25 13:08:23\",\"updated_by\":108,\"updated_ip\":\"58.145.189.247\"}', 1, '2022-02-25 13:07:46', NULL, '58.145.189.247', '2022-02-25 07:08:23', 108, '58.145.189.247'),
(103, 219, 'নূর নবী', '+8801892980480', 2017, 108, NULL, 'ক্যাশ পেলাম', '+8801892980480', '500.00', 2, '{\"updated_at\":\"2022-02-25 17:31:40\",\"updated_by\":108,\"updated_ip\":\"58.145.189.247\"}', 1, '2022-02-25 17:30:55', NULL, '58.145.189.247', '2022-02-25 11:31:40', 108, '58.145.189.247'),
(104, 220, 'Md. Anamul Hoq Moni', '01819841209', 2004, 108, NULL, '9BQ43L7GBQ', '01819841209', '3060.00', 2, '{\"updated_at\":\"2022-02-26 17:40:27\",\"updated_by\":108,\"updated_ip\":\"58.145.187.227\"}', 1, '2022-02-26 17:24:14', NULL, '103.155.184.139', '2022-02-26 11:40:27', 108, '58.145.187.227'),
(105, 221, 'আব্দুল্লাহ আল কায়সার', '+8801892980480', 2017, 108, NULL, '2017 ব্যাচ এর কালেকশন', '+8801892980480', '500.00', 2, '{\"updated_at\":\"2022-02-26 17:39:46\",\"updated_by\":108,\"updated_ip\":\"58.145.187.227\"}', 1, '2022-02-26 17:33:52', NULL, '58.145.187.227', '2022-02-26 11:39:46', 108, '58.145.187.227'),
(106, 222, 'রহমান মোহন', '+8801892980480', 2017, 108, NULL, '2017 ব্যাচের কালেকশন', '+8801892980480', '500.00', 2, '{\"updated_at\":\"2022-02-26 17:39:56\",\"updated_by\":108,\"updated_ip\":\"58.145.187.227\"}', 1, '2022-02-26 17:36:19', NULL, '58.145.187.227', '2022-02-26 11:39:56', 108, '58.145.187.227'),
(107, 223, 'নাইমুল ইসলাম', '+8801892980480', 2017, 108, NULL, '2017 ব্যাচের কালেকশন', '01892980480', '500.00', 2, '{\"updated_at\":\"2022-02-26 17:40:04\",\"updated_by\":108,\"updated_ip\":\"58.145.187.227\"}', 1, '2022-02-26 17:38:21', NULL, '58.145.187.227', '2022-02-26 11:40:04', 108, '58.145.187.227'),
(108, 224, 'Nur Hossain Shipu', '01819841209', 2004, 108, NULL, '9BQ73RK575', '01819841209', '5100.00', 2, '{\"updated_at\":\"2022-02-26 20:03:20\",\"updated_by\":108,\"updated_ip\":\"103.135.90.22\"}', 1, '2022-02-26 20:01:17', NULL, '182.48.95.110', '2022-02-26 14:03:20', 108, '103.135.90.22'),
(109, 225, 'Sabina Aktet', '01840676746', 1998, 109, NULL, '9B93MQIGO7', '01840676746', '500.00', 2, '{\"updated_at\":\"2022-02-27 01:44:45\",\"updated_by\":109,\"updated_ip\":\"58.145.189.245\"}', 1, '2022-02-27 01:43:45', NULL, '58.145.189.245', '2022-02-26 19:44:45', 109, '58.145.189.245'),
(110, 226, 'শহিদুল ইসলাম', '01817752997', 1990, 109, NULL, '1590', '01758921590', '1000.00', 3, '{\"updated_at\":\"2022-02-28 00:46:04\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-27 19:12:52', NULL, '93.168.109.71', '2022-02-27 18:46:04', 1, '103.205.71.20'),
(111, 227, 'তোফায়েল আহমেদ', '01831071718', 1998, 109, NULL, '1590', '01758921590', '3060.00', 3, '{\"updated_at\":\"2022-02-28 00:46:00\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-27 19:14:39', NULL, '93.168.109.71', '2022-02-27 18:46:00', 1, '103.205.71.20'),
(112, 228, 'Shalina Akter Nazma', '01819841209', 1986, 108, NULL, 'ব্যাংক জমা(আলী মুনসুর সুমন)', '01819841209', '10000.00', 2, '{\"updated_at\":\"2022-02-27 21:47:30\",\"updated_by\":108,\"updated_ip\":\"202.181.18.237\"}', 1, '2022-02-27 20:32:33', NULL, '182.48.95.110', '2022-02-27 15:47:30', 108, '202.181.18.237'),
(113, 229, 'Tanbir Ahammad', '01778201480', 2000, 111, NULL, '9BR34NDII7', '01778201480', '3000.00', 3, '{\"updated_at\":\"2022-02-27 23:08:03\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-27 21:00:41', NULL, '37.111.205.243', '2022-02-27 17:08:03', 1, '103.205.71.20'),
(114, 230, 'Saiful Islam Shiplu', '01817384020', 2000, 111, NULL, '111', '01817384020', '2000.00', 2, '{\"updated_at\":\"2022-02-27 23:04:32\",\"updated_by\":111,\"updated_ip\":\"123.108.246.201\"}', 1, '2022-02-27 22:53:47', NULL, '123.108.246.201', '2022-02-27 17:04:32', 111, '123.108.246.201'),
(115, 231, 'Hasan Rony', '01713509298', 2000, 111, NULL, '111', '01818367786', '1000.00', 2, '{\"updated_at\":\"2022-02-27 23:04:22\",\"updated_by\":111,\"updated_ip\":\"123.108.246.201\"}', 1, '2022-02-27 22:55:33', NULL, '123.108.246.201', '2022-02-27 17:04:22', 111, '123.108.246.201'),
(116, 232, 'Soroar Hossain', '01842373284', 2000, 111, NULL, '111', '01842373284', '1000.00', 2, '{\"updated_at\":\"2022-02-27 23:03:39\",\"updated_by\":111,\"updated_ip\":\"123.108.246.201\"}', 1, '2022-02-27 22:57:46', NULL, '123.108.246.201', '2022-02-27 17:03:39', 111, '123.108.246.201'),
(117, 233, 'Sala Uddin', '01819335256', 2000, 111, NULL, '111', '01819335256', '2000.00', 3, '{\"updated_at\":\"2022-02-27 23:08:00\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-02-27 23:00:21', NULL, '123.108.246.201', '2022-02-27 17:08:00', 1, '103.205.71.20'),
(118, 234, 'Sala Uddin', '01819335256', 2000, 111, NULL, '111', '01819335256', '1000.00', 2, '{\"updated_at\":\"2022-02-27 23:04:57\",\"updated_by\":111,\"updated_ip\":\"123.108.246.201\"}', 1, '2022-02-27 23:00:22', NULL, '123.108.246.201', '2022-02-27 17:04:57', 111, '123.108.246.201'),
(119, 235, 'Tanvir Ahmed', '01778201480', 2000, 111, NULL, '111', '01778201480', '3000.00', 2, '{\"updated_at\":\"2022-02-27 23:03:09\",\"updated_by\":111,\"updated_ip\":\"123.108.246.201\"}', 1, '2022-02-27 23:01:48', NULL, '123.108.246.201', '2022-02-27 17:03:09', 111, '123.108.246.201'),
(120, 236, 'TOFAYEL AHMED', '01741661066', 1998, 109, NULL, '9BR640SFZ4', '01758921590', '3000.00', 2, '{\"updated_at\":\"2022-02-27 23:38:02\",\"updated_by\":109,\"updated_ip\":\"58.145.184.244\"}', 1, '2022-02-27 23:33:19', NULL, '58.145.184.244', '2022-02-27 17:38:02', 109, '58.145.184.244'),
(121, 237, 'MD SHAHIDUL', '01741661066', 1990, 109, NULL, '9BR537DJC9', '01758921590', '1000.00', 2, '{\"updated_at\":\"2022-02-27 23:37:23\",\"updated_by\":109,\"updated_ip\":\"58.145.184.244\"}', 1, '2022-02-27 23:35:08', NULL, '58.145.184.244', '2022-02-27 17:37:23', 109, '58.145.184.244'),
(122, 238, 'মুন্সী আক্তার হোসেন', '01817118615', 1972, 110, NULL, '01817118615', '01817118615', '20000.00', 2, '{\"updated_at\":\"2022-02-28 00:19:11\",\"updated_by\":110,\"updated_ip\":\"58.145.190.250\"}', 1, '2022-02-27 23:57:22', NULL, '58.145.190.250', '2022-02-27 18:19:11', 110, '58.145.190.250'),
(123, 239, 'আবু হাসনাত', '01673523927', 2006, 110, NULL, '01673523927', '01673523927', '1000.00', 2, '{\"updated_at\":\"2022-02-28 00:18:55\",\"updated_by\":110,\"updated_ip\":\"58.145.190.250\"}', 1, '2022-02-28 00:00:27', NULL, '58.145.190.250', '2022-02-27 18:18:55', 110, '58.145.190.250'),
(124, 240, 'সুব্রত নাথ', '01718403285', 2012, 110, NULL, '01718403285', '01718403285', '1000.00', 2, '{\"updated_at\":\"2022-02-28 00:18:43\",\"updated_by\":110,\"updated_ip\":\"58.145.190.250\"}', 1, '2022-02-28 00:04:08', NULL, '58.145.190.250', '2022-02-27 18:18:43', 110, '58.145.190.250'),
(125, 241, 'তপন চন্দ্র নাথ', '01978157850', 1994, 110, NULL, '01978157850', '01978157850', '2000.00', 2, '{\"updated_at\":\"2022-02-28 00:18:23\",\"updated_by\":110,\"updated_ip\":\"58.145.190.250\"}', 1, '2022-02-28 00:06:23', NULL, '58.145.190.250', '2022-02-27 18:18:23', 110, '58.145.190.250'),
(126, 242, 'নাসির উদ্দিন', '01818649860', 1994, 110, NULL, '01818649860', '01818649860', '2000.00', 2, '{\"updated_at\":\"2022-02-28 00:18:06\",\"updated_by\":110,\"updated_ip\":\"58.145.190.250\"}', 1, '2022-02-28 00:13:17', NULL, '58.145.190.250', '2022-02-27 18:18:06', 110, '58.145.190.250'),
(127, 243, 'কাজী সামছুল হক', '01819692330', 1994, 110, NULL, '01819692330', '01819692330', '5000.00', 2, '{\"updated_at\":\"2022-02-28 00:17:50\",\"updated_by\":110,\"updated_ip\":\"58.145.190.250\"}', 1, '2022-02-28 00:16:03', NULL, '58.145.190.250', '2022-02-27 18:17:50', 110, '58.145.190.250'),
(128, 244, 'লক্ষন চন্দ্র নাথ', '01978157850', 1995, 110, NULL, '01978157850', '01978157850', '3000.00', 2, '{\"updated_at\":\"2022-02-28 00:32:17\",\"updated_by\":110,\"updated_ip\":\"58.145.190.250\"}', 1, '2022-02-28 00:31:52', NULL, '58.145.190.250', '2022-02-27 18:32:17', 110, '58.145.190.250'),
(129, 245, 'Mahfuz Bhuiyan', '01830375851', 2000, 111, NULL, '111', '01730798391', '3000.00', 2, '{\"updated_at\":\"2022-02-28 13:56:30\",\"updated_by\":111,\"updated_ip\":\"37.111.210.184\"}', 1, '2022-02-28 13:49:25', NULL, '37.111.210.184', '2022-02-28 07:56:30', 111, '37.111.210.184'),
(130, 246, 'Nizam Uddin', '01814470647', 1996, 111, NULL, '111', '01814470647', '2000.00', 2, '{\"updated_at\":\"2022-02-28 15:25:16\",\"updated_by\":111,\"updated_ip\":\"37.111.210.184\"}', 1, '2022-02-28 13:59:59', NULL, '37.111.210.184', '2022-02-28 09:25:16', 111, '37.111.210.184'),
(131, 247, 'Shahadat Hossain Sohel', '01558959032', 2004, 108, NULL, '9BS55MBFJ3', '01819841209', '500.00', 2, '{\"updated_at\":\"2022-02-28 23:52:36\",\"updated_by\":108,\"updated_ip\":\"58.145.189.237\"}', 1, '2022-02-28 23:14:01', NULL, '182.48.95.110', '2022-02-28 17:52:36', 108, '58.145.189.237'),
(132, 248, 'রুহুল আমিন', '01867208906', 1994, 110, NULL, '01867208906', '01867208906', '3000.00', 2, '{\"updated_at\":\"2022-03-01 00:41:44\",\"updated_by\":110,\"updated_ip\":\"58.145.190.241\"}', 1, '2022-03-01 00:39:58', NULL, '58.145.190.241', '2022-02-28 18:41:44', 110, '58.145.190.241'),
(133, 249, 'Anonymous', '01818367786', 1995, 111, NULL, '122', '01818367786', '3000.00', 2, '{\"updated_at\":\"2022-03-01 13:36:09\",\"updated_by\":111,\"updated_ip\":\"119.30.39.106\"}', 1, '2022-03-01 13:35:22', NULL, '119.30.39.106', '2022-03-01 07:36:09', 111, '119.30.39.106'),
(134, 250, 'Mir Hasan Saidul', '01817750170', 2000, 111, NULL, '111', '01817750170', '1000.00', 2, '{\"updated_at\":\"2022-03-01 17:17:38\",\"updated_by\":111,\"updated_ip\":\"119.30.39.106\"}', 1, '2022-03-01 17:13:50', NULL, '119.30.39.106', '2022-03-01 11:17:38', 111, '119.30.39.106'),
(135, 251, 'Mizanur Rahman', '01819335256', 2000, 111, NULL, '111', '01819335256', '1000.00', 2, '{\"updated_at\":\"2022-03-01 19:23:00\",\"updated_by\":111,\"updated_ip\":\"119.30.32.175\"}', 1, '2022-03-01 19:22:32', NULL, '119.30.32.175', '2022-03-01 13:23:00', 111, '119.30.32.175'),
(136, 252, 'Anamul Hoque Anam', '01819841209', 2004, 109, NULL, '9BGHJK67S', '01819841209', '1500.00', 2, '{\"updated_at\":\"2022-03-01 23:06:12\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-01 23:03:15', NULL, '202.181.18.250', '2022-03-01 17:06:12', 109, '202.181.18.250'),
(137, 253, 'Mejba Bhuiyan', '01741661066', 1998, 109, NULL, '9BFREW32X', '01741661066', '1000.00', 2, '{\"updated_at\":\"2022-03-01 23:06:03\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-01 23:04:36', NULL, '202.181.18.250', '2022-03-01 17:06:03', 109, '202.181.18.250'),
(138, 254, 'Shipon Pal', '01725551020', 2000, 111, NULL, '111', '01725551020', '1000.00', 2, '{\"updated_at\":\"2022-03-02 11:47:16\",\"updated_by\":111,\"updated_ip\":\"37.111.210.129\"}', 1, '2022-03-02 11:45:51', NULL, '37.111.210.129', '2022-03-02 05:47:16', 111, '37.111.210.129'),
(139, 255, 'মুনমুন নাগ', '01813758521', 2011, 108, NULL, 'ক্যাশ পেলাম', '01813758521', '1000.00', 2, '{\"updated_at\":\"2022-03-02 22:48:29\",\"updated_by\":108,\"updated_ip\":\"58.145.190.248\"}', 1, '2022-03-02 22:43:35', NULL, '58.145.190.248', '2022-03-02 16:48:29', 108, '58.145.190.248'),
(140, 256, 'রুপম পাল', '01813758521', 2004, 108, NULL, 'ক্যাশ পেলাম', '01813758521', '1000.00', 2, '{\"updated_at\":\"2022-03-02 22:48:44\",\"updated_by\":108,\"updated_ip\":\"58.145.190.248\"}', 1, '2022-03-02 22:44:41', NULL, '58.145.190.248', '2022-03-02 16:48:44', 108, '58.145.190.248'),
(141, 257, 'পীযুষ কান্তি নাগ', '01811181318', 2003, 108, NULL, 'ক্যাশ পেলাম', '01811181318', '1000.00', 2, '{\"updated_at\":\"2022-03-02 22:48:56\",\"updated_by\":108,\"updated_ip\":\"58.145.190.248\"}', 1, '2022-03-02 22:46:00', NULL, '58.145.190.248', '2022-03-02 16:48:56', 108, '58.145.190.248'),
(142, 258, 'সাবিত্রী নাগ', '01811181318', 2000, 108, NULL, 'ক্যাশ পেলাম', '01811181318', '1000.00', 2, '{\"updated_at\":\"2022-03-02 22:49:03\",\"updated_by\":108,\"updated_ip\":\"58.145.190.248\"}', 1, '2022-03-02 22:46:52', NULL, '58.145.190.248', '2022-03-02 16:49:03', 108, '58.145.190.248'),
(143, 259, 'ফজলুল করিম পিন্টু', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '10000.00', 2, '{\"updated_at\":\"2022-03-02 23:46:27\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:00:06', NULL, '58.145.190.227', '2022-03-02 17:46:27', 110, '58.145.190.227'),
(144, 260, 'বেলায়েত হোসেন বেলাল', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '10000.00', 2, '{\"updated_at\":\"2022-03-02 23:46:15\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:02:04', NULL, '58.145.190.227', '2022-03-02 17:46:15', 110, '58.145.190.227'),
(145, 261, 'আলী আশ্রাফ সুজন', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '5000.00', 2, '{\"updated_at\":\"2022-03-02 23:46:02\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:05:25', NULL, '58.145.190.227', '2022-03-02 17:46:02', 110, '58.145.190.227'),
(146, 262, 'শাহ আলম বাবলু', '01819214651', 1990, 110, NULL, '09876543211', '09876543211', '5000.00', 2, '{\"updated_at\":\"2022-03-02 23:45:48\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:07:59', NULL, '58.145.190.227', '2022-03-02 17:45:48', 110, '58.145.190.227'),
(147, 263, 'দেবাশীষ ভৌমিক', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '3000.00', 2, '{\"updated_at\":\"2022-03-02 23:45:37\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:09:49', NULL, '58.145.190.227', '2022-03-02 17:45:37', 110, '58.145.190.227'),
(148, 264, 'শাহজাহান কবির', '01312256980', 1990, 110, NULL, '09876543211', '09876543211', '3000.00', 2, '{\"updated_at\":\"2022-03-02 23:45:30\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:12:06', NULL, '58.145.190.227', '2022-03-02 17:45:30', 110, '58.145.190.227'),
(149, 265, 'গিয়াস উদ্দিন হায়দার', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '3000.00', 2, '{\"updated_at\":\"2022-03-02 23:45:19\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:16:36', NULL, '58.145.190.227', '2022-03-02 17:45:19', 110, '58.145.190.227'),
(150, 266, 'বিবি হাজেরা মুন্নী', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-02 23:45:04\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:18:17', NULL, '58.145.190.227', '2022-03-02 17:45:04', 110, '58.145.190.227'),
(151, 267, 'নুর আলমগীর', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-02 23:44:54\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:20:43', NULL, '58.145.190.227', '2022-03-02 17:44:54', 110, '58.145.190.227'),
(152, 268, 'আবু ইউছুপ ঝন্টু', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-02 23:44:46\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:23:07', NULL, '58.145.190.227', '2022-03-02 17:44:46', 110, '58.145.190.227'),
(153, 269, 'ঝর্না নাথ', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-02 23:44:29\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:25:11', NULL, '58.145.190.227', '2022-03-02 17:44:29', 110, '58.145.190.227'),
(154, 270, 'শেখ নিজাম উদ্দিন মাসুদ', '01911924256', 1990, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-02 23:43:14\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:27:23', NULL, '58.145.190.227', '2022-03-02 17:43:14', 110, '58.145.190.227'),
(155, 271, 'দিলাফরোজ বেগম রিনা', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-02 23:44:13\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:29:57', NULL, '58.145.190.227', '2022-03-02 17:44:13', 110, '58.145.190.227'),
(156, 272, 'অজিত কুমার', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-02 23:43:59\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:31:27', NULL, '58.145.190.227', '2022-03-02 17:43:59', 110, '58.145.190.227'),
(157, 273, 'মাসুদ করিম চৌধুরী', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-02 23:43:49\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:37:46', NULL, '58.145.190.227', '2022-03-02 17:43:49', 110, '58.145.190.227'),
(158, 274, 'মোঃ মমিনুল হক', '01716400337', 1990, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-02 23:43:36\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:39:01', NULL, '58.145.190.227', '2022-03-02 17:43:36', 110, '58.145.190.227'),
(159, 275, 'রিয়াজ উদ্দিন আহমেদ', '01815129512', 1991, 110, NULL, '09876543211', '09876543211', '5000.00', 2, '{\"updated_at\":\"2022-03-02 23:42:55\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:40:26', NULL, '58.145.190.227', '2022-03-02 17:42:55', 110, '58.145.190.227'),
(160, 276, 'ফজলুল হক', '01815129512', 1997, 110, NULL, '09876543211', '09876543211', '5000.00', 2, '{\"updated_at\":\"2022-03-02 23:42:39\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-02 23:41:21', NULL, '58.145.190.227', '2022-03-02 17:42:39', 110, '58.145.190.227'),
(161, 277, 'মুন্সী হারুন - অর - রশিদ তুহিন', '01812992042', 2008, 108, NULL, '9C317B7J4N', '01812992042', '3000.00', 2, '{\"updated_at\":\"2022-03-03 00:24:28\",\"updated_by\":108,\"updated_ip\":\"58.145.190.248\"}', 1, '2022-03-03 00:23:26', NULL, '58.145.190.248', '2022-03-02 18:24:28', 108, '58.145.190.248'),
(162, 278, 'Saiful Islam', '01741661066', 2001, 109, NULL, '9BGHJKMN', '01741661066', '2000.00', 2, '{\"updated_at\":\"2022-03-03 00:41:39\",\"updated_by\":109,\"updated_ip\":\"202.181.18.234\"}', 1, '2022-03-03 00:29:24', NULL, '202.181.18.234', '2022-03-02 18:41:39', 109, '202.181.18.234'),
(163, 279, 'Abdullah Al Momin Biplob', '01818670916', 2003, 109, NULL, '9BHSAKOP', '01819670916', '2000.00', 2, '{\"updated_at\":\"2022-03-03 00:41:31\",\"updated_by\":109,\"updated_ip\":\"202.181.18.234\"}', 1, '2022-03-03 00:31:12', NULL, '202.181.18.234', '2022-03-02 18:41:31', 109, '202.181.18.234'),
(164, 280, 'Monirul Islam Babu', '01670876557', 2006, 109, NULL, '9BDNCXZ', '01670876557', '1000.00', 2, '{\"updated_at\":\"2022-03-03 00:41:21\",\"updated_by\":109,\"updated_ip\":\"202.181.18.234\"}', 1, '2022-03-03 00:33:12', NULL, '202.181.18.234', '2022-03-02 18:41:21', 109, '202.181.18.234'),
(165, 281, 'Shemul Bhowmik', '01816358116', 2004, 109, NULL, '9BCVMKLU', '01816358116', '1000.00', 2, '{\"updated_at\":\"2022-03-03 00:41:05\",\"updated_by\":109,\"updated_ip\":\"202.181.18.234\"}', 1, '2022-03-03 00:34:56', NULL, '202.181.18.234', '2022-03-02 18:41:05', 109, '202.181.18.234'),
(166, 282, 'Enamul Haque Riyan', '01819841209', 2004, 109, NULL, '9BFDSAKL', '01819841209', '2000.00', 2, '{\"updated_at\":\"2022-03-03 00:40:58\",\"updated_by\":109,\"updated_ip\":\"202.181.18.234\"}', 1, '2022-03-03 00:36:47', NULL, '202.181.18.234', '2022-03-02 18:40:58', 109, '202.181.18.234'),
(167, 283, 'Badrul Hasan', '01811282240', 1998, 109, NULL, '9NJJKLSDAR', '01811282240', '2000.00', 2, '{\"updated_at\":\"2022-03-03 00:40:46\",\"updated_by\":109,\"updated_ip\":\"202.181.18.234\"}', 1, '2022-03-03 00:38:49', NULL, '202.181.18.234', '2022-03-02 18:40:46', 109, '202.181.18.234'),
(168, 284, 'Ibrahim Bhuiyan', '01818759875', 2001, 111, NULL, '111', '01818759875', '1000.00', 2, '{\"updated_at\":\"2022-03-03 09:09:42\",\"updated_by\":111,\"updated_ip\":\"37.111.197.218\"}', 1, '2022-03-03 09:07:04', NULL, '37.111.197.218', '2022-03-03 03:09:42', 111, '37.111.197.218'),
(169, 285, 'Jahangir Alam', '01819680326', 2000, 111, NULL, '111', '01819680326', '1000.00', 2, '{\"updated_at\":\"2022-03-03 09:09:55\",\"updated_by\":111,\"updated_ip\":\"37.111.197.218\"}', 1, '2022-03-03 09:08:56', NULL, '37.111.197.218', '2022-03-03 03:09:55', 111, '37.111.197.218'),
(170, 286, 'Kazi Md.Emran', '01712606026', 1994, 111, NULL, '111', '01712606026', '2000.00', 2, '{\"updated_at\":\"2022-03-03 09:48:27\",\"updated_by\":111,\"updated_ip\":\"37.111.197.218\"}', 1, '2022-03-03 09:48:01', NULL, '37.111.197.218', '2022-03-03 03:48:27', 111, '37.111.197.218'),
(171, 287, 'ওমর ফারুক', '01816363700', 2008, 108, NULL, '9C367EEWQ8', '01894820130', '1000.00', 2, '{\"updated_at\":\"2022-03-03 10:15:50\",\"updated_by\":108,\"updated_ip\":\"58.145.190.248\"}', 1, '2022-03-03 10:13:59', NULL, '58.145.190.248', '2022-03-03 04:15:50', 108, '58.145.190.248');
INSERT INTO `donarinfos` (`id`, `user_id`, `name`, `mobileNumber`, `sscBatch`, `sendNumber`, `donationBy`, `TransactionID`, `TransactionMobileNumber`, `donationAmount`, `approvedStatus`, `processInfo`, `isActive`, `created_at`, `created_by`, `created_ip`, `updated_at`, `updated_by`, `updated_ip`) VALUES
(172, 288, 'আবদুর রহিম', '01711152841', 1997, 110, NULL, '0171115841', '01711152841', '2500.00', 2, '{\"updated_at\":\"2022-03-03 10:20:00\",\"updated_by\":110,\"updated_ip\":\"58.145.190.227\"}', 1, '2022-03-03 10:18:29', NULL, '58.145.190.227', '2022-03-03 04:20:00', 110, '58.145.190.227'),
(173, 289, 'সাইদুল হক সাজু', '01811319914', 1997, 110, NULL, '01811319914', '01811319914', '2000.00', 2, '{\"updated_at\":\"2022-03-03 12:59:06\",\"updated_by\":110,\"updated_ip\":\"58.145.188.243\"}', 1, '2022-03-03 12:53:07', NULL, '58.145.188.243', '2022-03-03 06:59:06', 110, '58.145.188.243'),
(174, 290, 'দিপক চন্দ্র নাথ', '01740936013', 1997, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-03 13:27:32\",\"updated_by\":110,\"updated_ip\":\"58.145.188.243\"}', 1, '2022-03-03 13:26:47', NULL, '58.145.188.243', '2022-03-03 07:27:32', 110, '58.145.188.243'),
(175, 291, 'ফরহাদ উদ্দিন আহমেদ', '01815129512', 1997, 110, NULL, '01815129512', '01815129512', '10000.00', 2, '{\"updated_at\":\"2022-03-03 15:49:29\",\"updated_by\":110,\"updated_ip\":\"202.181.18.227\"}', 1, '2022-03-03 15:43:07', NULL, '202.181.18.227', '2022-03-03 09:49:29', 110, '202.181.18.227'),
(176, 292, 'মোহাম্মদ আলমগীর', '01818172982', 1997, 110, NULL, '0181812982', '01818172982', '2000.00', 2, '{\"updated_at\":\"2022-03-03 15:49:52\",\"updated_by\":110,\"updated_ip\":\"202.181.18.227\"}', 1, '2022-03-03 15:47:38', NULL, '202.181.18.227', '2022-03-03 09:49:52', 110, '202.181.18.227'),
(177, 293, 'Kamruzzaman Sumon', '01861971910', 2000, 111, NULL, '111', '01861971910', '1000.00', 2, '{\"updated_at\":\"2022-03-03 15:54:25\",\"updated_by\":111,\"updated_ip\":\"37.111.197.218\"}', 1, '2022-03-03 15:50:21', NULL, '37.111.197.218', '2022-03-03 09:54:25', 111, '37.111.197.218'),
(178, 294, 'Azahar hossain sumon', '01979841222', 2000, 111, NULL, '111', '01979841222', '1500.00', 2, '{\"updated_at\":\"2022-03-03 15:54:17\",\"updated_by\":111,\"updated_ip\":\"37.111.197.218\"}', 1, '2022-03-03 15:52:06', NULL, '37.111.197.218', '2022-03-03 09:54:17', 111, '37.111.197.218'),
(179, 295, 'Shahab uddin sumon', '01819680426', 2000, 111, NULL, '326', '01819680326', '1000.00', 2, '{\"updated_at\":\"2022-03-03 20:10:36\",\"updated_by\":111,\"updated_ip\":\"103.135.90.26\"}', 1, '2022-03-03 15:55:21', NULL, '58.145.190.239', '2022-03-03 14:10:36', 111, '103.135.90.26'),
(180, 296, 'ইকবাল হোসেন', '01818404047', 1997, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-03 18:33:53\",\"updated_by\":110,\"updated_ip\":\"202.181.18.227\"}', 1, '2022-03-03 18:30:20', NULL, '202.181.18.227', '2022-03-03 12:33:53', 110, '202.181.18.227'),
(181, 297, 'আবদুর লতিফ', '01784517003', 1997, 110, NULL, '1815129512', '01815129512', '1000.00', 2, '{\"updated_at\":\"2022-03-03 18:33:44\",\"updated_by\":110,\"updated_ip\":\"202.181.18.227\"}', 1, '2022-03-03 18:31:58', NULL, '202.181.18.227', '2022-03-03 12:33:44', 110, '202.181.18.227'),
(182, 298, 'রেজিয়া চৌধুরী লিপি', '01622720543', 1989, 110, NULL, '09876543211', '09876543211', '10000.00', 2, '{\"updated_at\":\"2022-03-03 19:07:44\",\"updated_by\":110,\"updated_ip\":\"202.181.18.227\"}', 1, '2022-03-03 19:07:11', NULL, '202.181.18.227', '2022-03-03 13:07:44', 110, '202.181.18.227'),
(183, 299, 'সরোয়ার জাহান', '01671686862', 2001, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-03 19:47:59\",\"updated_by\":110,\"updated_ip\":\"202.181.18.227\"}', 1, '2022-03-03 19:40:50', NULL, '202.181.18.227', '2022-03-03 13:47:59', 110, '202.181.18.227'),
(184, 300, 'জাহিদুল হক চৌধুরী রিয়াজ', '01819841209', 2004, 110, NULL, '09876543211', '09876543211', '5000.00', 2, '{\"updated_at\":\"2022-03-03 19:47:50\",\"updated_by\":110,\"updated_ip\":\"202.181.18.227\"}', 1, '2022-03-03 19:43:03', NULL, '202.181.18.227', '2022-03-03 13:47:50', 110, '202.181.18.227'),
(185, 301, 'একরামুল হক', '01614142256', 2003, 110, NULL, '09876543211', '09876543211', '3000.00', 2, '{\"updated_at\":\"2022-03-03 19:47:35\",\"updated_by\":110,\"updated_ip\":\"202.181.18.227\"}', 1, '2022-03-03 19:46:30', NULL, '202.181.18.227', '2022-03-03 13:47:35', 110, '202.181.18.227'),
(186, 302, 'Nur Nobi Sskil', '01819962521', 2000, 111, NULL, '111', '01819962521', '500.00', 2, '{\"updated_at\":\"2022-03-03 20:10:44\",\"updated_by\":111,\"updated_ip\":\"103.135.90.26\"}', 1, '2022-03-03 20:09:55', NULL, '103.135.90.26', '2022-03-03 14:10:44', 111, '103.135.90.26'),
(187, 303, 'রুনা', '01633542350', 2002, 110, NULL, '09876543211', '09876553211', '1000.00', 2, '{\"updated_at\":\"2022-03-03 21:32:33\",\"updated_by\":110,\"updated_ip\":\"58.145.190.238\"}', 1, '2022-03-03 21:24:22', NULL, '58.145.190.238', '2022-03-03 15:32:33', 110, '58.145.190.238'),
(188, 304, 'জাহাঙ্গীর আলম', '01829343774', 1991, 110, NULL, '09876543211', '09876543211', '5000.00', 2, '{\"updated_at\":\"2022-03-03 21:32:26\",\"updated_by\":110,\"updated_ip\":\"58.145.190.238\"}', 1, '2022-03-03 21:26:22', NULL, '58.145.190.238', '2022-03-03 15:32:26', 110, '58.145.190.238'),
(189, 305, 'জামাল উদ্দিন', '01718379418', 1994, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-03 21:32:18\",\"updated_by\":110,\"updated_ip\":\"58.145.190.238\"}', 1, '2022-03-03 21:27:46', NULL, '58.145.190.238', '2022-03-03 15:32:18', 110, '58.145.190.238'),
(190, 306, 'আবদুর রহিম মানিক', '01718403285', 1990, 110, NULL, '09876544311', '09876543211', '3000.00', 2, '{\"updated_at\":\"2022-03-03 21:32:09\",\"updated_by\":110,\"updated_ip\":\"58.145.190.238\"}', 1, '2022-03-03 21:31:29', NULL, '58.145.190.238', '2022-03-03 15:32:09', 110, '58.145.190.238'),
(191, 307, 'দীপংকর নাথ', '01879762384', 2017, 108, NULL, '9C398262KV', '01961794981', '500.00', 2, '{\"updated_at\":\"2022-03-03 21:56:59\",\"updated_by\":108,\"updated_ip\":\"58.145.189.238\"}', 1, '2022-03-03 21:49:09', NULL, '58.145.189.238', '2022-03-03 15:56:59', 108, '58.145.189.238'),
(192, 308, 'আশরাফুল হাকিম পিয়াল', '01860456320', 2017, 108, NULL, '9C378199MX', '01961794981', '500.00', 2, '{\"updated_at\":\"2022-03-03 21:56:48\",\"updated_by\":108,\"updated_ip\":\"58.145.189.238\"}', 1, '2022-03-03 21:51:54', NULL, '58.145.189.238', '2022-03-03 15:56:48', 108, '58.145.189.238'),
(193, 309, 'Biplob Chandra Nath', '01819339740', 2000, 111, NULL, '111', '01819339740', '1000.00', 2, '{\"updated_at\":\"2022-03-03 21:55:19\",\"updated_by\":111,\"updated_ip\":\"103.135.90.26\"}', 1, '2022-03-03 21:52:48', NULL, '103.135.90.26', '2022-03-03 15:55:19', 111, '103.135.90.26'),
(194, 310, 'Md Baker', '01815594214', 2000, 111, NULL, '111', '01815594214', '1000.00', 2, '{\"updated_at\":\"2022-03-03 21:55:10\",\"updated_by\":111,\"updated_ip\":\"103.135.90.26\"}', 1, '2022-03-03 21:54:31', NULL, '103.135.90.26', '2022-03-03 15:55:10', 111, '103.135.90.26'),
(195, 311, 'মেহেদী হায়াত নিশাত', '01627009054', 2017, 108, NULL, '9C378199MX', '01961794981', '500.00', 2, '{\"updated_at\":\"2022-03-03 21:56:36\",\"updated_by\":108,\"updated_ip\":\"58.145.189.238\"}', 1, '2022-03-03 21:55:44', NULL, '58.145.189.238', '2022-03-03 15:56:36', 108, '58.145.189.238'),
(196, 312, 'Ranjit kumar nath', '01853247316', 2009, 109, NULL, '9bhklabu', '01853247316', '500.00', 2, '{\"updated_at\":\"2022-03-04 00:08:26\",\"updated_by\":109,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-03-04 00:02:22', NULL, '58.145.189.243', '2022-03-03 18:08:26', 109, '58.145.189.243'),
(197, 313, 'Iftekhar Ahmed', '01762628915', 1975, 109, NULL, '9bloicf', '01762628915', '8000.00', 2, '{\"updated_at\":\"2022-03-04 00:08:18\",\"updated_by\":109,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-03-04 00:03:45', NULL, '58.145.189.243', '2022-03-03 18:08:18', 109, '58.145.189.243'),
(198, 314, 'Tanni Roy', '01748189747', 2017, 109, NULL, '9Bhjlksa', '01748189747', '1000.00', 2, '{\"updated_at\":\"2022-03-04 00:08:06\",\"updated_by\":109,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-03-04 00:04:57', NULL, '58.145.189.243', '2022-03-03 18:08:06', 109, '58.145.189.243'),
(199, 315, 'Anwar Hossain', '01711147774', 1993, 109, NULL, '9Blartnm', '01711147774', '1000.00', 2, '{\"updated_at\":\"2022-03-04 00:07:57\",\"updated_by\":109,\"updated_ip\":\"58.145.189.243\"}', 1, '2022-03-04 00:06:15', NULL, '58.145.189.243', '2022-03-03 18:07:57', 109, '58.145.189.243'),
(200, 316, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', 2017, 108, NULL, '9C408C2WW4', '01961794981', '500.00', 3, '{\"updated_at\":\"2022-03-04 15:08:33\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-03-04 11:49:13', NULL, '58.145.188.234', '2022-03-04 09:08:33', 1, '103.205.71.20'),
(201, 317, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', 2017, 108, NULL, '9C408C2WW4', '01961794981', '500.00', 3, '{\"updated_at\":\"2022-03-04 15:08:28\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-03-04 11:51:43', NULL, '58.145.188.234', '2022-03-04 09:08:28', 1, '103.205.71.20'),
(202, 318, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', 2017, 108, NULL, '9C408C2WW4', '01961794981', '500.00', 3, '{\"updated_at\":\"2022-03-04 15:08:37\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-03-04 11:51:43', NULL, '58.145.188.234', '2022-03-04 09:08:37', 1, '103.205.71.20'),
(203, 319, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', 2017, 108, NULL, '9C408C2WW4', '01961794981', '500.00', 3, '{\"updated_at\":\"2022-03-04 15:08:19\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-03-04 11:51:44', NULL, '58.145.188.234', '2022-03-04 09:08:19', 1, '103.205.71.20'),
(204, 320, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', 2017, 108, NULL, '9C408C2WW4', '01961794981', '500.00', 2, '{\"updated_at\":\"2022-03-04 13:10:58\",\"updated_by\":108,\"updated_ip\":\"58.145.188.234\"}', 1, '2022-03-04 11:51:45', NULL, '58.145.188.234', '2022-03-04 07:10:58', 108, '58.145.188.234'),
(205, 321, 'মিঠুন দেব নাথ', '01811812777', 2003, 109, NULL, '9C4289CWWE', '01811812777', '1000.00', 3, '{\"updated_at\":\"2022-03-05 10:54:18\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-03-04 12:15:40', NULL, '103.230.104.32', '2022-03-05 04:54:18', 1, '103.205.71.20'),
(206, 322, 'বাপ্পি পাল', '01676174239', 2003, 109, NULL, '9C4289CWWE', '01811812777', '1000.00', 3, '{\"updated_at\":\"2022-03-05 10:54:25\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-03-04 12:16:42', NULL, '103.230.104.32', '2022-03-05 04:54:25', 1, '103.205.71.20'),
(207, 323, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', 2017, 108, NULL, '9C408C2WW4', '01961794981', '500.00', 2, '{\"updated_at\":\"2022-03-04 13:10:47\",\"updated_by\":108,\"updated_ip\":\"58.145.188.234\"}', 1, '2022-03-04 13:07:18', NULL, '58.145.188.234', '2022-03-04 07:10:47', 108, '58.145.188.234'),
(208, 324, 'আরিফ হোসেন রাজু', '01887033584', 2016, 108, NULL, '9C408OGZ98', '01887033584', '510.00', 2, '{\"updated_at\":\"2022-03-04 19:45:41\",\"updated_by\":108,\"updated_ip\":\"58.145.189.251\"}', 1, '2022-03-04 19:40:26', NULL, '58.145.189.235', '2022-03-04 13:45:41', 108, '58.145.189.251'),
(209, 325, 'MD. Enamul Kaisar', '01842797984', 2005, 111, NULL, '9C408T1DM2', '+8801842797984', '500.00', 2, '{\"updated_at\":\"2022-03-06 09:04:10\",\"updated_by\":111,\"updated_ip\":\"119.30.39.105\"}', 1, '2022-03-04 21:36:43', NULL, '58.145.189.228', '2022-03-06 03:04:10', 111, '119.30.39.105'),
(210, 326, 'Sujan', '01833217786', 2012, 109, NULL, '9bcdasm', '01833217786', '1000.00', 2, '{\"updated_at\":\"2022-03-05 07:50:51\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:13:54', NULL, '58.145.188.240', '2022-03-05 01:50:51', 109, '58.145.188.240'),
(211, 327, 'Provati', '01833217786', 2012, 109, NULL, '9bghyui', '01833217786', '500.00', 2, '{\"updated_at\":\"2022-03-05 07:50:26\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:15:57', NULL, '58.145.188.240', '2022-03-05 01:50:26', 109, '58.145.188.240'),
(212, 328, 'Niloy', '01936317279', 2012, 109, NULL, '9bklasb', '01936317279', '200.00', 2, '{\"updated_at\":\"2022-03-05 07:50:15\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:17:37', NULL, '58.145.188.240', '2022-03-05 01:50:15', 109, '58.145.188.240'),
(213, 329, 'Fahmi', '01833217786', 2012, 109, NULL, '9bmkit', '01833217786', '150.00', 2, '{\"updated_at\":\"2022-03-05 07:50:07\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:19:00', NULL, '58.145.188.240', '2022-03-05 01:50:07', 109, '58.145.188.240'),
(214, 330, 'Popy', '01833217786', 2012, 109, NULL, '9bhjlind', '01833217786', '300.00', 2, '{\"updated_at\":\"2022-03-05 07:50:00\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:20:17', NULL, '58.145.188.240', '2022-03-05 01:50:00', 109, '58.145.188.240'),
(215, 331, 'Jahangir', '01833217786', 2012, 109, NULL, '9bghdsa', '01833217786', '1000.00', 2, '{\"updated_at\":\"2022-03-05 07:49:36\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:22:11', NULL, '58.145.188.240', '2022-03-05 01:49:36', 109, '58.145.188.240'),
(216, 332, 'Mohona', '01833217786', 2012, 109, NULL, '9bghloi', '01833217786', '1000.00', 2, '{\"updated_at\":\"2022-03-05 07:49:23\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:23:35', NULL, '58.145.188.240', '2022-03-05 01:49:23', 109, '58.145.188.240'),
(217, 333, 'Eti Moni', '01815918104', 2012, 109, NULL, '9bdfwqv', '01815918104', '100.00', 2, '{\"updated_at\":\"2022-03-05 07:48:57\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:24:54', NULL, '58.145.188.240', '2022-03-05 01:48:57', 109, '58.145.188.240'),
(218, 334, 'Golam kibria', '01670019084', 2004, 109, NULL, '9bsazbm', '01670019084', '1500.00', 2, '{\"updated_at\":\"2022-03-05 07:48:14\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:26:34', NULL, '58.145.188.240', '2022-03-05 01:48:14', 109, '58.145.188.240'),
(219, 335, 'Mahibul Hasan', '01840111412', 2004, 109, NULL, '9Bfdsnb', '01840111412', '1000.00', 2, '{\"updated_at\":\"2022-03-05 07:48:06\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:28:38', NULL, '58.145.188.240', '2022-03-05 01:48:06', 109, '58.145.188.240'),
(220, 336, 'Md Sohel', '01883880397', 2006, 109, NULL, '9bfdsajkl', '01883880397', '2000.00', 2, '{\"updated_at\":\"2022-03-05 07:47:55\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:30:30', NULL, '58.145.188.240', '2022-03-05 01:47:55', 109, '58.145.188.240'),
(221, 337, 'Anwarul Hoque Khandaker Abu', '01829343774', 1991, 109, NULL, '9Bhjdasm', '01829343774', '5000.00', 2, '{\"updated_at\":\"2022-03-05 07:47:21\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:33:35', NULL, '58.145.188.240', '2022-03-05 01:47:21', 109, '58.145.188.240'),
(222, 338, 'Jahirul Hoque Khandaker', '01829343774', 1989, 109, NULL, '9bfwerl', '01829343774', '2000.00', 2, '{\"updated_at\":\"2022-03-05 07:46:57\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:35:47', NULL, '58.145.188.240', '2022-03-05 01:46:57', 109, '58.145.188.240'),
(223, 339, 'Bappi paul', '01676174239', 2003, 109, NULL, '9bghsewq', '01676174239', '1000.00', 2, '{\"updated_at\":\"2022-03-05 07:44:52\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:37:46', NULL, '58.145.188.240', '2022-03-05 01:44:52', 109, '58.145.188.240'),
(224, 340, 'Mithun Deb Nath', '01811812777', 2003, 109, NULL, '9bdfhgl', '01811812777', '1000.00', 2, '{\"updated_at\":\"2022-03-05 07:42:49\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 07:39:59', NULL, '58.145.188.240', '2022-03-05 01:42:49', 109, '58.145.188.240'),
(225, 341, 'Nerod Bhowmick', '01823532464', 2003, 109, NULL, '9C519FCFEB', '01811812777', '500.00', 3, '{\"updated_at\":\"2022-03-05 23:57:49\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-03-05 19:23:19', NULL, '103.230.104.59', '2022-03-05 17:57:49', 1, '103.205.71.20'),
(226, 342, 'Nerod Bhowmik', '01823532464', 2003, 109, NULL, '9C519FCFEB', '01811812777', '500.00', 3, '{\"updated_at\":\"2022-03-05 23:57:55\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-03-05 19:24:38', NULL, '103.230.104.59', '2022-03-05 17:57:55', 1, '103.205.71.20'),
(227, 343, 'Nerod Bhowmick', '01823532464', 2003, 109, NULL, '9C519FCFEB', '01811812777', '500.00', 2, '{\"updated_at\":\"2022-03-06 01:04:51\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-05 19:25:57', NULL, '103.230.104.59', '2022-03-05 19:04:51', 109, '58.145.188.240'),
(228, 344, 'ইপু', '+8801892980480', 2017, 108, NULL, '9C5697EK74', '01961794981', '300.00', 2, '{\"updated_at\":\"2022-03-05 22:26:09\",\"updated_by\":108,\"updated_ip\":\"58.145.189.253\"}', 1, '2022-03-05 22:23:09', NULL, '58.145.189.253', '2022-03-05 16:26:09', 108, '58.145.189.253'),
(229, 345, 'পার্থ মজুমদার', '01743918340', 2008, 108, NULL, '9C589MFKT8', '01743918340', '1000.00', 2, '{\"updated_at\":\"2022-03-05 22:25:54\",\"updated_by\":108,\"updated_ip\":\"58.145.189.253\"}', 1, '2022-03-05 22:25:03', NULL, '58.145.189.253', '2022-03-05 16:25:54', 108, '58.145.189.253'),
(230, 346, 'Mosharraf Hossain Miru', '01718403285', 1993, 109, NULL, '9cghxym', '01718403285', '10000.00', 2, '{\"updated_at\":\"2022-03-06 01:26:45\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:07:41', NULL, '58.145.188.240', '2022-03-05 19:26:45', 109, '58.145.188.240'),
(231, 347, 'Sahab Uddin', '01816725320', 2005, 109, NULL, '9copanj', '01816725320', '5000.00', 2, '{\"updated_at\":\"2022-03-06 01:26:30\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:09:07', NULL, '58.145.188.240', '2022-03-05 19:26:30', 109, '58.145.188.240'),
(232, 348, 'Md Sojib', '01816725320', 2005, 109, NULL, '9cfnoit', '01816725320', '1000.00', 2, '{\"updated_at\":\"2022-03-06 01:26:14\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:10:23', NULL, '58.145.188.240', '2022-03-05 19:26:14', 109, '58.145.188.240'),
(233, 349, 'Yeasin Mahmud', '01816725320', 2005, 109, NULL, '9cfamnz', '01816725320', '1000.00', 2, '{\"updated_at\":\"2022-03-06 01:25:56\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:12:49', NULL, '58.145.188.240', '2022-03-05 19:25:56', 109, '58.145.188.240'),
(234, 350, 'Babul chandra nath', '01816725320', 2005, 109, NULL, '9cfrewq', '01816725320', '1000.00', 2, '{\"updated_at\":\"2022-03-06 01:25:27\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:14:22', NULL, '58.145.188.240', '2022-03-05 19:25:27', 109, '58.145.188.240'),
(235, 351, 'Didarul Islam', '01816725320', 2005, 109, NULL, '9ghcdsa', '01816725320', '4000.00', 2, '{\"updated_at\":\"2022-03-06 01:25:17\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:15:42', NULL, '58.145.188.240', '2022-03-05 19:25:17', 109, '58.145.188.240'),
(236, 352, 'Sojib Bhuiyan', '01863658880', 2005, 109, NULL, '9cghjlm', '01863658880', '1200.00', 2, '{\"updated_at\":\"2022-03-06 01:25:00\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:17:23', NULL, '58.145.188.240', '2022-03-05 19:25:00', 109, '58.145.188.240'),
(237, 353, 'Rayhan', '01863658880', 2005, 109, NULL, '9cvbdajk', '01863658880', '1000.00', 2, '{\"updated_at\":\"2022-03-06 01:24:46\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:18:42', NULL, '58.145.188.240', '2022-03-05 19:24:46', 109, '58.145.188.240'),
(238, 354, 'Farjana Akter', '01863658880', 2005, 109, NULL, '9cghlabn', '01863658880', '500.00', 2, '{\"updated_at\":\"2022-03-06 01:24:37\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:20:08', NULL, '58.145.188.240', '2022-03-05 19:24:37', 109, '58.145.188.240'),
(239, 355, 'Kamrul Islam', '01863658880', 2005, 109, NULL, '9cghlabn', '01863658880', '1000.00', 2, '{\"updated_at\":\"2022-03-06 01:24:28\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:21:15', NULL, '58.145.188.240', '2022-03-05 19:24:28', 109, '58.145.188.240'),
(240, 356, 'Sonjoy Mojumder', '01863658880', 2005, 109, NULL, '9vbdcalk', '01863658880', '500.00', 2, '{\"updated_at\":\"2022-03-06 01:24:15\",\"updated_by\":109,\"updated_ip\":\"58.145.188.240\"}', 1, '2022-03-06 01:22:43', NULL, '58.145.188.240', '2022-03-05 19:24:15', 109, '58.145.188.240'),
(241, 357, 'Joynal Babul', '01819335256', 2000, 111, NULL, '111', '01819335256', '1000.00', 2, '{\"updated_at\":\"2022-03-06 09:15:07\",\"updated_by\":111,\"updated_ip\":\"119.30.39.105\"}', 1, '2022-03-06 09:06:24', NULL, '119.30.39.105', '2022-03-06 03:15:07', 111, '119.30.39.105'),
(242, 358, 'Dipankar Chandra Shil', '01609431566', 2000, 111, NULL, '111', '01609431566', '1000.00', 2, '{\"updated_at\":\"2022-03-06 09:15:01\",\"updated_by\":111,\"updated_ip\":\"119.30.39.105\"}', 1, '2022-03-06 09:07:43', NULL, '119.30.39.105', '2022-03-06 03:15:01', 111, '119.30.39.105'),
(243, 359, 'Johirul Alam', '01819335256', 2000, 111, NULL, '111', '01819335256', '1000.00', 2, '{\"updated_at\":\"2022-03-06 09:14:51\",\"updated_by\":111,\"updated_ip\":\"119.30.39.105\"}', 1, '2022-03-06 09:09:56', NULL, '119.30.39.105', '2022-03-06 03:14:51', 111, '119.30.39.105'),
(244, 360, 'Razu', '01810202040', 2000, 111, NULL, '111', '01810202040', '500.00', 2, '{\"updated_at\":\"2022-03-06 09:14:28\",\"updated_by\":111,\"updated_ip\":\"119.30.39.105\"}', 1, '2022-03-06 09:11:32', NULL, '119.30.39.105', '2022-03-06 03:14:28', 111, '119.30.39.105'),
(245, 361, 'Shek saifuddin Firoz', '01959301737', 2001, 111, NULL, '111', '01959301737', '1500.00', 2, '{\"updated_at\":\"2022-03-06 09:14:21\",\"updated_by\":111,\"updated_ip\":\"119.30.39.105\"}', 1, '2022-03-06 09:13:39', NULL, '119.30.39.105', '2022-03-06 03:14:21', 111, '119.30.39.105'),
(246, 362, 'আবু তালেব', '+8801812553332', 2008, 108, NULL, '9C619UOM7T', '+8801812553332', '1000.00', 2, '{\"updated_at\":\"2022-03-06 11:33:46\",\"updated_by\":108,\"updated_ip\":\"58.145.189.253\"}', 1, '2022-03-06 11:33:09', NULL, '58.145.189.253', '2022-03-06 05:33:46', 108, '58.145.189.253'),
(247, 363, 'Adnan bin Nahid', '01826688001', 2014, 109, NULL, '9cghajli', '01826688001', '1000.00', 2, '{\"updated_at\":\"2022-03-07 01:30:51\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 00:58:40', NULL, '202.181.18.250', '2022-03-06 19:30:51', 109, '202.181.18.250'),
(248, 364, 'Abdur Rahim', '01826688001', 2014, 109, NULL, '9cghalm', '01826688001', '1000.00', 2, '{\"updated_at\":\"2022-03-07 01:30:44\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:00:28', NULL, '202.181.18.250', '2022-03-06 19:30:44', 109, '202.181.18.250'),
(249, 365, 'Saharia Emon', '01826688001', 2014, 109, NULL, '9cghalk', '01826688101', '1000.00', 2, '{\"updated_at\":\"2022-03-07 01:30:38\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:03:19', NULL, '202.181.18.250', '2022-03-06 19:30:38', 109, '202.181.18.250'),
(250, 366, 'Omio Roy', '01826688001', 2014, 109, NULL, '9cvsadm', '01826688001', '500.00', 2, '{\"updated_at\":\"2022-03-07 01:30:29\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:04:55', NULL, '202.181.18.250', '2022-03-06 19:30:29', 109, '202.181.18.250'),
(251, 367, 'Anisha Akter', '01826688001', 2014, 109, NULL, '9cfhalbn', '01826688001', '500.00', 2, '{\"updated_at\":\"2022-03-07 01:30:20\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:06:31', NULL, '202.181.18.250', '2022-03-06 19:30:20', 109, '202.181.18.250'),
(252, 368, 'Shazzad hossain Tusher', '01826688001', 2014, 109, NULL, '9cvdlmq', '01826688001', '500.00', 2, '{\"updated_at\":\"2022-03-07 01:30:13\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:07:52', NULL, '202.181.18.250', '2022-03-06 19:30:13', 109, '202.181.18.250'),
(253, 369, 'Abu Saleh Nasim', '01826688001', 2014, 109, NULL, '9cvaypo', '01826688001', '1000.00', 2, '{\"updated_at\":\"2022-03-07 01:30:06\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:09:08', NULL, '202.181.18.250', '2022-03-06 19:30:06', 109, '202.181.18.250'),
(254, 370, 'No name', '01815327140', 2014, 109, NULL, '9cvdapoi', '01815327140', '500.00', 2, '{\"updated_at\":\"2022-03-07 01:29:59\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:10:28', NULL, '202.181.18.250', '2022-03-06 19:29:59', 109, '202.181.18.250'),
(255, 371, 'Monsur Alam', '01306254599', 2014, 109, NULL, '9cdaskl', '01306254599', '500.00', 2, '{\"updated_at\":\"2022-03-07 01:29:48\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:12:05', NULL, '202.181.18.250', '2022-03-06 19:29:48', 109, '202.181.18.250'),
(256, 372, 'Shalaa Uddin', '01819841209', 2004, 109, NULL, '9cvbdsal', '01819841209', '2000.00', 2, '{\"updated_at\":\"2022-03-07 01:29:36\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:13:28', NULL, '202.181.18.250', '2022-03-06 19:29:36', 109, '202.181.18.250'),
(257, 373, 'Amjad Hossain Tuhin', '01826688001', 1998, 109, NULL, '9cvbsaiy', '01826688001', '3000.00', 2, '{\"updated_at\":\"2022-03-07 01:29:22\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:14:50', NULL, '202.181.18.250', '2022-03-06 19:29:22', 109, '202.181.18.250'),
(258, 374, 'Sumon Chandra Nath', '01844041408', 1998, 109, NULL, '9cvasdlk', '01844041408', '2000.00', 2, '{\"updated_at\":\"2022-03-07 01:29:14\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:16:07', NULL, '202.181.18.250', '2022-03-06 19:29:14', 109, '202.181.18.250'),
(259, 375, 'Mohammad Jashim Uddin', '01815973256', 1998, 109, NULL, '9cvsatrem', '01815973256', '3000.00', 2, '{\"updated_at\":\"2022-03-07 01:29:07\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:17:29', NULL, '202.181.18.250', '2022-03-06 19:29:07', 109, '202.181.18.250'),
(260, 376, 'M.M Mahfuz khan jelin', '01815426040', 1995, 109, NULL, '9cvblajk', '01815426040', '2000.00', 2, '{\"updated_at\":\"2022-03-07 01:28:57\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:19:53', NULL, '202.181.18.250', '2022-03-06 19:28:57', 109, '202.181.18.250'),
(261, 377, 'Dalia Karim', '01762628915', 1987, 109, NULL, '9cfgjkld', '01762628915', '20000.00', 2, '{\"updated_at\":\"2022-03-07 01:28:49\",\"updated_by\":109,\"updated_ip\":\"202.181.18.250\"}', 1, '2022-03-07 01:28:17', NULL, '202.181.18.250', '2022-03-06 19:28:49', 109, '202.181.18.250'),
(262, 378, 'Ahamed Karim', '01713376520', 1975, 111, NULL, '9C72AWXIUY', '01819003611', '20400.00', 2, '{\"updated_at\":\"2022-03-07 17:16:10\",\"updated_by\":111,\"updated_ip\":\"37.111.214.167\"}', 1, '2022-03-07 16:29:32', NULL, '123.200.3.165', '2022-03-07 11:16:10', 111, '37.111.214.167'),
(263, 379, 'Jesmin Akter', '01757930586', 1992, 109, NULL, '9cvndaty', '01757930586', '1000.00', 2, '{\"updated_at\":\"2022-03-07 23:19:05\",\"updated_by\":109,\"updated_ip\":\"58.145.190.248\"}', 1, '2022-03-07 23:11:45', NULL, '58.145.190.248', '2022-03-07 17:19:05', 109, '58.145.190.248'),
(264, 380, 'Abu Raihan Shohag', '01757930586', 1990, 109, NULL, '9cfaert', '01757930586', '2000.00', 2, '{\"updated_at\":\"2022-03-07 23:18:57\",\"updated_by\":109,\"updated_ip\":\"58.145.190.248\"}', 1, '2022-03-07 23:14:28', NULL, '58.145.190.248', '2022-03-07 17:18:57', 109, '58.145.190.248'),
(265, 381, 'Sheikh Forid', '01817046144', 1990, 109, NULL, '9cfadjk', '01817046144', '2000.00', 2, '{\"updated_at\":\"2022-03-07 23:18:49\",\"updated_by\":109,\"updated_ip\":\"58.145.190.248\"}', 1, '2022-03-07 23:16:17', NULL, '58.145.190.248', '2022-03-07 17:18:49', 109, '58.145.190.248'),
(266, 382, 'মোশাররফ  উদ্দিন নাছিম', '01711303450', 1977, 110, NULL, '09876543211', '09876543211', '50000.00', 2, '{\"updated_at\":\"2022-03-08 00:14:31\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-07 23:23:39', NULL, '58.145.188.245', '2022-03-07 18:14:31', 110, '58.145.188.245'),
(267, 383, 'হিমাদ্রি দাস', '01711710152', 2001, 110, NULL, '90987654321', '09876543211', '500.00', 2, '{\"updated_at\":\"2022-03-08 00:16:22\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-07 23:50:53', NULL, '58.145.188.245', '2022-03-07 18:16:22', 110, '58.145.188.245'),
(268, 384, 'আনোয়ার হোসেন', '01711710152', 1993, 110, NULL, '00099888987', '09876544444', '1000.00', 2, '{\"updated_at\":\"2022-03-08 00:16:13\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-07 23:53:27', NULL, '58.145.188.245', '2022-03-07 18:16:13', 110, '58.145.188.245'),
(269, 385, 'আনোয়ার হোসেন', '01711710152', 1993, 110, NULL, '09876543211', '09876543211', '500.00', 2, '{\"updated_at\":\"2022-03-08 00:16:04\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-07 23:55:11', NULL, '58.145.188.245', '2022-03-07 18:16:04', 110, '58.145.188.245'),
(270, 386, 'ইন্দ্রলাল নাথ', '01711710152', 1993, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-08 00:15:50\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-07 23:57:01', NULL, '58.145.188.245', '2022-03-07 18:15:50', 110, '58.145.188.245'),
(271, 387, 'রতন চন্দ্র নাথ', '01672909211', 1995, 110, NULL, '09876543211', '09876543211', '500.00', 2, '{\"updated_at\":\"2022-03-08 00:15:39\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 00:00:58', NULL, '58.145.188.245', '2022-03-07 18:15:39', 110, '58.145.188.245'),
(272, 388, 'নিজাম উদ্দিন খোকা', '01613376543', 1989, 110, NULL, '09876543211', '09876543211', '3000.00', 2, '{\"updated_at\":\"2022-03-08 00:14:08\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 00:02:30', NULL, '58.145.188.245', '2022-03-07 18:14:08', 110, '58.145.188.245'),
(273, 389, 'আবুল খায়ের টিপু', '01873315454', 1989, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-08 00:13:50\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 00:05:14', NULL, '58.145.188.245', '2022-03-07 18:13:50', 110, '58.145.188.245'),
(274, 390, 'মজিবুল হক শিমুল', '01840676426', 1989, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-08 00:13:15\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 00:06:56', NULL, '58.145.188.245', '2022-03-07 18:13:15', 110, '58.145.188.245'),
(275, 391, 'মমিনুল হক ভূঁইয়া', '01711634424', 1981, 110, NULL, '09876543211', '09876543211', '50000.00', 2, '{\"updated_at\":\"2022-03-08 08:55:30\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 08:54:33', NULL, '58.145.188.245', '2022-03-08 02:55:30', 110, '58.145.188.245'),
(276, 392, 'শান্তনু দেব নাথ', '+8801815326627', 2008, 108, NULL, '9C86BFSYGC', '01893381305', '1000.00', 2, '{\"updated_at\":\"2022-03-08 09:17:47\",\"updated_by\":108,\"updated_ip\":\"58.145.188.227\"}', 1, '2022-03-08 09:16:19', NULL, '58.145.188.227', '2022-03-08 03:17:47', 108, '58.145.188.227'),
(277, 393, 'নুরুল আবেদিন', '016451563776', 1987, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-08 09:59:07\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 09:58:43', NULL, '58.145.188.245', '2022-03-08 03:59:07', 110, '58.145.188.245'),
(278, 394, 'শিমুল চন্দ্রনাথ', '01815129512', 1996, 110, NULL, '09876543211', '01509876543', '10000.00', 2, '{\"updated_at\":\"2022-03-08 10:03:08\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 10:02:41', NULL, '58.145.188.245', '2022-03-08 04:03:08', 110, '58.145.188.245'),
(279, 395, 'সালেহ উদ্দিন নাহিদ', '01791601468', 1986, 110, NULL, '09886543211', '09876543211', '10000.00', 2, '{\"updated_at\":\"2022-03-08 11:19:42\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 11:19:16', NULL, '58.145.188.245', '2022-03-08 05:19:42', 110, '58.145.188.245'),
(280, 396, 'ওবায়দুর রহমান', '01817770736', 1997, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-08 16:25:00\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 16:19:55', NULL, '58.145.188.245', '2022-03-08 10:25:00', 110, '58.145.188.245'),
(281, 397, 'মশিউর রহমান', '01842803041', 1997, 110, NULL, '09876543211', '09876543311', '1000.00', 2, '{\"updated_at\":\"2022-03-08 16:24:44\",\"updated_by\":110,\"updated_ip\":\"58.145.188.245\"}', 1, '2022-03-08 16:23:30', NULL, '58.145.188.245', '2022-03-08 10:24:44', 110, '58.145.188.245'),
(282, 398, 'কামাল উদ্দিন', '01815129512', 1997, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-08 23:25:40\",\"updated_by\":110,\"updated_ip\":\"58.145.188.248\"}', 1, '2022-03-08 16:36:09', NULL, '58.145.188.245', '2022-03-08 17:25:40', 110, '58.145.188.248'),
(283, 399, 'আবুল হোসেন', '01818958182', 1977, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-08 18:38:18\",\"updated_by\":110,\"updated_ip\":\"58.145.189.230\"}', 1, '2022-03-08 18:37:50', NULL, '58.145.189.230', '2022-03-08 12:38:18', 110, '58.145.189.230'),
(284, 400, 'শামসুন নাহার মলি', '01823581534', 2008, 108, NULL, '9C87BH85C9', '01823581534', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:09:30\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 22:44:24', NULL, '58.145.189.242', '2022-03-08 18:09:30', 108, '58.145.189.242'),
(285, 401, 'নূর নাহার জলি', '01676131282', 2006, 108, NULL, '9C87BH85C9', '01823581534', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:09:22\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 22:47:00', NULL, '58.145.189.242', '2022-03-08 18:09:22', 108, '58.145.189.242'),
(286, 402, 'মো: ফারুক', '01812818276', 2011, 108, NULL, 'ক্যাশ পেলাম', '01812818276', '1000.00', 2, '{\"updated_at\":\"2022-03-09 00:09:13\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 22:48:28', NULL, '58.145.189.242', '2022-03-08 18:09:13', 108, '58.145.189.242'),
(287, 403, 'সরোজ', '01819724836', 2011, 108, NULL, 'ক্যাশ পেলাম', '01819724836', '1000.00', 2, '{\"updated_at\":\"2022-03-09 00:09:00\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 22:50:25', NULL, '58.145.189.242', '2022-03-08 18:09:00', 108, '58.145.189.242'),
(288, 404, 'আবদুল্লাহ আল আজিজ', '01644222029', 2011, 108, NULL, 'ক্যাশ পেলাম', '01644222029', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:08:52\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:01:55', NULL, '58.145.189.242', '2022-03-08 18:08:52', 108, '58.145.189.242'),
(289, 405, 'তানভীর হাসান', '01819724836', 2011, 108, NULL, 'ক্যাশ পেলাম', '01819724836', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:08:42\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:03:03', NULL, '58.145.189.242', '2022-03-08 18:08:42', 108, '58.145.189.242'),
(290, 406, 'নজরুল ইসলাম', '01822308734', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:08:28\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:05:53', NULL, '58.145.189.242', '2022-03-08 18:08:28', 108, '58.145.189.242'),
(291, 407, 'লুবনা আক্তার', '01858170545', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:08:20\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:06:49', NULL, '58.145.189.242', '2022-03-08 18:08:20', 108, '58.145.189.242'),
(292, 408, 'রুপম দত্ত', '01837617374', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '1000.00', 2, '{\"updated_at\":\"2022-03-09 00:08:11\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:07:49', NULL, '58.145.189.242', '2022-03-08 18:08:11', 108, '58.145.189.242'),
(293, 409, 'হেলাল উদ্দিন', '01612291930', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:08:03\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:09:00', NULL, '58.145.189.242', '2022-03-08 18:08:03', 108, '58.145.189.242'),
(294, 410, 'আবু জায়েদ মুরাদ', '01839013997', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:07:56\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:10:21', NULL, '58.145.189.242', '2022-03-08 18:07:56', 108, '58.145.189.242'),
(295, 411, 'জাবেদ হোসেন', '01824549498', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '1000.00', 2, '{\"updated_at\":\"2022-03-09 00:07:44\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:11:15', NULL, '58.145.189.242', '2022-03-08 18:07:44', 108, '58.145.189.242'),
(296, 412, 'নিপু চন্দ্র নাথ', '01832657594', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:07:34\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:13:24', NULL, '58.145.189.242', '2022-03-08 18:07:34', 108, '58.145.189.242'),
(297, 413, 'নাজমুল হক', '01845512711', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:07:26\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:14:20', NULL, '58.145.189.242', '2022-03-08 18:07:26', 108, '58.145.189.242'),
(298, 414, 'পেয়ার আহম্মদ', '01817773234', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:07:15\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:15:17', NULL, '58.145.189.242', '2022-03-08 18:07:15', 108, '58.145.189.242'),
(299, 415, 'মো: ইউসুফ', '01989770147', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '200.00', 2, '{\"updated_at\":\"2022-03-09 00:07:04\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:16:25', NULL, '58.145.189.242', '2022-03-08 18:07:04', 108, '58.145.189.242'),
(300, 416, 'জামশেদ পাটোয়ারী', '01825293224', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:06:53\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:17:16', NULL, '58.145.189.242', '2022-03-08 18:06:53', 108, '58.145.189.242'),
(301, 417, 'নাজিম মাহমুদ', '01629010783', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:06:41\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:18:14', NULL, '58.145.189.242', '2022-03-08 18:06:41', 108, '58.145.189.242'),
(302, 418, 'বাবলু নাথ', '01740936013', 1997, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-08 23:25:56\",\"updated_by\":110,\"updated_ip\":\"58.145.188.248\"}', 1, '2022-03-08 23:22:03', NULL, '58.145.188.248', '2022-03-08 17:25:56', 110, '58.145.188.248'),
(303, 419, 'আমিরুল ইসলাম টিপু', '01919201018', 2011, 108, NULL, 'ক্যাশ পেলাম', '01919201018', '1000.00', 2, '{\"updated_at\":\"2022-03-09 00:06:30\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:23:47', NULL, '58.145.189.242', '2022-03-08 18:06:30', 108, '58.145.189.242'),
(304, 420, 'নাহিয়ান বাবু', '01824549498', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '1000.00', 2, '{\"updated_at\":\"2022-03-09 00:06:21\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:24:44', NULL, '58.145.189.242', '2022-03-08 18:06:21', 108, '58.145.189.242'),
(305, 421, 'জামিল হোসেন', '01830319732', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:06:02\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:25:50', NULL, '58.145.189.242', '2022-03-08 18:06:02', 108, '58.145.189.242'),
(306, 422, 'মোফাজ্জল হক', '01765809156', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '1000.00', 2, '{\"updated_at\":\"2022-03-09 00:05:48\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:26:54', NULL, '58.145.189.242', '2022-03-08 18:05:48', 108, '58.145.189.242'),
(307, 423, 'নাহিদুল ইসলাম', '01825747641', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:05:38\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:28:03', NULL, '58.145.189.242', '2022-03-08 18:05:38', 108, '58.145.189.242'),
(308, 424, 'মাহফুজ', '01850628625', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:05:28\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-08 23:29:09', NULL, '58.145.189.242', '2022-03-08 18:05:28', 108, '58.145.189.242'),
(309, 425, 'সজীব', '01824549498', 2011, 108, NULL, 'ক্যাশ পেলাম', '01824549498', '500.00', 2, '{\"updated_at\":\"2022-03-09 00:05:13\",\"updated_by\":108,\"updated_ip\":\"58.145.189.242\"}', 1, '2022-03-09 00:04:21', NULL, '58.145.189.242', '2022-03-08 18:05:13', 108, '58.145.189.242'),
(310, 426, 'Afzalur Rahaman', '01718403285', 1992, 109, NULL, '2457899', '97643208781', '2000.00', 2, '{\"updated_at\":\"2022-03-09 02:18:49\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 00:57:28', NULL, '58.145.189.231', '2022-03-08 20:18:49', 109, '58.145.189.231'),
(311, 427, 'Samir Bhowmick', '01812865203', 2001, 109, NULL, '3578884311', '01321000999', '700.00', 2, '{\"updated_at\":\"2022-03-09 02:18:38\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 00:58:54', NULL, '58.145.189.231', '2022-03-08 20:18:38', 109, '58.145.189.231'),
(312, 428, 'Mizanur Rahman Polash', '01716449275', 1991, 109, NULL, '2457899', '01800000000', '2000.00', 2, '{\"updated_at\":\"2022-03-09 02:18:24\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:00:45', NULL, '58.145.189.231', '2022-03-08 20:18:24', 109, '58.145.189.231'),
(313, 429, 'Abdul Hai', '01741661066', 1997, 109, NULL, '8906432', '01741661066', '10000.00', 2, '{\"updated_at\":\"2022-03-09 02:18:13\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:02:08', NULL, '58.145.189.231', '2022-03-08 20:18:13', 109, '58.145.189.231'),
(314, 430, 'Md Selim', '01824471471', 1999, 109, NULL, 'Utwevhjok', '01824471471', '10000.00', 2, '{\"updated_at\":\"2022-03-09 02:18:04\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:03:24', NULL, '58.145.189.231', '2022-03-08 20:18:04', 109, '58.145.189.231'),
(315, 431, 'Mosaraf Hossain', '01824471471', 1999, 109, NULL, 'Trwvnnjfx', '01824471471', '5000.00', 2, '{\"updated_at\":\"2022-03-09 02:17:38\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:04:50', NULL, '58.145.189.231', '2022-03-08 20:17:38', 109, '58.145.189.231'),
(316, 432, 'Omar Faruk', '01817772310', 1999, 109, NULL, '3157789', '01817772310', '2000.00', 2, '{\"updated_at\":\"2022-03-09 02:17:27\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:05:57', NULL, '58.145.189.231', '2022-03-08 20:17:27', 109, '58.145.189.231'),
(317, 433, 'Bikrom kumar paul', '01824471471', 1999, 109, NULL, '64277899', '01824471471', '3000.00', 2, '{\"updated_at\":\"2022-03-09 02:17:20\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:07:00', NULL, '58.145.189.231', '2022-03-08 20:17:20', 109, '58.145.189.231'),
(318, 434, 'Yousuf Alam', '01815601994', 1999, 109, NULL, '3211578', '01815601994', '1000.00', 2, '{\"updated_at\":\"2022-03-09 02:17:11\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:08:07', NULL, '58.145.189.231', '2022-03-08 20:17:11', 109, '58.145.189.231'),
(319, 435, 'Abdullah Al Mamun', '01819636315', 1999, 109, NULL, '4239999', '01819636315', '2000.00', 2, '{\"updated_at\":\"2022-03-09 02:16:59\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:09:22', NULL, '58.145.189.231', '2022-03-08 20:16:59', 109, '58.145.189.231'),
(320, 436, 'Sarwar Alam', '01824471471', 1999, 109, NULL, '4327889', '01824471471', '2000.00', 2, '{\"updated_at\":\"2022-03-09 02:16:49\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:10:27', NULL, '58.145.189.231', '2022-03-08 20:16:49', 109, '58.145.189.231'),
(321, 437, 'Emdadul Haque Swapon', '01824471471', 1999, 109, NULL, '7534799', '01824471471', '1500.00', 2, '{\"updated_at\":\"2022-03-09 02:16:39\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:12:04', NULL, '58.145.189.231', '2022-03-08 20:16:39', 109, '58.145.189.231'),
(322, 438, 'Rajib chandra Paul', '01824471471', 1999, 109, NULL, '4321688', '01824471471', '1000.00', 2, '{\"updated_at\":\"2022-03-09 02:16:32\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:13:28', NULL, '58.145.189.231', '2022-03-08 20:16:32', 109, '58.145.189.231'),
(323, 439, 'Shipon Chandra Bhowmik', '01824471471', 1999, 109, NULL, '5424799', '01824471471', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:16:22\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:16:12', NULL, '58.145.189.231', '2022-03-08 20:16:22', 109, '58.145.189.231'),
(324, 440, 'Benu lal Nath', '01824471471', 1999, 109, NULL, '5324799', '01824471471', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:16:12\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:18:02', NULL, '58.145.189.231', '2022-03-08 20:16:12', 109, '58.145.189.231'),
(325, 441, 'Khaleda Akter', '01817772310', 1999, 109, NULL, '5314899', '01817772310', '7000.00', 2, '{\"updated_at\":\"2022-03-09 02:16:04\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:19:21', NULL, '58.145.189.231', '2022-03-08 20:16:04', 109, '58.145.189.231'),
(326, 442, 'Sumon Chandra Nath', '01854975329', 1999, 109, NULL, '8629909', '01854975329', '1000.00', 2, '{\"updated_at\":\"2022-03-09 02:15:55\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:21:06', NULL, '58.145.189.231', '2022-03-08 20:15:55', 109, '58.145.189.231'),
(327, 443, 'Sujon Chandra Nath', '01876035120', 1999, 109, NULL, '538899642', '01876035120', '2000.00', 2, '{\"updated_at\":\"2022-03-09 02:15:42\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:22:42', NULL, '58.145.189.231', '2022-03-08 20:15:42', 109, '58.145.189.231'),
(328, 444, 'Liton Chandra Nath', '01854975329', 1999, 109, NULL, '52299368', '01854975329', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:15:23\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:24:05', NULL, '58.145.189.231', '2022-03-08 20:15:23', 109, '58.145.189.231'),
(329, 445, 'No Name', '01824471471', 1999, 109, NULL, '42899528', '01824471471', '1000.00', 2, '{\"updated_at\":\"2022-03-09 02:15:12\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:25:29', NULL, '58.145.189.231', '2022-03-08 20:15:12', 109, '58.145.189.231'),
(330, 446, 'Priodon Chandra Nath', '01819145841', 1999, 109, NULL, '528931169', '01819145841', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:15:04\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:26:59', NULL, '58.145.189.231', '2022-03-08 20:15:04', 109, '58.145.189.231'),
(331, 447, 'Shukanto Shekhor Nath', '01863426252', 1999, 109, NULL, '47846909', '01863426252', '1000.00', 2, '{\"updated_at\":\"2022-03-09 02:14:52\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:28:26', NULL, '58.145.189.231', '2022-03-08 20:14:52', 109, '58.145.189.231'),
(332, 448, 'Arian Riad', '01634227443', 1999, 109, NULL, '647999', '01634227443', '1000.00', 3, '{\"updated_at\":\"2022-03-09 22:12:21\",\"updated_by\":1,\"updated_ip\":\"103.205.71.20\"}', 1, '2022-03-09 01:31:48', NULL, '58.145.189.231', '2022-03-09 16:12:21', 1, '103.205.71.20'),
(333, 449, 'Abdur Rahim', '01634227443', 2015, 109, NULL, '6424789', '01634227443', '1000.00', 2, '{\"updated_at\":\"2022-03-09 02:14:44\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:34:49', NULL, '58.145.189.231', '2022-03-08 20:14:44', 109, '58.145.189.231'),
(334, 450, 'Shorav Chowdhury', '01634227443', 2015, 109, NULL, '6425800632', '01634227443', '1000.00', 2, '{\"updated_at\":\"2022-03-09 02:14:34\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:36:10', NULL, '58.145.189.231', '2022-03-08 20:14:34', 109, '58.145.189.231'),
(335, 451, 'Hrdoy', '01635227443', 2015, 109, NULL, '32256788', '01634227443', '1000.00', 2, '{\"updated_at\":\"2022-03-09 02:14:23\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:37:58', NULL, '58.145.189.231', '2022-03-08 20:14:23', 109, '58.145.189.231'),
(336, 452, 'Nazmul Haider', '01634227443', 2015, 109, NULL, '424789997', '01634227443', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:14:14\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:39:13', NULL, '58.145.189.231', '2022-03-08 20:14:14', 109, '58.145.189.231'),
(337, 453, 'Farhad Robin', '01635227443', 2015, 109, NULL, '332795258', '01634227443', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:13:58\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:40:10', NULL, '58.145.189.231', '2022-03-08 20:13:58', 109, '58.145.189.231'),
(338, 454, 'Rakibul Hasan', '01634227443', 2015, 109, NULL, '615995379', '01634227443', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:13:39\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:41:37', NULL, '58.145.189.231', '2022-03-08 20:13:39', 109, '58.145.189.231'),
(339, 455, 'Nayan Bhowmick', '01634227443', 2015, 109, NULL, '83169632', '01634227443', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:13:31\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:43:03', NULL, '58.145.189.231', '2022-03-08 20:13:31', 109, '58.145.189.231'),
(340, 456, 'Jony Alam', '01634227443', 2015, 109, NULL, '631806', '01634227443', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:13:24\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:44:02', NULL, '58.145.189.231', '2022-03-08 20:13:24', 109, '58.145.189.231');
INSERT INTO `donarinfos` (`id`, `user_id`, `name`, `mobileNumber`, `sscBatch`, `sendNumber`, `donationBy`, `TransactionID`, `TransactionMobileNumber`, `donationAmount`, `approvedStatus`, `processInfo`, `isActive`, `created_at`, `created_by`, `created_ip`, `updated_at`, `updated_by`, `updated_ip`) VALUES
(341, 457, 'Shaba', '01634227443', 2015, 109, NULL, '627906074', '01634228443', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:13:13\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:45:03', NULL, '58.145.189.231', '2022-03-08 20:13:13', 109, '58.145.189.231'),
(342, 458, 'Prapti', '01634227443', 2015, 109, NULL, '31799289', '01634227443', '500.00', 2, '{\"updated_at\":\"2022-03-09 02:13:02\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:46:00', NULL, '58.145.189.231', '2022-03-08 20:13:02', 109, '58.145.189.231'),
(343, 459, 'Pranto Das', '01634227443', 2015, 109, NULL, '74180621', '01634227443', '300.00', 2, '{\"updated_at\":\"2022-03-09 02:12:44\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:47:01', NULL, '58.145.189.231', '2022-03-08 20:12:44', 109, '58.145.189.231'),
(344, 460, 'Novel', '01634227443', 2015, 109, NULL, '72606314', '01635227443', '300.00', 2, '{\"updated_at\":\"2022-03-09 02:12:34\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:47:55', NULL, '58.145.189.231', '2022-03-08 20:12:34', 109, '58.145.189.231'),
(345, 461, 'Mofazzal Hossain', '01634227443', 2015, 109, NULL, '01634227443', '01634227443', '300.00', 2, '{\"updated_at\":\"2022-03-09 02:12:26\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:49:11', NULL, '58.145.189.231', '2022-03-08 20:12:26', 109, '58.145.189.231'),
(346, 462, 'Prince Saikat', '01634227443', 2015, 109, NULL, '63@9941', '01635227443', '300.00', 2, '{\"updated_at\":\"2022-03-09 02:12:18\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:50:14', NULL, '58.145.189.231', '2022-03-08 20:12:18', 109, '58.145.189.231'),
(347, 463, 'Emon', '01634227443', 2015, 109, NULL, '62480752', '01634227443', '300.00', 2, '{\"updated_at\":\"2022-03-09 02:12:07\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:51:11', NULL, '58.145.189.231', '2022-03-08 20:12:07', 109, '58.145.189.231'),
(348, 464, 'Ataul', '01634227443', 2015, 109, NULL, '25799631', '01634227443', '300.00', 2, '{\"updated_at\":\"2022-03-09 02:11:59\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:52:21', NULL, '58.145.189.231', '2022-03-08 20:11:59', 109, '58.145.189.231'),
(349, 465, 'Taposh', '01634227443', 2015, 109, NULL, '317900541', '01634227443', '300.00', 2, '{\"updated_at\":\"2022-03-09 02:11:49\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:53:09', NULL, '58.145.189.231', '2022-03-08 20:11:49', 109, '58.145.189.231'),
(350, 466, 'Hasnat', '01634227443', 2015, 109, NULL, '1752800', '01634227443', '300.00', 2, '{\"updated_at\":\"2022-03-09 02:11:34\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:54:01', NULL, '58.145.189.231', '2022-03-08 20:11:34', 109, '58.145.189.231'),
(351, 467, 'Sojib', '01634227443', 2015, 109, NULL, '62380042', '01634227443', '300.00', 2, '{\"updated_at\":\"2022-03-09 02:11:15\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:55:11', NULL, '58.145.189.231', '2022-03-08 20:11:15', 109, '58.145.189.231'),
(352, 468, 'Saiful', '01634227443', 2015, 109, NULL, '237007421', '01634227443', '200.00', 2, '{\"updated_at\":\"2022-03-09 02:11:09\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:56:14', NULL, '58.145.189.231', '2022-03-08 20:11:09', 109, '58.145.189.231'),
(353, 469, 'Nishat', '01634227443', 2015, 109, NULL, '62187529', '01634227443', '200.00', 2, '{\"updated_at\":\"2022-03-09 02:11:01\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:57:14', NULL, '58.145.189.231', '2022-03-08 20:11:01', 109, '58.145.189.231'),
(354, 470, 'Sabbir', '01634227443', 2015, 109, NULL, '517052178', '01634227443', '200.00', 2, '{\"updated_at\":\"2022-03-09 02:10:52\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:58:20', NULL, '58.145.189.231', '2022-03-08 20:10:52', 109, '58.145.189.231'),
(355, 471, 'No name', '01634227443', 2015, 109, NULL, '63167521', '01634227443', '200.00', 2, '{\"updated_at\":\"2022-03-09 02:10:39\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 01:59:20', NULL, '58.145.189.231', '2022-03-08 20:10:39', 109, '58.145.189.231'),
(356, 472, 'Arian Riad', '01634227443', 2015, 109, NULL, '74280742', '01634227443', '1000.00', 2, '{\"updated_at\":\"2022-03-09 02:22:11\",\"updated_by\":109,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-09 02:21:36', NULL, '58.145.189.231', '2022-03-08 20:22:11', 109, '58.145.189.231'),
(357, 473, 'Parul Akter', '01717030924', 1996, 111, NULL, '111', '01717030924', '2000.00', 2, '{\"updated_at\":\"2022-03-10 09:08:13\",\"updated_by\":111,\"updated_ip\":\"37.111.207.206\"}', 1, '2022-03-10 09:02:19', NULL, '37.111.207.206', '2022-03-10 03:08:13', 111, '37.111.207.206'),
(358, 474, 'Saddam Hossain Badal', '01717030924', 2001, 111, NULL, '111', '01717030924', '3000.00', 2, '{\"updated_at\":\"2022-03-10 09:08:05\",\"updated_by\":111,\"updated_ip\":\"37.111.207.206\"}', 1, '2022-03-10 09:03:20', NULL, '37.111.207.206', '2022-03-10 03:08:05', 111, '37.111.207.206'),
(359, 475, 'Farha Ulfat Nirjona', '01717030924', 2016, 111, NULL, '111', '01717030924', '1000.00', 2, '{\"updated_at\":\"2022-03-10 09:07:55\",\"updated_by\":111,\"updated_ip\":\"37.111.207.206\"}', 1, '2022-03-10 09:04:59', NULL, '37.111.207.206', '2022-03-10 03:07:55', 111, '37.111.207.206'),
(360, 476, 'Kazi Md Erfan', '01717192968', 2000, 111, NULL, '111', '01717192968', '3000.00', 2, '{\"updated_at\":\"2022-03-10 09:07:45\",\"updated_by\":111,\"updated_ip\":\"37.111.207.206\"}', 1, '2022-03-10 09:07:02', NULL, '37.111.207.206', '2022-03-10 03:07:45', 111, '37.111.207.206'),
(361, 477, 'সুমন চন্দ্র দাস', '+8801888739022', 2009, 108, NULL, 'ক্যাশ পেলাম', '+8801888739022', '1000.00', 2, '{\"updated_at\":\"2022-03-10 10:49:41\",\"updated_by\":108,\"updated_ip\":\"58.145.190.247\"}', 1, '2022-03-10 10:47:00', NULL, '58.145.190.247', '2022-03-10 04:49:41', 108, '58.145.190.247'),
(362, 478, 'নিশান চন্দ্র ভৌমিক', '+8801822478621', 2008, 108, NULL, 'ক্যাশ পেলাম', '+8801822478621', '500.00', 2, '{\"updated_at\":\"2022-03-10 10:49:48\",\"updated_by\":108,\"updated_ip\":\"58.145.190.247\"}', 1, '2022-03-10 10:49:06', NULL, '58.145.190.247', '2022-03-10 04:49:48', 108, '58.145.190.247'),
(363, 479, 'পলাশ চন্দ্র দেবনাথ', '01818489926', 2003, 110, NULL, '09876543211', '09876543211', '1000.00', 2, '{\"updated_at\":\"2022-03-10 11:24:31\",\"updated_by\":110,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-10 11:20:33', NULL, '58.145.189.231', '2022-03-10 05:24:31', 110, '58.145.189.231'),
(364, 480, 'আবু সাঈদ টিপু', '01762628915', 1986, 110, NULL, '09876543211', '09876543211', '2000.00', 2, '{\"updated_at\":\"2022-03-10 11:24:22\",\"updated_by\":110,\"updated_ip\":\"58.145.189.231\"}', 1, '2022-03-10 11:23:17', NULL, '58.145.189.231', '2022-03-10 05:24:22', 110, '58.145.189.231'),
(365, 481, 'Salah uddin', '01643537116', 2003, 111, NULL, '152203100007116', '01643537116', '1000.00', 2, '{\"updated_at\":\"2022-03-10 14:53:08\",\"updated_by\":111,\"updated_ip\":\"58.145.188.225\"}', 1, '2022-03-10 13:14:57', NULL, '103.146.134.7', '2022-03-10 08:53:08', 111, '58.145.188.225'),
(366, 482, 'সালাহ উদ্দীন সজীব', '01643537116', 2003, 111, NULL, '1522031000007113', '01643537116', '1000.00', 3, '{\"updated_at\":\"2022-03-10 16:52:51\",\"updated_by\":1,\"updated_ip\":\"103.221.253.227\"}', 1, '2022-03-10 13:17:09', NULL, '103.146.134.7', '2022-03-10 10:52:51', 1, '103.221.253.227'),
(367, 483, 'Taposh pual', '01670354857', 2004, 109, NULL, '9CA0DFOGO8', '01819841209', '1000.00', 2, '{\"updated_at\":\"2022-03-10 23:41:04\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-10 14:06:53', NULL, '103.155.184.158', '2022-03-10 17:41:04', 109, '202.181.18.243'),
(368, 484, 'Kapil Uddin', '01819841209', 2004, 109, NULL, '9CA0DFOGO8', '01819841209', '1000.00', 2, '{\"updated_at\":\"2022-03-10 23:40:55\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-10 14:08:19', NULL, '103.155.184.158', '2022-03-10 17:40:55', 109, '202.181.18.243'),
(369, 485, 'শাহাদাত হোসেন অনি', '01743918340', 2008, 108, NULL, '9CA7D6Q057', '01713264541', '1000.00', 2, '{\"updated_at\":\"2022-03-10 23:05:00\",\"updated_by\":108,\"updated_ip\":\"58.145.188.236\"}', 1, '2022-03-10 22:42:42', NULL, '58.145.188.239', '2022-03-10 17:05:00', 108, '58.145.188.236'),
(370, 486, 'জামশেদ আলম নিলয়', '+8801616701413', 2008, 108, NULL, '9CA9DPZLPP', '01919701413', '500.00', 2, '{\"updated_at\":\"2022-03-10 23:04:07\",\"updated_by\":108,\"updated_ip\":\"58.145.188.236\"}', 1, '2022-03-10 22:44:30', NULL, '58.145.188.239', '2022-03-10 17:04:07', 108, '58.145.188.236'),
(371, 487, 'A Al Mamun', '+8801837616244', 2007, 109, NULL, 'Bank Deposit', '+8801837616244', '10000.00', 2, '{\"updated_at\":\"2022-03-11 02:21:53\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:31:35', NULL, '182.48.95.110', '2022-03-10 20:21:53', 109, '202.181.18.243'),
(372, 488, 'Arfin Rimon', '+8801837616244', 2007, 109, NULL, 'Bank Deposit', '+8801837616244', '5000.00', 2, '{\"updated_at\":\"2022-03-11 02:21:47\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:34:08', NULL, '182.48.95.110', '2022-03-10 20:21:47', 109, '202.181.18.243'),
(373, 489, 'Sn Sahin', '+8801837616244', 2007, 109, NULL, 'Bank Deposit', '+8801837616244', '3000.00', 2, '{\"updated_at\":\"2022-03-11 02:21:40\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:36:19', NULL, '182.48.95.110', '2022-03-10 20:21:40', 109, '202.181.18.243'),
(374, 490, 'Mohammad Nahed Parvez', '01719325456', 2007, 109, NULL, 'Bank Deposite', '01837616244', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:21:30\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:40:03', NULL, '103.205.71.20', '2022-03-10 20:21:30', 109, '202.181.18.243'),
(375, 491, 'Nasir Uddin', '+8801837616244', 2007, 109, NULL, 'Bank Deposit', '01815973257', '2000.00', 2, '{\"updated_at\":\"2022-03-11 02:21:20\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:43:46', NULL, '182.48.95.110', '2022-03-10 20:21:20', 109, '202.181.18.243'),
(376, 492, 'Mehedi Sumon', '+8801837616244', 2007, 109, NULL, 'Bank Deposit', '01815973257', '2000.00', 2, '{\"updated_at\":\"2022-03-11 02:21:15\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:45:55', NULL, '182.48.95.110', '2022-03-10 20:21:15', 109, '202.181.18.243'),
(377, 493, 'MD Hasan Jony Jony', '+8801837616244', 2007, 109, NULL, 'Bank Deposit', '01815973257', '2000.00', 2, '{\"updated_at\":\"2022-03-11 02:21:10\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:47:34', NULL, '182.48.95.110', '2022-03-10 20:21:10', 109, '202.181.18.243'),
(378, 494, 'MD Mominul Sujan', '+8801837616244', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:21:04\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:50:22', NULL, '182.48.95.110', '2022-03-10 20:21:04', 109, '202.181.18.243'),
(379, 495, 'Riaz Islam', '+8801837616244', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1500.00', 2, '{\"updated_at\":\"2022-03-11 02:20:52\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:52:15', NULL, '182.48.95.110', '2022-03-10 20:20:52', 109, '202.181.18.243'),
(380, 496, 'Sohel Mahmud', '01815944577', 2007, 109, NULL, 'Bank Deposite', '01837616244', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:20:57\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:53:31', NULL, '103.205.71.20', '2022-03-10 20:20:57', 109, '202.181.18.243'),
(381, 497, 'Jewel', '01811313273', 2007, 109, NULL, 'Bank Deposite', '01837616244', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:20:44\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:54:29', NULL, '103.205.71.20', '2022-03-10 20:20:44', 109, '202.181.18.243'),
(382, 498, 'Linkon Feni', '01837616244', 2007, 109, NULL, 'Bank Deposite', '01837616244', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:20:38\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:55:22', NULL, '103.205.71.20', '2022-03-10 20:20:38', 109, '202.181.18.243'),
(383, 499, 'Md. Foysal Bhuiyan Manun', '01837616244', 2007, 109, NULL, 'Bank Deposite', '01837616244', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:20:29\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:56:17', NULL, '103.205.71.20', '2022-03-10 20:20:29', 109, '202.181.18.243'),
(384, 500, 'Md Saiduzzaman Siddique', '01711266531', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:20:24\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:56:18', NULL, '182.48.95.110', '2022-03-10 20:20:24', 109, '202.181.18.243'),
(385, 501, 'MD Ariful Islam', '01837616244', 2007, 109, NULL, 'Bank Deposite', '01837616244', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:20:19\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:56:51', NULL, '103.205.71.20', '2022-03-10 20:20:19', 109, '202.181.18.243'),
(386, 502, 'Nur Mohammad', '01837616244', 2007, 109, NULL, 'Bank Deposite', '01837616244', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:20:13\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:57:23', NULL, '103.205.71.20', '2022-03-10 20:20:13', 109, '202.181.18.243'),
(387, 503, 'Mayeen Uddin', '01837616244', 2007, 109, NULL, 'Bank Deposite', '01837616244', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:20:08\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:57:54', NULL, '103.205.71.20', '2022-03-10 20:20:08', 109, '202.181.18.243'),
(388, 504, 'Gias Gh', '01864014100', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:20:02\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:58:09', NULL, '182.48.95.110', '2022-03-10 20:20:02', 109, '202.181.18.243'),
(389, 505, 'Unnamed', '01837616244', 2007, 109, NULL, 'Bank Deposite', '01837616244', '500.00', 2, '{\"updated_at\":\"2022-03-11 02:19:57\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:58:30', NULL, '103.205.71.20', '2022-03-10 20:19:57', 109, '202.181.18.243'),
(390, 506, 'S M Asif', '01838750403', 2007, 109, NULL, 'Bank Deposite', '01837616244', '500.00', 2, '{\"updated_at\":\"2022-03-11 02:19:51\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 00:59:27', NULL, '103.205.71.20', '2022-03-10 20:19:51', 109, '202.181.18.243'),
(391, 507, 'M A Hanif', '01814254459', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:19:45\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:00:13', NULL, '182.48.95.110', '2022-03-10 20:19:45', 109, '202.181.18.243'),
(392, 508, 'Rana Khan', '01887037084', 2007, 109, NULL, 'Bank Deposite', '01837616244', '500.00', 2, '{\"updated_at\":\"2022-03-11 02:19:37\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:00:26', NULL, '103.205.71.20', '2022-03-10 20:19:37', 109, '202.181.18.243'),
(393, 509, 'Atik Ullah Bhuiyan Parvez', '01837616244', 2007, 109, NULL, 'Bank Deposite', '01837616244', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:19:25\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:01:14', NULL, '103.205.71.20', '2022-03-10 20:19:25', 109, '202.181.18.243'),
(394, 510, 'AH Munna Feni', '01866978626', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:19:14\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:03:18', NULL, '182.48.95.110', '2022-03-10 20:19:14', 109, '202.181.18.243'),
(395, 511, 'Dewan Rizon', '01870346988', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:19:09\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:05:09', NULL, '182.48.95.110', '2022-03-10 20:19:09', 109, '202.181.18.243'),
(396, 512, 'Md Saddam', '01825292998', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:19:01\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:06:53', NULL, '182.48.95.110', '2022-03-10 20:19:01', 109, '202.181.18.243'),
(397, 513, 'P Mithun', '01830274107', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:18:53\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:08:35', NULL, '182.48.95.110', '2022-03-10 20:18:53', 109, '202.181.18.243'),
(398, 514, 'Kishor Kumar Shom', '01875268454', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:18:47\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:10:52', NULL, '182.48.95.110', '2022-03-10 20:18:47', 109, '202.181.18.243'),
(399, 515, 'Gouranggo Nath', '01914474166', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:18:39\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:13:34', NULL, '182.48.95.110', '2022-03-10 20:18:39', 109, '202.181.18.243'),
(400, 516, 'Md Mizan', '+8801837616244', 2007, 109, NULL, 'Bank Deposit', '01815973257', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:18:34\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:15:22', NULL, '182.48.95.110', '2022-03-10 20:18:34', 109, '202.181.18.243'),
(401, 517, 'Amjad hossain sohel', '01854042391', 2013, 109, NULL, '6800727', '01854042391', '2000.00', 2, '{\"updated_at\":\"2022-03-11 02:18:16\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:46:04', NULL, '202.181.18.243', '2022-03-10 20:18:16', 109, '202.181.18.243'),
(402, 518, 'Md Elias', '01854042391', 2013, 109, NULL, '5229764', '01854042391', '2000.00', 2, '{\"updated_at\":\"2022-03-11 02:18:11\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:47:09', NULL, '202.181.18.243', '2022-03-10 20:18:11', 109, '202.181.18.243'),
(403, 519, 'Seikh Jabed Emran', '01854042391', 2013, 109, NULL, '4#998532', '01854042391', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:18:04\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:48:22', NULL, '202.181.18.243', '2022-03-10 20:18:04', 109, '202.181.18.243'),
(404, 520, 'Mejbah uddin Rana', '01854042391', 2013, 109, NULL, '532890', '01854042391', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:17:57\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:49:47', NULL, '202.181.18.243', '2022-03-10 20:17:57', 109, '202.181.18.243'),
(405, 521, 'Abdullah Al Nahid', '01854042391', 2013, 109, NULL, '743290', '01854042391', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:17:50\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:50:59', NULL, '202.181.18.243', '2022-03-10 20:17:50', 109, '202.181.18.243'),
(406, 522, 'Md Salauddin', '01854042391', 2013, 109, NULL, '7642111578', '01854042391', '500.00', 2, '{\"updated_at\":\"2022-03-11 02:17:45\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:52:09', NULL, '202.181.18.243', '2022-03-10 20:17:45', 109, '202.181.18.243'),
(407, 523, 'Kamrul Hasan', '01854042391', 2013, 109, NULL, '235689841', '01854042391', '500.00', 2, '{\"updated_at\":\"2022-03-11 02:17:38\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:53:23', NULL, '202.181.18.243', '2022-03-10 20:17:38', 109, '202.181.18.243'),
(408, 524, 'Abdullah Al Hossain', '01854042391', 2013, 109, NULL, '85311589', '01854042491', '500.00', 2, '{\"updated_at\":\"2022-03-11 02:17:33\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:54:31', NULL, '202.181.18.243', '2022-03-10 20:17:33', 109, '202.181.18.243'),
(409, 525, 'Khalid Hasan', '01854042391', 2013, 109, NULL, '96411689', '01854042391', '500.00', 2, '{\"updated_at\":\"2022-03-11 02:17:28\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:55:31', NULL, '202.181.18.243', '2022-03-10 20:17:28', 109, '202.181.18.243'),
(410, 526, 'Mohi Uddin', '01854042391', 2013, 109, NULL, '346789864', '01854042391', '500.00', 2, '{\"updated_at\":\"2022-03-11 02:17:21\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:57:11', NULL, '202.181.18.243', '2022-03-10 20:17:21', 109, '202.181.18.243'),
(411, 527, 'Prity Rani', '01854042391', 2013, 109, NULL, '75312680', '01854042391', '300.00', 2, '{\"updated_at\":\"2022-03-11 02:17:01\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:58:23', NULL, '202.181.18.243', '2022-03-10 20:17:01', 109, '202.181.18.243'),
(412, 528, 'Arif', '01854042391', 2013, 109, NULL, '6415900', '01854042391', '200.00', 2, '{\"updated_at\":\"2022-03-11 02:16:55\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 01:59:18', NULL, '202.181.18.243', '2022-03-10 20:16:55', 109, '202.181.18.243'),
(413, 529, 'No Name', '01854975329', 1999, 109, NULL, '9416800', '01854975329', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:16:47\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:00:27', NULL, '202.181.18.243', '2022-03-10 20:16:47', 109, '202.181.18.243'),
(414, 530, 'Md Fakhrul Islam', '01925177380', 1999, 109, NULL, '9731370', '01925177380', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:16:41\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:01:51', NULL, '202.181.18.243', '2022-03-10 20:16:41', 109, '202.181.18.243'),
(415, 531, 'Robiul Hoque', '01856696208', 2005, 109, NULL, '6421689', '01856696208', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:16:33\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:03:05', NULL, '202.181.18.243', '2022-03-10 20:16:33', 109, '202.181.18.243'),
(416, 532, 'Shahadeb Mozumdar', '01816725320', 2005, 109, NULL, '41689043', '01816725320', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:16:25\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:04:16', NULL, '202.181.18.243', '2022-03-10 20:16:25', 109, '202.181.18.243'),
(417, 533, 'Shamim Pavel', '01303760140', 2005, 109, NULL, '21900742', '01303760140', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:16:14\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:05:21', NULL, '202.181.18.243', '2022-03-10 20:16:14', 109, '202.181.18.243'),
(418, 534, 'Mohiuddin Dalim', '01846073085', 2005, 109, NULL, '763126890', '01846073085', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:16:05\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:06:44', NULL, '202.181.18.243', '2022-03-10 20:16:05', 109, '202.181.18.243'),
(419, 535, 'Abu Shahin', '01709990754', 1996, 109, NULL, '08613689', '01709990754', '5000.00', 2, '{\"updated_at\":\"2022-03-11 02:15:55\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:08:20', NULL, '202.181.18.243', '2022-03-10 20:15:55', 109, '202.181.18.243'),
(420, 536, 'Ajit Nath', '01887634928', 2009, 109, NULL, '6325890', '01887634928', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:15:46\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:09:39', NULL, '202.181.18.243', '2022-03-10 20:15:46', 109, '202.181.18.243'),
(421, 537, 'Jane Alam Mahi', '01819610807', 2006, 109, NULL, '71790085', '01819610807', '1000.00', 2, '{\"updated_at\":\"2022-03-11 02:15:37\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:10:46', NULL, '202.181.18.243', '2022-03-10 20:15:37', 109, '202.181.18.243'),
(422, 538, 'Bondona Rani Nath', '01575048733', 1996, 109, NULL, '852690', '01575048733', '2000.00', 2, '{\"updated_at\":\"2022-03-11 02:15:29\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:12:19', NULL, '202.181.18.243', '2022-03-10 20:15:29', 109, '202.181.18.243'),
(423, 539, 'Md Mohi Uddin Major', '01710433311', 1998, 109, NULL, '86313689', '01710433311', '500.00', 2, '{\"updated_at\":\"2022-03-11 02:15:22\",\"updated_by\":109,\"updated_ip\":\"202.181.18.243\"}', 1, '2022-03-11 02:14:10', NULL, '202.181.18.243', '2022-03-10 20:15:22', 109, '202.181.18.243'),
(424, 540, 'Liton Chandra Nath', '01638667983', 2000, 111, NULL, '112', '01638667983', '1000.00', 2, '{\"updated_at\":\"2022-03-11 11:11:22\",\"updated_by\":111,\"updated_ip\":\"103.135.90.29\"}', 1, '2022-03-11 11:10:36', NULL, '103.135.90.29', '2022-03-11 05:11:22', 111, '103.135.90.29'),
(425, 541, 'সুমন চন্দ্র দাস', '01841647284', 2004, 108, NULL, '9CB4EADOUI', '01819841209', '500.00', 2, '{\"updated_at\":\"2022-03-11 14:18:27\",\"updated_by\":108,\"updated_ip\":\"202.134.10.142\"}', 1, '2022-03-11 14:17:53', NULL, '202.134.10.142', '2022-03-11 08:18:27', 108, '202.134.10.142'),
(426, 542, 'ফারহান আক্তার', '01831655332', 2010, 108, NULL, 'Cash', '01831655332', '1000.00', 1, NULL, 1, '2022-03-11 15:40:27', NULL, '103.205.71.20', '2022-03-11 09:40:27', NULL, NULL),
(427, 543, 'নন্দিতা দাস', '01845408620', 2010, 108, NULL, 'Cash', '01845408620', '1000.00', 1, NULL, 1, '2022-03-11 15:41:31', NULL, '103.205.71.20', '2022-03-11 09:41:31', NULL, NULL),
(428, 544, 'পলাশ নাথ', '01932592803', 2010, 108, NULL, 'cash', '01932592803', '500.00', 1, NULL, 1, '2022-03-11 15:47:56', NULL, '103.205.71.20', '2022-03-11 09:47:56', NULL, NULL),
(429, 545, 'বোরহান উদ্দিন শিমুল', '01932592803', 2010, 108, NULL, 'cash', '01932592803', '1000.00', 1, NULL, 1, '2022-03-11 15:49:16', NULL, '103.205.71.20', '2022-03-11 09:49:16', NULL, NULL),
(430, 546, 'অন্তর রায়', '01830458976', 2010, 108, NULL, 'cash', '01830458976', '1000.00', 1, NULL, 1, '2022-03-11 15:50:03', NULL, '103.205.71.20', '2022-03-11 09:50:03', NULL, NULL),
(431, 547, 'জাহিদ মাসুদ', '01932592803', 2010, 108, NULL, 'cash', '01932592803', '1000.00', 1, NULL, 1, '2022-03-11 15:50:27', NULL, '103.205.71.20', '2022-03-11 09:50:27', NULL, NULL),
(432, 548, 'Abdul Sukkur', '01999843161', 2000, 111, NULL, '111', '01999843161', '500.00', 2, '{\"updated_at\":\"2022-03-11 15:51:51\",\"updated_by\":111,\"updated_ip\":\"37.111.198.243\"}', 1, '2022-03-11 15:50:59', NULL, '37.111.198.243', '2022-03-11 09:51:51', 111, '37.111.198.243'),
(433, 549, 'রুবেল কামাল উদ্দিন', '01932592803', 2010, 108, NULL, 'cash', '01932592803', '3000.00', 1, NULL, 1, '2022-03-11 15:51:07', NULL, '103.205.71.20', '2022-03-11 09:51:07', NULL, NULL),
(434, 550, 'মীর বোরহান', '01932592803', 2010, 108, NULL, 'cash', '01932592803', '1000.00', 1, NULL, 1, '2022-03-11 15:51:37', NULL, '103.205.71.20', '2022-03-11 09:51:37', NULL, NULL),
(435, 551, 'আব্দুল আজিজ', '01769556357', 2010, 108, NULL, 'cash', '01769556357', '1000.00', 1, NULL, 1, '2022-03-11 15:52:32', NULL, '103.205.71.20', '2022-03-11 09:52:32', NULL, NULL),
(436, 552, 'নজরুল ইসলাম শাকিল', '01682767521', 2010, 108, NULL, 'cash', '01682767521', '2000.00', 1, NULL, 1, '2022-03-11 15:53:33', NULL, '103.205.71.20', '2022-03-11 09:53:33', NULL, NULL),
(437, 553, 'Md. Omar Faruk (Shohag)', '01839707645', 2010, 108, NULL, 'cash', '01839707645', '4000.00', 1, NULL, 1, '2022-03-11 15:54:06', NULL, '103.205.71.20', '2022-03-11 09:54:06', NULL, NULL),
(438, 554, 'Saiful Islam', '01846665851', 2000, 111, NULL, '111', '01846665851', '1000.00', 2, '{\"updated_at\":\"2022-03-11 17:34:24\",\"updated_by\":111,\"updated_ip\":\"37.111.212.105\"}', 1, '2022-03-11 17:33:24', NULL, '37.111.212.105', '2022-03-11 11:34:24', 111, '37.111.212.105'),
(439, 555, 'Nimai Gowshami', '01730580571', 2002, 109, NULL, '73289653', '01730580571', '3000.00', 2, '{\"updated_at\":\"2022-03-12 01:05:32\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:46:54', NULL, '58.145.188.226', '2022-03-11 19:05:32', 109, '58.145.188.226'),
(440, 556, 'Sirajul Islam', '01730580571', 2002, 109, NULL, '4412699', '01730580571', '3000.00', 2, '{\"updated_at\":\"2022-03-12 01:05:27\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:48:40', NULL, '58.145.188.226', '2022-03-11 19:05:27', 109, '58.145.188.226'),
(441, 557, 'Md Harun', '01730580571', 2002, 109, NULL, '41267999', '01730580571', '2000.00', 2, '{\"updated_at\":\"2022-03-12 01:05:23\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:49:49', NULL, '58.145.188.226', '2022-03-11 19:05:23', 109, '58.145.188.226'),
(442, 558, 'Asaduzzaman', '01730580571', 2002, 109, NULL, '46899631', '01730580571', '2000.00', 2, '{\"updated_at\":\"2022-03-12 01:05:18\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:51:35', NULL, '58.145.188.226', '2022-03-11 19:05:18', 109, '58.145.188.226'),
(443, 559, 'Komol Chandra nath', '01730580571', 2002, 109, NULL, '97412589', '01730580571', '1000.00', 2, '{\"updated_at\":\"2022-03-12 01:05:10\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:52:46', NULL, '58.145.188.226', '2022-03-11 19:05:10', 109, '58.145.188.226'),
(444, 560, 'Belal Hossain', '01730580571', 2002, 109, NULL, '34799842', '01730580571', '1000.00', 2, '{\"updated_at\":\"2022-03-12 01:05:00\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:54:12', NULL, '58.145.188.226', '2022-03-11 19:05:00', 109, '58.145.188.226'),
(445, 561, 'Saddam Hossain', '01730580571', 2002, 109, NULL, '64227899', '01730580571', '1000.00', 2, '{\"updated_at\":\"2022-03-12 01:04:52\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:55:10', NULL, '58.145.188.226', '2022-03-11 19:04:52', 109, '58.145.188.226'),
(446, 562, 'Adv. Anwar hossain', '01812340600', 2001, 109, NULL, '7518909852', '01812340600', '2000.00', 2, '{\"updated_at\":\"2022-03-12 01:04:43\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:56:40', NULL, '58.145.188.226', '2022-03-11 19:04:43', 109, '58.145.188.226'),
(447, 563, 'Nantu Kumar Deb Nath', '01812340600', 2001, 109, NULL, '742147900', '01812340600', '2000.00', 2, '{\"updated_at\":\"2022-03-12 01:04:38\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:57:53', NULL, '58.145.188.226', '2022-03-11 19:04:38', 109, '58.145.188.226'),
(448, 564, 'Samir Bhowmick', '01812865203', 2001, 109, NULL, '31387489', '01812865203', '300.00', 2, '{\"updated_at\":\"2022-03-12 01:04:32\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 00:59:17', NULL, '58.145.188.226', '2022-03-11 19:04:32', 109, '58.145.188.226'),
(449, 565, 'Md Monsurul Alam Chowdhury', '01741661066', 1988, 109, NULL, '87521890', '01741661066', '3000.00', 2, '{\"updated_at\":\"2022-03-12 01:04:25\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 01:01:17', NULL, '58.145.188.226', '2022-03-11 19:04:25', 109, '58.145.188.226'),
(450, 566, 'Mojammel Hoque', '01829604201', 1988, 109, NULL, '97422689', '01829604201', '2000.00', 2, '{\"updated_at\":\"2022-03-12 01:04:06\",\"updated_by\":109,\"updated_ip\":\"58.145.188.226\"}', 1, '2022-03-12 01:02:47', NULL, '58.145.188.226', '2022-03-11 19:04:06', 109, '58.145.188.226'),
(451, 567, 'Aynoon Afroz Dola', '01892415363', 2010, 108, NULL, 'cash', '01892415363', '500.00', 1, NULL, 1, '2022-03-12 09:14:40', NULL, '103.205.71.20', '2022-03-12 03:14:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_participants_info`
--

CREATE TABLE `event_participants_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL DEFAULT 1,
  `name` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `addBy` int(11) UNSIGNED DEFAULT NULL,
  `batch` int(10) UNSIGNED DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '1=Male, 2=Female',
  `mobile` varchar(30) CHARACTER SET utf8 NOT NULL,
  `present_address` text CHARACTER SET utf8 DEFAULT NULL,
  `profession` int(11) DEFAULT NULL,
  `profession_details` text CHARACTER SET utf8 NOT NULL,
  `participantID` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `facebookLink` varchar(500) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `approved_status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Pending, 2=Approved, 3=Declined',
  `created_by` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_ip` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_ip` varchar(15) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_participants_info`
--

INSERT INTO `event_participants_info` (`id`, `event_id`, `name`, `addBy`, `batch`, `gender`, `mobile`, `present_address`, `profession`, `profession_details`, `participantID`, `image`, `facebookLink`, `is_active`, `approved_status`, `created_by`, `created_time`, `created_ip`, `updated_by`, `updated_at`, `updated_ip`) VALUES
(1, 1, 'Md Omar Faruk', NULL, 2021, 1, '01839707645', 'Feni, Dhaka', 1, 'tes', '202143667', '', 'sdd', 0, 2, 1, '2022-03-12 14:57:42', '::1', 1, '2022-03-12 15:59:15', ''),
(8, 1, 'Md Omar Faruk', NULL, 2022, 1, '01839707645', 'Feni, Dhaka', 1, 'tes', '202228229', '', 'sdd', 0, 2, 1, '2022-03-12 15:12:42', '::1', 1, '2022-03-12 15:59:20', ''),
(9, 1, '3', NULL, 2019, 1, '3', '3', 2, '3', '201967539', '', '3', 0, 2, 1, '2022-03-12 15:12:58', '::1', 1, '2022-03-12 15:59:11', ''),
(10, 1, 'Md Omar Faruk', NULL, 2019, 1, '01839707645', 'Lemua,  Feni Sadar, Feni', 2, '3', '202130933', '', '3', 0, 2, 1, '2022-03-12 15:18:49', '::1', 1, '2022-03-12 15:59:52', ''),
(12, 1, 'Md Omar Faruk', NULL, 2022, 1, '01839707645', NULL, 6, 'Dhak', '202261482', '', NULL, 1, 4, 1, '2022-03-12 16:07:44', '::1', 569, '2022-03-17 11:53:55', ''),
(13, 1, '150', NULL, 2010, 2, '01839707645', NULL, 5, 'hello the world', '201030920', '', NULL, 0, 4, 568, '2022-03-12 17:59:37', '::1', 569, '2022-03-17 12:03:08', ''),
(14, 1, 'te', NULL, 2010, 1, '018397076454', NULL, 5, 'e', '201023230', '', NULL, 0, 4, 1, '2022-03-15 03:06:18', '::1', 569, '2022-03-17 12:03:04', ''),
(15, 1, '5', NULL, 2010, 1, '5', NULL, 5, '55', '201054034', '', NULL, 0, 2, 1, '2022-03-15 03:17:30', '::1', 569, '2022-03-17 12:03:00', ''),
(16, 1, '3', NULL, 2019, 1, '3', NULL, 5, '3', '201994441', '', NULL, 1, 4, 1, '2022-03-15 03:18:40', '::1', 569, '2022-03-17 12:35:33', ''),
(17, 1, 'w', NULL, 2019, 1, '1111111111111', NULL, 5, 'w', '201998155', '', NULL, 0, 2, 569, '2022-03-17 11:24:16', '::1', 569, '2022-03-17 12:02:49', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_infos`
--

CREATE TABLE `invoice_infos` (
  `id` int(11) NOT NULL,
  `invoiceId` varchar(30) DEFAULT NULL,
  `transId` varchar(30) DEFAULT NULL,
  `applicantId` int(11) UNSIGNED DEFAULT NULL,
  `applicantRegCrg` decimal(10,2) DEFAULT NULL,
  `guestRegCrg` decimal(10,2) DEFAULT NULL,
  `totalRegCrg` decimal(10,2) DEFAULT NULL,
  `transactionPer` decimal(10,2) DEFAULT NULL,
  `transactionFeesAmnt` decimal(10,2) DEFAULT NULL,
  `netAmount` decimal(10,2) DEFAULT NULL,
  `paidAmnt` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_ip` varchar(15) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_ip` varchar(15) DEFAULT NULL,
  `isActive` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `paidStatus` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `city` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `country` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `address`, `gender`, `image`, `phone`, `dob`, `city`, `country`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'sd', '1', '/uploads/profile/1605888701_1_avatar.jpg', '01840239203', '2020-11-20 22:07:55', 'Dhaka', 'Bangladesh', '2020-11-20 16:07:55', '2020-11-20 16:11:41', NULL),
(2, 85, NULL, NULL, '/uploads/profile/avatar.jpg', NULL, NULL, NULL, NULL, '2020-12-05 06:27:19', '2020-12-05 06:27:19', NULL),
(3, 86, NULL, NULL, '/uploads/profile/avatar.jpg', NULL, NULL, NULL, NULL, '2020-12-14 02:57:03', '2020-12-14 02:57:03', NULL),
(4, 87, NULL, NULL, '/uploads/profile/avatar.jpg', NULL, NULL, NULL, NULL, '2020-12-14 03:03:17', '2020-12-14 03:03:17', NULL),
(5, 88, NULL, NULL, '/uploads/profile/avatar.jpg', NULL, NULL, NULL, NULL, '2021-02-03 20:29:50', '2021-02-03 20:29:50', NULL),
(6, 89, NULL, NULL, '/uploads/profile/avatar.jpg', NULL, NULL, NULL, NULL, '2021-02-03 20:43:03', '2021-02-03 20:43:03', NULL),
(7, 90, NULL, NULL, '/uploads/profile/avatar.jpg', NULL, NULL, NULL, NULL, '2021-02-15 16:16:33', '2021-02-15 16:16:33', NULL),
(8, 91, NULL, NULL, '/uploads/profile/avatar.jpg', NULL, NULL, NULL, NULL, '2021-04-27 15:46:11', '2021-04-27 15:46:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `registrationrecord`
--

CREATE TABLE `registrationrecord` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `applyType` tinyint(1) UNSIGNED DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `sscBatch` int(11) UNSIGNED DEFAULT NULL,
  `isFather` tinyint(1) UNSIGNED DEFAULT 1,
  `fatherHusbandName` varchar(250) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `occupation` int(10) UNSIGNED DEFAULT NULL,
  `workPlace` text DEFAULT NULL,
  `membershipId` bigint(20) UNSIGNED DEFAULT NULL,
  `tShirtSize` varchar(10) DEFAULT NULL,
  `picture` varchar(150) DEFAULT NULL,
  `approved_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Register, 2 = Invoice Generate, 3 = Payment Complete ',
  `class_name` int(11) UNSIGNED DEFAULT NULL,
  `roll_no` varchar(30) NOT NULL,
  `gender` tinyint(1) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_ip` varchar(15) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_ip` varchar(15) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registrationrecord`
--

INSERT INTO `registrationrecord` (`id`, `user_id`, `applyType`, `name`, `sscBatch`, `isFather`, `fatherHusbandName`, `address`, `occupation`, `workPlace`, `membershipId`, `tShirtSize`, `picture`, `approved_status`, `class_name`, `roll_no`, `gender`, `created_at`, `created_by`, `created_ip`, `updated_at`, `updated_by`, `updated_ip`, `is_active`) VALUES
(1, 571, NULL, 'd', 2019, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '', NULL, '2022-05-20 00:52:05', NULL, '::1', '2022-05-20 00:52:05', NULL, NULL, 1),
(2, 572, 1, 'Ariful Islam', 2011, 1, NULL, '#গ্রাম:            #পো:             # থানা: ফেনী সদর # জেলা: ফেনী ।', NULL, NULL, 201124790, NULL, '', 2, NULL, '', 1, '2022-05-21 04:29:59', 572, '::1', '2022-05-21 04:29:59', 572, '::1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reg_gust_infos`
--

CREATE TABLE `reg_gust_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `applicantId` int(11) UNSIGNED DEFAULT NULL,
  `ctg_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_ip` varchar(15) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reg_rate_chart`
--

CREATE TABLE `reg_rate_chart` (
  `id` int(11) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT 0.00,
  `type` tinyint(4) DEFAULT NULL COMMENT '1=Applicant,2=Family Member',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `created_ip` varchar(15) DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_time` int(11) DEFAULT NULL,
  `updated_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reg_rate_chart`
--

INSERT INTO `reg_rate_chart` (`id`, `title`, `amount`, `type`, `is_active`, `created_by`, `created_time`, `created_ip`, `updated_by`, `updated_time`, `updated_ip`) VALUES
(1, 'প্রাক্তন শিক্ষার্থী', '500.00', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'বর্তমান শিক্ষার্থী', '0.00', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'অতিথি', '500.00', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'পিতা', '500.00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'মা', '500.00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'স্বামী', '500.00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'স্ত্রী', '500.00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'সন্তান', '500.00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'ভাই', '500.00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'বোন', '500.00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'অন্যান্য', '500.00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_history`
--

CREATE TABLE `sms_history` (
  `id` bigint(20) NOT NULL,
  `donar_id` int(11) UNSIGNED DEFAULT NULL COMMENT 'table # users',
  `mobile_number` varchar(30) NOT NULL,
  `msg` text NOT NULL,
  `send_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=pending, 2=send comple',
  `success_status` tinyint(1) DEFAULT NULL COMMENT '1=success,=fail',
  `created_at` datetime NOT NULL,
  `is_resend_sms` tinyint(1) DEFAULT NULL,
  `is_resend_sms_date` datetime DEFAULT NULL,
  `ins_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_history`
--

INSERT INTO `sms_history` (`id`, `donar_id`, `mobile_number`, `msg`, `send_status`, `success_status`, `created_at`, `is_resend_sms`, `is_resend_sms_date`, `ins_by`, `updated_at`) VALUES
(110848, 123, '01839707645', 'Dear Md Omar Faruk (Test for SMS Sending), We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5.00 has been successfully received. ', 2, 1, '2022-02-08 02:30:32', NULL, NULL, 1, '2022-02-08 03:00:05'),
(110849, 121, '01824120761', 'Dear Nilufa Yesmin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10200.00 has been successfully received. ', 2, 1, '2022-02-08 23:14:20', NULL, NULL, 109, '2022-02-09 00:00:04'),
(110850, 122, '66553931608', 'Dear Belal, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-08 23:21:25', NULL, NULL, 110, '2022-02-09 00:00:05'),
(110851, 125, '+6584386550', 'Dear Robiul Hoque Shobuj, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5100.00 has been successfully received. ', 2, 1, '2022-02-09 00:57:50', NULL, NULL, 109, '2022-02-09 01:00:03'),
(110852, 124, '01824995355', 'Dear Palash Chandra Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-09 10:18:48', NULL, NULL, 111, '2022-02-09 11:00:05'),
(110853, 126, '01819841209', 'Dear নাম প্রকাশে অনিচ্ছুক (২০০৩), We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2020.00 has been successfully received. ', 2, 2, '2022-02-09 11:57:08', NULL, NULL, 108, '2022-02-09 19:34:25'),
(110854, 127, '01814376537', 'Dear আসাদুজ্জামান (আসাদ), We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2040.00 has been successfully received. ', 2, 1, '2022-02-09 17:59:13', NULL, NULL, 108, '2022-02-09 17:59:13'),
(110855, 128, '01819003611', 'Dear Md. Myeen Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2500.00 has been successfully received. ', 2, 1, '2022-02-09 18:51:25', NULL, NULL, 108, '2022-02-09 19:00:05'),
(110856, 130, '01869017735', 'Dear Azad, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-09 22:18:32', NULL, NULL, 109, '2022-02-09 23:00:05'),
(110857, 129, '01925177380', 'Dear Nirmal Das, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-09 22:18:41', NULL, NULL, 109, '2022-02-09 23:00:06'),
(110858, 132, '01824549498', 'Dear শরিফুল ইসলাম মুন্না, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1020.00 has been successfully received. ', 2, 2, '2022-02-10 12:47:12', NULL, NULL, 108, '2022-02-10 13:00:04'),
(110859, 134, '01169327724', 'Dear Noman Pintu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-10 19:58:56', NULL, NULL, 109, '2022-02-10 20:00:03'),
(110860, 138, '01815426040', 'Dear MIR REZAUL KARIM LELIN, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-10 20:08:47', NULL, NULL, 109, '2022-02-10 21:00:08'),
(110861, 137, '00968785750', 'Dear Pipul Bhowmik, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-10 20:08:58', NULL, NULL, 109, '2022-02-10 21:00:09'),
(110862, 136, '01619887867', 'Dear Debashish Bhowmick, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1020.00 has been successfully received. ', 2, 1, '2022-02-11 09:02:18', NULL, NULL, 111, '2022-02-11 10:00:08'),
(110863, 139, '01819086730', 'Dear Saiful Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-11 14:13:06', NULL, NULL, 111, '2022-02-11 15:00:03'),
(110864, 140, '60583862048', 'Dear আলাউদ্দিন মুন্না, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2040.00 has been successfully received. ', 2, 2, '2022-02-11 22:48:21', NULL, NULL, 108, '2022-02-11 23:00:05'),
(110865, 141, '01782563144', 'Dear শেখ ইমাম শরিফ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-12 15:20:37', NULL, NULL, 111, '2022-02-12 16:00:04'),
(110866, 145, '01919386831', 'Dear ডঃ শামছুদ্দিন ফরহাদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-02-12 15:27:31', NULL, NULL, 111, '2022-02-12 16:00:05'),
(110867, 146, '93284541573', 'Dear রায়হান উদ্দিন আহমেদ (রুবেল), We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-02-12 19:34:03', NULL, NULL, 110, '2022-02-12 20:00:03'),
(110868, 147, '01819610804', 'Dear Emran Patwary, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-12 20:11:43', NULL, NULL, 109, '2022-02-12 21:00:03'),
(110869, 150, '01815129512', 'Dear Nur Alam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-12 20:12:57', NULL, NULL, 110, '2022-02-12 21:00:04'),
(110870, 149, '01819647394', 'Dear Shahadat Hossain Bablu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-12 20:13:19', NULL, NULL, 110, '2022-02-12 21:00:06'),
(110871, 148, '01617745194', 'Dear Belal Hossain, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-12 20:13:30', NULL, NULL, 110, '2022-02-12 21:00:07'),
(110872, 151, '01854975329', 'Dear Ashish kumar paul, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-12 20:31:08', NULL, NULL, 109, '2022-02-12 21:00:08'),
(110873, 155, '01911511883', 'Dear ডাঃ বিশ্বজিৎ সুমন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-02-12 20:41:02', NULL, NULL, 110, '2022-02-12 21:00:09'),
(110874, 154, '01815129512', 'Dear Nur karim mitu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-12 20:41:18', NULL, NULL, 110, '2022-02-12 21:00:10'),
(110875, 153, '01727555800', 'Dear erfanul hoque nayon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-12 20:41:42', NULL, NULL, 110, '2022-02-12 21:00:11'),
(110876, 152, '01628942109', 'Dear Anamul hoque, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-12 20:42:14', NULL, NULL, 110, '2022-02-12 21:00:12'),
(110877, 156, '01815692330', 'Dear আলী হায়দার শিপন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-02-13 12:07:24', NULL, NULL, 110, '2022-02-13 13:00:07'),
(110878, 157, '01832057893', 'Dear Apu Chandra Bhowmick, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1020.00 has been successfully received. ', 2, 1, '2022-02-13 22:53:03', NULL, NULL, 108, '2022-02-13 23:00:04'),
(110879, 158, '01824408767', 'Dear Nikhil Chandra Das, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2045.00 has been successfully received. ', 2, 1, '2022-02-13 23:56:32', NULL, NULL, 108, '2022-02-14 00:00:05'),
(110880, 159, '01816363464', 'Dear সাইদুর রহমান জিবু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-15 09:02:16', NULL, NULL, 110, '2022-02-15 10:00:09'),
(110881, 160, '01628398800', 'Dear Abdullah Al Noman, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 1, '2022-02-15 12:26:56', NULL, NULL, 109, '2022-02-15 13:00:05'),
(110882, 163, '01815129512', 'Dear জাহাঙ্গীর আলম, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-15 21:32:15', NULL, NULL, 110, '2022-02-15 22:00:06'),
(110883, 162, '01815129512', 'Dear গিয়াস উদ্দিন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-15 21:33:25', NULL, NULL, 110, '2022-02-15 22:00:07'),
(110884, 161, '01815129512', 'Dear জিয়া উদ্দিন বাবলু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-15 21:33:40', NULL, NULL, 110, '2022-02-15 22:00:08'),
(110885, 168, '01762628915', 'Dear আবুল কাশেম, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-02-15 21:40:27', NULL, NULL, 108, '2022-02-15 22:00:09'),
(110886, 167, '01718403285', 'Dear প্রদীপ দেব নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-15 21:40:50', NULL, NULL, 108, '2022-02-15 22:00:10'),
(110887, 166, '01718403285', 'Dear রাজিব চন্দ্র নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-15 21:41:04', NULL, NULL, 108, '2022-02-15 22:00:11'),
(110888, 165, '01718403285', 'Dear মৃণাল কান্তি নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-15 21:41:56', NULL, NULL, 108, '2022-02-15 22:00:12'),
(110889, 169, '01718421747', 'Dear Mitun Chandra Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-17 17:54:30', NULL, NULL, 111, '2022-02-17 18:00:04'),
(110890, 173, '01875243626', 'Dear REETA GOWSHMI, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-17 18:31:36', NULL, NULL, 109, '2022-02-17 19:00:04'),
(110891, 172, '01741661066', 'Dear MD HELAL UDDIN BADRI, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-17 18:31:44', NULL, NULL, 109, '2022-02-17 19:00:05'),
(110892, 171, '01741661066', 'Dear MD SARWAR JAHAN RUBEL, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-17 18:31:53', NULL, NULL, 109, '2022-02-17 19:00:06'),
(110893, 170, '01811244656', 'Dear Rokshana pervin Mukta, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-17 18:32:03', NULL, NULL, 109, '2022-02-17 19:00:08'),
(110894, 174, '01978157850', 'Dear নাম প্রকাশে অনিচ্ছুক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-17 22:11:06', NULL, NULL, 110, '2022-02-17 23:00:05'),
(110895, 175, '01787673430', 'Dear আলী কাউছার, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-17 23:23:31', NULL, NULL, 110, '2022-02-18 00:00:05'),
(110896, 176, '01324348648', 'Dear সালাউদ্দিন মানিক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-18 18:42:25', NULL, NULL, 110, '2022-02-18 19:00:05'),
(110897, 177, '01824522157', 'Dear সিন্টু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1020.00 has been successfully received. ', 2, 2, '2022-02-18 20:06:14', NULL, NULL, 108, '2022-02-18 21:00:05'),
(110898, 178, '01741661066', 'Dear Ehsan polash, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 1, '2022-02-19 00:07:36', NULL, NULL, 109, '2022-02-19 01:00:07'),
(110899, 179, '01845120130', 'Dear সাদ্দাম হোসেন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-19 12:36:08', NULL, NULL, 110, '2022-02-19 13:00:05'),
(110900, 180, '01819841209', 'Dear Wahidul Hasan Jabed, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2035.00 has been successfully received. ', 2, 1, '2022-02-19 14:13:41', NULL, NULL, 108, '2022-02-19 15:00:08'),
(110901, 181, '01711080694', 'Dear মেজবাহ উদ্দিন আহমেদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-19 15:18:29', NULL, NULL, 111, '2022-02-19 16:00:08'),
(110902, 182, '01713509298', 'Dear Md Ibrahim, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 1, '2022-02-19 15:21:13', NULL, NULL, 111, '2022-02-19 16:00:09'),
(110903, 183, '01873370409', 'Dear Jahangir Alam piplu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-19 18:11:32', NULL, NULL, 109, '2022-02-19 19:00:03'),
(110904, 184, '01732235978', 'Dear Nazrul Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 1, '2022-02-19 21:31:20', NULL, NULL, 109, '2022-02-19 22:00:04'),
(110905, 185, '01816363700', 'Dear মুন্সী আসাদুল ইসলাম (রিয়াদ), We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2040.00 has been successfully received. ', 2, 2, '2022-02-19 23:10:06', NULL, NULL, 108, '2022-02-20 00:00:05'),
(110906, 186, '01824522157', 'Dear নাম প্রকাশে অনিচ্ছুক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 2, '2022-02-19 23:10:45', NULL, NULL, 108, '2022-02-20 00:00:06'),
(110907, 187, '01816363700', 'Dear ফারুকুল ইসলাম সাগর, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1020.00 has been successfully received. ', 2, 2, '2022-02-20 11:35:29', NULL, NULL, 108, '2022-02-20 12:00:05'),
(110908, 188, '01627907724', 'Dear Kazi sohag, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-20 12:12:25', NULL, NULL, 111, '2022-02-20 13:00:04'),
(110909, 189, '01711702137', 'Dear খোকন চন্দ্র দাস, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-20 12:12:56', NULL, NULL, 108, '2022-02-20 13:00:05'),
(110910, 190, '01741661066', 'Dear Jamshed Alam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-20 12:29:04', NULL, NULL, 109, '2022-02-20 13:00:06'),
(110911, 191, '01816363700', 'Dear সজীব দেব, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1020.00 has been successfully received. ', 2, 2, '2022-02-20 14:23:47', NULL, NULL, 108, '2022-02-20 15:00:06'),
(110912, 192, '01837616244', 'Dear সাদিয়া ইবনাত, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 510.00 has been successfully received. ', 2, 2, '2022-02-20 14:36:50', NULL, NULL, 108, '2022-02-20 15:00:07'),
(110913, 195, '01815129512', 'Dear ফজলুল হক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-20 19:28:36', NULL, NULL, 110, '2022-02-20 20:00:05'),
(110914, 194, '01819741132', 'Dear নারায়ন চন্দ্র নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-20 19:28:51', NULL, NULL, 110, '2022-02-20 20:00:06'),
(110915, 193, '01978157850', 'Dear বিজয় দাস, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-20 19:29:07', NULL, NULL, 110, '2022-02-20 20:00:07'),
(110916, 196, '01816237771', 'Dear স্মৃতি চক্রবর্ত্তী, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 2, '2022-02-20 22:10:37', NULL, NULL, 108, '2022-02-20 23:00:08'),
(110917, 198, '01978157859', 'Dear স্বর্না পাল, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-02-21 23:13:56', NULL, NULL, 110, '2022-02-22 00:00:04'),
(110918, 199, '01815129512', 'Dear মনিরুল ইসলাম সোহাগ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-21 23:31:09', NULL, NULL, 110, '2022-02-22 00:00:05'),
(110919, 200, '01818690600', 'Dear একরামুল হক শিমুল, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-21 23:34:06', NULL, NULL, 110, '2022-02-22 00:00:06'),
(110920, 201, '01816363700', 'Dear মোবাশ্বের হোসেন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2140.00 has been successfully received. ', 2, 2, '2022-02-21 23:37:35', NULL, NULL, 108, '2022-02-22 00:00:07'),
(110921, 202, '01301884410', 'Dear Nipa rai, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-22 16:43:26', NULL, NULL, 111, '2022-02-22 17:00:05'),
(110922, 204, '01828516450', 'Dear নিলুফা ইয়াসমিন টুম্পা, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-22 21:55:04', NULL, NULL, 108, '2022-02-22 22:00:03'),
(110923, 205, '01818900103', 'Dear তপন চন্দ্র নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-22 21:55:26', NULL, NULL, 108, '2022-02-22 22:00:04'),
(110924, 206, '01718403285', 'Dear রতন চন্দ্র নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-02-22 21:55:45', NULL, NULL, 108, '2022-02-22 22:00:06'),
(110925, 203, '01815129512', 'Dear মোহাম্মদ হাসান, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-22 22:01:54', NULL, NULL, 110, '2022-02-22 23:00:04'),
(110926, 207, '01819841209', 'Dear Md. Ibrahim, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3055.00 has been successfully received. ', 2, 1, '2022-02-23 10:20:08', NULL, NULL, 108, '2022-02-23 11:00:07'),
(110927, 215, '01819169440', 'Dear Salauddin kader, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1500.00 has been successfully received. ', 2, 1, '2022-02-24 22:39:03', NULL, NULL, 111, '2022-02-24 23:00:05'),
(110928, 214, '01717383076', 'Dear Sadia Afrose Shushama, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-24 22:39:24', NULL, NULL, 111, '2022-02-24 23:00:06'),
(110929, 212, '01717383076', 'Dear Rebeka Sultana Shompa, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-24 22:39:39', NULL, NULL, 111, '2022-02-24 23:00:07'),
(110930, 209, '01717383086', 'Dear Afser Uddin Shahin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-24 22:39:53', NULL, NULL, 111, '2022-02-24 23:00:11'),
(110931, 216, '01819335256', 'Dear Raihan Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-24 22:42:52', NULL, NULL, 111, '2022-02-24 23:00:12'),
(110932, 217, '01818996392', 'Dear Abul Kalam Mintu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-24 23:14:44', NULL, NULL, 109, '2022-02-25 00:00:04'),
(110933, 218, '01743918340', 'Dear সুজল ঘোষ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1020.00 has been successfully received. ', 2, 2, '2022-02-25 13:08:23', NULL, NULL, 108, '2022-02-25 14:00:08'),
(110934, 219, '01892980480', 'Dear নূর নবী, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-02-25 17:31:40', NULL, NULL, 108, '2022-02-25 18:00:05'),
(110935, 221, '01892980480', 'Dear আব্দুল্লাহ আল কায়সার, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-02-26 17:39:46', NULL, NULL, 108, '2022-02-26 18:00:04'),
(110936, 222, '01892980480', 'Dear রহমান মোহন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-02-26 17:39:56', NULL, NULL, 108, '2022-02-26 18:00:06'),
(110937, 223, '01892980480', 'Dear নাইমুল ইসলাম, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-02-26 17:40:04', NULL, NULL, 108, '2022-02-26 18:00:07'),
(110938, 220, '01819841209', 'Dear Md. Anamul Hoq Moni, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3060.00 has been successfully received. ', 2, 1, '2022-02-26 17:40:27', NULL, NULL, 108, '2022-02-26 18:00:08'),
(110939, 224, '01819841209', 'Dear Nur Hossain Shipu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5100.00 has been successfully received. ', 2, 1, '2022-02-26 20:03:20', NULL, NULL, 108, '2022-02-26 21:00:09'),
(110940, 225, '01840676746', 'Dear Sabina Aktet, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-02-27 01:44:45', NULL, NULL, 109, '2022-02-27 02:00:04'),
(110941, 228, '01819841209', 'Dear Shalina Akter Nazma, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 1, '2022-02-27 21:47:30', NULL, NULL, 108, '2022-02-27 22:00:04'),
(110942, 235, '01778201480', 'Dear Tanvir Ahmed, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-02-27 23:03:09', NULL, NULL, 111, '2022-02-28 00:00:05'),
(110943, 232, '01842373284', 'Dear Soroar Hossain, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-27 23:03:39', NULL, NULL, 111, '2022-02-28 00:00:06'),
(110944, 231, '01713509298', 'Dear Hasan Rony, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-27 23:04:22', NULL, NULL, 111, '2022-02-28 00:00:07'),
(110945, 230, '01817384020', 'Dear Saiful Islam Shiplu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-27 23:04:32', NULL, NULL, 111, '2022-02-28 00:00:08'),
(110946, 234, '01819335256', 'Dear Sala Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-27 23:04:57', NULL, NULL, 111, '2022-02-28 00:00:10'),
(110947, 237, '01741661066', 'Dear MD SHAHIDUL, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-02-27 23:37:23', NULL, NULL, 109, '2022-02-28 00:00:11'),
(110948, 236, '01741661066', 'Dear TOFAYEL AHMED, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-02-27 23:38:02', NULL, NULL, 109, '2022-02-28 00:00:12'),
(110949, 243, '01819692330', 'Dear কাজী সামছুল হক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-02-28 00:17:50', NULL, NULL, 110, '2022-02-28 01:00:04'),
(110950, 242, '01818649860', 'Dear নাসির উদ্দিন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-28 00:18:06', NULL, NULL, 110, '2022-02-28 01:00:06'),
(110951, 241, '01978157850', 'Dear তপন চন্দ্র নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-02-28 00:18:23', NULL, NULL, 110, '2022-02-28 01:00:07'),
(110952, 240, '01718403285', 'Dear সুব্রত নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-28 00:18:43', NULL, NULL, 110, '2022-02-28 01:00:08'),
(110953, 239, '01673523927', 'Dear আবু হাসনাত, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-28 00:18:55', NULL, NULL, 110, '2022-02-28 01:00:09'),
(110954, 238, '01817118615', 'Dear মুন্সী আক্তার হোসেন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 20000.00 has been successfully received. ', 2, 2, '2022-02-28 00:19:11', NULL, NULL, 110, '2022-02-28 01:00:10'),
(110955, 244, '01978157850', 'Dear লক্ষন চন্দ্র নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 2, '2022-02-28 00:32:17', NULL, NULL, 110, '2022-02-28 01:00:11'),
(110956, 227, '01831071718', 'Dear তোফায়েল আহমেদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3060.00 has been successfully received. ', 2, 2, '2022-02-28 00:46:00', NULL, NULL, 1, '2022-02-28 01:00:12'),
(110957, 226, '01817752997', 'Dear শহিদুল ইসলাম, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-02-28 00:46:04', NULL, NULL, 1, '2022-02-28 01:00:13'),
(110958, 245, '01830375851', 'Dear Mahfuz Bhuiyan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-02-28 13:56:30', NULL, NULL, 111, '2022-02-28 14:00:06'),
(110959, 246, '01814470647', 'Dear Nizam Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-02-28 15:25:16', NULL, NULL, 111, '2022-02-28 16:00:05'),
(110960, 247, '01558959032', 'Dear Shahadat Hossain Sohel, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-02-28 23:52:36', NULL, NULL, 108, '2022-03-01 00:00:05'),
(110961, 248, '01867208906', 'Dear রুহুল আমিন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 2, '2022-03-01 00:41:44', NULL, NULL, 110, '2022-03-01 01:00:05'),
(110962, 249, '01818367786', 'Dear Anonymous, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-01 13:36:09', NULL, NULL, 111, '2022-03-01 14:00:05'),
(110963, 250, '01817750170', 'Dear Mir Hasan Saidul, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-01 17:17:38', NULL, NULL, 111, '2022-03-01 18:00:07'),
(110964, 251, '01819335256', 'Dear Mizanur Rahman, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-01 19:23:00', NULL, NULL, 111, '2022-03-01 20:00:10'),
(110965, 253, '01741661066', 'Dear Mejba Bhuiyan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-01 23:06:03', NULL, NULL, 109, '2022-03-02 00:00:05'),
(110966, 252, '01819841209', 'Dear Anamul Hoque Anam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1500.00 has been successfully received. ', 2, 1, '2022-03-01 23:06:12', NULL, NULL, 109, '2022-03-02 00:00:06'),
(110967, 254, '01725551020', 'Dear Shipon Pal, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-02 11:47:16', NULL, NULL, 111, '2022-03-02 12:00:06'),
(110968, 255, '01813758521', 'Dear মুনমুন নাগ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-02 22:48:29', NULL, NULL, 108, '2022-03-02 23:00:04'),
(110969, 256, '01813758521', 'Dear রুপম পাল, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-02 22:48:44', NULL, NULL, 108, '2022-03-02 23:00:05'),
(110970, 257, '01811181318', 'Dear পীযুষ কান্তি নাগ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-02 22:48:56', NULL, NULL, 108, '2022-03-02 23:00:06'),
(110971, 258, '01811181318', 'Dear সাবিত্রী নাগ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-02 22:49:03', NULL, NULL, 108, '2022-03-02 23:00:08'),
(110972, 276, '01815129512', 'Dear ফজলুল হক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-03-02 23:42:39', NULL, NULL, 110, '2022-03-03 00:00:05'),
(110973, 275, '01815129512', 'Dear রিয়াজ উদ্দিন আহমেদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-03-02 23:42:55', NULL, NULL, 110, '2022-03-03 00:00:07'),
(110974, 270, '01911924256', 'Dear শেখ নিজাম উদ্দিন মাসুদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-02 23:43:14', NULL, NULL, 110, '2022-03-03 00:00:08'),
(110975, 274, '01716400337', 'Dear মোঃ মমিনুল হক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-02 23:43:36', NULL, NULL, 110, '2022-03-03 00:00:09'),
(110976, 273, '01716400337', 'Dear মাসুদ করিম চৌধুরী, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-02 23:43:49', NULL, NULL, 110, '2022-03-03 00:00:10'),
(110977, 272, '01716400337', 'Dear অজিত কুমার, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-02 23:43:59', NULL, NULL, 110, '2022-03-03 00:00:12'),
(110978, 271, '01716400337', 'Dear দিলাফরোজ বেগম রিনা, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-02 23:44:13', NULL, NULL, 110, '2022-03-03 00:00:13'),
(110979, 269, '01716400337', 'Dear ঝর্না নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-02 23:44:29', NULL, NULL, 110, '2022-03-03 00:00:14'),
(110980, 268, '01716400337', 'Dear আবু ইউছুপ ঝন্টু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-02 23:44:46', NULL, NULL, 110, '2022-03-03 00:00:15'),
(110981, 267, '01716400337', 'Dear নুর আলমগীর, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-02 23:44:54', NULL, NULL, 110, '2022-03-03 00:00:16'),
(110982, 266, '01716400337', 'Dear বিবি হাজেরা মুন্নী, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-02 23:45:04', NULL, NULL, 110, '2022-03-03 01:00:06'),
(110983, 265, '01716400337', 'Dear গিয়াস উদ্দিন হায়দার, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 2, '2022-03-02 23:45:19', NULL, NULL, 110, '2022-03-03 01:00:07'),
(110984, 264, '01312256980', 'Dear শাহজাহান কবির, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 2, '2022-03-02 23:45:30', NULL, NULL, 110, '2022-03-03 01:00:09'),
(110985, 263, '01716400337', 'Dear দেবাশীষ ভৌমিক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 2, '2022-03-02 23:45:37', NULL, NULL, 110, '2022-03-03 01:00:10'),
(110986, 262, '01819214651', 'Dear শাহ আলম বাবলু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-03-02 23:45:48', NULL, NULL, 110, '2022-03-03 01:00:11'),
(110987, 261, '01716400337', 'Dear আলী আশ্রাফ সুজন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-03-02 23:46:02', NULL, NULL, 110, '2022-03-03 01:00:12'),
(110988, 260, '01716400337', 'Dear বেলায়েত হোসেন বেলাল, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 2, '2022-03-02 23:46:15', NULL, NULL, 110, '2022-03-03 01:00:13'),
(110989, 259, '01716400337', 'Dear ফজলুল করিম পিন্টু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 2, '2022-03-02 23:46:27', NULL, NULL, 110, '2022-03-03 01:00:15'),
(110990, 277, '01812992042', 'Dear মুন্সী হারুন - অর - রশিদ তুহিন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 2, '2022-03-03 00:24:28', NULL, NULL, 108, '2022-03-03 01:00:16'),
(110991, 283, '01811282240', 'Dear Badrul Hasan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-03 00:40:46', NULL, NULL, 109, '2022-03-03 01:00:17'),
(110992, 282, '01819841209', 'Dear Enamul Haque Riyan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-03 00:40:58', NULL, NULL, 109, '2022-03-03 02:00:08'),
(110993, 281, '01816358116', 'Dear Shemul Bhowmik, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-03 00:41:05', NULL, NULL, 109, '2022-03-03 02:00:09'),
(110994, 280, '01670876557', 'Dear Monirul Islam Babu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-03 00:41:21', NULL, NULL, 109, '2022-03-03 02:00:10'),
(110995, 279, '01818670916', 'Dear Abdullah Al Momin Biplob, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-03 00:41:31', NULL, NULL, 109, '2022-03-03 02:00:11'),
(110996, 278, '01741661066', 'Dear Saiful Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-03 00:41:39', NULL, NULL, 109, '2022-03-03 02:00:12'),
(110997, 284, '01818759875', 'Dear Ibrahim Bhuiyan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-03 09:09:42', NULL, NULL, 111, '2022-03-03 10:00:04'),
(110998, 285, '01819680326', 'Dear Jahangir Alam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-03 09:09:55', NULL, NULL, 111, '2022-03-03 10:00:05'),
(110999, 286, '01712606026', 'Dear Kazi Md.Emran, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-03 09:48:27', NULL, NULL, 111, '2022-03-03 10:00:06'),
(111000, 287, '01816363700', 'Dear ওমর ফারুক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-03 10:15:50', NULL, NULL, 108, '2022-03-03 11:00:08'),
(111001, 288, '01711152841', 'Dear আবদুর রহিম, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2500.00 has been successfully received. ', 2, 2, '2022-03-03 10:20:00', NULL, NULL, 110, '2022-03-03 11:00:09'),
(111002, 289, '01811319914', 'Dear সাইদুল হক সাজু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-03 12:59:06', NULL, NULL, 110, '2022-03-03 13:00:05'),
(111003, 290, '01740936013', 'Dear দিপক চন্দ্র নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-03 13:27:32', NULL, NULL, 110, '2022-03-03 14:00:05'),
(111004, 291, '01815129512', 'Dear ফরহাদ উদ্দিন আহমেদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 2, '2022-03-03 15:49:29', NULL, NULL, 110, '2022-03-03 16:00:05'),
(111005, 292, '01818172982', 'Dear মোহাম্মদ আলমগীর, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-03 15:49:52', NULL, NULL, 110, '2022-03-03 16:00:06'),
(111006, 294, '01979841222', 'Dear Azahar hossain sumon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1500.00 has been successfully received. ', 2, 1, '2022-03-03 15:54:17', NULL, NULL, 111, '2022-03-03 16:00:07'),
(111007, 293, '01861971910', 'Dear Kamruzzaman Sumon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-03 15:54:25', NULL, NULL, 111, '2022-03-03 16:00:09'),
(111008, 297, '01784517003', 'Dear আবদুর লতিফ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-03 18:33:44', NULL, NULL, 110, '2022-03-03 19:00:04'),
(111009, 296, '01818404047', 'Dear ইকবাল হোসেন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-03 18:33:53', NULL, NULL, 110, '2022-03-03 19:00:05'),
(111010, 298, '01622720543', 'Dear রেজিয়া চৌধুরী লিপি, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 2, '2022-03-03 19:07:44', NULL, NULL, 110, '2022-03-03 21:00:04'),
(111011, 301, '01614142256', 'Dear একরামুল হক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 2, '2022-03-03 19:47:35', NULL, NULL, 110, '2022-03-03 21:00:06'),
(111012, 300, '01819841209', 'Dear জাহিদুল হক চৌধুরী রিয়াজ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-03-03 19:47:50', NULL, NULL, 110, '2022-03-03 21:00:07'),
(111013, 299, '01671686862', 'Dear সরোয়ার জাহান, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-03 19:47:59', NULL, NULL, 110, '2022-03-03 21:00:08'),
(111014, 295, '01819680426', 'Dear Shahab uddin sumon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-03 20:10:36', NULL, NULL, 111, '2022-03-03 21:00:10'),
(111015, 302, '01819962521', 'Dear Nur Nobi Sskil, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-03 20:10:44', NULL, NULL, 111, '2022-03-03 21:00:11'),
(111016, 306, '01718403285', 'Dear আবদুর রহিম মানিক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 2, '2022-03-03 21:32:09', NULL, NULL, 110, '2022-03-03 22:00:04'),
(111017, 305, '01718379418', 'Dear জামাল উদ্দিন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-03 21:32:18', NULL, NULL, 110, '2022-03-03 22:00:05'),
(111018, 304, '01829343774', 'Dear জাহাঙ্গীর আলম, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 2, '2022-03-03 21:32:26', NULL, NULL, 110, '2022-03-03 22:00:07'),
(111019, 303, '01633542350', 'Dear রুনা, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-03 21:32:33', NULL, NULL, 110, '2022-03-03 22:00:08'),
(111020, 310, '01815594214', 'Dear Md Baker, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-03 21:55:10', NULL, NULL, 111, '2022-03-03 22:00:09'),
(111021, 309, '01819339740', 'Dear Biplob Chandra Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-03 21:55:19', NULL, NULL, 111, '2022-03-03 22:00:10'),
(111022, 311, '01627009054', 'Dear মেহেদী হায়াত নিশাত, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-03 21:56:36', NULL, NULL, 108, '2022-03-03 22:00:11'),
(111023, 308, '01860456320', 'Dear আশরাফুল হাকিম পিয়াল, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-03 21:56:48', NULL, NULL, 108, '2022-03-03 22:00:13'),
(111024, 307, '01879762384', 'Dear দীপংকর নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-03 21:56:59', NULL, NULL, 108, '2022-03-03 22:00:14'),
(111025, 315, '01711147774', 'Dear Anwar Hossain, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-04 00:07:57', NULL, NULL, 109, '2022-03-04 01:00:05'),
(111026, 314, '01748189747', 'Dear Tanni Roy, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-04 00:08:06', NULL, NULL, 109, '2022-03-04 01:00:06'),
(111027, 313, '01762628915', 'Dear Iftekhar Ahmed, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 8000.00 has been successfully received. ', 2, 1, '2022-03-04 00:08:18', NULL, NULL, 109, '2022-03-04 01:00:07'),
(111028, 312, '01853247316', 'Dear Ranjit kumar nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-04 00:08:26', NULL, NULL, 109, '2022-03-04 01:00:08'),
(111029, 323, '01892980480', 'Dear নাম প্রকাশে অনিচ্ছুক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-04 13:10:47', NULL, NULL, 108, '2022-03-04 14:00:08'),
(111030, 320, '01892980480', 'Dear নাম প্রকাশে অনিচ্ছুক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-04 13:10:58', NULL, NULL, 108, '2022-03-04 14:00:09'),
(111031, 324, '01887033584', 'Dear আরিফ হোসেন রাজু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 510.00 has been successfully received. ', 2, 2, '2022-03-04 19:45:41', NULL, NULL, 108, '2022-03-04 20:00:04');
INSERT INTO `sms_history` (`id`, `donar_id`, `mobile_number`, `msg`, `send_status`, `success_status`, `created_at`, `is_resend_sms`, `is_resend_sms_date`, `ins_by`, `updated_at`) VALUES
(111032, 340, '01811812777', 'Dear Mithun Deb Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-05 07:42:49', NULL, NULL, 109, '2022-03-05 08:00:06'),
(111033, 339, '01676174239', 'Dear Bappi paul, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-05 07:44:52', NULL, NULL, 109, '2022-03-05 08:00:07'),
(111034, 338, '01829343774', 'Dear Jahirul Hoque Khandaker, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-05 07:46:57', NULL, NULL, 109, '2022-03-05 08:00:08'),
(111035, 337, '01829343774', 'Dear Anwarul Hoque Khandaker Abu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 1, '2022-03-05 07:47:21', NULL, NULL, 109, '2022-03-05 08:00:09'),
(111036, 336, '01883880397', 'Dear Md Sohel, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-05 07:47:55', NULL, NULL, 109, '2022-03-05 08:00:10'),
(111037, 335, '01840111412', 'Dear Mahibul Hasan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-05 07:48:06', NULL, NULL, 109, '2022-03-05 08:00:11'),
(111038, 334, '01670019084', 'Dear Golam kibria, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1500.00 has been successfully received. ', 2, 1, '2022-03-05 07:48:14', NULL, NULL, 109, '2022-03-05 08:00:12'),
(111039, 333, '01815918104', 'Dear Eti Moni, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 100.00 has been successfully received. ', 2, 1, '2022-03-05 07:48:57', NULL, NULL, 109, '2022-03-05 08:00:13'),
(111040, 332, '01833217786', 'Dear Mohona, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-05 07:49:23', NULL, NULL, 109, '2022-03-05 08:00:14'),
(111041, 331, '01833217786', 'Dear Jahangir, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-05 07:49:36', NULL, NULL, 109, '2022-03-05 08:00:15'),
(111042, 330, '01833217786', 'Dear Popy, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-05 07:50:00', NULL, NULL, 109, '2022-03-05 09:00:08'),
(111043, 329, '01833217786', 'Dear Fahmi, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 150.00 has been successfully received. ', 2, 1, '2022-03-05 07:50:07', NULL, NULL, 109, '2022-03-05 09:00:09'),
(111044, 328, '01936317279', 'Dear Niloy, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 200.00 has been successfully received. ', 2, 1, '2022-03-05 07:50:15', NULL, NULL, 109, '2022-03-05 09:00:10'),
(111045, 327, '01833217786', 'Dear Provati, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-05 07:50:26', NULL, NULL, 109, '2022-03-05 09:00:10'),
(111046, 326, '01833217786', 'Dear Sujan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-05 07:50:51', NULL, NULL, 109, '2022-03-05 09:00:12'),
(111047, 345, '01743918340', 'Dear পার্থ মজুমদার, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-05 22:25:54', NULL, NULL, 108, '2022-03-05 23:00:06'),
(111048, 344, '01892980480', 'Dear ইপু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 2, '2022-03-05 22:26:09', NULL, NULL, 108, '2022-03-05 23:00:07'),
(111049, 343, '01823532464', 'Dear Nerod Bhowmick, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-06 01:04:51', NULL, NULL, 109, '2022-03-06 02:00:05'),
(111050, 356, '01863658880', 'Dear Sonjoy Mojumder, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-06 01:24:15', NULL, NULL, 109, '2022-03-06 02:00:06'),
(111051, 355, '01863658880', 'Dear Kamrul Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-06 01:24:28', NULL, NULL, 109, '2022-03-06 02:00:07'),
(111052, 354, '01863658880', 'Dear Farjana Akter, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-06 01:24:37', NULL, NULL, 109, '2022-03-06 02:00:08'),
(111053, 353, '01863658880', 'Dear Rayhan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-06 01:24:46', NULL, NULL, 109, '2022-03-06 02:00:09'),
(111054, 352, '01863658880', 'Dear Sojib Bhuiyan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1200.00 has been successfully received. ', 2, 1, '2022-03-06 01:25:00', NULL, NULL, 109, '2022-03-06 02:00:10'),
(111055, 351, '01816725320', 'Dear Didarul Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 4000.00 has been successfully received. ', 2, 1, '2022-03-06 01:25:17', NULL, NULL, 109, '2022-03-06 02:00:12'),
(111056, 350, '01816725320', 'Dear Babul chandra nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-06 01:25:27', NULL, NULL, 109, '2022-03-06 02:00:13'),
(111057, 349, '01816725320', 'Dear Yeasin Mahmud, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-06 01:25:56', NULL, NULL, 109, '2022-03-06 02:00:14'),
(111058, 348, '01816725320', 'Dear Md Sojib, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-06 01:26:14', NULL, NULL, 109, '2022-03-06 02:00:15'),
(111059, 347, '01816725320', 'Dear Sahab Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 1, '2022-03-06 01:26:30', NULL, NULL, 109, '2022-03-06 03:00:06'),
(111060, 346, '01718403285', 'Dear Mosharraf Hossain Miru, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 1, '2022-03-06 01:26:45', NULL, NULL, 109, '2022-03-06 03:00:07'),
(111061, 325, '01842797984', 'Dear MD. Enamul Kaisar, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-06 09:04:10', NULL, NULL, 111, '2022-03-06 10:00:04'),
(111062, 361, '01959301737', 'Dear Shek saifuddin Firoz, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1500.00 has been successfully received. ', 2, 1, '2022-03-06 09:14:21', NULL, NULL, 111, '2022-03-06 10:00:05'),
(111063, 360, '01810202040', 'Dear Razu, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-06 09:14:28', NULL, NULL, 111, '2022-03-06 10:00:06'),
(111064, 359, '01819335256', 'Dear Johirul Alam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-06 09:14:51', NULL, NULL, 111, '2022-03-06 10:00:07'),
(111065, 358, '01609431566', 'Dear Dipankar Chandra Shil, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-06 09:15:01', NULL, NULL, 111, '2022-03-06 10:00:08'),
(111066, 357, '01819335256', 'Dear Joynal Babul, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-06 09:15:07', NULL, NULL, 111, '2022-03-06 10:00:09'),
(111067, 362, '01812553332', 'Dear আবু তালেব, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-06 11:33:46', NULL, NULL, 108, '2022-03-06 12:00:05'),
(111068, 377, '01762628915', 'Dear Dalia Karim, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 20000.00 has been successfully received. ', 2, 1, '2022-03-07 01:28:49', NULL, NULL, 109, '2022-03-07 02:00:04'),
(111069, 376, '01815426040', 'Dear M.M Mahfuz khan jelin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-07 01:28:57', NULL, NULL, 109, '2022-03-07 02:00:05'),
(111070, 375, '01815973256', 'Dear Mohammad Jashim Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-07 01:29:07', NULL, NULL, 109, '2022-03-07 02:00:06'),
(111071, 374, '01844041408', 'Dear Sumon Chandra Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-07 01:29:14', NULL, NULL, 109, '2022-03-07 02:00:07'),
(111072, 373, '01826688001', 'Dear Amjad Hossain Tuhin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-07 01:29:22', NULL, NULL, 109, '2022-03-07 02:00:09'),
(111073, 372, '01819841209', 'Dear Shalaa Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-07 01:29:36', NULL, NULL, 109, '2022-03-07 02:00:10'),
(111074, 371, '01306254599', 'Dear Monsur Alam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-07 01:29:48', NULL, NULL, 109, '2022-03-07 02:00:11'),
(111075, 370, '01815327140', 'Dear No name, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-07 01:29:59', NULL, NULL, 109, '2022-03-07 02:00:12'),
(111076, 369, '01826688001', 'Dear Abu Saleh Nasim, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-07 01:30:06', NULL, NULL, 109, '2022-03-07 02:00:13'),
(111077, 368, '01826688001', 'Dear Shazzad hossain Tusher, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-07 01:30:13', NULL, NULL, 109, '2022-03-07 02:00:14'),
(111078, 367, '01826688001', 'Dear Anisha Akter, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-07 01:30:20', NULL, NULL, 109, '2022-03-07 03:00:05'),
(111079, 366, '01826688001', 'Dear Omio Roy, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-07 01:30:29', NULL, NULL, 109, '2022-03-07 03:00:06'),
(111080, 365, '01826688001', 'Dear Saharia Emon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-07 01:30:38', NULL, NULL, 109, '2022-03-07 03:00:07'),
(111081, 364, '01826688001', 'Dear Abdur Rahim, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-07 01:30:44', NULL, NULL, 109, '2022-03-07 03:00:08'),
(111082, 363, '01826688001', 'Dear Adnan bin Nahid, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-07 01:30:51', NULL, NULL, 109, '2022-03-07 03:00:09'),
(111083, 378, '01713376520', 'Dear Ahamed Karim, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 20400.00 has been successfully received. ', 2, 1, '2022-03-07 17:16:10', NULL, NULL, 111, '2022-03-07 18:00:09'),
(111084, 381, '01817046144', 'Dear Sheikh Forid, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-07 23:18:49', NULL, NULL, 109, '2022-03-08 00:00:05'),
(111085, 380, '01757930586', 'Dear Abu Raihan Shohag, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-07 23:18:57', NULL, NULL, 109, '2022-03-08 00:00:07'),
(111086, 379, '01757930586', 'Dear Jesmin Akter, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-07 23:19:05', NULL, NULL, 109, '2022-03-08 00:00:08'),
(111087, 390, '01840676426', 'Dear মজিবুল হক শিমুল, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-08 00:13:15', NULL, NULL, 110, '2022-03-08 01:00:09'),
(111088, 389, '01873315454', 'Dear আবুল খায়ের টিপু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-08 00:13:50', NULL, NULL, 110, '2022-03-08 01:00:11'),
(111089, 388, '01613376543', 'Dear নিজাম উদ্দিন খোকা, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 2, '2022-03-08 00:14:08', NULL, NULL, 110, '2022-03-08 01:00:12'),
(111090, 382, '01711303450', 'Dear মোশাররফ  উদ্দিন নাছিম, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 50000.00 has been successfully received. ', 2, 2, '2022-03-08 00:14:31', NULL, NULL, 110, '2022-03-08 01:00:14'),
(111091, 387, '01672909211', 'Dear রতন চন্দ্র নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-08 00:15:39', NULL, NULL, 110, '2022-03-08 01:00:15'),
(111092, 386, '01711710152', 'Dear ইন্দ্রলাল নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-08 00:15:50', NULL, NULL, 110, '2022-03-08 01:00:16'),
(111093, 385, '01711710152', 'Dear আনোয়ার হোসেন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-08 00:16:04', NULL, NULL, 110, '2022-03-08 01:00:17'),
(111094, 384, '01711710152', 'Dear আনোয়ার হোসেন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-08 00:16:13', NULL, NULL, 110, '2022-03-08 01:00:18'),
(111095, 383, '01711710152', 'Dear হিমাদ্রি দাস, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-08 00:16:22', NULL, NULL, 110, '2022-03-08 01:00:19'),
(111096, 391, '01711634424', 'Dear মমিনুল হক ভূঁইয়া, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 50000.00 has been successfully received. ', 2, 2, '2022-03-08 08:55:30', NULL, NULL, 110, '2022-03-08 09:00:05'),
(111097, 392, '01815326627', 'Dear শান্তনু দেব নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-08 09:17:47', NULL, NULL, 108, '2022-03-08 10:00:04'),
(111098, 393, '16451563776', 'Dear নুরুল আবেদিন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-08 09:59:07', NULL, NULL, 110, '2022-03-08 10:00:05'),
(111099, 394, '01815129512', 'Dear শিমুল চন্দ্রনাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 2, '2022-03-08 10:03:08', NULL, NULL, 110, '2022-03-08 11:00:09'),
(111100, 395, '01791601468', 'Dear সালেহ উদ্দিন নাহিদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 2, '2022-03-08 11:19:42', NULL, NULL, 110, '2022-03-08 12:00:08'),
(111101, 397, '01842803041', 'Dear মশিউর রহমান, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-08 16:24:44', NULL, NULL, 110, '2022-03-08 17:00:05'),
(111102, 396, '01817770736', 'Dear ওবায়দুর রহমান, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-08 16:25:00', NULL, NULL, 110, '2022-03-08 17:00:06'),
(111103, 399, '01818958182', 'Dear আবুল হোসেন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-08 18:38:18', NULL, NULL, 110, '2022-03-08 19:00:05'),
(111104, 398, '01815129512', 'Dear কামাল উদ্দিন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-08 23:25:40', NULL, NULL, 110, '2022-03-09 00:00:04'),
(111105, 418, '01740936013', 'Dear বাবলু নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-08 23:25:56', NULL, NULL, 110, '2022-03-09 00:00:06'),
(111106, 425, '01824549498', 'Dear সজীব, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:05:13', NULL, NULL, 108, '2022-03-09 01:00:04'),
(111107, 424, '01850628625', 'Dear মাহফুজ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:05:28', NULL, NULL, 108, '2022-03-09 01:00:05'),
(111108, 423, '01825747641', 'Dear নাহিদুল ইসলাম, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:05:38', NULL, NULL, 108, '2022-03-09 01:00:06'),
(111109, 422, '01765809156', 'Dear মোফাজ্জল হক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-09 00:05:48', NULL, NULL, 108, '2022-03-09 01:00:08'),
(111110, 421, '01830319732', 'Dear জামিল হোসেন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:06:02', NULL, NULL, 108, '2022-03-09 01:00:09'),
(111111, 420, '01824549498', 'Dear নাহিয়ান বাবু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-09 00:06:21', NULL, NULL, 108, '2022-03-09 01:00:10'),
(111112, 419, '01919201018', 'Dear আমিরুল ইসলাম টিপু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-09 00:06:30', NULL, NULL, 108, '2022-03-09 01:00:11'),
(111113, 417, '01629010783', 'Dear নাজিম মাহমুদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:06:41', NULL, NULL, 108, '2022-03-09 01:00:12'),
(111114, 416, '01825293224', 'Dear জামশেদ পাটোয়ারী, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:06:53', NULL, NULL, 108, '2022-03-09 01:00:13'),
(111115, 415, '01989770147', 'Dear মো: ইউসুফ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 200.00 has been successfully received. ', 2, 2, '2022-03-09 00:07:04', NULL, NULL, 108, '2022-03-09 01:00:14'),
(111116, 414, '01817773234', 'Dear পেয়ার আহম্মদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:07:15', NULL, NULL, 108, '2022-03-09 02:00:03'),
(111117, 413, '01845512711', 'Dear নাজমুল হক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:07:26', NULL, NULL, 108, '2022-03-09 02:00:04'),
(111118, 412, '01832657594', 'Dear নিপু চন্দ্র নাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:07:34', NULL, NULL, 108, '2022-03-09 02:00:05'),
(111119, 411, '01824549498', 'Dear জাবেদ হোসেন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-09 00:07:44', NULL, NULL, 108, '2022-03-09 02:00:06'),
(111120, 410, '01839013997', 'Dear আবু জায়েদ মুরাদ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:07:56', NULL, NULL, 108, '2022-03-09 02:00:07'),
(111121, 409, '01612291930', 'Dear হেলাল উদ্দিন, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:08:03', NULL, NULL, 108, '2022-03-09 02:00:08'),
(111122, 408, '01837617374', 'Dear রুপম দত্ত, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-09 00:08:11', NULL, NULL, 108, '2022-03-09 02:00:09'),
(111123, 407, '01858170545', 'Dear লুবনা আক্তার, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:08:20', NULL, NULL, 108, '2022-03-09 02:00:10'),
(111124, 406, '01822308734', 'Dear নজরুল ইসলাম, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:08:28', NULL, NULL, 108, '2022-03-09 02:00:11'),
(111125, 405, '01819724836', 'Dear তানভীর হাসান, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:08:42', NULL, NULL, 108, '2022-03-09 02:00:12'),
(111126, 404, '01644222029', 'Dear আবদুল্লাহ আল আজিজ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:08:52', NULL, NULL, 108, '2022-03-09 03:00:06'),
(111127, 403, '01819724836', 'Dear সরোজ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-09 00:09:00', NULL, NULL, 108, '2022-03-09 03:00:07'),
(111128, 402, '01812818276', 'Dear মো: ফারুক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-09 00:09:13', NULL, NULL, 108, '2022-03-09 03:00:08'),
(111129, 401, '01676131282', 'Dear নূর নাহার জলি, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:09:22', NULL, NULL, 108, '2022-03-09 03:00:09'),
(111130, 400, '01823581534', 'Dear শামসুন নাহার মলি, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-09 00:09:30', NULL, NULL, 108, '2022-03-09 03:00:11'),
(111131, 471, '01634227443', 'Dear No name, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 200.00 has been successfully received. ', 2, 1, '2022-03-09 02:10:39', NULL, NULL, 109, '2022-03-09 03:00:12'),
(111132, 470, '01634227443', 'Dear Sabbir, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 200.00 has been successfully received. ', 2, 1, '2022-03-09 02:10:52', NULL, NULL, 109, '2022-03-09 03:00:13'),
(111133, 469, '01634227443', 'Dear Nishat, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 200.00 has been successfully received. ', 2, 1, '2022-03-09 02:11:01', NULL, NULL, 109, '2022-03-09 03:00:14'),
(111134, 468, '01634227443', 'Dear Saiful, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 200.00 has been successfully received. ', 2, 1, '2022-03-09 02:11:09', NULL, NULL, 109, '2022-03-09 03:00:15'),
(111135, 467, '01634227443', 'Dear Sojib, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-09 02:11:15', NULL, NULL, 109, '2022-03-09 03:00:15'),
(111136, 466, '01634227443', 'Dear Hasnat, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-09 02:11:34', NULL, NULL, 109, '2022-03-09 04:00:08'),
(111137, 465, '01634227443', 'Dear Taposh, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-09 02:11:49', NULL, NULL, 109, '2022-03-09 04:00:09'),
(111138, 464, '01634227443', 'Dear Ataul, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-09 02:11:59', NULL, NULL, 109, '2022-03-09 04:00:10'),
(111139, 463, '01634227443', 'Dear Emon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-09 02:12:07', NULL, NULL, 109, '2022-03-09 04:00:11'),
(111140, 462, '01634227443', 'Dear Prince Saikat, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-09 02:12:18', NULL, NULL, 109, '2022-03-09 04:00:12'),
(111141, 461, '01634227443', 'Dear Mofazzal Hossain, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-09 02:12:26', NULL, NULL, 109, '2022-03-09 04:00:13'),
(111142, 460, '01634227443', 'Dear Novel, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-09 02:12:34', NULL, NULL, 109, '2022-03-09 04:00:14'),
(111143, 459, '01634227443', 'Dear Pranto Das, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-09 02:12:44', NULL, NULL, 109, '2022-03-09 04:00:15'),
(111144, 458, '01634227443', 'Dear Prapti, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:13:02', NULL, NULL, 109, '2022-03-09 04:00:16'),
(111145, 457, '01634227443', 'Dear Shaba, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:13:13', NULL, NULL, 109, '2022-03-09 04:00:17'),
(111146, 456, '01634227443', 'Dear Jony Alam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:13:24', NULL, NULL, 109, '2022-03-09 05:00:09'),
(111147, 455, '01634227443', 'Dear Nayan Bhowmick, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:13:31', NULL, NULL, 109, '2022-03-09 05:00:10'),
(111148, 454, '01634227443', 'Dear Rakibul Hasan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:13:39', NULL, NULL, 109, '2022-03-09 05:00:11'),
(111149, 453, '01635227443', 'Dear Farhad Robin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:13:58', NULL, NULL, 109, '2022-03-09 05:00:12'),
(111150, 452, '01634227443', 'Dear Nazmul Haider, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:14:14', NULL, NULL, 109, '2022-03-09 05:00:13'),
(111151, 451, '01635227443', 'Dear Hrdoy, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-09 02:14:23', NULL, NULL, 109, '2022-03-09 05:00:14'),
(111152, 450, '01634227443', 'Dear Shorav Chowdhury, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-09 02:14:34', NULL, NULL, 109, '2022-03-09 05:00:15'),
(111153, 449, '01634227443', 'Dear Abdur Rahim, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-09 02:14:44', NULL, NULL, 109, '2022-03-09 05:00:16'),
(111154, 447, '01863426252', 'Dear Shukanto Shekhor Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-09 02:14:52', NULL, NULL, 109, '2022-03-09 05:00:17'),
(111155, 446, '01819145841', 'Dear Priodon Chandra Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:15:04', NULL, NULL, 109, '2022-03-09 05:00:18'),
(111156, 445, '01824471471', 'Dear No Name, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-09 02:15:12', NULL, NULL, 109, '2022-03-09 06:00:05'),
(111157, 444, '01854975329', 'Dear Liton Chandra Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:15:23', NULL, NULL, 109, '2022-03-09 06:00:06'),
(111158, 443, '01876035120', 'Dear Sujon Chandra Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-09 02:15:42', NULL, NULL, 109, '2022-03-09 06:00:07'),
(111159, 442, '01854975329', 'Dear Sumon Chandra Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-09 02:15:55', NULL, NULL, 109, '2022-03-09 06:00:08'),
(111160, 441, '01817772310', 'Dear Khaleda Akter, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 7000.00 has been successfully received. ', 2, 1, '2022-03-09 02:16:04', NULL, NULL, 109, '2022-03-09 06:00:09'),
(111161, 440, '01824471471', 'Dear Benu lal Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:16:12', NULL, NULL, 109, '2022-03-09 06:00:10'),
(111162, 439, '01824471471', 'Dear Shipon Chandra Bhowmik, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-09 02:16:22', NULL, NULL, 109, '2022-03-09 06:00:11'),
(111163, 438, '01824471471', 'Dear Rajib chandra Paul, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-09 02:16:32', NULL, NULL, 109, '2022-03-09 06:00:12'),
(111164, 437, '01824471471', 'Dear Emdadul Haque Swapon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1500.00 has been successfully received. ', 2, 1, '2022-03-09 02:16:39', NULL, NULL, 109, '2022-03-09 06:00:13'),
(111165, 436, '01824471471', 'Dear Sarwar Alam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-09 02:16:49', NULL, NULL, 109, '2022-03-09 06:00:14'),
(111166, 435, '01819636315', 'Dear Abdullah Al Mamun, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-09 02:16:59', NULL, NULL, 109, '2022-03-09 07:00:06'),
(111167, 434, '01815601994', 'Dear Yousuf Alam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-09 02:17:11', NULL, NULL, 109, '2022-03-09 07:00:07'),
(111168, 433, '01824471471', 'Dear Bikrom kumar paul, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-09 02:17:20', NULL, NULL, 109, '2022-03-09 07:00:08'),
(111169, 432, '01817772310', 'Dear Omar Faruk, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-09 02:17:27', NULL, NULL, 109, '2022-03-09 07:00:09'),
(111170, 431, '01824471471', 'Dear Mosaraf Hossain, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 1, '2022-03-09 02:17:38', NULL, NULL, 109, '2022-03-09 07:00:10'),
(111171, 430, '01824471471', 'Dear Md Selim, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 1, '2022-03-09 02:18:04', NULL, NULL, 109, '2022-03-09 07:00:12'),
(111172, 429, '01741661066', 'Dear Abdul Hai, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 1, '2022-03-09 02:18:13', NULL, NULL, 109, '2022-03-09 07:00:13'),
(111173, 428, '01716449275', 'Dear Mizanur Rahman Polash, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-09 02:18:24', NULL, NULL, 109, '2022-03-09 07:00:14'),
(111174, 427, '01812865203', 'Dear Samir Bhowmick, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 700.00 has been successfully received. ', 2, 1, '2022-03-09 02:18:38', NULL, NULL, 109, '2022-03-09 07:00:15'),
(111175, 426, '01718403285', 'Dear Afzalur Rahaman, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-09 02:18:49', NULL, NULL, 109, '2022-03-09 07:00:16'),
(111176, 472, '01634227443', 'Dear Arian Riad, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-09 02:22:11', NULL, NULL, 109, '2022-03-09 08:00:07'),
(111177, 476, '01717192968', 'Dear Kazi Md Erfan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-10 09:07:45', NULL, NULL, 111, '2022-03-10 10:00:08'),
(111178, 475, '01717030924', 'Dear Farha Ulfat Nirjona, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-10 09:07:55', NULL, NULL, 111, '2022-03-10 10:00:09'),
(111179, 474, '01717030924', 'Dear Saddam Hossain Badal, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-10 09:08:05', NULL, NULL, 111, '2022-03-10 10:00:10'),
(111180, 473, '01717030924', 'Dear Parul Akter, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-10 09:08:13', NULL, NULL, 111, '2022-03-10 10:00:11'),
(111181, 477, '01888739022', 'Dear সুমন চন্দ্র দাস, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-10 10:49:41', NULL, NULL, 108, '2022-03-10 11:00:04'),
(111182, 478, '01822478621', 'Dear নিশান চন্দ্র ভৌমিক, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-10 10:49:48', NULL, NULL, 108, '2022-03-10 11:00:05'),
(111183, 480, '01762628915', 'Dear আবু সাঈদ টিপু, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 2, '2022-03-10 11:24:22', NULL, NULL, 110, '2022-03-10 12:00:08'),
(111184, 479, '01818489926', 'Dear পলাশ চন্দ্র দেবনাথ, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-10 11:24:31', NULL, NULL, 110, '2022-03-10 12:00:09'),
(111185, 481, '01643537116', 'Dear Salah uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-10 14:53:08', NULL, NULL, 111, '2022-03-10 15:00:04'),
(111186, 486, '01616701413', 'Dear জামশেদ আলম নিলয়, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-10 23:04:07', NULL, NULL, 108, '2022-03-11 00:00:05'),
(111187, 485, '01743918340', 'Dear শাহাদাত হোসেন অনি, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 2, '2022-03-10 23:05:00', NULL, NULL, 108, '2022-03-11 00:00:06'),
(111188, 484, '01819841209', 'Dear Kapil Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-10 23:40:55', NULL, NULL, 109, '2022-03-11 00:00:07'),
(111189, 483, '01670354857', 'Dear Taposh pual, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-10 23:41:04', NULL, NULL, 109, '2022-03-11 00:00:08'),
(111190, 539, '01710433311', 'Dear Md Mohi Uddin Major, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 02:15:22', NULL, NULL, 109, '2022-03-11 03:00:06'),
(111191, 538, '01575048733', 'Dear Bondona Rani Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-11 02:15:29', NULL, NULL, 109, '2022-03-11 03:00:07'),
(111192, 537, '01819610807', 'Dear Jane Alam Mahi, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:15:37', NULL, NULL, 109, '2022-03-11 03:00:08'),
(111193, 536, '01887634928', 'Dear Ajit Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:15:46', NULL, NULL, 109, '2022-03-11 03:00:10'),
(111194, 535, '01709990754', 'Dear Abu Shahin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 1, '2022-03-11 02:15:55', NULL, NULL, 109, '2022-03-11 03:00:10'),
(111195, 534, '01846073085', 'Dear Mohiuddin Dalim, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:16:05', NULL, NULL, 109, '2022-03-11 03:00:11'),
(111196, 533, '01303760140', 'Dear Shamim Pavel, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:16:14', NULL, NULL, 109, '2022-03-11 03:00:12'),
(111197, 532, '01816725320', 'Dear Shahadeb Mozumdar, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:16:25', NULL, NULL, 109, '2022-03-11 03:00:13'),
(111198, 531, '01856696208', 'Dear Robiul Hoque, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:16:33', NULL, NULL, 109, '2022-03-11 03:00:14'),
(111199, 530, '01925177380', 'Dear Md Fakhrul Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:16:41', NULL, NULL, 109, '2022-03-11 03:00:15'),
(111200, 529, '01854975329', 'Dear No Name, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:16:47', NULL, NULL, 109, '2022-03-11 04:00:09'),
(111201, 528, '01854042391', 'Dear Arif, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 200.00 has been successfully received. ', 2, 1, '2022-03-11 02:16:55', NULL, NULL, 109, '2022-03-11 04:00:10'),
(111202, 527, '01854042391', 'Dear Prity Rani, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-11 02:17:01', NULL, NULL, 109, '2022-03-11 04:00:11'),
(111203, 526, '01854042391', 'Dear Mohi Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 02:17:21', NULL, NULL, 109, '2022-03-11 04:00:12'),
(111204, 525, '01854042391', 'Dear Khalid Hasan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 02:17:28', NULL, NULL, 109, '2022-03-11 04:00:13'),
(111205, 524, '01854042391', 'Dear Abdullah Al Hossain, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 02:17:33', NULL, NULL, 109, '2022-03-11 04:00:14'),
(111206, 523, '01854042391', 'Dear Kamrul Hasan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 02:17:39', NULL, NULL, 109, '2022-03-11 04:00:15'),
(111207, 522, '01854042391', 'Dear Md Salauddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 02:17:45', NULL, NULL, 109, '2022-03-11 04:00:16'),
(111208, 521, '01854042391', 'Dear Abdullah Al Nahid, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:17:50', NULL, NULL, 109, '2022-03-11 04:00:17'),
(111209, 520, '01854042391', 'Dear Mejbah uddin Rana, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:17:57', NULL, NULL, 109, '2022-03-11 04:00:18'),
(111210, 519, '01854042391', 'Dear Seikh Jabed Emran, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:18:04', NULL, NULL, 109, '2022-03-11 05:00:09'),
(111211, 518, '01854042391', 'Dear Md Elias, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-11 02:18:11', NULL, NULL, 109, '2022-03-11 05:00:10'),
(111212, 517, '01854042391', 'Dear Amjad hossain sohel, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-11 02:18:16', NULL, NULL, 109, '2022-03-11 05:00:11'),
(111213, 516, '01837616244', 'Dear Md Mizan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:18:34', NULL, NULL, 109, '2022-03-11 05:00:12'),
(111214, 515, '01914474166', 'Dear Gouranggo Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:18:39', NULL, NULL, 109, '2022-03-11 05:00:13'),
(111215, 514, '01875268454', 'Dear Kishor Kumar Shom, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:18:47', NULL, NULL, 109, '2022-03-11 05:00:14'),
(111216, 513, '01830274107', 'Dear P Mithun, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:18:53', NULL, NULL, 109, '2022-03-11 05:00:15'),
(111217, 512, '01825292998', 'Dear Md Saddam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:19:01', NULL, NULL, 109, '2022-03-11 05:00:16');
INSERT INTO `sms_history` (`id`, `donar_id`, `mobile_number`, `msg`, `send_status`, `success_status`, `created_at`, `is_resend_sms`, `is_resend_sms_date`, `ins_by`, `updated_at`) VALUES
(111218, 511, '01870346988', 'Dear Dewan Rizon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:19:09', NULL, NULL, 109, '2022-03-11 05:00:17'),
(111219, 510, '01866978626', 'Dear AH Munna Feni, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:19:14', NULL, NULL, 109, '2022-03-11 05:00:18'),
(111220, 509, '01837616244', 'Dear Atik Ullah Bhuiyan Parvez, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:19:25', NULL, NULL, 109, '2022-03-11 06:00:09'),
(111221, 508, '01887037084', 'Dear Rana Khan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 02:19:37', NULL, NULL, 109, '2022-03-11 06:00:10'),
(111222, 507, '01814254459', 'Dear M A Hanif, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:19:45', NULL, NULL, 109, '2022-03-11 06:00:11'),
(111223, 506, '01838750403', 'Dear S M Asif, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 02:19:51', NULL, NULL, 109, '2022-03-11 06:00:12'),
(111224, 505, '01837616244', 'Dear Unnamed, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 02:19:57', NULL, NULL, 109, '2022-03-11 06:00:13'),
(111225, 504, '01864014100', 'Dear Gias Gh, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:02', NULL, NULL, 109, '2022-03-11 06:00:14'),
(111226, 503, '01837616244', 'Dear Mayeen Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:08', NULL, NULL, 109, '2022-03-11 06:00:15'),
(111227, 502, '01837616244', 'Dear Nur Mohammad, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:13', NULL, NULL, 109, '2022-03-11 06:00:16'),
(111228, 501, '01837616244', 'Dear MD Ariful Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:19', NULL, NULL, 109, '2022-03-11 06:00:17'),
(111229, 500, '01711266531', 'Dear Md Saiduzzaman Siddique, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:24', NULL, NULL, 109, '2022-03-11 06:00:18'),
(111230, 499, '01837616244', 'Dear Md. Foysal Bhuiyan Manun, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:29', NULL, NULL, 109, '2022-03-11 07:00:07'),
(111231, 498, '01837616244', 'Dear Linkon Feni, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:38', NULL, NULL, 109, '2022-03-11 07:00:08'),
(111232, 497, '01811313273', 'Dear Jewel, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:44', NULL, NULL, 109, '2022-03-11 07:00:09'),
(111233, 495, '01837616244', 'Dear Riaz Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1500.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:52', NULL, NULL, 109, '2022-03-11 07:00:10'),
(111234, 496, '01815944577', 'Dear Sohel Mahmud, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:20:57', NULL, NULL, 109, '2022-03-11 07:00:11'),
(111235, 494, '01837616244', 'Dear MD Mominul Sujan, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:21:04', NULL, NULL, 109, '2022-03-11 07:00:12'),
(111236, 493, '01837616244', 'Dear MD Hasan Jony Jony, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-11 02:21:10', NULL, NULL, 109, '2022-03-11 07:00:14'),
(111237, 492, '01837616244', 'Dear Mehedi Sumon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-11 02:21:15', NULL, NULL, 109, '2022-03-11 07:00:15'),
(111238, 491, '01837616244', 'Dear Nasir Uddin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-11 02:21:20', NULL, NULL, 109, '2022-03-11 07:00:16'),
(111239, 490, '01719325456', 'Dear Mohammad Nahed Parvez, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 02:21:30', NULL, NULL, 109, '2022-03-11 07:00:17'),
(111240, 489, '01837616244', 'Dear Sn Sahin, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-11 02:21:40', NULL, NULL, 109, '2022-03-11 08:00:05'),
(111241, 488, '01837616244', 'Dear Arfin Rimon, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 5000.00 has been successfully received. ', 2, 1, '2022-03-11 02:21:47', NULL, NULL, 109, '2022-03-11 08:00:06'),
(111242, 487, '01837616244', 'Dear A Al Mamun, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 10000.00 has been successfully received. ', 2, 1, '2022-03-11 02:21:53', NULL, NULL, 109, '2022-03-11 08:00:07'),
(111243, 540, '01638667983', 'Dear Liton Chandra Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 11:11:22', NULL, NULL, 111, '2022-03-11 12:00:05'),
(111244, 541, '01841647284', 'Dear সুমন চন্দ্র দাস, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 2, '2022-03-11 14:18:27', NULL, NULL, 108, '2022-03-11 15:00:09'),
(111245, 548, '01999843161', 'Dear Abdul Sukkur, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 500.00 has been successfully received. ', 2, 1, '2022-03-11 15:51:51', NULL, NULL, 111, '2022-03-11 16:00:05'),
(111246, 554, '01846665851', 'Dear Saiful Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-11 17:34:24', NULL, NULL, 111, '2022-03-11 18:00:06'),
(111247, 566, '01829604201', 'Dear Mojammel Hoque, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-12 01:04:06', NULL, NULL, 109, '2022-03-12 02:00:07'),
(111248, 565, '01741661066', 'Dear Md Monsurul Alam Chowdhury, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-12 01:04:25', NULL, NULL, 109, '2022-03-12 02:00:08'),
(111249, 564, '01812865203', 'Dear Samir Bhowmick, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 300.00 has been successfully received. ', 2, 1, '2022-03-12 01:04:32', NULL, NULL, 109, '2022-03-12 02:00:08'),
(111250, 563, '01812340600', 'Dear Nantu Kumar Deb Nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-12 01:04:38', NULL, NULL, 109, '2022-03-12 02:00:10'),
(111251, 562, '01812340600', 'Dear Adv. Anwar hossain, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-12 01:04:43', NULL, NULL, 109, '2022-03-12 02:00:11'),
(111252, 561, '01730580571', 'Dear Saddam Hossain, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-12 01:04:52', NULL, NULL, 109, '2022-03-12 02:00:12'),
(111253, 560, '01730580571', 'Dear Belal Hossain, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-12 01:05:00', NULL, NULL, 109, '2022-03-12 02:00:13'),
(111254, 559, '01730580571', 'Dear Komol Chandra nath, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 1000.00 has been successfully received. ', 2, 1, '2022-03-12 01:05:10', NULL, NULL, 109, '2022-03-12 02:00:13'),
(111255, 558, '01730580571', 'Dear Asaduzzaman, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-12 01:05:18', NULL, NULL, 109, '2022-03-12 02:00:14'),
(111256, 557, '01730580571', 'Dear Md Harun, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 2000.00 has been successfully received. ', 2, 1, '2022-03-12 01:05:23', NULL, NULL, 109, '2022-03-12 02:00:15'),
(111257, 556, '01730580571', 'Dear Sirajul Islam, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-12 01:05:27', NULL, NULL, 109, '2022-03-12 03:00:06'),
(111258, 555, '01730580571', 'Dear Nimai Gowshami, We, at \'Ex. Student Forum of Lemua High School\',  greatly appreciate your donation. Your donation amount 3000.00 has been successfully received. ', 2, 1, '2022-03-12 01:05:32', NULL, NULL, 109, '2022-03-12 03:00:07'),
(111259, 12, '01839707645', 'Dear Md Omar Faruk, We, at \'Ex. Student Forum of Lemua High School\',   ', 1, NULL, '2022-03-17 11:53:55', NULL, NULL, 569, '2022-03-17 11:53:55'),
(111260, 13, '01839707645', 'Dear 150, We, at \'Ex. Student Forum of Lemua High School\'   ', 1, NULL, '2022-03-17 11:57:44', NULL, NULL, 569, '2022-03-17 11:57:44'),
(111261, 14, '18397076454', 'Dear te, We, at \'Ex. Student Forum of Lemua High School\'   ', 1, NULL, '2022-03-17 12:01:15', NULL, NULL, 569, '2022-03-17 12:01:15'),
(111262, 16, '3', 'Congratulation! \r\n Dear 3, You are confirmed to join Teachers Farewell-2022, Lemua High School. \r\n \r\n Regards \r\n Ex. Students Forum of LHS  ', 1, NULL, '2022-03-17 12:35:34', NULL, NULL, 569, '2022-03-17 12:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_info`
--

CREATE TABLE `supplier_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `account_no` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `present_address` varchar(255) NOT NULL,
  `permanent_address` varchar(255) NOT NULL,
  `national_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_info`
--

INSERT INTO `supplier_info` (`id`, `account_no`, `name`, `mobile`, `email`, `present_address`, `permanent_address`, `national_id`) VALUES
(1, 1000001, 'Md Omar Faruk', '01840239203', 'omarlemua@gmail.com', '109/6,east rayer bazar,dhaka-1209', '109/6,east rayer bazar,dhaka-1209', '19943011495000254');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pos_accounts`
--

CREATE TABLE `tbl_pos_accounts` (
  `id` int(11) NOT NULL,
  `accountName` varchar(55) NOT NULL,
  `accountType` varchar(11) NOT NULL,
  `accountNumber` varchar(25) DEFAULT NULL,
  `accountBranchName` varchar(55) DEFAULT NULL,
  `note` varchar(100) NOT NULL,
  `openingBal` decimal(10,2) DEFAULT NULL,
  `softDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Active, 1=Inactve, 2=Delete',
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_ip` varchar(15) DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `updated_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_pos_accounts`
--

INSERT INTO `tbl_pos_accounts` (`id`, `accountName`, `accountType`, `accountNumber`, `accountBranchName`, `note`, `openingBal`, `softDelete`, `created_by`, `created_time`, `created_ip`, `updated_by`, `updated_time`, `updated_ip`) VALUES
(6, 'Pubali Bank', 'BANK', '4741101024959', 'Lemua Bazar', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_info`
--

CREATE TABLE `transaction_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transCode` varchar(50) DEFAULT NULL,
  `transBy` varchar(100) DEFAULT NULL,
  `bank_id` int(11) UNSIGNED DEFAULT NULL COMMENT '# tbl_pos_accounts',
  `trans_date` date DEFAULT NULL,
  `type` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1 = Direct Collection via Bank, 2 = Via Fund Collector, 3 = Expense ',
  `remarks` text DEFAULT NULL,
  `receiptNo` varchar(100) DEFAULT NULL,
  `expense_ctg` int(11) UNSIGNED DEFAULT NULL COMMENT '# expenseCtg',
  `collector_id` int(11) UNSIGNED DEFAULT NULL,
  `debit_amount` decimal(10,2) DEFAULT NULL COMMENT 'Total Biling Amount',
  `credit_amount` decimal(10,2) DEFAULT NULL COMMENT 'Total Payment Amount',
  `approved_status` tinyint(3) UNSIGNED DEFAULT NULL COMMENT '1=Pending, 2=Approved, 3=Declined',
  `attachmentInfo` varchar(150) DEFAULT NULL,
  `is_active` tinyint(1) UNSIGNED DEFAULT 1,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_ip` varchar(15) DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_ip` varchar(15) DEFAULT NULL,
  `is_opening_balance` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = No, 2 = Yes',
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'have parent id exist that have child #  transaction_info '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_info`
--

INSERT INTO `transaction_info` (`id`, `transCode`, `transBy`, `bank_id`, `trans_date`, `type`, `remarks`, `receiptNo`, `expense_ctg`, `collector_id`, `debit_amount`, `credit_amount`, `approved_status`, `attachmentInfo`, `is_active`, `created_by`, `created_at`, `created_ip`, `updated_by`, `updated_at`, `updated_ip`, `is_opening_balance`, `parent_id`) VALUES
(1, '524122', '0', 6, '2022-02-18', 1, 'Hello the world', NULL, NULL, NULL, '500.00', NULL, 2, NULL, 0, NULL, '2022-02-17 20:02:13', NULL, 1, '2022-03-06 00:03:11', '', 1, NULL),
(3, 'TR#1-220306000812', NULL, 6, '2022-03-06', 1, 'Inital Balance', NULL, NULL, NULL, '356708.00', NULL, 2, '', 1, 1, '2022-03-06 00:08:12', '103.205.71.20', 1, '2022-03-06 00:08:12', '103.205.71.20', 1, NULL),
(4, 'TR#1-220306000853', 'shohag', 6, '2022-03-06', 3, 'Test Expense', NULL, 2, NULL, NULL, '500.00', 2, '', 1, 1, '2022-03-06 00:08:53', '103.205.71.20', 1, '2022-03-06 00:12:20', '', 1, NULL),
(5, 'TR#1-220322223315', '2', 6, '2022-03-22', 3, '2', NULL, 7, NULL, NULL, '2.00', 2, '', 1, 1, '2022-03-22 22:33:15', '::1', 1, '2022-03-22 22:33:15', '::1', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 NOT NULL,
  `mobile` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `mobileBankBkash` varchar(15) DEFAULT NULL,
  `email_verified_at` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `image` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `user_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Super Admin 2=admin,3=found Collector,4=Operator,5=Donar',
  `is_admin` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1=super_admin,2=system_admin',
  `userSscBatch` int(11) UNSIGNED DEFAULT NULL,
  `project_id` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `access_all_project` int(11) NOT NULL DEFAULT 0,
  `coordinator` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `emine` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `permission` text CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `deleted_by` int(11) UNSIGNED DEFAULT NULL,
  `created_ip` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `updated_ip` varchar(15) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `mobileBankBkash`, `email_verified_at`, `password`, `status`, `image`, `last_login`, `user_type`, `is_admin`, `userSscBatch`, `project_id`, `access_all_project`, `coordinator`, `emine`, `permission`, `created_at`, `updated_at`, `deleted_at`, `updated_by`, `created_by`, `deleted_by`, `created_ip`, `updated_ip`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, NULL, NULL, '$2y$10$cF7RHPn7bLtQXa8UQ7Dxu.M.vj7tYWv7yXb2W4Akxnyyquw1EQViG', 1, NULL, '2022-05-19 18:44:13', 1, 1, 2010, 1, 0, NULL, NULL, NULL, '2020-11-20 16:05:38', '2022-05-19 18:44:13', NULL, NULL, 1, NULL, NULL, NULL),
(104, 'Md Omar Faruk', 'omarshohag93@gmail.com', '01839707645', '01839707645', NULL, '$2y$10$Yn82RW5dH9RVGu0JhZBS3.goNhoSf5MVhlBi3uboGNZpaWY1x8NIK', 1, NULL, '2022-02-09 16:06:14', 1, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-02 13:08:50', '2022-02-09 16:06:14', NULL, 1, NULL, NULL, NULL, '103.205.71.20'),
(105, 'Kapil Uddin (SSC-2004)', 'kapiluddin03@gmail.com', '01819841209', '01819841209', NULL, '$2y$10$T8gl3PZq42S9XHrBCWMYOuSqwUPg/XHcI2xQZxGB0kxtNROi.k8xG', 1, NULL, '2022-03-12 10:54:42', 3, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 02:24:37', '2022-03-12 10:54:42', NULL, 1, NULL, NULL, NULL, '::1'),
(106, 'RUPOM PAUL', 'rupamcadcfeni@gmail.com', '01865510025', '01865510025', NULL, '$2y$10$Y0OF6ziB5v6AbBgIvXTYB.qq3yqs6sPcOGcLN3HiKmNglXutfK9j6', 2, NULL, NULL, 3, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 04:13:35', '2022-02-05 11:53:40', NULL, 1, NULL, NULL, NULL, '103.205.71.20'),
(107, 'Md Omar Faruk', '01839707645', '01839707645', NULL, NULL, '$2y$10$SzNQjFgU.66vhaFlsFsO9.g.VltfiT4uHG9uvNgqM67vBJXwL6yw2', 1, NULL, NULL, 1, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 11:40:28', '2022-02-05 11:40:28', NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'Manash Acharjee (SSC-2008)', 'manashacharjeebd@gmail.com', '01816363700', '01816363700', NULL, '$2y$10$tCamRBRERTn5JDy9whbjp.boG9ztCkKlZCnDNt6jcZ5IeEQtjQMoK', 1, NULL, '2022-03-11 08:14:50', 3, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 11:46:17', '2022-03-11 08:14:50', NULL, 1, NULL, NULL, NULL, '103.205.71.20'),
(109, 'Faruk Chowdhury (SSC-1998)', 'farukchowdhury3@gmail.com', '01815973257', '01815973257', NULL, '$2y$10$LEEqNppdQhMHC9BgEdsxyexDWZWXrl1CDLvpf7jLKOkO68FoBVhEG', 1, NULL, '2022-03-11 19:03:36', 3, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 11:47:27', '2022-03-11 19:03:36', NULL, 1, NULL, NULL, NULL, '103.205.71.20'),
(110, 'Md Nobi (SSC-1997)', 'mdnobi243@gmail.com', '01815129512', '01815129512', NULL, '$2y$10$op58dVqQvGo2sgjdr10VdO1upo5.WefjR/YSKOpwbrxQDbTlMSMTK', 1, NULL, '2022-03-10 15:52:37', 3, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 11:48:48', '2022-03-10 15:52:37', NULL, 1, NULL, NULL, NULL, '103.205.71.20'),
(111, 'Kazi Md Erfan (SSC-2000)', 'erfanrasel@yahoo.com', '01717192968', '01717192968', NULL, '$2y$10$uEoAftJDUEIM6vzp/71yFOgFZgU7brOvxXg1hq18NhhUU2yJVZ2hq', 1, NULL, '2022-03-11 09:51:29', 3, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 11:50:02', '2022-03-11 09:51:29', NULL, 1, NULL, NULL, NULL, '103.205.71.20'),
(112, 'Sobuj Bhuiyan', 'sobuj@gmail.com', '01811883820', '01811883820', NULL, '$2y$10$L11P2VeKhyORW1omqek1xOe6Kccr4.2/cwtyj3r8Ij5ltopGl12Hy', 2, NULL, NULL, 3, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 11:53:00', '2022-02-05 11:53:09', NULL, 1, NULL, NULL, NULL, '103.205.71.20'),
(113, '33', '333333333333333', '333333333333333', NULL, NULL, '$2y$10$400jMdqKt/XdRczvKMsXi.rWbOTpCi66yzRgBQsdPJ1M7mQEOB6X.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 12:03:03', '2022-02-05 12:03:03', NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'Md. Omar Faruk', '01839707645', '01839707645', NULL, NULL, '$2y$10$Zj11tQRkW7bvFZ/5AA6ILuZWWtIJXrzA8j8ARYFh1LHQCDVonOGHy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 13:16:23', '2022-02-05 13:16:23', NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'Md. Omar Faruk', '01839707645', '01839707645', NULL, NULL, '$2y$10$cvXwmDIxve5Jnu78hYjMhe2avgaz8h.AV2vLvzqaIVuNgl8pdMOp.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 13:52:15', '2022-02-05 13:52:15', NULL, NULL, NULL, NULL, NULL, NULL),
(116, 'Md. Omar Faruk', '01839707645', '01839707645', NULL, NULL, '$2y$10$zPR0k/WdOiSmTRj51NJXoez.pEjpb32wkVqzud1I1nBnxfXeY1Ct2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-05 14:12:46', '2022-02-05 14:12:46', NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'Test Name', '01839707645', '01839707645', NULL, NULL, '$2y$10$ibtGpXNYGYuIc/VZ3dv9Re1mj7NI6XuyJFkAbcdEy3Wf9Fqhmwy5S', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-06 08:29:56', '2022-02-06 08:29:56', NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'Test Name 2', '01839707645', '01839707645', NULL, NULL, '$2y$10$GZBHhZck3Mp2WbnZflABA.DDCJm0iov1EM7MXXCu0cbc9oWWQ.soO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-06 09:16:04', '2022-02-06 09:16:04', NULL, NULL, NULL, NULL, NULL, NULL),
(119, 'Nelufa Yeasim', '018303200055', '018303200055', NULL, NULL, '$2y$10$f3klIb3D8DFClUZcRTZrl.upyYbCXjxexmOv7fqO5MqnrB46ZJzyO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-06 09:39:23', '2022-02-06 09:39:23', NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'Nilufa Hoque', '+8801824120761', '+8801824120761', NULL, NULL, '$2y$10$LtbgaZ5scSLfE3Tq8E52xu42J4OlDMkD.mrzKqiRPw2Aris3jiyta', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-06 22:02:21', '2022-02-06 22:02:21', NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'Nilufa Yesmin', '01824120761', '01824120761', NULL, NULL, '$2y$10$T.GhwTER9XzrDUfMCdue1OMJcdiyTMfth/1KTpdu92TVho/i8e6dK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-06 23:11:24', '2022-02-06 23:11:24', NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'Belal', '+966553931608', '+966553931608', NULL, NULL, '$2y$10$bUENuGQ/PqJ2ZJoCZOrTcOhtl6MXNxctwJqiLEbpf2uVDnmJoVIaS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-07 12:39:23', '2022-02-07 12:39:23', NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'Md Omar Faruk (Test for SMS Sending)', '01839707645', '01839707645', NULL, NULL, '$2y$10$no/DlyJMdol2AIu7pVioU.4dmNZ2WLdleZWTNPSjGGXEoZRsF.VSW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-07 20:20:21', '2022-02-07 20:20:21', NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'Palash Chandra Nath', '01824995355', '01824995355', NULL, NULL, '$2y$10$Z4pdvlpnSDw8YXg0LIftBOrQroGC6F6BROBJfDGKfSXG5NYwXkYBK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-08 05:44:09', '2022-02-08 05:44:09', NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'Robiul Hoque Shobuj', '+6584386550', '+6584386550', NULL, NULL, '$2y$10$jnq3emsx/gcxDgBOid4pl.jz55C2NWn6WBw1ES0yXwexz00ewzQFq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-08 18:56:42', '2022-02-08 18:56:42', NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'নাম প্রকাশে অনিচ্ছুক (২০০৩)', '01819841209', '01819841209', NULL, NULL, '$2y$10$Q1OQXDYDA3hlolzfsW5YRemNOyhiytg/zn/8uY3gjFoUTLk5YHrgC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-09 04:02:06', '2022-02-09 04:02:06', NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'আসাদুজ্জামান (আসাদ)', '+8801814376537', '+8801814376537', NULL, NULL, '$2y$10$PxOXmqg9LgRG0QnsItiQveuvtUwSZQ5JeAiOwQgKScTa.Fesu1s/a', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-09 11:57:53', '2022-02-09 11:57:53', NULL, NULL, NULL, NULL, NULL, NULL),
(128, 'Md. Myeen Uddin', '01819003611', '01819003611', NULL, NULL, '$2y$10$E8z.iEN8o4wdQs70LhfJqu8T3OGviawbozfG/cJNI5X79jfWZBkd2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-09 12:30:43', '2022-02-09 12:30:43', NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'Nirmal Das', '01925177380', '01925177380', NULL, NULL, '$2y$10$/g2rLde.LIxA9YMcIqklg.Sm9LhJLB/G/O0OzKcr.4sK7UNNoo9oC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-09 16:14:20', '2022-02-09 16:14:20', NULL, NULL, NULL, NULL, NULL, NULL),
(130, 'Azad', '01869017735', '01869017735', NULL, NULL, '$2y$10$Dpb/rPRshzbYGoxzdVesGeGDfSKIJq1yzQiX7tbKZIkjvr/wzDzQK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-09 16:17:09', '2022-02-09 16:17:09', NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'test', '01839707645', '01839707645', NULL, NULL, '$2y$10$jD6rh82mDw9czblePXAT3OYclxvzk5adWZwX.w/FrPHczT.S0QLS2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-09 16:54:26', '2022-02-09 16:54:26', NULL, NULL, NULL, NULL, NULL, NULL),
(132, 'শরিফুল ইসলাম মুন্না', '+8801824549498', '+8801824549498', NULL, NULL, '$2y$10$4SgPBuQwcU/LhZ7mEaRS3OGI5G5wxup9ieWPS0eJ2d0W3O/tXrw1.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-10 06:41:05', '2022-02-10 06:41:05', NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'Debashish Bhowmick', '01619887867', '01619887867', NULL, NULL, '$2y$10$SXiXdwZf2oz8HCuthJ2i1ufo4FY2/QrmYMkOl6MReLDxADzgyWnUG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-10 13:53:10', '2022-02-10 13:53:10', NULL, NULL, NULL, NULL, NULL, NULL),
(134, 'Noman Pintu', '00601169327724', '00601169327724', NULL, NULL, '$2y$10$0yj2NhouV36sDtlofFPIcueCu2Tkva1jrFI5.Z0xrMTP3TeMFl29u', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-10 13:54:37', '2022-02-10 13:54:37', NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'Debashish Bhowmick', '01619887867', '01619887867', NULL, NULL, '$2y$10$G6ABFXjscgJuEAX9WlcoeupbXDqArcHso.dYlpAs15MllGeIF7P3O', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-10 13:57:18', '2022-02-10 13:57:18', NULL, NULL, NULL, NULL, NULL, NULL),
(136, 'Debashish Bhowmick', '01619887867', '01619887867', NULL, NULL, '$2y$10$fLquOL/tCdbP6gwZWrJqZOV61e1MpwMmr1iSr9lanQu7tBCXsgrKi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-10 13:58:44', '2022-02-10 13:58:44', NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'Pipul Bhowmik', '00968785750', '00968785750', NULL, NULL, '$2y$10$I36bgpZO1gCtsyq5Rt/bTOJaGLJxIaIYPIXPVo53gUmHmDYD48wP2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-10 14:04:38', '2022-02-10 14:04:38', NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'MIR REZAUL KARIM LELIN', '01815426040', '01815426040', NULL, NULL, '$2y$10$RhKVul12mu.Xxvjk5HTaxO/fWuzOwibxHcrtH4OunUkXi1jIpPp52', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-10 14:07:36', '2022-02-10 14:07:36', NULL, NULL, NULL, NULL, NULL, NULL),
(139, 'Saiful Islam', '01819086730', '01819086730', NULL, NULL, '$2y$10$O2ibAqaouM99/r0S.kSFF.HwYWtb9hkxqOgHz79rEe8.XddpeNPuq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-11 08:11:41', '2022-02-11 08:11:41', NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'আলাউদ্দিন মুন্না', '009660583862048', '009660583862048', NULL, NULL, '$2y$10$AAdYg4ak.IYW7U/A/g7zFOVVQ4DBjFyh.WIe3GdSnRubmwc2GxGrK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-11 16:45:56', '2022-02-11 16:45:56', NULL, NULL, NULL, NULL, NULL, NULL),
(141, 'শেখ ইমাম শরিফ', '01782563144', '01782563144', NULL, NULL, '$2y$10$RIdbDtSj15vkOcGMVXJ3del00/Xw3lITyvS55K/ilL6czcVIP9Cdq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 05:24:17', '2022-02-12 05:24:17', NULL, NULL, NULL, NULL, NULL, NULL),
(142, 'ডঃ শামছুদ্দিন ফরহাদ', '01919386831', '01919386831', NULL, NULL, '$2y$10$DwA4.mUAdHRB4c.2RDmb.eTcZRu3iobTuclX82ec7M2N4vyskPHp2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 09:25:56', '2022-02-12 09:25:56', NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'ডঃ শামছুদ্দিন ফরহাদ', '01919386831', '01919386831', NULL, NULL, '$2y$10$Piyohs1ifwtugip9Kj0Ea.KyoPSKyiotVVwtdAX0uyQ5lnzOxG.ja', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 09:25:59', '2022-02-12 09:25:59', NULL, NULL, NULL, NULL, NULL, NULL),
(144, 'ডঃ শামছুদ্দিন ফরহাদ', '01919386831', '01919386831', NULL, NULL, '$2y$10$vO3WE793CfRI7bnqarXzquV6tWDmxFDk3C1GMAu8QrBoH7hCfdm8m', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 09:26:13', '2022-02-12 09:26:13', NULL, NULL, NULL, NULL, NULL, NULL),
(145, 'ডঃ শামছুদ্দিন ফরহাদ', '01919386831', '01919386831', NULL, NULL, '$2y$10$sTXnN8o.9GpEDmJd3DT8K.qFJM4CzDIJEjK0ox3QPucrTwYoFveoS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 09:26:13', '2022-02-12 09:26:13', NULL, NULL, NULL, NULL, NULL, NULL),
(146, 'রায়হান উদ্দিন আহমেদ (রুবেল)', '00393284541573', '00393284541573', NULL, NULL, '$2y$10$3AIfqjvCjzB0iuqEw.nFk.b.clPTNgQBL4Icj3PKIDGRFv9GyHPHu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 11:32:04', '2022-02-12 11:32:04', NULL, NULL, NULL, NULL, NULL, NULL),
(147, 'Emran Patwary', '01819610804', '01819610804', NULL, NULL, '$2y$10$ED.B.yvWQlWqkuZGywyzleTT4Bvtvya89NovTSOv6bzcF44LvKl6a', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 13:48:51', '2022-02-12 13:48:51', NULL, NULL, NULL, NULL, NULL, NULL),
(148, 'Belal Hossain', '01617745194', '01617745194', NULL, NULL, '$2y$10$atWAkwScdPShZnuePE8KGOgchrLICzAl3Q6nk.IHb8HflzNCKJebK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 13:51:33', '2022-02-12 13:51:33', NULL, NULL, NULL, NULL, NULL, NULL),
(149, 'Shahadat Hossain Bablu', '01819647394', '01819647394', NULL, NULL, '$2y$10$/kljOSET6RsUwTbxrZfike.y5SqCF/XyEY4VXt1RWzRCW582PyA/e', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 13:54:38', '2022-02-12 13:54:38', NULL, NULL, NULL, NULL, NULL, NULL),
(150, 'Nur Alam', '01815129512', '01815129512', NULL, NULL, '$2y$10$EmKBXGLLCvL05Aew1OOPg.6RtEM6BjclvMQV3MswYpsxv3pJ7Pzye', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 13:57:41', '2022-02-12 13:57:41', NULL, NULL, NULL, NULL, NULL, NULL),
(151, 'Ashish kumar paul', '01854975329', '01854975329', NULL, NULL, '$2y$10$2101bltqyVCFNgAqWAwXCOdBS5fSVOKRCUD5byAblnNdgiBxI5wfm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 14:30:35', '2022-02-12 14:30:35', NULL, NULL, NULL, NULL, NULL, NULL),
(152, 'Anamul hoque', '01628942109', '01628942109', NULL, NULL, '$2y$10$Lg./VqrFh3D7S0XmlniyCeJNXOVf.JjExnnsu1b9VaHGY/3j3BZdi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 14:32:09', '2022-02-12 14:32:09', NULL, NULL, NULL, NULL, NULL, NULL),
(153, 'erfanul hoque nayon', '01727555800', '01727555800', NULL, NULL, '$2y$10$BIWlJvdgAQV9toDpIjS3eudYL5PUai6o5evRfaO10zA/5jTYs3Gr.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 14:35:36', '2022-02-12 14:35:36', NULL, NULL, NULL, NULL, NULL, NULL),
(154, 'Nur karim mitu', '01815129512', '01815129512', NULL, NULL, '$2y$10$ceqaPYalHOCD25lR4Eik2.9SHU367EvgQ/QpQ7VYz.2RnPNZIr672', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 14:37:25', '2022-02-12 14:37:25', NULL, NULL, NULL, NULL, NULL, NULL),
(155, 'ডাঃ বিশ্বজিৎ সুমন', '01911511883', '01911511883', NULL, NULL, '$2y$10$ZsJ2xup1lw1FDM/CIdXsN.btUPzro/US//J7fxPOA8Hmoo5Oo3m9u', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-12 14:39:48', '2022-02-12 14:39:48', NULL, NULL, NULL, NULL, NULL, NULL),
(156, 'আলী হায়দার শিপন', '01815692330', '01815692330', NULL, NULL, '$2y$10$QbOzbrf/Ue3qv73ZzHLldeOkUKZFdsVPJWniQNC29Z9Y0WdDR3q1S', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-13 06:05:28', '2022-02-13 06:05:28', NULL, NULL, NULL, NULL, NULL, NULL),
(157, 'Apu Chandra Bhowmick', '+8801832057893', '+8801832057893', NULL, NULL, '$2y$10$l5vjhePTikH7ZdNiMEJNFOnG9TmnAYUSrxEr81n9/Xhi/p9gUr1Fy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-13 16:51:29', '2022-02-13 16:51:29', NULL, NULL, NULL, NULL, NULL, NULL),
(158, 'Nikhil Chandra Das', '01824408767', '01824408767', NULL, NULL, '$2y$10$Mn1sXQNPkhlCOd/eXGP.rOtwsnjtOy/wB8JrqvF4QDVkEPZY/7kAe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-13 17:52:40', '2022-02-13 17:52:40', NULL, NULL, NULL, NULL, NULL, NULL),
(159, 'সাইদুর রহমান জিবু', '01816363464', '01816363464', NULL, NULL, '$2y$10$XkUT57Hmto9kdcIHtUZqR.igOtu.JPpighrDubCsEItGzeH7yCBi6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 03:00:56', '2022-02-15 03:00:56', NULL, NULL, NULL, NULL, NULL, NULL),
(160, 'Abdullah Al Noman', '01628398800', '01628398800', NULL, NULL, '$2y$10$UJMkNn1dLSLYPq2s6paq0u1TGRSezzbeKQzSHkQtkaAj7thjTpnKW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 06:26:12', '2022-02-15 06:26:12', NULL, NULL, NULL, NULL, NULL, NULL),
(161, 'জিয়া উদ্দিন বাবলু', '01815129512', '01815129512', NULL, NULL, '$2y$10$QcXhkjxAb5uNBwggaTHBuOHUKZj7j7xTzBbZpn53YB6qDj.cEVN1q', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 15:25:17', '2022-02-15 15:25:17', NULL, NULL, NULL, NULL, NULL, NULL),
(162, 'গিয়াস উদ্দিন', '01815129512', '01815129512', NULL, NULL, '$2y$10$UprioB5gDXLDwMVpBK1dgu8/fIc1IUIqpTGJgACtHGg53FihOsjAu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 15:27:08', '2022-02-15 15:27:08', NULL, NULL, NULL, NULL, NULL, NULL),
(163, 'জাহাঙ্গীর আলম', '01815129512', '01815129512', NULL, NULL, '$2y$10$rLPAasVRGBdT5Qr.wzCnWeNTCHOUxvJDQ8xWCNeqGYzaumZcuj9ji', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 15:28:26', '2022-02-15 15:28:26', NULL, NULL, NULL, NULL, NULL, NULL),
(164, 'মৃণাল কান্তি নাথ', '01718403285', '01718403285', NULL, NULL, '$2y$10$sDUlP1z4YvC7XAHGJ1nybeKWx9FPujN8ynRUksddt/IKEtTKsAuD.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 15:30:44', '2022-02-15 15:30:44', NULL, NULL, NULL, NULL, NULL, NULL),
(165, 'মৃণাল কান্তি নাথ', '01718403285', '01718403285', NULL, NULL, '$2y$10$iHLds5BgMQWTt.HUX4sX/uXgPAWqN82PVJmKfjGF9/ho5ENVZNc4a', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 15:33:07', '2022-02-15 15:33:07', NULL, NULL, NULL, NULL, NULL, NULL),
(166, 'রাজিব চন্দ্র নাথ', '01718403285', '01718403285', NULL, NULL, '$2y$10$YwE9ygw.9esak13kmB3QC.U4LCvBdGeSbuQKz/ZXCMvti5p9Thay.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 15:34:18', '2022-02-15 15:34:18', NULL, NULL, NULL, NULL, NULL, NULL),
(167, 'প্রদীপ দেব নাথ', '01718403285', '01718403285', NULL, NULL, '$2y$10$WCgGvrPlnlNXNskCRKJA6.b24G0nwlP/17Vtm39sf.kuqq70h816.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 15:35:49', '2022-02-15 15:35:49', NULL, NULL, NULL, NULL, NULL, NULL),
(168, 'আবুল কাশেম', '01762628915', '01762628915', NULL, NULL, '$2y$10$PSiNLE3vz3Lyo7GvmlCI/O1.owNcvOQAKRGxMSW4OR80/sg0tuD5O', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-15 15:37:57', '2022-02-15 15:37:57', NULL, NULL, NULL, NULL, NULL, NULL),
(169, 'Mitun Chandra Nath', '01718421747', '01718421747', NULL, NULL, '$2y$10$1W4N/ZBs3La.T2sDezVBCeiihnsm4WUrMMFWMqsveRmkse2k.fMIG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-17 11:51:44', '2022-02-17 11:51:44', NULL, NULL, NULL, NULL, NULL, NULL),
(170, 'Rokshana pervin Mukta', '01811244656', '01811244656', NULL, NULL, '$2y$10$8KPB4bAHHmbPnivR7fCehOjexbk9dvjWb7wRSipSp40bEeU4d3OqS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-17 12:20:49', '2022-02-17 12:20:49', NULL, NULL, NULL, NULL, NULL, NULL),
(171, 'MD SARWAR JAHAN RUBEL', '01741661066', '01741661066', NULL, NULL, '$2y$10$HQXHVgYSpnvdmxMRpoPi4u/LTe5RViWHKSAB5v3Lf0OOdVrU1xc12', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-17 12:23:25', '2022-02-17 12:23:25', NULL, NULL, NULL, NULL, NULL, NULL),
(172, 'MD HELAL UDDIN BADRI', '01741661066', '01741661066', NULL, NULL, '$2y$10$mqJfHhFuSMmr1gd23dqeMej1Nvr5G6h/R1kWJcu7WcwMqpb8T/9sG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-17 12:26:48', '2022-02-17 12:26:48', NULL, NULL, NULL, NULL, NULL, NULL),
(173, 'REETA GOWSHMI', '01875243626', '01875243626', NULL, NULL, '$2y$10$1cNJ9LuCGmjQ7yOBF3NnHOjNCkZFbNA1cmzyeD5lgq0ns05M5Etr2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-17 12:29:32', '2022-02-17 12:29:32', NULL, NULL, NULL, NULL, NULL, NULL),
(174, 'নাম প্রকাশে অনিচ্ছুক', '01978157850', '01978157850', NULL, NULL, '$2y$10$IOY1yj9PBYT3RJQOHjYcPOWTuoiUG1Wa53jU7Re6ILCqZ4pP3TGk2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-17 16:08:34', '2022-02-17 16:08:34', NULL, NULL, NULL, NULL, NULL, NULL),
(175, 'আলী কাউছার', '01787673430', '01787673430', NULL, NULL, '$2y$10$EYg5.0cBpzw.frpanqPIO.gnc5K8lPfXtnTcq9wwcjpssAkTvHOGO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-17 17:22:45', '2022-02-17 17:22:45', NULL, NULL, NULL, NULL, NULL, NULL),
(176, 'সালাউদ্দিন মানিক', '01324348648', '01324348648', NULL, NULL, '$2y$10$TW0q9v85Sw2/ELe7KIhu0u4BouKzYBhRBb4piCJCYcWZncd0byWl2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-18 12:41:28', '2022-02-18 12:41:28', NULL, NULL, NULL, NULL, NULL, NULL),
(177, 'সিন্টু', '+8801824522157', '+8801824522157', NULL, NULL, '$2y$10$gsHpXJMl5JBt53ykq0dEzubNRybmy2IBneiO6L7nFTGGvp/wGhP3m', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-18 14:05:35', '2022-02-18 14:05:35', NULL, NULL, NULL, NULL, NULL, NULL),
(178, 'Ehsan polash', '01741661066', '01741661066', NULL, NULL, '$2y$10$CWff/PKZAFlQjFfyN1t.puXXr20C5Mu4rNAjWppVhis8zOo4RQGm2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-18 18:03:40', '2022-02-18 18:03:40', NULL, NULL, NULL, NULL, NULL, NULL),
(179, 'সাদ্দাম হোসেন', '01845120130', '01845120130', NULL, NULL, '$2y$10$rl36AttfKlJ4giHvbFISFuJoIL.g4EErnTv8uH2/2XdGODu1IDssW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-19 06:35:07', '2022-02-19 06:35:07', NULL, NULL, NULL, NULL, NULL, NULL),
(180, 'Wahidul Hasan Jabed', '01819841209', '01819841209', NULL, NULL, '$2y$10$OPFUn.Bef1CQjZ20CLJkx.Wco5zK1JhuaERSkF.ZCyDmR5HByggCi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-19 06:53:41', '2022-02-19 06:53:41', NULL, NULL, NULL, NULL, NULL, NULL),
(181, 'মেজবাহ উদ্দিন আহমেদ', '01711080694', '01711080694', NULL, NULL, '$2y$10$o6B9FElvweLpD9OkDRT.qOd2/.tSSFMl.fHJmA1LR2JdMce0gKrry', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-19 06:57:46', '2022-02-19 06:57:46', NULL, NULL, NULL, NULL, NULL, NULL),
(182, 'Md Ibrahim', '01713509298', '01713509298', NULL, NULL, '$2y$10$FISvLpuzVlKVO7ybYgmg8eBkN6.WKeE/.k8k5E2l1dlkARRw8ghb2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-19 09:20:46', '2022-02-19 09:20:46', NULL, NULL, NULL, NULL, NULL, NULL),
(183, 'Jahangir Alam piplu', '01873370409', '01873370409', NULL, NULL, '$2y$10$yl3VLBVfJpckG7ARyyGvkO6Jhpg5bz8Ciqp2wNN4VHoxnDk0251sm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-19 12:08:41', '2022-02-19 12:08:41', NULL, NULL, NULL, NULL, NULL, NULL),
(184, 'Nazrul Islam', '01732235978', '01732235978', NULL, NULL, '$2y$10$WPqQz2cpnxOLk5Qvz99VG.i0XUCcE6enw9KQsvtmJD80gHqzWjIuG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-19 15:25:03', '2022-02-19 15:25:03', NULL, NULL, NULL, NULL, NULL, NULL),
(185, 'মুন্সী আসাদুল ইসলাম (রিয়াদ)', '01816363700', '01816363700', NULL, NULL, '$2y$10$.GCy/5bWvoTelxzEDr782eQHpyqHJ91kHeQHrv7kGIic32jiCmA5e', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-19 16:39:46', '2022-02-19 16:39:46', NULL, NULL, NULL, NULL, NULL, NULL),
(186, 'নাম প্রকাশে অনিচ্ছুক', '+8801824522157', '+8801824522157', NULL, NULL, '$2y$10$94K/3uggRXMEr/4LbPDzZOKSh813aqJfR7oNgsH8sb9Z3VwcsJrpa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-19 17:04:37', '2022-02-19 17:04:37', NULL, NULL, NULL, NULL, NULL, NULL),
(187, 'ফারুকুল ইসলাম সাগর', '01816363700', '01816363700', NULL, NULL, '$2y$10$IdACwCq5sTBBs69qTwxTx.yWjggBUgseqaCk4su.5ERW5wqMQMOq.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 05:34:43', '2022-02-20 05:34:43', NULL, NULL, NULL, NULL, NULL, NULL),
(188, 'Kazi sohag', '01627907724', '01627907724', NULL, NULL, '$2y$10$1.xOFw.8XaZG9DuORzvlKe3ZsLbsYziZ0kt54IPfeHq3M/Fv2gwRu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 06:06:37', '2022-02-20 06:06:37', NULL, NULL, NULL, NULL, NULL, NULL),
(189, 'খোকন চন্দ্র দাস', '+8801711702137', '+8801711702137', NULL, NULL, '$2y$10$SDWefOl5m3HBlsj7MNLnde9/SgQh4WMjH2AtG6xs9YRm0Bh5N5N02', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 06:12:23', '2022-02-20 06:12:23', NULL, NULL, NULL, NULL, NULL, NULL),
(190, 'Jamshed Alam', '01741661066', '01741661066', NULL, NULL, '$2y$10$fMagLzSyk17iEC5ECmlVse2ZVdgd.wI00uxzV9M5cXHWQuJTbLSyK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 06:26:36', '2022-02-20 06:26:36', NULL, NULL, NULL, NULL, NULL, NULL),
(191, 'সজীব দেব', '01816363700', '01816363700', NULL, NULL, '$2y$10$2xdacRMb9XUmzptcHNkY2ONb83.2tZAvnzjz3UcRff1U3Nx/JgF7S', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 08:22:44', '2022-02-20 08:22:44', NULL, NULL, NULL, NULL, NULL, NULL),
(192, 'সাদিয়া ইবনাত', '01837616244', '01837616244', NULL, NULL, '$2y$10$ef6GJyyN9YAHzj7dEQ48XenoqRidRPOaptLbou5lWeZHuwiLTv.ey', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 08:36:05', '2022-02-20 08:36:05', NULL, NULL, NULL, NULL, NULL, NULL),
(193, 'বিজয় দাস', '01978157850', '01978157850', NULL, NULL, '$2y$10$xbJIfabogWGojXvEtqSw8.MD5NJ1xEQWav1lJfspgpMhDAY2Oi47S', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 13:21:11', '2022-02-20 13:21:11', NULL, NULL, NULL, NULL, NULL, NULL),
(194, 'নারায়ন চন্দ্র নাথ', '01819741132', '01819741132', NULL, NULL, '$2y$10$3ySvPgbh4PvZZzjAz4s5uu3CwXM9cTKa7d8qdyXBxzSHCtPuoAA8W', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 13:25:16', '2022-02-20 13:25:16', NULL, NULL, NULL, NULL, NULL, NULL),
(195, 'ফজলুল হক', '01815129512', '01815129512', NULL, NULL, '$2y$10$zSzmxZUGo.FANOP4R8IgD.wYWPA8wIpJf8YrYPMavUwpD/F83TKIa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 13:26:35', '2022-02-20 13:26:35', NULL, NULL, NULL, NULL, NULL, NULL),
(196, 'স্মৃতি চক্রবর্ত্তী', '01816237771', '01816237771', NULL, NULL, '$2y$10$hfP8nhDYep2BDXcjsCJSBepby5YpIFW.DUeY712Yq5hQi/ENAPjTW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-20 16:09:25', '2022-02-20 16:09:25', NULL, NULL, NULL, NULL, NULL, NULL),
(197, 'একরামুল হক শিমুল', '01818690600', '01818690600', NULL, NULL, '$2y$10$N2zInlD0Y52WabqNtrjCkO5QfqR32SAbW6ltasqga5i83d2ZxS.9y', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-21 17:02:46', '2022-02-21 17:02:46', NULL, NULL, NULL, NULL, NULL, NULL),
(198, 'স্বর্না পাল', '01978157859', '01978157859', NULL, NULL, '$2y$10$a78U/ipaNNLagL/8e9p5k.96CJXJHM92RBmfqPq1RXj/sPta8bDNq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-21 17:04:27', '2022-02-21 17:04:27', NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'মনিরুল ইসলাম সোহাগ', '01815129512', '01815129512', NULL, NULL, '$2y$10$Y1LdTRpzgwB6GELSo9xLI.JEWQt/tH85nm486Nh8CZJdOkEgy.SYm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-21 17:30:16', '2022-02-21 17:30:16', NULL, NULL, NULL, NULL, NULL, NULL),
(200, 'একরামুল হক শিমুল', '01818690600', '01818690600', NULL, NULL, '$2y$10$p8UshNBuresGWO/ll9lheOtmuZyJ7y6Q8ic60dNUf1IzxYXJp3YOu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-21 17:33:35', '2022-02-21 17:33:35', NULL, NULL, NULL, NULL, NULL, NULL),
(201, 'মোবাশ্বের হোসেন', '01816363700', '01816363700', NULL, NULL, '$2y$10$ZYtyBc2h068j1t4WYxIJ9.OG8aUX6q56MHK5BQ8h3QDBxG6ssxvly', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-21 17:36:01', '2022-02-21 17:36:01', NULL, NULL, NULL, NULL, NULL, NULL),
(202, 'Nipa rai', '01301884410', '01301884410', NULL, NULL, '$2y$10$TBmbZ9Er0brANyecfoypYOUWzBeQr/twTFmzNaAyakeF1DDS0m5gW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-22 10:42:44', '2022-02-22 10:42:44', NULL, NULL, NULL, NULL, NULL, NULL),
(203, 'মোহাম্মদ হাসান', '01815129512', '01815129512', NULL, NULL, '$2y$10$X7EZ79F5C6vxLpzPeyvaP.AAOvY.8CPIIRygCA84PR6mk3rzYUJJS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-22 15:36:37', '2022-02-22 15:36:37', NULL, NULL, NULL, NULL, NULL, NULL),
(204, 'নিলুফা ইয়াসমিন টুম্পা', '01828516450', '01828516450', NULL, NULL, '$2y$10$a6ttwejxWlfxwBBdFpwHyeEJA7soE6WacJr5L7PBjvs1QOkwpfYhC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-22 15:44:38', '2022-02-22 15:44:38', NULL, NULL, NULL, NULL, NULL, NULL),
(205, 'তপন চন্দ্র নাথ', '01818900103', '01818900103', NULL, NULL, '$2y$10$QTPs114EwhYGDXKpDBwoB.qPr4cvck5CGuE6ztw6GawANyf5iuTOq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-22 15:46:57', '2022-02-22 15:46:57', NULL, NULL, NULL, NULL, NULL, NULL),
(206, 'রতন চন্দ্র নাথ', '+8801718403285', '+8801718403285', NULL, NULL, '$2y$10$bm84YWFURdWrNukrpdz6a.6nzsQmHNmrXH2oN70YvJQvGg8baK9vy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-22 15:53:56', '2022-02-22 15:53:56', NULL, NULL, NULL, NULL, NULL, NULL),
(207, 'Md. Ibrahim', '01819841209', '01819841209', NULL, NULL, '$2y$10$I0MwhxoQSLMdgQnr17UOBuS3dztSjxCQSBjP/RmEoc6d4o20iWk4y', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-23 04:04:10', '2022-02-23 04:04:10', NULL, NULL, NULL, NULL, NULL, NULL),
(208, 'Afser Uddin Shahin', '01717383086', '01717383086', NULL, NULL, '$2y$10$Pttr4aqmxtrfoquNlKg9guBIajF/Og4Tlvp06rmk8BQwSSGVddYDK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 16:23:40', '2022-02-24 16:23:40', NULL, NULL, NULL, NULL, NULL, NULL),
(209, 'Afser Uddin Shahin', '01717383086', '01717383086', NULL, NULL, '$2y$10$7/3fAFMgoV7n2jWEK6X.quk6GAtwXOKEPOsHNO7CYacsaehm2Dtzq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 16:23:41', '2022-02-24 16:23:41', NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'Rebeka Sultana Shompa', '01717383076', '01717383076', NULL, NULL, '$2y$10$AdY1.COvuDk1JWeBbU6kaeDuiawrNnlrka6FIibeF4wB/.vi0vEve', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 16:25:49', '2022-02-24 16:25:49', NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'Rebeka Sultana Shompa', '01717383076', '01717383076', NULL, NULL, '$2y$10$w7F2FSeupNlRdroXqmpMEu8I9VOphUs/.sQvB3vHVBcwcm6/umGz.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 16:25:50', '2022-02-24 16:25:50', NULL, NULL, NULL, NULL, NULL, NULL),
(212, 'Rebeka Sultana Shompa', '01717383076', '01717383076', NULL, NULL, '$2y$10$Ztpo9JQZt0QcbhnZ85VgqeQIgZfrv7k8Z02h8nq0mVFR4PficXNGK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 16:25:51', '2022-02-24 16:25:51', NULL, NULL, NULL, NULL, NULL, NULL),
(213, 'Sadia Afrose Shushama', '01717383076', '01717383076', NULL, NULL, '$2y$10$pbRKvhMI1KaNeG9zAQqPy.FLD.TnTA.Knxe8nc35SaNzp6Fi78nGy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 16:28:09', '2022-02-24 16:28:09', NULL, NULL, NULL, NULL, NULL, NULL),
(214, 'Sadia Afrose Shushama', '01717383076', '01717383076', NULL, NULL, '$2y$10$PSfBVudJI8Za1X4oZTIhMeOVeQp.aKrk/cKLzcTXdGWHWTJOe07hC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 16:28:09', '2022-02-24 16:28:09', NULL, NULL, NULL, NULL, NULL, NULL),
(215, 'Salauddin kader', '01819169440', '01819169440', NULL, NULL, '$2y$10$83DVF3qB0fBCAii3lYX3X.stAZ2fGB7LMceXDaKA20xX0tzUdPvDO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 16:38:09', '2022-02-24 16:38:09', NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'Raihan Uddin', '01819335256', '01819335256', NULL, NULL, '$2y$10$IWuXzl0pDS0FQdCRmaUTyu4rBS/YJEShvrdV0CE4NWQkY0GCkmFc2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 16:41:52', '2022-02-24 16:41:52', NULL, NULL, NULL, NULL, NULL, NULL),
(217, 'Abul Kalam Mintu', '01818996392', '01818996392', NULL, NULL, '$2y$10$eq.2sF9CrRT3VeTQ/VYX3unEacRwb.EaFsQXZeb7trad3M9/n0QxW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-24 17:13:50', '2022-02-24 17:13:50', NULL, NULL, NULL, NULL, NULL, NULL),
(218, 'সুজল ঘোষ', '01743918340', '01743918340', NULL, NULL, '$2y$10$0sOCMKHDDxO6q8/uTN8U.uFkoN2eqMaWTnb03nWCYGVL4nnHswTVe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-25 07:07:46', '2022-02-25 07:07:46', NULL, NULL, NULL, NULL, NULL, NULL),
(219, 'নূর নবী', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$xngcKnvP08FYnYG.2j4aAuE8zSfY6MVsuGJESx3tR82404vMFJ1aS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-25 11:30:55', '2022-02-25 11:30:55', NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'Md. Anamul Hoq Moni', '01819841209', '01819841209', NULL, NULL, '$2y$10$MUlK7ey86SXwlm8QBAECQu8MKeijzLdAcwLzIFIt6dv2mZx4e4daS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-26 11:24:14', '2022-02-26 11:24:14', NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'আব্দুল্লাহ আল কায়সার', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$TL0z3ua690bA46Ubmby0XeCDx9Pw74.sS7P2BjXv0E4h7sVplTTCK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-26 11:33:52', '2022-02-26 11:33:52', NULL, NULL, NULL, NULL, NULL, NULL),
(222, 'রহমান মোহন', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$aPWLP4SawiCVN9NaEIFcpO4IWT9lHV2HFqXktBYlmqIo6ncuPqQwK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-26 11:36:19', '2022-02-26 11:36:19', NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'নাইমুল ইসলাম', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$3uXiGiyYZM9BgtVEGcecAehVrLXwa/K00oqEBuPZe4AFnHx0d9iZy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-26 11:38:21', '2022-02-26 11:38:21', NULL, NULL, NULL, NULL, NULL, NULL),
(224, 'Nur Hossain Shipu', '01819841209', '01819841209', NULL, NULL, '$2y$10$cw4sTerz5SFYZdIDdNQzN.4IXPOHvw7a.22/n3wISc8v9J3IxFFCa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-26 14:01:17', '2022-02-26 14:01:17', NULL, NULL, NULL, NULL, NULL, NULL),
(225, 'Sabina Aktet', '01840676746', '01840676746', NULL, NULL, '$2y$10$dxqvSx./Y3EOV/UOiIN2re8JvKoy4RUJgt/u0ieO9ITOfdXDVIj1q', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-26 19:43:45', '2022-02-26 19:43:45', NULL, NULL, NULL, NULL, NULL, NULL),
(226, 'শহিদুল ইসলাম', '01817752997', '01817752997', NULL, NULL, '$2y$10$aEYXOwjyNCLjI.TuEqMLdeokuZvWifRoqbTovYhgi1e8I3hmBoNn6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 13:12:52', '2022-02-27 13:12:52', NULL, NULL, NULL, NULL, NULL, NULL),
(227, 'তোফায়েল আহমেদ', '01831071718', '01831071718', NULL, NULL, '$2y$10$iA..iTjQmLksmjXi9wK1femrM2qoJ0arwMRaxJSFJPUXmRBkiRbJS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 13:14:39', '2022-02-27 13:14:39', NULL, NULL, NULL, NULL, NULL, NULL),
(228, 'Shalina Akter Nazma', '01819841209', '01819841209', NULL, NULL, '$2y$10$i7mS7c5QM0Q4A1i1.66/au.gsBKfw3faCEPHuXyXe0o3tX4DSIJFe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 14:32:33', '2022-02-27 14:32:33', NULL, NULL, NULL, NULL, NULL, NULL),
(229, 'Tanbir Ahammad', '01778201480', '01778201480', NULL, NULL, '$2y$10$iRpsbBRy2u9QmEuFNhlLVeycU4PFeVL8zEhTTLHGjE/9u.oyV0OT2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 15:00:41', '2022-02-27 15:00:41', NULL, NULL, NULL, NULL, NULL, NULL),
(230, 'Saiful Islam Shiplu', '01817384020', '01817384020', NULL, NULL, '$2y$10$C.mvMZIjWMEeQcT7u6ab4.CQXJ41tMvHFDqjvpqgzmNTKb5tqunQe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 16:53:47', '2022-02-27 16:53:47', NULL, NULL, NULL, NULL, NULL, NULL),
(231, 'Hasan Rony', '01713509298', '01713509298', NULL, NULL, '$2y$10$MgHPkuyspAbvAkcklQVYWebRv36KJBp1kK8jw9ixajCnbiad8zxDy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 16:55:33', '2022-02-27 16:55:33', NULL, NULL, NULL, NULL, NULL, NULL),
(232, 'Soroar Hossain', '01842373284', '01842373284', NULL, NULL, '$2y$10$xmYqD9PrF9XzvihXFAd6PedLGu303ED7Cv5Czud7gcNqYyQsfIKa6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 16:57:46', '2022-02-27 16:57:46', NULL, NULL, NULL, NULL, NULL, NULL),
(233, 'Sala Uddin', '01819335256', '01819335256', NULL, NULL, '$2y$10$0h96OIiNhWNfUo0jhRmJiOyQgu007JTVdWByiFwwDIPIb4vS//5Iy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 17:00:21', '2022-02-27 17:00:21', NULL, NULL, NULL, NULL, NULL, NULL),
(234, 'Sala Uddin', '01819335256', '01819335256', NULL, NULL, '$2y$10$5AnhOpB6cnwhdzCuj04AAOQI09RHcfK7TS2R4EJqQiAjQPrD1fvN.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 17:00:22', '2022-02-27 17:00:22', NULL, NULL, NULL, NULL, NULL, NULL),
(235, 'Tanvir Ahmed', '01778201480', '01778201480', NULL, NULL, '$2y$10$N8pcpAuLklyn30l1/bRIIeT6Fw9z3Fkw9miM29H53.0H7wE0UvIUG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 17:01:48', '2022-02-27 17:01:48', NULL, NULL, NULL, NULL, NULL, NULL),
(236, 'TOFAYEL AHMED', '01741661066', '01741661066', NULL, NULL, '$2y$10$Ynx1/h2eQPiOdrUBG11SyuJw7EUasuROatBQEDUZblMlKIWunwxOO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 17:33:19', '2022-02-27 17:33:19', NULL, NULL, NULL, NULL, NULL, NULL),
(237, 'MD SHAHIDUL', '01741661066', '01741661066', NULL, NULL, '$2y$10$BmklpGwS/5Dgkr9q5uBTfODi6rPWWxehORr0h6onpGWyToj3hMkZO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 17:35:08', '2022-02-27 17:35:08', NULL, NULL, NULL, NULL, NULL, NULL),
(238, 'মুন্সী আক্তার হোসেন', '01817118615', '01817118615', NULL, NULL, '$2y$10$XHDSHx4SM1u5d2ob4ApRlOU3gq4UrP.zbyIePStb0xUUUXRgZlg52', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 17:57:22', '2022-02-27 17:57:22', NULL, NULL, NULL, NULL, NULL, NULL),
(239, 'আবু হাসনাত', '01673523927', '01673523927', NULL, NULL, '$2y$10$tzJtql0bBQVujTcthCbd6.kICcKxH3GRUqQXzDtA/yQBrg8qtjoqy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 18:00:27', '2022-02-27 18:00:27', NULL, NULL, NULL, NULL, NULL, NULL),
(240, 'সুব্রত নাথ', '01718403285', '01718403285', NULL, NULL, '$2y$10$miGV/OX0pJfY9HwizJAXee4GQlvyjVvhCJ7zU5bPoQK8nKTMTJRd.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 18:04:08', '2022-02-27 18:04:08', NULL, NULL, NULL, NULL, NULL, NULL),
(241, 'তপন চন্দ্র নাথ', '01978157850', '01978157850', NULL, NULL, '$2y$10$DnflwaljQeP56x6/zSawcu.PV7EMewPWOYMaeM6WjiXXEcJ4C5vo2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 18:06:23', '2022-02-27 18:06:23', NULL, NULL, NULL, NULL, NULL, NULL),
(242, 'নাসির উদ্দিন', '01818649860', '01818649860', NULL, NULL, '$2y$10$Rp7/6JqoR0NQxS9.8lm6je7J4BiArCOW7E3h5ytcrSEO3Zam0/94y', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 18:13:17', '2022-02-27 18:13:17', NULL, NULL, NULL, NULL, NULL, NULL),
(243, 'কাজী সামছুল হক', '01819692330', '01819692330', NULL, NULL, '$2y$10$Va5KuwuinrE.2c4.DTIUiuB8QhnTPgaWgZtjzxbRvsu8RJnWVReUy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 18:16:03', '2022-02-27 18:16:03', NULL, NULL, NULL, NULL, NULL, NULL),
(244, 'লক্ষন চন্দ্র নাথ', '01978157850', '01978157850', NULL, NULL, '$2y$10$hF/4ihcrgwlV1c7ciT0.nOASGPpuxPnO0QD4R3zAdZ5Wa20eJcl1O', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-27 18:31:52', '2022-02-27 18:31:52', NULL, NULL, NULL, NULL, NULL, NULL),
(245, 'Mahfuz Bhuiyan', '01830375851', '01830375851', NULL, NULL, '$2y$10$XQIcMOYPW/SDnI3Gr7IbpeJQh.9JTAIcL7Gd.uBE.GqXOBTrm4U9e', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-28 07:49:25', '2022-02-28 07:49:25', NULL, NULL, NULL, NULL, NULL, NULL),
(246, 'Nizam Uddin', '01814470647', '01814470647', NULL, NULL, '$2y$10$iUU4exATQDHXWCnx/w1d/e6O1srwys0FX4wJ3QpSVsvdN6VGRWtJ6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-28 07:59:59', '2022-02-28 07:59:59', NULL, NULL, NULL, NULL, NULL, NULL),
(247, 'Shahadat Hossain Sohel', '01558959032', '01558959032', NULL, NULL, '$2y$10$Wb/YIS1mers1oeqEN8bGPej10B0f2fRNTu.R8tSo5tNWxXZlA36s6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-28 17:14:01', '2022-02-28 17:14:01', NULL, NULL, NULL, NULL, NULL, NULL),
(248, 'রুহুল আমিন', '01867208906', '01867208906', NULL, NULL, '$2y$10$BoEiNNyqKFkvCaaa.AHsC.S2u7Y9JXwx1bOZ6tuUYkva/BIJzBBpu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-02-28 18:39:58', '2022-02-28 18:39:58', NULL, NULL, NULL, NULL, NULL, NULL),
(249, 'Anonymous', '01818367786', '01818367786', NULL, NULL, '$2y$10$hArjO1wzHW/Au2WXD6iDt.7zgITDAvF.Wl1wMt9wsRGmqjt.fmWBK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-01 07:35:22', '2022-03-01 07:35:22', NULL, NULL, NULL, NULL, NULL, NULL),
(250, 'Mir Hasan Saidul', '01817750170', '01817750170', NULL, NULL, '$2y$10$R3xnsZO77jpx8DJhdKJ1QeDaQffnsHGF0RSEtSuu/4kryQzZU9ytG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-01 11:13:50', '2022-03-01 11:13:50', NULL, NULL, NULL, NULL, NULL, NULL),
(251, 'Mizanur Rahman', '01819335256', '01819335256', NULL, NULL, '$2y$10$zasygUv1is0rTLQXcogvaORVf8.7aOjwUNJeZcJViE1798KJa9L.G', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-01 13:22:32', '2022-03-01 13:22:32', NULL, NULL, NULL, NULL, NULL, NULL),
(252, 'Anamul Hoque Anam', '01819841209', '01819841209', NULL, NULL, '$2y$10$hgHenoXJVbIu/Og962YRF.Ka0wsNdoAwdKxG0ylFdRNt2k/xvj5Wu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-01 17:03:15', '2022-03-01 17:03:15', NULL, NULL, NULL, NULL, NULL, NULL),
(253, 'Mejba Bhuiyan', '01741661066', '01741661066', NULL, NULL, '$2y$10$yIuB0LlO11yl/5GhUwJQZ.shWEppaNG4Q0z17lnR1/jLXvHnyqf8m', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-01 17:04:36', '2022-03-01 17:04:36', NULL, NULL, NULL, NULL, NULL, NULL),
(254, 'Shipon Pal', '01725551020', '01725551020', NULL, NULL, '$2y$10$TbbJOj0QqUtlp1kFGtnzn.nm5lP1IxHWmyxy2Dxrhn.pGElfEgJcq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 05:45:51', '2022-03-02 05:45:51', NULL, NULL, NULL, NULL, NULL, NULL),
(255, 'মুনমুন নাগ', '01813758521', '01813758521', NULL, NULL, '$2y$10$foGM4uw4bhb5njluG1qdh.t29mgmhMy0xnx/FZyNqPVqktjN1tfX.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 16:43:35', '2022-03-02 16:43:35', NULL, NULL, NULL, NULL, NULL, NULL),
(256, 'রুপম পাল', '01813758521', '01813758521', NULL, NULL, '$2y$10$oFEAQdIpuybrxUc9gFHplu80hIG7XIXzLk2Fnqft4CSNzl8R7T1Oi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 16:44:41', '2022-03-02 16:44:41', NULL, NULL, NULL, NULL, NULL, NULL),
(257, 'পীযুষ কান্তি নাগ', '01811181318', '01811181318', NULL, NULL, '$2y$10$wYgfHs83yObHpb8CymOZv.6XV1oSMxZ/H8kxQZ.6dZ3RAei4bfaN.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 16:46:00', '2022-03-02 16:46:00', NULL, NULL, NULL, NULL, NULL, NULL),
(258, 'সাবিত্রী নাগ', '01811181318', '01811181318', NULL, NULL, '$2y$10$75k8fFvDtVU02oIGsKXHeuaiMwC08bMlYdMsRAppjvh.l7XcIidea', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 16:46:52', '2022-03-02 16:46:52', NULL, NULL, NULL, NULL, NULL, NULL),
(259, 'ফজলুল করিম পিন্টু', '01716400337', '01716400337', NULL, NULL, '$2y$10$nL2a1yPl2MdBk4jA2Zxscud0bbYUcZMrzXkjPUuOCLVzfk3Qrv.5e', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:00:06', '2022-03-02 17:00:06', NULL, NULL, NULL, NULL, NULL, NULL),
(260, 'বেলায়েত হোসেন বেলাল', '01716400337', '01716400337', NULL, NULL, '$2y$10$bNT8IW/fBJJguVVlP3wfQ.Ha0kqjqDa03qPROFUiKCTZNx6qPM5le', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:02:04', '2022-03-02 17:02:04', NULL, NULL, NULL, NULL, NULL, NULL),
(261, 'আলী আশ্রাফ সুজন', '01716400337', '01716400337', NULL, NULL, '$2y$10$9KOo4ZJKQRKBVH4kEWWsXOmy8DlBNik3bEEWK2NXDjBSe9Gc2i0x.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:05:25', '2022-03-02 17:05:25', NULL, NULL, NULL, NULL, NULL, NULL),
(262, 'শাহ আলম বাবলু', '01819214651', '01819214651', NULL, NULL, '$2y$10$w2gQl2HjUUm80W9AcwgiI.IB9caBb2aDxjTWL6UJZOusPAw6D4Ob2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:07:59', '2022-03-02 17:07:59', NULL, NULL, NULL, NULL, NULL, NULL),
(263, 'দেবাশীষ ভৌমিক', '01716400337', '01716400337', NULL, NULL, '$2y$10$kdzhqfAM1nZVm.luokBfjeOzhX4Mpf8bn5xWC.Zy5RV19XsbpHKU.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:09:49', '2022-03-02 17:09:49', NULL, NULL, NULL, NULL, NULL, NULL),
(264, 'শাহজাহান কবির', '01312256980', '01312256980', NULL, NULL, '$2y$10$yuqBJBjOIFejc6QgD8lg/eQjRPhbDIfLPc9K0v/0/7QF5SxmXD/WG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:12:06', '2022-03-02 17:12:06', NULL, NULL, NULL, NULL, NULL, NULL),
(265, 'গিয়াস উদ্দিন হায়দার', '01716400337', '01716400337', NULL, NULL, '$2y$10$QNBFzSj9ZaTXkND4LWR0VOcFmne/Xyo7W9S7NXJzgOu21voMnriGy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:16:36', '2022-03-02 17:16:36', NULL, NULL, NULL, NULL, NULL, NULL),
(266, 'বিবি হাজেরা মুন্নী', '01716400337', '01716400337', NULL, NULL, '$2y$10$f8SSyKNdjohsHZuy4Y9bE.LXarDTPbjSimXpUquGnvDnTEorwJSK.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:18:17', '2022-03-02 17:18:17', NULL, NULL, NULL, NULL, NULL, NULL),
(267, 'নুর আলমগীর', '01716400337', '01716400337', NULL, NULL, '$2y$10$3Cdo87pp2sERHFCJ6p9hxurK6iVQU.AM0A4UAujW1x4rSa79ui3gq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:20:43', '2022-03-02 17:20:43', NULL, NULL, NULL, NULL, NULL, NULL),
(268, 'আবু ইউছুপ ঝন্টু', '01716400337', '01716400337', NULL, NULL, '$2y$10$5aMZL8cfQxtr647I70Qxeud3.spdGp4n8wMskMeh3vfthh6CsgEFq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:23:07', '2022-03-02 17:23:07', NULL, NULL, NULL, NULL, NULL, NULL),
(269, 'ঝর্না নাথ', '01716400337', '01716400337', NULL, NULL, '$2y$10$nDefSQdO2wMA.1eEv1Wlq.ant6iV7QjsGBRwghHoddxOeIs8TTlfS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:25:11', '2022-03-02 17:25:11', NULL, NULL, NULL, NULL, NULL, NULL),
(270, 'শেখ নিজাম উদ্দিন মাসুদ', '01911924256', '01911924256', NULL, NULL, '$2y$10$txZ4lOxAP5inhlt8owsF8O.5pECyA/MlaamRzbwO9B7rF.2wNrNtS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:27:23', '2022-03-02 17:27:23', NULL, NULL, NULL, NULL, NULL, NULL),
(271, 'দিলাফরোজ বেগম রিনা', '01716400337', '01716400337', NULL, NULL, '$2y$10$NucQOocRFnnWGuKJWaub/eRoYynFYBmoFb8GdZVtfcRZWP9oZS2n2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:29:57', '2022-03-02 17:29:57', NULL, NULL, NULL, NULL, NULL, NULL),
(272, 'অজিত কুমার', '01716400337', '01716400337', NULL, NULL, '$2y$10$XkTRgADTZMW55va2G/VxcuAB6bUkbbVP9eqy1yu4Xqtqn0fDjYFl6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:31:27', '2022-03-02 17:31:27', NULL, NULL, NULL, NULL, NULL, NULL),
(273, 'মাসুদ করিম চৌধুরী', '01716400337', '01716400337', NULL, NULL, '$2y$10$GzzpOZ6FxKKmTql.T7QnS.hK34/o.YS96cy8u/0pxc.2h57GTuFtu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:37:46', '2022-03-02 17:37:46', NULL, NULL, NULL, NULL, NULL, NULL),
(274, 'মোঃ মমিনুল হক', '01716400337', '01716400337', NULL, NULL, '$2y$10$oyh0Z5LafGlcwTbdei3lw.hAwsdJeiKKG8wmquW.mEXUmxKQDalbO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:39:01', '2022-03-02 17:39:01', NULL, NULL, NULL, NULL, NULL, NULL),
(275, 'রিয়াজ উদ্দিন আহমেদ', '01815129512', '01815129512', NULL, NULL, '$2y$10$Hu0mu4SGlRTGVFa5LDtxCuJXXg3LUKPH/QankUKP7tgB2YHVtIZnW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:40:26', '2022-03-02 17:40:26', NULL, NULL, NULL, NULL, NULL, NULL),
(276, 'ফজলুল হক', '01815129512', '01815129512', NULL, NULL, '$2y$10$B/K3FNCIYbcf7VKWAK0FDO8QwbwoVeMm00VxrlS8t0MnhXJ/mhxry', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 17:41:21', '2022-03-02 17:41:21', NULL, NULL, NULL, NULL, NULL, NULL),
(277, 'মুন্সী হারুন - অর - রশিদ তুহিন', '01812992042', '01812992042', NULL, NULL, '$2y$10$LZnK/.gSNRxaqeCJCYTCi.Bk14FI/ffk7erUSlIdwg3ad1ePRZroa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 18:23:26', '2022-03-02 18:23:26', NULL, NULL, NULL, NULL, NULL, NULL),
(278, 'Saiful Islam', '01741661066', '01741661066', NULL, NULL, '$2y$10$D.THDAxZJ9kkOfBz5ZW2guCnDeGE71LU3B.85shb1MwoCNMGLnsPW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 18:29:24', '2022-03-02 18:29:24', NULL, NULL, NULL, NULL, NULL, NULL),
(279, 'Abdullah Al Momin Biplob', '01818670916', '01818670916', NULL, NULL, '$2y$10$K6McwbM2rfkHZJkK0Zhm0eiRwZn.gnqn/EF2dx3qNLNpk.pQkNN2y', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 18:31:12', '2022-03-02 18:31:12', NULL, NULL, NULL, NULL, NULL, NULL),
(280, 'Monirul Islam Babu', '01670876557', '01670876557', NULL, NULL, '$2y$10$LUzXpa6DIfGAWD/7cM53Q.jJVrpbhSNR.uC/qtA8oOyLPYXWh67uu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 18:33:12', '2022-03-02 18:33:12', NULL, NULL, NULL, NULL, NULL, NULL),
(281, 'Shemul Bhowmik', '01816358116', '01816358116', NULL, NULL, '$2y$10$KUdgWGvGFUSuqTOl1XIvYuO5iaPFS0yH9NqnY.5QGiw4t./jVgXIy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 18:34:56', '2022-03-02 18:34:56', NULL, NULL, NULL, NULL, NULL, NULL),
(282, 'Enamul Haque Riyan', '01819841209', '01819841209', NULL, NULL, '$2y$10$ecmtj4ahNJYSZ0aS.cGM1u5yY0XgTI/.auO2Tm5OmOhfmY2rOAZQ.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 18:36:47', '2022-03-02 18:36:47', NULL, NULL, NULL, NULL, NULL, NULL),
(283, 'Badrul Hasan', '01811282240', '01811282240', NULL, NULL, '$2y$10$P6z9R/dUSVJCJvsF3MbWCunkYWCuq8WS49Ww8l.jLpsgz8U53XWSW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-02 18:38:49', '2022-03-02 18:38:49', NULL, NULL, NULL, NULL, NULL, NULL),
(284, 'Ibrahim Bhuiyan', '01818759875', '01818759875', NULL, NULL, '$2y$10$C5sOKP.173FivwoZcAmv5unzckQLge/YUvUYiFcWF5GKOGQJKxPwy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 03:07:04', '2022-03-03 03:07:04', NULL, NULL, NULL, NULL, NULL, NULL),
(285, 'Jahangir Alam', '01819680326', '01819680326', NULL, NULL, '$2y$10$L1Z6RaTdcTwD5oV.xH019u/FNjqlyvi1azeq9HaJ56wa2nbQluJe2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 03:08:56', '2022-03-03 03:08:56', NULL, NULL, NULL, NULL, NULL, NULL),
(286, 'Kazi Md.Emran', '01712606026', '01712606026', NULL, NULL, '$2y$10$mYnVOpY78YBbZmQ.A7ZSyuRMAU/9lyTR2HiT4hzCSwtTLIS8xh3kG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 03:48:01', '2022-03-03 03:48:01', NULL, NULL, NULL, NULL, NULL, NULL),
(287, 'ওমর ফারুক', '01816363700', '01816363700', NULL, NULL, '$2y$10$poilzdQ6hQUpb3dwpB0kxeJ3gxSHUHxlEsfjQDsLkP1kESEvJWcT.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 04:13:59', '2022-03-03 04:13:59', NULL, NULL, NULL, NULL, NULL, NULL),
(288, 'আবদুর রহিম', '01711152841', '01711152841', NULL, NULL, '$2y$10$NIZUb6VWxm1v7wHU6YNIluxlYu8fhSfR4ko2a6qQDCEEEJKQxXET2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 04:18:29', '2022-03-03 04:18:29', NULL, NULL, NULL, NULL, NULL, NULL),
(289, 'সাইদুল হক সাজু', '01811319914', '01811319914', NULL, NULL, '$2y$10$L6SnchXrquL2f4IyjqsBUu1CDIyAQ8bJJvERe0Csh1YOmh8S1nbQe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 06:53:07', '2022-03-03 06:53:07', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `mobileBankBkash`, `email_verified_at`, `password`, `status`, `image`, `last_login`, `user_type`, `is_admin`, `userSscBatch`, `project_id`, `access_all_project`, `coordinator`, `emine`, `permission`, `created_at`, `updated_at`, `deleted_at`, `updated_by`, `created_by`, `deleted_by`, `created_ip`, `updated_ip`) VALUES
(290, 'দিপক চন্দ্র নাথ', '01740936013', '01740936013', NULL, NULL, '$2y$10$TUSj8.dxjNSKhWWQYA/oJeRiBgzcieo7kTuwnDcffGZ0y0bXAZvCC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 07:26:47', '2022-03-03 07:26:47', NULL, NULL, NULL, NULL, NULL, NULL),
(291, 'ফরহাদ উদ্দিন আহমেদ', '01815129512', '01815129512', NULL, NULL, '$2y$10$9Hpe9EZRaH8J6seESCa1puvSrddKSyxDL4vCcs3LGAhg..48yw4cG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 09:43:07', '2022-03-03 09:43:07', NULL, NULL, NULL, NULL, NULL, NULL),
(292, 'মোহাম্মদ আলমগীর', '01818172982', '01818172982', NULL, NULL, '$2y$10$0pHXe6MiDcExuCgtuFOPhOZPmHYPHdctewQChGbiLUYp6lIvqTrEy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 09:47:38', '2022-03-03 09:47:38', NULL, NULL, NULL, NULL, NULL, NULL),
(293, 'Kamruzzaman Sumon', '01861971910', '01861971910', NULL, NULL, '$2y$10$1nCIaxZ.h49iKjdjltlsAOhyceZUzL.hUGfxvh6MOkXga1pDZiBzq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 09:50:21', '2022-03-03 09:50:21', NULL, NULL, NULL, NULL, NULL, NULL),
(294, 'Azahar hossain sumon', '01979841222', '01979841222', NULL, NULL, '$2y$10$DM/4nUdz9ysXczMG3PzhSudC5RyXtfaU15cjht7b8cxka3usowpz.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 09:52:06', '2022-03-03 09:52:06', NULL, NULL, NULL, NULL, NULL, NULL),
(295, 'Shahab uddin sumon', '01819680426', '01819680426', NULL, NULL, '$2y$10$ea.unJMm3pvPtWDkhyzUAONy.M55Z3Cg6N0zDG4rwqR5Zy15Ms6z2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 09:55:21', '2022-03-03 09:55:21', NULL, NULL, NULL, NULL, NULL, NULL),
(296, 'ইকবাল হোসেন', '01818404047', '01818404047', NULL, NULL, '$2y$10$8OFIbbNHYESsMkUk/vKeyuw3e0hn5SO.gqxSK3TTqQGfCTaP8JUmG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 12:30:20', '2022-03-03 12:30:20', NULL, NULL, NULL, NULL, NULL, NULL),
(297, 'আবদুর লতিফ', '01784517003', '01784517003', NULL, NULL, '$2y$10$8yOgpHWYflZY4c3SC9x8peUzSywGUjibP/K9jxD2vz6sUu8h6FVNe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 12:31:58', '2022-03-03 12:31:58', NULL, NULL, NULL, NULL, NULL, NULL),
(298, 'রেজিয়া চৌধুরী লিপি', '01622720543', '01622720543', NULL, NULL, '$2y$10$mNJLhsdaiRNawdJ0jKrQDeWMGyAQUTUPVCQyBdLsDgC8zJKf.mSdm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 13:07:11', '2022-03-03 13:07:11', NULL, NULL, NULL, NULL, NULL, NULL),
(299, 'সরোয়ার জাহান', '01671686862', '01671686862', NULL, NULL, '$2y$10$uZVbulAF9xLODbGg2bB68uSov40nmui3zeIfHWoL7/q3PgQYixxY.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 13:40:50', '2022-03-03 13:40:50', NULL, NULL, NULL, NULL, NULL, NULL),
(300, 'জাহিদুল হক চৌধুরী রিয়াজ', '01819841209', '01819841209', NULL, NULL, '$2y$10$p4aRNcZ4XoP/K/BI20Lffe5oPNNnwt3..SyJgh.A/vbN78UNtXvVm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 13:43:03', '2022-03-03 13:43:03', NULL, NULL, NULL, NULL, NULL, NULL),
(301, 'একরামুল হক', '01614142256', '01614142256', NULL, NULL, '$2y$10$HUcqjmu8ATsoo/VqHO.6zOTqVr10KK4Dg7Ylq2Geog/qui132HM0O', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 13:46:30', '2022-03-03 13:46:30', NULL, NULL, NULL, NULL, NULL, NULL),
(302, 'Nur Nobi Sskil', '01819962521', '01819962521', NULL, NULL, '$2y$10$cn.AKf/txze78tF4CxCet.NX5BWcJVBhJZC4BafFP/p6Uw83trVOi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 14:09:55', '2022-03-03 14:09:55', NULL, NULL, NULL, NULL, NULL, NULL),
(303, 'রুনা', '01633542350', '01633542350', NULL, NULL, '$2y$10$XhqafDzAuk5B5mRne1p90ukGeJoLmWYWnYelycJ3aRHhDb5XKcpQu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 15:24:22', '2022-03-03 15:24:22', NULL, NULL, NULL, NULL, NULL, NULL),
(304, 'জাহাঙ্গীর আলম', '01829343774', '01829343774', NULL, NULL, '$2y$10$Ukrh61wqjyb8SdkjRRjOcuYxaxHdwDTxqMKGn431wFM6lci103ly2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 15:26:22', '2022-03-03 15:26:22', NULL, NULL, NULL, NULL, NULL, NULL),
(305, 'জামাল উদ্দিন', '01718379418', '01718379418', NULL, NULL, '$2y$10$YEs.hMRSLm9CgJrd4PFrpOtDRhGD2WJOAfmGw5EJfGrvXJRiP46rK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 15:27:46', '2022-03-03 15:27:46', NULL, NULL, NULL, NULL, NULL, NULL),
(306, 'আবদুর রহিম মানিক', '01718403285', '01718403285', NULL, NULL, '$2y$10$0UvlbC7dYx1jqNKIPRDM3ury/iRAWkj4ig9VOPiQNUnNK86oqrNru', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 15:31:29', '2022-03-03 15:31:29', NULL, NULL, NULL, NULL, NULL, NULL),
(307, 'দীপংকর নাথ', '01879762384', '01879762384', NULL, NULL, '$2y$10$9Grws0xxrpRzI/FCSsEBxu6OVA.vT1lcT7JQtg.U3EjfTcm3Rz0ca', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 15:49:09', '2022-03-03 15:49:09', NULL, NULL, NULL, NULL, NULL, NULL),
(308, 'আশরাফুল হাকিম পিয়াল', '01860456320', '01860456320', NULL, NULL, '$2y$10$qXTaQnTqdyUYTzWc4ROLD.pERh4f0plkDP6W8Gdp6ifIm7HCEwoZa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 15:51:54', '2022-03-03 15:51:54', NULL, NULL, NULL, NULL, NULL, NULL),
(309, 'Biplob Chandra Nath', '01819339740', '01819339740', NULL, NULL, '$2y$10$xOYZwe5WqD3agpHrY3.NueEImSJiICWrJu4qWVoJ2i3CNyWvRrANi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 15:52:48', '2022-03-03 15:52:48', NULL, NULL, NULL, NULL, NULL, NULL),
(310, 'Md Baker', '01815594214', '01815594214', NULL, NULL, '$2y$10$Qy44d/tLy9/wg6bg1FW0/O7lWsB0kZuWjbkhAVHJbg1CdLRYw7fwi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 15:54:31', '2022-03-03 15:54:31', NULL, NULL, NULL, NULL, NULL, NULL),
(311, 'মেহেদী হায়াত নিশাত', '01627009054', '01627009054', NULL, NULL, '$2y$10$wD8hlur/C/DnXlmoNiO15uGBYlaGNzwb/rX3P8/qYK1OJb0pvz0Si', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 15:55:44', '2022-03-03 15:55:44', NULL, NULL, NULL, NULL, NULL, NULL),
(312, 'Ranjit kumar nath', '01853247316', '01853247316', NULL, NULL, '$2y$10$c1HT0scZctQW7K0qd7uax.7b3HWQMiu7lSQyRrYAMKWP/Ik89teni', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 18:02:22', '2022-03-03 18:02:22', NULL, NULL, NULL, NULL, NULL, NULL),
(313, 'Iftekhar Ahmed', '01762628915', '01762628915', NULL, NULL, '$2y$10$Krc0OcfA61RqP9FiixvSFeU2QMxCtsdbEtFkuduGdH/WdRdPIMVDm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 18:03:45', '2022-03-03 18:03:45', NULL, NULL, NULL, NULL, NULL, NULL),
(314, 'Tanni Roy', '01748189747', '01748189747', NULL, NULL, '$2y$10$aD/XhCsowedx0kWRziuhI.dsMp2JNeESUfWMJhZpTHpap/Uj4qnJm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 18:04:57', '2022-03-03 18:04:57', NULL, NULL, NULL, NULL, NULL, NULL),
(315, 'Anwar Hossain', '01711147774', '01711147774', NULL, NULL, '$2y$10$/0MCGVoUXBg5QT7Ff5IWWeMS1aYhBhGnkai0kol1nJfUmlqYGykIC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-03 18:06:15', '2022-03-03 18:06:15', NULL, NULL, NULL, NULL, NULL, NULL),
(316, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$5nKQk1A7coHPUcYndzKwteUGjbKrBXFtlAMlH4uZyjp5JmPyOFyRS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 05:49:13', '2022-03-04 05:49:13', NULL, NULL, NULL, NULL, NULL, NULL),
(317, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$9w/2TiE2z66bh9O3Dq8JGeNzyvkHhTRm.pNE0jBrNe7qKX632Wxpm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 05:51:43', '2022-03-04 05:51:43', NULL, NULL, NULL, NULL, NULL, NULL),
(318, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$5FB1asAW1v8oaVobgQ.2t.OBLLdmCcIU/Cg3xDNTfcg00ljrs.0Pm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 05:51:43', '2022-03-04 05:51:43', NULL, NULL, NULL, NULL, NULL, NULL),
(319, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$Ju3qBUPcdqnXNZ8f9AFJX.ilWxfb2/GXdy39J0GTy0o9xfgc1bzzq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 05:51:44', '2022-03-04 05:51:44', NULL, NULL, NULL, NULL, NULL, NULL),
(320, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$bQDxGFOZzg.NPrQzGNeMJ.nmdPfgkOi5NSP0sgQ60aoQ.MeQ704Va', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 05:51:45', '2022-03-04 05:51:45', NULL, NULL, NULL, NULL, NULL, NULL),
(321, 'মিঠুন দেব নাথ', '01811812777', '01811812777', NULL, NULL, '$2y$10$PjYqDgfbGtP4shy4nOokyunYqjTHcVy5wQsoLKdOUfa4G.tH6Eihe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 06:15:40', '2022-03-04 06:15:40', NULL, NULL, NULL, NULL, NULL, NULL),
(322, 'বাপ্পি পাল', '01676174239', '01676174239', NULL, NULL, '$2y$10$02IoMmEUBchGF6kmGdYfBuZKEZLmuWSp.ghx0dt2c24Uvg17hjBs6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 06:16:42', '2022-03-04 06:16:42', NULL, NULL, NULL, NULL, NULL, NULL),
(323, 'নাম প্রকাশে অনিচ্ছুক', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$q/Q5VhMzWm5MMfH6nQkpMuMkkQJpu8X.NlXoUa42gSGov39hXFGre', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 07:07:18', '2022-03-04 07:07:18', NULL, NULL, NULL, NULL, NULL, NULL),
(324, 'আরিফ হোসেন রাজু', '01887033584', '01887033584', NULL, NULL, '$2y$10$k2tUmQMPfERu.YS.JF4n5.aP8yJRJ8MVMngoe3856TG4QtRCxvPra', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 13:40:26', '2022-03-04 13:40:26', NULL, NULL, NULL, NULL, NULL, NULL),
(325, 'MD. Enamul Kaisar', '01842797984', '01842797984', NULL, NULL, '$2y$10$6I.ziI05qpzADj.g8u3.luDzqbGy6exqPhLpNYbw6EyNyjOVVXtAu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-04 15:36:43', '2022-03-04 15:36:43', NULL, NULL, NULL, NULL, NULL, NULL),
(326, 'Sujan', '01833217786', '01833217786', NULL, NULL, '$2y$10$ZCCs5AkIWjEOyx7lTB2uL.kwENkZED0pDT7qyKKHCsFb2P2Jh0P9q', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:13:54', '2022-03-05 01:13:54', NULL, NULL, NULL, NULL, NULL, NULL),
(327, 'Provati', '01833217786', '01833217786', NULL, NULL, '$2y$10$y6rYU1tdNlALG.ZwdxCgIe4dRuLcVjyJxYr45uRQW7T9gmwuCMOkK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:15:57', '2022-03-05 01:15:57', NULL, NULL, NULL, NULL, NULL, NULL),
(328, 'Niloy', '01936317279', '01936317279', NULL, NULL, '$2y$10$pbKX8bmcUB6RjCsO3ZyeGuLKSIZJfy6dzfL3EFyHbMwaehlxrSVbu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:17:37', '2022-03-05 01:17:37', NULL, NULL, NULL, NULL, NULL, NULL),
(329, 'Fahmi', '01833217786', '01833217786', NULL, NULL, '$2y$10$VZxyQUMCjb5HL/b8Gf53h.PiOWMvKd9/f0oQSs5aotVhtpTgonfii', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:19:00', '2022-03-05 01:19:00', NULL, NULL, NULL, NULL, NULL, NULL),
(330, 'Popy', '01833217786', '01833217786', NULL, NULL, '$2y$10$ubwzL4kzE59s2Do.fg0WRu/fXE4FiptUoTcPN3F/6b2lMLJyedPOq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:20:17', '2022-03-05 01:20:17', NULL, NULL, NULL, NULL, NULL, NULL),
(331, 'Jahangir', '01833217786', '01833217786', NULL, NULL, '$2y$10$lfbrnq5zPwpx2a55GL925ef.hR7uJdyMNYzn2Nn5nY4aJdunCjV0y', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:22:11', '2022-03-05 01:22:11', NULL, NULL, NULL, NULL, NULL, NULL),
(332, 'Mohona', '01833217786', '01833217786', NULL, NULL, '$2y$10$9UP2iQwmwV/1A79YxHELQetymXHBFPsNUBEk9JG4b2lrNEOQJ2Bpq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:23:35', '2022-03-05 01:23:35', NULL, NULL, NULL, NULL, NULL, NULL),
(333, 'Eti Moni', '01815918104', '01815918104', NULL, NULL, '$2y$10$/YCQ9hDrknNG3mZwePUFmuJ6WzWQJjILLTn9PAuhNX/fMGxMTzd2i', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:24:54', '2022-03-05 01:24:54', NULL, NULL, NULL, NULL, NULL, NULL),
(334, 'Golam kibria', '01670019084', '01670019084', NULL, NULL, '$2y$10$YjQtKxNXsrByNNxr1WI2zuMGZAwtretHg6tErScrRPjCDnOCr4b9q', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:26:34', '2022-03-05 01:26:34', NULL, NULL, NULL, NULL, NULL, NULL),
(335, 'Mahibul Hasan', '01840111412', '01840111412', NULL, NULL, '$2y$10$Ha9ysQpBokVPBTKjN5vdXuE0eH6K4hpCZ9VMK56IP99xEREBpoDD2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:28:38', '2022-03-05 01:28:38', NULL, NULL, NULL, NULL, NULL, NULL),
(336, 'Md Sohel', '01883880397', '01883880397', NULL, NULL, '$2y$10$jXwTkWUqdbbCRRyLa4pC8uchFwrLM61bDULg0FWFHOS1od3hqWaDO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:30:30', '2022-03-05 01:30:30', NULL, NULL, NULL, NULL, NULL, NULL),
(337, 'Anwarul Hoque Khandaker Abu', '01829343774', '01829343774', NULL, NULL, '$2y$10$e0wNsFntvjNLyS9AnaIqg.52yM.LXHl3nHw8vMxo8rLyqiRaM29t2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:33:35', '2022-03-05 01:33:35', NULL, NULL, NULL, NULL, NULL, NULL),
(338, 'Jahirul Hoque Khandaker', '01829343774', '01829343774', NULL, NULL, '$2y$10$Q9h15r77e5hqGkP2tmIrDOzjaz1IoeCYxoDhVlqNC6PcUx8z3EctG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:35:47', '2022-03-05 01:35:47', NULL, NULL, NULL, NULL, NULL, NULL),
(339, 'Bappi paul', '01676174239', '01676174239', NULL, NULL, '$2y$10$3SJV4o9zeGh2UnvO07S.C.52JWJuSYatTtbzus.UkWHDS8kOgfXfS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:37:46', '2022-03-05 01:37:46', NULL, NULL, NULL, NULL, NULL, NULL),
(340, 'Mithun Deb Nath', '01811812777', '01811812777', NULL, NULL, '$2y$10$WFC0xiS6u7XHpByi1egwTOcWWOUS2LKYxnLRNS7V2n1bPtPuXh292', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 01:39:59', '2022-03-05 01:39:59', NULL, NULL, NULL, NULL, NULL, NULL),
(341, 'Nerod Bhowmick', '01823532464', '01823532464', NULL, NULL, '$2y$10$jAb1SlvuNrFMHV2y9xixsORo1B4cfv2vvRWgwJCHXXrRxlkf3eIIm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 13:23:19', '2022-03-05 13:23:19', NULL, NULL, NULL, NULL, NULL, NULL),
(342, 'Nerod Bhowmik', '01823532464', '01823532464', NULL, NULL, '$2y$10$k1RsJRn8yJ0585DWSIb0Zu9XpXnHhjsfLoKgNFXX1..u8sghOiUdW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 13:24:38', '2022-03-05 13:24:38', NULL, NULL, NULL, NULL, NULL, NULL),
(343, 'Nerod Bhowmick', '01823532464', '01823532464', NULL, NULL, '$2y$10$1Zp5xFJn/kRUuGPf5YsOhu8puCJxIxfWsgTVyixU9DeXtTDi9SEde', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 13:25:57', '2022-03-05 13:25:57', NULL, NULL, NULL, NULL, NULL, NULL),
(344, 'ইপু', '+8801892980480', '+8801892980480', NULL, NULL, '$2y$10$BN2adSHXtnGY6ml3tnqtPuXh4U5ULhZUJMFH456KJcU98Wgbb2jsG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 16:23:09', '2022-03-05 16:23:09', NULL, NULL, NULL, NULL, NULL, NULL),
(345, 'পার্থ মজুমদার', '01743918340', '01743918340', NULL, NULL, '$2y$10$g6lNY1QTCzaTf98LVBiEGeUW.bz6hJP9b8o3iIbxu8N4iSE3jbY5C', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 16:25:03', '2022-03-05 16:25:03', NULL, NULL, NULL, NULL, NULL, NULL),
(346, 'Mosharraf Hossain Miru', '01718403285', '01718403285', NULL, NULL, '$2y$10$os8t9dfa9RSIXpSwaZCjgulhsDZ6HfCmC/2vYWlnbuxmQes1j6D7K', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:07:41', '2022-03-05 19:07:41', NULL, NULL, NULL, NULL, NULL, NULL),
(347, 'Sahab Uddin', '01816725320', '01816725320', NULL, NULL, '$2y$10$MyKDXPfq/cq0DO/p43EjkOC..GRj7hdhwyePEyRlwYRu5wnpJtdOm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:09:07', '2022-03-05 19:09:07', NULL, NULL, NULL, NULL, NULL, NULL),
(348, 'Md Sojib', '01816725320', '01816725320', NULL, NULL, '$2y$10$PcamoL7ExnryUIPdCvVB5OmN4hID.nB4qfRGeYW.1QxDRgWT5.RxK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:10:23', '2022-03-05 19:10:23', NULL, NULL, NULL, NULL, NULL, NULL),
(349, 'Yeasin Mahmud', '01816725320', '01816725320', NULL, NULL, '$2y$10$f9RTvYAMd6A5KffN/3.1z.w.ugqZs3cfMAS7UIuL1CWtLrug8C88u', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:12:49', '2022-03-05 19:12:49', NULL, NULL, NULL, NULL, NULL, NULL),
(350, 'Babul chandra nath', '01816725320', '01816725320', NULL, NULL, '$2y$10$uFAUwqTaRuNl2tTnuwxK0OGzZeRG3L8zFlpkv0tODDwP53IVtG2xG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:14:22', '2022-03-05 19:14:22', NULL, NULL, NULL, NULL, NULL, NULL),
(351, 'Didarul Islam', '01816725320', '01816725320', NULL, NULL, '$2y$10$Bczu6Rvod4IhmabeMhIayeYvxlhTaHLFC3gyLPprHJcWnQurli4b2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:15:42', '2022-03-05 19:15:42', NULL, NULL, NULL, NULL, NULL, NULL),
(352, 'Sojib Bhuiyan', '01863658880', '01863658880', NULL, NULL, '$2y$10$PlR5QjwmB3YuvpTbHFWz1uo5alinpFDUFG4z4RjH0ZwTWPB6bYhbi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:17:23', '2022-03-05 19:17:23', NULL, NULL, NULL, NULL, NULL, NULL),
(353, 'Rayhan', '01863658880', '01863658880', NULL, NULL, '$2y$10$5NwHy/Vks.9iP8.7CjgUSeZaMckeXyGndYoik5BJH/3Zj4m0suOUS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:18:42', '2022-03-05 19:18:42', NULL, NULL, NULL, NULL, NULL, NULL),
(354, 'Farjana Akter', '01863658880', '01863658880', NULL, NULL, '$2y$10$jvH5ib9Kr8KYgvbUKftH5O2p1h2z4yeUCtwVIIvftQo/qAkYnYL.S', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:20:08', '2022-03-05 19:20:08', NULL, NULL, NULL, NULL, NULL, NULL),
(355, 'Kamrul Islam', '01863658880', '01863658880', NULL, NULL, '$2y$10$vsvoF3JA7dygZO0/t2LSpOAtDD6O5ZniJb05qWYdON51vR4yaTVBm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:21:15', '2022-03-05 19:21:15', NULL, NULL, NULL, NULL, NULL, NULL),
(356, 'Sonjoy Mojumder', '01863658880', '01863658880', NULL, NULL, '$2y$10$3QeCmR1C6n6waimWucV1MOZBzOUTlBqZgr62xSwxYxivMF0nm0rZS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-05 19:22:43', '2022-03-05 19:22:43', NULL, NULL, NULL, NULL, NULL, NULL),
(357, 'Joynal Babul', '01819335256', '01819335256', NULL, NULL, '$2y$10$Qsr65Caw7TDzJSr9/N8cTOM7aa2oibYXi8x9WcXaorKGJrukhwe2.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 03:06:24', '2022-03-06 03:06:24', NULL, NULL, NULL, NULL, NULL, NULL),
(358, 'Dipankar Chandra Shil', '01609431566', '01609431566', NULL, NULL, '$2y$10$r.c4WwTm9we9zpxjmEAAzu.LvNK36N5o8zfn0vIQu32/KQwt1NxP.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 03:07:43', '2022-03-06 03:07:43', NULL, NULL, NULL, NULL, NULL, NULL),
(359, 'Johirul Alam', '01819335256', '01819335256', NULL, NULL, '$2y$10$NqgiIWpHp/KffKsvtZdlduINdW1y/mEyBBl3dzAFn08WNJrneq/Ry', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 03:09:56', '2022-03-06 03:09:56', NULL, NULL, NULL, NULL, NULL, NULL),
(360, 'Razu', '01810202040', '01810202040', NULL, NULL, '$2y$10$C77I7e6/5i9Qgh9qEQUDxOwWfTP9S438VESEpnwoaIFMHBrgUqcbi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 03:11:32', '2022-03-06 03:11:32', NULL, NULL, NULL, NULL, NULL, NULL),
(361, 'Shek saifuddin Firoz', '01959301737', '01959301737', NULL, NULL, '$2y$10$vrjDv7YSZ/UiQs9eB88oQuBFI0BJvSmpCeLBM4FKedvcqDfRIQndi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 03:13:39', '2022-03-06 03:13:39', NULL, NULL, NULL, NULL, NULL, NULL),
(362, 'আবু তালেব', '+8801812553332', '+8801812553332', NULL, NULL, '$2y$10$bC3Z/U7QNiglEhizRfQnnOYed.R3SMJiRjO5CuTP78fcMBpNiePCm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 05:33:09', '2022-03-06 05:33:09', NULL, NULL, NULL, NULL, NULL, NULL),
(363, 'Adnan bin Nahid', '01826688001', '01826688001', NULL, NULL, '$2y$10$ETpNMADjLdsSiHICgwFXR.NMwnGnFvSDH6m7lkWkhkMKGFXxGjJIC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 18:58:40', '2022-03-06 18:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(364, 'Abdur Rahim', '01826688001', '01826688001', NULL, NULL, '$2y$10$G4VDT.Jo5fw0UJtdEXl2qe3/2MBja9eB4sU0PJGGdylNn8BSevBfO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:00:28', '2022-03-06 19:00:28', NULL, NULL, NULL, NULL, NULL, NULL),
(365, 'Saharia Emon', '01826688001', '01826688001', NULL, NULL, '$2y$10$Mtfs9nIT4RfSN6ijMdGnN.BY4mdBAK0E5aojoXC3DpomnVVOX2zAa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:03:19', '2022-03-06 19:03:19', NULL, NULL, NULL, NULL, NULL, NULL),
(366, 'Omio Roy', '01826688001', '01826688001', NULL, NULL, '$2y$10$tWiZtDgcCQYtvbWAdHcBZ.hhyzgtNeo0Es8DigmOo1YA5Fgz/wOPK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:04:55', '2022-03-06 19:04:55', NULL, NULL, NULL, NULL, NULL, NULL),
(367, 'Anisha Akter', '01826688001', '01826688001', NULL, NULL, '$2y$10$Oh2411dmCQL1PBXYU.PjH.NLpULMAsGuxAigaSPuqjPEuy0tn9Sfm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:06:31', '2022-03-06 19:06:31', NULL, NULL, NULL, NULL, NULL, NULL),
(368, 'Shazzad hossain Tusher', '01826688001', '01826688001', NULL, NULL, '$2y$10$B.f10xWEjWIjAfx1vfgqYeMVm/O15JsyEvYtU621Cevo0o6awARku', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:07:52', '2022-03-06 19:07:52', NULL, NULL, NULL, NULL, NULL, NULL),
(369, 'Abu Saleh Nasim', '01826688001', '01826688001', NULL, NULL, '$2y$10$JqICNIOM5vcZDFlQgiU37uwy09U/RE7Qch1fm60cSNXelUJth6QN6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:09:08', '2022-03-06 19:09:08', NULL, NULL, NULL, NULL, NULL, NULL),
(370, 'No name', '01815327140', '01815327140', NULL, NULL, '$2y$10$HBKsCSjVGIytXOg5X6fesOgPaqKctwnfeXxxkcvAgEDp8yXLqCzve', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:10:28', '2022-03-06 19:10:28', NULL, NULL, NULL, NULL, NULL, NULL),
(371, 'Monsur Alam', '01306254599', '01306254599', NULL, NULL, '$2y$10$.imPK1QI9R7tbKgWXwktQ.Fmlh1t57VjGPt1jbNm.zbFDG4VKRW02', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:12:05', '2022-03-06 19:12:05', NULL, NULL, NULL, NULL, NULL, NULL),
(372, 'Shalaa Uddin', '01819841209', '01819841209', NULL, NULL, '$2y$10$TXM8v9YuhsbQ8iwhq4GWcelbiKODWFC5TK4JAu0fdG9XgeGo5b25W', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:13:28', '2022-03-06 19:13:28', NULL, NULL, NULL, NULL, NULL, NULL),
(373, 'Amjad Hossain Tuhin', '01826688001', '01826688001', NULL, NULL, '$2y$10$CW/oXizwjnj8iU2K1LI9XuRgGbyh0BXQb89zZzs9dwWTCWQJCXeEq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:14:50', '2022-03-06 19:14:50', NULL, NULL, NULL, NULL, NULL, NULL),
(374, 'Sumon Chandra Nath', '01844041408', '01844041408', NULL, NULL, '$2y$10$g2FSg9G0AbxP3ovj.0vF9.btkOR8c3XBZvnlCh16xrMx8kvCzOrF.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:16:07', '2022-03-06 19:16:07', NULL, NULL, NULL, NULL, NULL, NULL),
(375, 'Mohammad Jashim Uddin', '01815973256', '01815973256', NULL, NULL, '$2y$10$naOehs7yt36RIS9mePtEWOTV9i4u58zxBiX74tcf.ZV92WFzUFoQe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:17:29', '2022-03-06 19:17:29', NULL, NULL, NULL, NULL, NULL, NULL),
(376, 'M.M Mahfuz khan jelin', '01815426040', '01815426040', NULL, NULL, '$2y$10$GDzcI5BSzUM2/assWty0ie5mqNek8rn9BSzXywwE2hSZDnh6KztFK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:19:53', '2022-03-06 19:19:53', NULL, NULL, NULL, NULL, NULL, NULL),
(377, 'Dalia Karim', '01762628915', '01762628915', NULL, NULL, '$2y$10$nktTjzAs/U/wsYgvDcMgH.MjsAG3eXV7ZPgNpEZp7Iru3E4MpnAlq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-06 19:28:17', '2022-03-06 19:28:17', NULL, NULL, NULL, NULL, NULL, NULL),
(378, 'Ahamed Karim', '01713376520', '01713376520', NULL, NULL, '$2y$10$SJ8Ja2US0B6GV2F4FbfCdOo6s/BZNb7h6CXHTTaP2JVx54Mx0yV2i', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 10:29:32', '2022-03-07 10:29:32', NULL, NULL, NULL, NULL, NULL, NULL),
(379, 'Jesmin Akter', '01757930586', '01757930586', NULL, NULL, '$2y$10$T0you9sApBeONuv.11PkNOwogBiPMQKQOljj23pCFIZpUd8aeCXBm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 17:11:45', '2022-03-07 17:11:45', NULL, NULL, NULL, NULL, NULL, NULL),
(380, 'Abu Raihan Shohag', '01757930586', '01757930586', NULL, NULL, '$2y$10$ME.S05EvXFtF/HuYdETj.e9fWOcS.SKwYXRfsUcRFiypR3xeDivb6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 17:14:28', '2022-03-07 17:14:28', NULL, NULL, NULL, NULL, NULL, NULL),
(381, 'Sheikh Forid', '01817046144', '01817046144', NULL, NULL, '$2y$10$S7vmEHNJm7aCeg9zmBPD2ukJiO/hFqspwNA1w7aNIBu8hcZ8ULa26', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 17:16:17', '2022-03-07 17:16:17', NULL, NULL, NULL, NULL, NULL, NULL),
(382, 'মোশাররফ  উদ্দিন নাছিম', '01711303450', '01711303450', NULL, NULL, '$2y$10$Q9X9/JkCuUDZAqYHFjq3DewR1veJQANZlAuSWOksYBm3Z7pTOmpqO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 17:23:39', '2022-03-07 17:23:39', NULL, NULL, NULL, NULL, NULL, NULL),
(383, 'হিমাদ্রি দাস', '01711710152', '01711710152', NULL, NULL, '$2y$10$TDGrneqzKAKdQ7zZEQlbmOUNQBCZFyCDe2X.aiCjbtdbUqEnkAcYC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 17:50:53', '2022-03-07 17:50:53', NULL, NULL, NULL, NULL, NULL, NULL),
(384, 'আনোয়ার হোসেন', '01711710152', '01711710152', NULL, NULL, '$2y$10$3wJYS28IrnC/t6bd0HyY8e/Z3UjIVLBWBr0gfVQY3qnunSBCLBk.m', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 17:53:27', '2022-03-07 17:53:27', NULL, NULL, NULL, NULL, NULL, NULL),
(385, 'আনোয়ার হোসেন', '01711710152', '01711710152', NULL, NULL, '$2y$10$49oWhViznrtP4GBVqR8RaOZ8xN20i5xQJUTd5QqdCstAVe7eX4b.W', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 17:55:11', '2022-03-07 17:55:11', NULL, NULL, NULL, NULL, NULL, NULL),
(386, 'ইন্দ্রলাল নাথ', '01711710152', '01711710152', NULL, NULL, '$2y$10$PvYqz1jA0pk15DDn9GUQ.eIT8UY5X.fpkF4XD8ovIIFyRyIor1oRK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 17:57:01', '2022-03-07 17:57:01', NULL, NULL, NULL, NULL, NULL, NULL),
(387, 'রতন চন্দ্র নাথ', '01672909211', '01672909211', NULL, NULL, '$2y$10$NVanEIG8FvAp7acertCH2OwzIkSH.OK0a6U1r1q1M7hFlQ7I6xwgS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 18:00:58', '2022-03-07 18:00:58', NULL, NULL, NULL, NULL, NULL, NULL),
(388, 'নিজাম উদ্দিন খোকা', '01613376543', '01613376543', NULL, NULL, '$2y$10$H7hTa5e29Oes1vJ0Biy7D.2/Zn3ltriX7FwMm8SMUa36aCXbHfzdK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 18:02:30', '2022-03-07 18:02:30', NULL, NULL, NULL, NULL, NULL, NULL),
(389, 'আবুল খায়ের টিপু', '01873315454', '01873315454', NULL, NULL, '$2y$10$2GmQ0bFIsmGwnswItXo7OuB892HKs4aTNTHAGNMx/8NDs0j0cM0ti', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 18:05:14', '2022-03-07 18:05:14', NULL, NULL, NULL, NULL, NULL, NULL),
(390, 'মজিবুল হক শিমুল', '01840676426', '01840676426', NULL, NULL, '$2y$10$vK5mU594PnTPEome1LZKE.6YlGq.O4lr776G7yG9U9DOrE44K05bm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-07 18:06:56', '2022-03-07 18:06:56', NULL, NULL, NULL, NULL, NULL, NULL),
(391, 'মমিনুল হক ভূঁইয়া', '01711634424', '01711634424', NULL, NULL, '$2y$10$TvlhSoVOsitYcTABrx0XG.yJjsIOVHaVxn390gT2u69CdFA.Khxx2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 02:54:33', '2022-03-08 02:54:33', NULL, NULL, NULL, NULL, NULL, NULL),
(392, 'শান্তনু দেব নাথ', '+8801815326627', '+8801815326627', NULL, NULL, '$2y$10$i3vrXWARPkTcYVyIw.uBTOUBmWDxG0Y7fD82R1mHdgpooJXUwBao6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 03:16:19', '2022-03-08 03:16:19', NULL, NULL, NULL, NULL, NULL, NULL),
(393, 'নুরুল আবেদিন', '016451563776', '016451563776', NULL, NULL, '$2y$10$2s1MwPhpR//PaWfCf8JiyOzCJiObt.LTd9Vw.zkI8Ky7eym/V8FAm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 03:58:43', '2022-03-08 03:58:43', NULL, NULL, NULL, NULL, NULL, NULL),
(394, 'শিমুল চন্দ্রনাথ', '01815129512', '01815129512', NULL, NULL, '$2y$10$4tyPKaI0R.ne.cDhm9q4zuPo0K6AfzWSr6qRpW31UWfte4WJDyt5C', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 04:02:41', '2022-03-08 04:02:41', NULL, NULL, NULL, NULL, NULL, NULL),
(395, 'সালেহ উদ্দিন নাহিদ', '01791601468', '01791601468', NULL, NULL, '$2y$10$aPqDrr/fDa6SZ3uPnJpJYeCB.wpIomryJuUYjN/42W/zyDcy62yIq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 05:19:16', '2022-03-08 05:19:16', NULL, NULL, NULL, NULL, NULL, NULL),
(396, 'ওবায়দুর রহমান', '01817770736', '01817770736', NULL, NULL, '$2y$10$qNYIYkueBeoAJpg/2c8zXu72l8Bocls9rSB3L0C7MCTalo2QPeFme', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 10:19:55', '2022-03-08 10:19:55', NULL, NULL, NULL, NULL, NULL, NULL),
(397, 'মশিউর রহমান', '01842803041', '01842803041', NULL, NULL, '$2y$10$pGBE7qtDSd/lFRvF1TzJqudgER44Bb/su2jw9Nc5aeMRLPrGWIch.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 10:23:30', '2022-03-08 10:23:30', NULL, NULL, NULL, NULL, NULL, NULL),
(398, 'কামাল উদ্দিন', '01815129512', '01815129512', NULL, NULL, '$2y$10$FCq0PDX5GB4N05drAUk35O50WXBEc/ykNHIpg0Lr4aNbTI1lop7jS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 10:36:09', '2022-03-08 10:36:09', NULL, NULL, NULL, NULL, NULL, NULL),
(399, 'আবুল হোসেন', '01818958182', '01818958182', NULL, NULL, '$2y$10$XY/.COIWDd2JXMa8tmjMOeXeiBUBA4AxT67zvTkQgVLHRTkSmerBa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 12:37:49', '2022-03-08 12:37:49', NULL, NULL, NULL, NULL, NULL, NULL),
(400, 'শামসুন নাহার মলি', '01823581534', '01823581534', NULL, NULL, '$2y$10$cjqf0PUw3Md1tPHIBpNFOeTh67bj56tvQymeAzuqaKRA3g2lHCFdu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 16:44:24', '2022-03-08 16:44:24', NULL, NULL, NULL, NULL, NULL, NULL),
(401, 'নূর নাহার জলি', '01676131282', '01676131282', NULL, NULL, '$2y$10$A/M1wJsBmLt2ist/ApwNWugfk/QsUHQmfuOrVNqKAvSP9ooCxGVVS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 16:47:00', '2022-03-08 16:47:00', NULL, NULL, NULL, NULL, NULL, NULL),
(402, 'মো: ফারুক', '01812818276', '01812818276', NULL, NULL, '$2y$10$wl2jMTV2lqVvY9yhmOysyeGs7xr/18BusH9M.WCQPNFZODvlyApLu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 16:48:28', '2022-03-08 16:48:28', NULL, NULL, NULL, NULL, NULL, NULL),
(403, 'সরোজ', '01819724836', '01819724836', NULL, NULL, '$2y$10$JUzRagYOPUpmXhdyZdoALeCeyA1IaC.TCnOWCnfTIHWGy1/zu97g2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 16:50:25', '2022-03-08 16:50:25', NULL, NULL, NULL, NULL, NULL, NULL),
(404, 'আবদুল্লাহ আল আজিজ', '01644222029', '01644222029', NULL, NULL, '$2y$10$/FFsMpeHLnYVSXP5bW6Q5.208IRtDemWk3BtaHhlpr98aJ4fCZPN.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:01:55', '2022-03-08 17:01:55', NULL, NULL, NULL, NULL, NULL, NULL),
(405, 'তানভীর হাসান', '01819724836', '01819724836', NULL, NULL, '$2y$10$0oHVBuln2MWSy/KBCY27q.xKqteHIlq5LKYzb/UiWpS0VokrtuC52', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:03:03', '2022-03-08 17:03:03', NULL, NULL, NULL, NULL, NULL, NULL),
(406, 'নজরুল ইসলাম', '01822308734', '01822308734', NULL, NULL, '$2y$10$/heskbkiMrBRb127puRzR.lToTCBtTGPsPz6DzFTBUtBmrpxHKYom', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:05:53', '2022-03-08 17:05:53', NULL, NULL, NULL, NULL, NULL, NULL),
(407, 'লুবনা আক্তার', '01858170545', '01858170545', NULL, NULL, '$2y$10$sj6wySNdwMdx0T9.CDzi..q/TZGaPxDktEQHJvkML9Iv23/hdsP5K', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:06:49', '2022-03-08 17:06:49', NULL, NULL, NULL, NULL, NULL, NULL),
(408, 'রুপম দত্ত', '01837617374', '01837617374', NULL, NULL, '$2y$10$w4Af7YtQwMjaEVKExQWIOeho5JGEPzQcZ3JQNJgn1HMf6/e9gHzbq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:07:49', '2022-03-08 17:07:49', NULL, NULL, NULL, NULL, NULL, NULL),
(409, 'হেলাল উদ্দিন', '01612291930', '01612291930', NULL, NULL, '$2y$10$982N3Z6BNBnS9uT8L2F0/uny7th5AmoBORmDldZnXXu27jyWzRO56', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:09:00', '2022-03-08 17:09:00', NULL, NULL, NULL, NULL, NULL, NULL),
(410, 'আবু জায়েদ মুরাদ', '01839013997', '01839013997', NULL, NULL, '$2y$10$InIiy7sVPV4ZpZaVtXbblOqtomUGJaKUl6hO7bBxy07bFJ70OuI/O', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:10:21', '2022-03-08 17:10:21', NULL, NULL, NULL, NULL, NULL, NULL),
(411, 'জাবেদ হোসেন', '01824549498', '01824549498', NULL, NULL, '$2y$10$WzOKj23rRC.9UNLVYdVWKuxiKt7bJjwRJYRqXDBFbUPBuESUkJ2m.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:11:15', '2022-03-08 17:11:15', NULL, NULL, NULL, NULL, NULL, NULL),
(412, 'নিপু চন্দ্র নাথ', '01832657594', '01832657594', NULL, NULL, '$2y$10$1khdyZCFEOJ3ZJvxlJz5lOX17Lid2.SEofqrVV9H5TXBsTNgPZacu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:13:24', '2022-03-08 17:13:24', NULL, NULL, NULL, NULL, NULL, NULL),
(413, 'নাজমুল হক', '01845512711', '01845512711', NULL, NULL, '$2y$10$gf4.Wh74Qk3eUmhg2Pmw0OWyn4cYjAx5045BQi5q6mTT30Cg2Vaka', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:14:20', '2022-03-08 17:14:20', NULL, NULL, NULL, NULL, NULL, NULL),
(414, 'পেয়ার আহম্মদ', '01817773234', '01817773234', NULL, NULL, '$2y$10$FYPwhjdVq8fCUe80FexlPOzPzJENRTCQPVmkj/XVH.lBnOK54qSJq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:15:17', '2022-03-08 17:15:17', NULL, NULL, NULL, NULL, NULL, NULL),
(415, 'মো: ইউসুফ', '01989770147', '01989770147', NULL, NULL, '$2y$10$GbnBg1zImaTNTKbvZp5h0eMjS2a.UEcSUElmlykCJxPr7LRusZ4Ga', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:16:25', '2022-03-08 17:16:25', NULL, NULL, NULL, NULL, NULL, NULL),
(416, 'জামশেদ পাটোয়ারী', '01825293224', '01825293224', NULL, NULL, '$2y$10$ZGbWL6jv/xRcbj5mQ/rlC.XERClnnMsdoJYxSCip0U5x3f/wROZ4G', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:17:16', '2022-03-08 17:17:16', NULL, NULL, NULL, NULL, NULL, NULL),
(417, 'নাজিম মাহমুদ', '01629010783', '01629010783', NULL, NULL, '$2y$10$L4TvL/.jT.sRMZVMzHLituct2FLzrbAFCZwPZUNoBaZFW6QxaXXp.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:18:14', '2022-03-08 17:18:14', NULL, NULL, NULL, NULL, NULL, NULL),
(418, 'বাবলু নাথ', '01740936013', '01740936013', NULL, NULL, '$2y$10$T7xRCDTU5zQocaKaBKfDn.T7SWDE9rulgFS4ZOjKq.gcq0E55ask6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:22:03', '2022-03-08 17:22:03', NULL, NULL, NULL, NULL, NULL, NULL),
(419, 'আমিরুল ইসলাম টিপু', '01919201018', '01919201018', NULL, NULL, '$2y$10$n9FCh4CiOZUpuIF1ykImOOQFOT2AAfogXU0yHlePwe/h1DcgTpBiq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:23:47', '2022-03-08 17:23:47', NULL, NULL, NULL, NULL, NULL, NULL),
(420, 'নাহিয়ান বাবু', '01824549498', '01824549498', NULL, NULL, '$2y$10$KBojUhyAZPc8lNKgCtpIee9bIPh4kFXrCV7iIBXwHhRqL04wvjL22', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:24:44', '2022-03-08 17:24:44', NULL, NULL, NULL, NULL, NULL, NULL),
(421, 'জামিল হোসেন', '01830319732', '01830319732', NULL, NULL, '$2y$10$I0x3cRBaccljrRq9hXkM8.YKMqD7xmtk5SLgEU5v5YO/Lzc3c6N6a', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:25:50', '2022-03-08 17:25:50', NULL, NULL, NULL, NULL, NULL, NULL),
(422, 'মোফাজ্জল হক', '01765809156', '01765809156', NULL, NULL, '$2y$10$eUiYJ40bnPu75EahrHzxmeX2s4DVy4fE.134/67wSWpo5fLPdOV8i', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:26:54', '2022-03-08 17:26:54', NULL, NULL, NULL, NULL, NULL, NULL),
(423, 'নাহিদুল ইসলাম', '01825747641', '01825747641', NULL, NULL, '$2y$10$DDn8JYl.dEGgFP8hyVsDg./bo3kRJxBklG9CBRQTTbGFc.69n93UK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:28:03', '2022-03-08 17:28:03', NULL, NULL, NULL, NULL, NULL, NULL),
(424, 'মাহফুজ', '01850628625', '01850628625', NULL, NULL, '$2y$10$uSM.RrNNperBsc9V2rOcLOCNqnWfjRBY0JjrY966MlGkl/KeGUnmy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 17:29:09', '2022-03-08 17:29:09', NULL, NULL, NULL, NULL, NULL, NULL),
(425, 'সজীব', '01824549498', '01824549498', NULL, NULL, '$2y$10$XdDVtpWgerekrz4hc032RuB5YU.TndGzPFfhzp6T.L60ZX.r44S56', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 18:04:21', '2022-03-08 18:04:21', NULL, NULL, NULL, NULL, NULL, NULL),
(426, 'Afzalur Rahaman', '01718403285', '01718403285', NULL, NULL, '$2y$10$6evU7BIFRdR5xIVYT3kAN.CBSqRLAn4brko6c9/6oyIuWi.pkQ4aa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 18:57:28', '2022-03-08 18:57:28', NULL, NULL, NULL, NULL, NULL, NULL),
(427, 'Samir Bhowmick', '01812865203', '01812865203', NULL, NULL, '$2y$10$tTTehi5nHT2PON6MEsWqx.vsiDpOh6WCLN99qozREpHpmbc1fUvdC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 18:58:54', '2022-03-08 18:58:54', NULL, NULL, NULL, NULL, NULL, NULL),
(428, 'Mizanur Rahman Polash', '01716449275', '01716449275', NULL, NULL, '$2y$10$3uDtnh.4dKYMUZDHgf7.u.grkCWbYb1ljo0YArvDRfvQ3Cyu5i6xW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:00:45', '2022-03-08 19:00:45', NULL, NULL, NULL, NULL, NULL, NULL),
(429, 'Abdul Hai', '01741661066', '01741661066', NULL, NULL, '$2y$10$1X1.ctUanGsn/uNrYjox5uc9VG4r1yCBy56lgze0pucUTxUjNOzNq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:02:08', '2022-03-08 19:02:08', NULL, NULL, NULL, NULL, NULL, NULL),
(430, 'Md Selim', '01824471471', '01824471471', NULL, NULL, '$2y$10$bbPPBDipnOLW/Fe1B1Zt2u7u0d6NMo.80EyIUCTG3yW8lfpASHRMS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:03:24', '2022-03-08 19:03:24', NULL, NULL, NULL, NULL, NULL, NULL),
(431, 'Mosaraf Hossain', '01824471471', '01824471471', NULL, NULL, '$2y$10$WgXwtJlLqHYhr7O9KDZvy.a2PhKQO7Pxe2cNgt82Ed4TqUJpnn8wO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:04:50', '2022-03-08 19:04:50', NULL, NULL, NULL, NULL, NULL, NULL),
(432, 'Omar Faruk', '01817772310', '01817772310', NULL, NULL, '$2y$10$t0XSsxDWDgCqj.unoO9j1OwjFkido0/9llhRNN87/J45T.kNBKXE6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:05:57', '2022-03-08 19:05:57', NULL, NULL, NULL, NULL, NULL, NULL),
(433, 'Bikrom kumar paul', '01824471471', '01824471471', NULL, NULL, '$2y$10$Iyac4JB9cxlaDn5x63IlK.L1FH9pE..SgP0c7HM/SSlZDg/6ySubC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:07:00', '2022-03-08 19:07:00', NULL, NULL, NULL, NULL, NULL, NULL),
(434, 'Yousuf Alam', '01815601994', '01815601994', NULL, NULL, '$2y$10$q8Tn0NuSy3hR39SR.KEouuQ3D2PA21h8iKpiUdhPMOsToFFax2oaC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:08:07', '2022-03-08 19:08:07', NULL, NULL, NULL, NULL, NULL, NULL),
(435, 'Abdullah Al Mamun', '01819636315', '01819636315', NULL, NULL, '$2y$10$9IvLl.k1WQn4tM3abV9szOH0FcGsgPoS7C3U4PxIsiaq9EIDgl.xe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:09:22', '2022-03-08 19:09:22', NULL, NULL, NULL, NULL, NULL, NULL),
(436, 'Sarwar Alam', '01824471471', '01824471471', NULL, NULL, '$2y$10$cbAuhdIj44ZeR4iCl5cJSeTOu28RpeeUNmZPnZxqReqcy9i75pC4e', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:10:27', '2022-03-08 19:10:27', NULL, NULL, NULL, NULL, NULL, NULL),
(437, 'Emdadul Haque Swapon', '01824471471', '01824471471', NULL, NULL, '$2y$10$TG0QC590dOlWlMC.RXQa/.5Kaht8piY9vxsF0THKenXL9Jm6v739.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:12:04', '2022-03-08 19:12:04', NULL, NULL, NULL, NULL, NULL, NULL),
(438, 'Rajib chandra Paul', '01824471471', '01824471471', NULL, NULL, '$2y$10$9GvTXFuz3HaWVtkGKuvZo.8u5GbJApJ7jInxhLvpgMDdXO0ERd47W', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:13:28', '2022-03-08 19:13:28', NULL, NULL, NULL, NULL, NULL, NULL),
(439, 'Shipon Chandra Bhowmik', '01824471471', '01824471471', NULL, NULL, '$2y$10$fnJuCl/q2qAHsImLpyY0wumcjw4TevHt.3Xwpev8LKV1y4lHGwSVW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:16:12', '2022-03-08 19:16:12', NULL, NULL, NULL, NULL, NULL, NULL),
(440, 'Benu lal Nath', '01824471471', '01824471471', NULL, NULL, '$2y$10$F/wnv.hpf5y4jUt6LdqbnuqnWtGNOxkWUevF2skND1.rQ1hTeqA56', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:18:02', '2022-03-08 19:18:02', NULL, NULL, NULL, NULL, NULL, NULL),
(441, 'Khaleda Akter', '01817772310', '01817772310', NULL, NULL, '$2y$10$5mq06D4rAMRd4dcvkQu3ZedeHMI/29bU50pxsnNS7Fz6esRFgmBSW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:19:21', '2022-03-08 19:19:21', NULL, NULL, NULL, NULL, NULL, NULL),
(442, 'Sumon Chandra Nath', '01854975329', '01854975329', NULL, NULL, '$2y$10$QTjnnp.HrlxYeXtGUyyIiuBQ/ObYRHO5QL/X5sSBqogWY6YTC80h2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:21:06', '2022-03-08 19:21:06', NULL, NULL, NULL, NULL, NULL, NULL),
(443, 'Sujon Chandra Nath', '01876035120', '01876035120', NULL, NULL, '$2y$10$kod9arZLJ2CFd773ndcFzuWyaHnX45uFq5YSzHGTc.kUf8p.HSwCC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:22:42', '2022-03-08 19:22:42', NULL, NULL, NULL, NULL, NULL, NULL),
(444, 'Liton Chandra Nath', '01854975329', '01854975329', NULL, NULL, '$2y$10$JZXuMgkLF69OjkCg/Ae66.xP6sIOLVOPceWVff6SwalzTZJDitWKG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:24:05', '2022-03-08 19:24:05', NULL, NULL, NULL, NULL, NULL, NULL),
(445, 'No Name', '01824471471', '01824471471', NULL, NULL, '$2y$10$VeE7uOUvlJDnXI26LnB7IeVOXEBsmrPAHDU3055IiNxZhC8HvOHWq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:25:29', '2022-03-08 19:25:29', NULL, NULL, NULL, NULL, NULL, NULL),
(446, 'Priodon Chandra Nath', '01819145841', '01819145841', NULL, NULL, '$2y$10$wfw3d/xScPu.Ajw0/vKaIO8L80zcNSx68lhwu8IpVoNZJHOak5msy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:26:59', '2022-03-08 19:26:59', NULL, NULL, NULL, NULL, NULL, NULL),
(447, 'Shukanto Shekhor Nath', '01863426252', '01863426252', NULL, NULL, '$2y$10$MBAJwbsg9FDYA09VNE0drOthIhYUgOCXDCGH773vD30p0j1xuhYQy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:28:26', '2022-03-08 19:28:26', NULL, NULL, NULL, NULL, NULL, NULL),
(448, 'Arian Riad', '01634227443', '01634227443', NULL, NULL, '$2y$10$xWvGcdfvxv2XwTKmXzam7.L27wX1z.rs9wNoiwAARWDo8h8ZTlnO2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:31:48', '2022-03-08 19:31:48', NULL, NULL, NULL, NULL, NULL, NULL),
(449, 'Abdur Rahim', '01634227443', '01634227443', NULL, NULL, '$2y$10$O5xK7JknxNrjcuMmlP/bluMIId7ZhBgxG9I4d38DPWQ7mEu2fbwIW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:34:49', '2022-03-08 19:34:49', NULL, NULL, NULL, NULL, NULL, NULL),
(450, 'Shorav Chowdhury', '01634227443', '01634227443', NULL, NULL, '$2y$10$qnIodTivaHUiLpSRGqqj0.NJyanaFBsZLJ3pLQU8./clD1HNsiyZa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:36:10', '2022-03-08 19:36:10', NULL, NULL, NULL, NULL, NULL, NULL),
(451, 'Hrdoy', '01635227443', '01635227443', NULL, NULL, '$2y$10$bFer4TJfSRL57Grw5lTGVe.PO6H.CPEzKTLoD23990QalLrvu6DMS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:37:58', '2022-03-08 19:37:58', NULL, NULL, NULL, NULL, NULL, NULL),
(452, 'Nazmul Haider', '01634227443', '01634227443', NULL, NULL, '$2y$10$ssmI97dWU2rhwiCQCFpxAOCcCK8L1oK0NQzOQipn03USeEz6aRSrm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:39:13', '2022-03-08 19:39:13', NULL, NULL, NULL, NULL, NULL, NULL),
(453, 'Farhad Robin', '01635227443', '01635227443', NULL, NULL, '$2y$10$t0fPRl7LtpROUdOICNfSYOtWQVxXGPYPZqAF8pPzcFBOzG.uI/Zzu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:40:10', '2022-03-08 19:40:10', NULL, NULL, NULL, NULL, NULL, NULL),
(454, 'Rakibul Hasan', '01634227443', '01634227443', NULL, NULL, '$2y$10$3is.ts6m/h51yJaHWb5NGO8EFP0dC0zU9Rs4gZjvoAT693tf5Gpoq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:41:37', '2022-03-08 19:41:37', NULL, NULL, NULL, NULL, NULL, NULL),
(455, 'Nayan Bhowmick', '01634227443', '01634227443', NULL, NULL, '$2y$10$VDaEIIRr95EKSZh27h1nfuwK9q7bGG/JWYgGG0qFV9IpOW1WiqKOm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:43:03', '2022-03-08 19:43:03', NULL, NULL, NULL, NULL, NULL, NULL),
(456, 'Jony Alam', '01634227443', '01634227443', NULL, NULL, '$2y$10$o0zco61eyPMzncnUXD0.eOjUVxfWierFmmRw0n0ntvQVno8Kk2zRi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:44:02', '2022-03-08 19:44:02', NULL, NULL, NULL, NULL, NULL, NULL),
(457, 'Shaba', '01634227443', '01634227443', NULL, NULL, '$2y$10$Wa4xJRKz57gBXyHyHijzlOUHzHu4mUBSpNTcbxKY7emPMvT5pcA3G', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:45:03', '2022-03-08 19:45:03', NULL, NULL, NULL, NULL, NULL, NULL),
(458, 'Prapti', '01634227443', '01634227443', NULL, NULL, '$2y$10$DFQJAunvR4LbyHhBHmG9WebqCbdKIT/ezPMWhqo.DBUxPv3f.iJgK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:45:59', '2022-03-08 19:45:59', NULL, NULL, NULL, NULL, NULL, NULL),
(459, 'Pranto Das', '01634227443', '01634227443', NULL, NULL, '$2y$10$Uw.D3.IEQBc9WP6cWdD80OuJVm3J8l8tUxRSZLTcjn.gQiZlUPTZu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:47:01', '2022-03-08 19:47:01', NULL, NULL, NULL, NULL, NULL, NULL),
(460, 'Novel', '01634227443', '01634227443', NULL, NULL, '$2y$10$xtdiuTHJzd6cuypqnrRqKu7klOZ7a9azpIow6nC0cnY2gFlklQdkW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:47:55', '2022-03-08 19:47:55', NULL, NULL, NULL, NULL, NULL, NULL),
(461, 'Mofazzal Hossain', '01634227443', '01634227443', NULL, NULL, '$2y$10$4.xWGGQVMROyUBxO5nln5OLfnZNH1eKgsI35veWlpWMMTZBqNjXUm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:49:11', '2022-03-08 19:49:11', NULL, NULL, NULL, NULL, NULL, NULL),
(462, 'Prince Saikat', '01634227443', '01634227443', NULL, NULL, '$2y$10$dnThNPYjOEpYfuReHYtn2OiaQlVhY5vLIII7iFQ7dzB1VjDI48DVe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:50:14', '2022-03-08 19:50:14', NULL, NULL, NULL, NULL, NULL, NULL),
(463, 'Emon', '01634227443', '01634227443', NULL, NULL, '$2y$10$Lp0bakjqsgbBnsWdEgDv..n8N4Sj5a4k11J3az4Bc3xm0Md7uO/Yu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:51:11', '2022-03-08 19:51:11', NULL, NULL, NULL, NULL, NULL, NULL),
(464, 'Ataul', '01634227443', '01634227443', NULL, NULL, '$2y$10$yRVZhYXq1NQHF2QSHp49gOw9AoLlokf08Seb3GLApi02j5uE2H/wu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:52:21', '2022-03-08 19:52:21', NULL, NULL, NULL, NULL, NULL, NULL),
(465, 'Taposh', '01634227443', '01634227443', NULL, NULL, '$2y$10$wtvgPq21XMyWI4ibwlL6NOe.qd88EzGHlU5qjX75qElGaDiNF9Cei', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:53:09', '2022-03-08 19:53:09', NULL, NULL, NULL, NULL, NULL, NULL),
(466, 'Hasnat', '01634227443', '01634227443', NULL, NULL, '$2y$10$mvcktzkJ8KATqBmZb8egNeaJyXI0KI3g3y8lNuBYaHayuxKYPXBny', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:54:01', '2022-03-08 19:54:01', NULL, NULL, NULL, NULL, NULL, NULL),
(467, 'Sojib', '01634227443', '01634227443', NULL, NULL, '$2y$10$DkWgGLVJIcbnCeC5bazhoO.qriWb0iumF0WhS5ijnDdSwXaPb3EpS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:55:11', '2022-03-08 19:55:11', NULL, NULL, NULL, NULL, NULL, NULL),
(468, 'Saiful', '01634227443', '01634227443', NULL, NULL, '$2y$10$wkarsi3HH2kDVN8iexJ5nusKEPTpeOATQF2oPzV7alGQpcWna888u', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:56:14', '2022-03-08 19:56:14', NULL, NULL, NULL, NULL, NULL, NULL),
(469, 'Nishat', '01634227443', '01634227443', NULL, NULL, '$2y$10$UWBD92tbw5Z32N742xeUuOQwYlLSRlFBlDQO6T4KJim6gcRImiJj.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:57:14', '2022-03-08 19:57:14', NULL, NULL, NULL, NULL, NULL, NULL),
(470, 'Sabbir', '01634227443', '01634227443', NULL, NULL, '$2y$10$eWZBadxn7h7tZZYORbqioe6N6kwxwR8vYEHQj405k52FTOYlamJQ2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:58:20', '2022-03-08 19:58:20', NULL, NULL, NULL, NULL, NULL, NULL),
(471, 'No name', '01634227443', '01634227443', NULL, NULL, '$2y$10$TkwxqHrUBt4zQbYpVrZKwusRspWOJyq.ui3c.ORdmKvxZBdIPSUQ.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 19:59:20', '2022-03-08 19:59:20', NULL, NULL, NULL, NULL, NULL, NULL),
(472, 'Arian Riad', '01634227443', '01634227443', NULL, NULL, '$2y$10$QfpoxxkiEVyYrkIgz2SnI.O9RrUp6Y/gafJs3lMPob/fxPsTXnKvC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-08 20:21:36', '2022-03-08 20:21:36', NULL, NULL, NULL, NULL, NULL, NULL),
(473, 'Parul Akter', '01717030924', '01717030924', NULL, NULL, '$2y$10$5k.0H8GK9vGvzsdyTNigqu.hbxCYdVSUqCxK3wvrdsmZCmiFsnAt6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 03:02:19', '2022-03-10 03:02:19', NULL, NULL, NULL, NULL, NULL, NULL),
(474, 'Saddam Hossain Badal', '01717030924', '01717030924', NULL, NULL, '$2y$10$1bDr7jGENe82puIPMkq/L./jf8J30JOVCW9cKzk2YM9KmTId6GK.u', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 03:03:20', '2022-03-10 03:03:20', NULL, NULL, NULL, NULL, NULL, NULL),
(475, 'Farha Ulfat Nirjona', '01717030924', '01717030924', NULL, NULL, '$2y$10$RVcXDp1VcR.Y3T.AZgmlAu184UeX.5VJtiDBkZY9Zc/0t5kvd0NdG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 03:04:59', '2022-03-10 03:04:59', NULL, NULL, NULL, NULL, NULL, NULL),
(476, 'Kazi Md Erfan', '01717192968', '01717192968', NULL, NULL, '$2y$10$hAyHhLDYV97jJ9szM2yNWeW28wUG2Ivg9ZV4H2ycjymK3bKnffoY6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 03:07:02', '2022-03-10 03:07:02', NULL, NULL, NULL, NULL, NULL, NULL),
(477, 'সুমন চন্দ্র দাস', '+8801888739022', '+8801888739022', NULL, NULL, '$2y$10$3WXu2v3WesbTlsZW9aEuyevJxwo7Ir3rYzhq7i2EL2HPQJgIGHdpq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 04:47:00', '2022-03-10 04:47:00', NULL, NULL, NULL, NULL, NULL, NULL),
(478, 'নিশান চন্দ্র ভৌমিক', '+8801822478621', '+8801822478621', NULL, NULL, '$2y$10$asAykjGwzEkm6r13gw8MZew3x32UvXBs9usX4CpmW7ELdJ//gqxHu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 04:49:06', '2022-03-10 04:49:06', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `mobileBankBkash`, `email_verified_at`, `password`, `status`, `image`, `last_login`, `user_type`, `is_admin`, `userSscBatch`, `project_id`, `access_all_project`, `coordinator`, `emine`, `permission`, `created_at`, `updated_at`, `deleted_at`, `updated_by`, `created_by`, `deleted_by`, `created_ip`, `updated_ip`) VALUES
(479, 'পলাশ চন্দ্র দেবনাথ', '01818489926', '01818489926', NULL, NULL, '$2y$10$8ZJ2nlEYQjBNKMNG9Sp61ehfFmM8obqwCPKSr/7e94AbjeTQQXhTu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 05:20:33', '2022-03-10 05:20:33', NULL, NULL, NULL, NULL, NULL, NULL),
(480, 'আবু সাঈদ টিপু', '01762628915', '01762628915', NULL, NULL, '$2y$10$bS5WpAz/AY3arzK.IWk5U.nxuziwvKU/adiT.8FESKtQdp0BioQnS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 05:23:17', '2022-03-10 05:23:17', NULL, NULL, NULL, NULL, NULL, NULL),
(481, 'Salah uddin', '01643537116', '01643537116', NULL, NULL, '$2y$10$tGF66BrEx3FevTPg.dh3oOeNME.w4I8Yn3n.kvZ.xpZgMCVyQw5/m', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 07:14:57', '2022-03-10 07:14:57', NULL, NULL, NULL, NULL, NULL, NULL),
(482, 'সালাহ উদ্দীন সজীব', '01643537116', '01643537116', NULL, NULL, '$2y$10$xClf3yOw/JRrdpjSMR1KqeYJjj/MBVo7BHZvoDqX7a7PhI/T8TiFe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 07:17:09', '2022-03-10 07:17:09', NULL, NULL, NULL, NULL, NULL, NULL),
(483, 'Taposh pual', '01670354857', '01670354857', NULL, NULL, '$2y$10$XIEIsvqdUk7AQpDihM3VTu.x5q1NQ5gtO9bIYPT2TsgU7.F.oUbFm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 08:06:53', '2022-03-10 08:06:53', NULL, NULL, NULL, NULL, NULL, NULL),
(484, 'Kapil Uddin', '01819841209', '01819841209', NULL, NULL, '$2y$10$.zobzib/2CmYMe6Xt.TPdukp0zFLnfbuTtA6p4ipiYWj4JrB4UICm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 08:08:19', '2022-03-10 08:08:19', NULL, NULL, NULL, NULL, NULL, NULL),
(485, 'শাহাদাত হোসেন অনি', '01743918340', '01743918340', NULL, NULL, '$2y$10$pdTiipCzpMoZ.XAsi9NDE.RTXFygSGUuQtc37Pcn3vVpjPi5bEKae', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 16:42:42', '2022-03-10 16:42:42', NULL, NULL, NULL, NULL, NULL, NULL),
(486, 'জামশেদ আলম নিলয়', '+8801616701413', '+8801616701413', NULL, NULL, '$2y$10$VKXvDPE99vN8h1F0G1ozSu3QcfUTXO1EKzDDmcvtlkymkHJjpuX2i', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 16:44:30', '2022-03-10 16:44:30', NULL, NULL, NULL, NULL, NULL, NULL),
(487, 'A Al Mamun', '+8801837616244', '+8801837616244', NULL, NULL, '$2y$10$PPvifoGm81gpn4oV6KNGOuQX6IEpQkDu4U7XLfGEwgzpaZwjONEkK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:31:35', '2022-03-10 18:31:35', NULL, NULL, NULL, NULL, NULL, NULL),
(488, 'Arfin Rimon', '+8801837616244', '+8801837616244', NULL, NULL, '$2y$10$5w.85MHPm/NM7EWYMt18ze4f7SixFRvrGjuWa44amAajCBkQ7dxDK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:34:08', '2022-03-10 18:34:08', NULL, NULL, NULL, NULL, NULL, NULL),
(489, 'Sn Sahin', '+8801837616244', '+8801837616244', NULL, NULL, '$2y$10$zTFCqzy7Zmc0jXT/Ek9E8uwM8OSLB43pv3nb76A1v44GkeohkT8om', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:36:19', '2022-03-10 18:36:19', NULL, NULL, NULL, NULL, NULL, NULL),
(490, 'Mohammad Nahed Parvez', '01719325456', '01719325456', NULL, NULL, '$2y$10$0Y/ZSVTP1X/OsPeBcdpD3OZc4q8Whr2287MvDvIMkXXIEY77mf5Om', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:40:03', '2022-03-10 18:40:03', NULL, NULL, NULL, NULL, NULL, NULL),
(491, 'Nasir Uddin', '+8801837616244', '+8801837616244', NULL, NULL, '$2y$10$Zdm9f/L3LbWKFb/4Q6xC4ONf3IGNtDBgk8YZqTkyN1rXmpVI2EwzO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:43:46', '2022-03-10 18:43:46', NULL, NULL, NULL, NULL, NULL, NULL),
(492, 'Mehedi Sumon', '+8801837616244', '+8801837616244', NULL, NULL, '$2y$10$LgRr7EHKkOR4HNQqlZeTzu9CKKrAWMyEFb57SFDIiOvkSh8VrVVVS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:45:55', '2022-03-10 18:45:55', NULL, NULL, NULL, NULL, NULL, NULL),
(493, 'MD Hasan Jony Jony', '+8801837616244', '+8801837616244', NULL, NULL, '$2y$10$2SwG13qdE8TEEQbL.Wlq9up6rD8CGFS2nJ7es5R0MEqlEKil2B2yi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:47:34', '2022-03-10 18:47:34', NULL, NULL, NULL, NULL, NULL, NULL),
(494, 'MD Mominul Sujan', '+8801837616244', '+8801837616244', NULL, NULL, '$2y$10$PZEcIdTbCZqOyU3LYOmzaewlh8W95YhSr/FocVk3Suwo084yfnMO6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:50:22', '2022-03-10 18:50:22', NULL, NULL, NULL, NULL, NULL, NULL),
(495, 'Riaz Islam', '+8801837616244', '+8801837616244', NULL, NULL, '$2y$10$t8TwETpkh7eFaZLM98HXgelZLN2V9xC7mQZRb0SCkyEBctEr9Yb.q', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:52:15', '2022-03-10 18:52:15', NULL, NULL, NULL, NULL, NULL, NULL),
(496, 'Sohel Mahmud', '01815944577', '01815944577', NULL, NULL, '$2y$10$CoaxcXnrgT9xIM5XwD1KxOKyd8MZgRF4EkLYJ62LdlyZP2zy9vMR.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:53:31', '2022-03-10 18:53:31', NULL, NULL, NULL, NULL, NULL, NULL),
(497, 'Jewel', '01811313273', '01811313273', NULL, NULL, '$2y$10$Xv7lZs1ly7j7cVAvd0ETyer39O5z1OqPvbODK6308ENNnTssrPnQe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:54:29', '2022-03-10 18:54:29', NULL, NULL, NULL, NULL, NULL, NULL),
(498, 'Linkon Feni', '01837616244', '01837616244', NULL, NULL, '$2y$10$sJrpm7rr/y81EcLYsNrZEeObVt/8G6hktP/eD9nn34oaAZKX88wvC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:55:22', '2022-03-10 18:55:22', NULL, NULL, NULL, NULL, NULL, NULL),
(499, 'Md. Foysal Bhuiyan Manun', '01837616244', '01837616244', NULL, NULL, '$2y$10$7SNlknTFqApfUQfQ.ZAyvuhSRWguXqWECr5OA4AoJDvQo9Brj8RNK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:56:17', '2022-03-10 18:56:17', NULL, NULL, NULL, NULL, NULL, NULL),
(500, 'Md Saiduzzaman Siddique', '01711266531', '01711266531', NULL, NULL, '$2y$10$2mJGpGqrPcSBR8L3FqUh.ey91FFGh4HyHoQ4AgQaD/UthVjh3K/CW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:56:18', '2022-03-10 18:56:18', NULL, NULL, NULL, NULL, NULL, NULL),
(501, 'MD Ariful Islam', '01837616244', '01837616244', NULL, NULL, '$2y$10$Anv6wdzJ7Y7eRgN436KJ0uvsurrtAQ4yTHEcfiPsvXttdZbBbZvgu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:56:51', '2022-03-10 18:56:51', NULL, NULL, NULL, NULL, NULL, NULL),
(502, 'Nur Mohammad', '01837616244', '01837616244', NULL, NULL, '$2y$10$jFqoHpyF0IvDf2ZOU4PvH.gYtfgHLxonF66z6VqHUq6ym2t0aGXyS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:57:23', '2022-03-10 18:57:23', NULL, NULL, NULL, NULL, NULL, NULL),
(503, 'Mayeen Uddin', '01837616244', '01837616244', NULL, NULL, '$2y$10$KK22LV1cljRlmryESS31vu6pwRxDrNJ.Nl7her9r0S3vO3W.glJmO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:57:54', '2022-03-10 18:57:54', NULL, NULL, NULL, NULL, NULL, NULL),
(504, 'Gias Gh', '01864014100', '01864014100', NULL, NULL, '$2y$10$SO5dd5NgjQm6kktieVnx7eNM4C8Q3iY9H44xSd9jFqpTysZWmkt2u', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:58:09', '2022-03-10 18:58:09', NULL, NULL, NULL, NULL, NULL, NULL),
(505, 'Unnamed', '01837616244', '01837616244', NULL, NULL, '$2y$10$smE/msk9ZNnyQQ5ThXafSevyIoXOQZG6ABzNcrOw6QrrSBOhuXeE6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:58:30', '2022-03-10 18:58:30', NULL, NULL, NULL, NULL, NULL, NULL),
(506, 'S M Asif', '01838750403', '01838750403', NULL, NULL, '$2y$10$5Q0k1N9j/de83Ue60yhaq.pBytT6cpUzPncdNSBDC3n7KcWLQ4FVe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 18:59:27', '2022-03-10 18:59:27', NULL, NULL, NULL, NULL, NULL, NULL),
(507, 'M A Hanif', '01814254459', '01814254459', NULL, NULL, '$2y$10$7516ABEu2QzlBei5.PoYa.r3KDcSjsS6DN5XKSQMOJ.YRhBQb1ypa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:00:13', '2022-03-10 19:00:13', NULL, NULL, NULL, NULL, NULL, NULL),
(508, 'Rana Khan', '01887037084', '01887037084', NULL, NULL, '$2y$10$NT7qxpPyCP8ija2/EbcZM.L0piZZplK6uZ81unx8chXExi4XiVnBm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:00:26', '2022-03-10 19:00:26', NULL, NULL, NULL, NULL, NULL, NULL),
(509, 'Atik Ullah Bhuiyan Parvez', '01837616244', '01837616244', NULL, NULL, '$2y$10$1.1hAZPLOpf3A5rNwQ68WOBHTcQfidy9pB4xDrtmUHviqVx2Un9VS', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:01:14', '2022-03-10 19:01:14', NULL, NULL, NULL, NULL, NULL, NULL),
(510, 'AH Munna Feni', '01866978626', '01866978626', NULL, NULL, '$2y$10$lx7qcSUZ4L8.YmcIFqY73Obr4o31B76O42cneloDK9gSTdbDkTV2u', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:03:18', '2022-03-10 19:03:18', NULL, NULL, NULL, NULL, NULL, NULL),
(511, 'Dewan Rizon', '01870346988', '01870346988', NULL, NULL, '$2y$10$VQ94tm7ZO4yoqvSLkPqmzuRYeeM.sAHifEc0sCMwcZ2lqKODJ4vu.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:05:09', '2022-03-10 19:05:09', NULL, NULL, NULL, NULL, NULL, NULL),
(512, 'Md Saddam', '01825292998', '01825292998', NULL, NULL, '$2y$10$3P1eCG/uxwBc0h7b0eUYiOPQK3bbUg1vui9lgZA2i.ZALH3CYINLu', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:06:53', '2022-03-10 19:06:53', NULL, NULL, NULL, NULL, NULL, NULL),
(513, 'P Mithun', '01830274107', '01830274107', NULL, NULL, '$2y$10$mhH1FTQCSlhVkwvocBytuen4SYNgRznYDjWFuXXfCyJ4xFOEslJv.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:08:35', '2022-03-10 19:08:35', NULL, NULL, NULL, NULL, NULL, NULL),
(514, 'Kishor Kumar Shom', '01875268454', '01875268454', NULL, NULL, '$2y$10$R1wyWAZHwd4NS7Kz.zHjE.ExA7/MZOsVRA//7MzNV8HbL67Fx9qGy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:10:52', '2022-03-10 19:10:52', NULL, NULL, NULL, NULL, NULL, NULL),
(515, 'Gouranggo Nath', '01914474166', '01914474166', NULL, NULL, '$2y$10$is3o/fTWLEAAaJcAFnQ2bOmUiZKihQwcncCRG6H79zQVOhbwG5qnm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:13:34', '2022-03-10 19:13:34', NULL, NULL, NULL, NULL, NULL, NULL),
(516, 'Md Mizan', '+8801837616244', '+8801837616244', NULL, NULL, '$2y$10$bLbA4uQRcQ5UtpJlJbfy7OGQHkTaHGgJlHNgKUC4sW/BiJYuF.IfW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:15:22', '2022-03-10 19:15:22', NULL, NULL, NULL, NULL, NULL, NULL),
(517, 'Amjad hossain sohel', '01854042391', '01854042391', NULL, NULL, '$2y$10$a0M3j1O0BP1hxYrvdq97c.lOQXj5HCQ03zD0FYQ8uk8xDUJWDPAyi', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:46:04', '2022-03-10 19:46:04', NULL, NULL, NULL, NULL, NULL, NULL),
(518, 'Md Elias', '01854042391', '01854042391', NULL, NULL, '$2y$10$T9DcGOTKwee/lM3GRn4JhOPb.WoUbx7.z1hgp/xaeHMnheD9RRZ4y', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:47:09', '2022-03-10 19:47:09', NULL, NULL, NULL, NULL, NULL, NULL),
(519, 'Seikh Jabed Emran', '01854042391', '01854042391', NULL, NULL, '$2y$10$aLQsUBsDjipczkeN3P.eh.aN6TekWuN0p1GcKgNGvhP7gqoxcul.K', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:48:22', '2022-03-10 19:48:22', NULL, NULL, NULL, NULL, NULL, NULL),
(520, 'Mejbah uddin Rana', '01854042391', '01854042391', NULL, NULL, '$2y$10$hioyao51k8Gdik1htqNEqulIKwR3VnbsYUBB3pE7ZQof8fLf08M0O', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:49:47', '2022-03-10 19:49:47', NULL, NULL, NULL, NULL, NULL, NULL),
(521, 'Abdullah Al Nahid', '01854042391', '01854042391', NULL, NULL, '$2y$10$FEekg8GRqvwU/25ueIAYiOE.lptks8h/TDf9eV4urJM0z0z6nu8jW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:50:59', '2022-03-10 19:50:59', NULL, NULL, NULL, NULL, NULL, NULL),
(522, 'Md Salauddin', '01854042391', '01854042391', NULL, NULL, '$2y$10$xw9MUvwNMf9noCTTWRTIxO5eDmh.ZY4JJJe7GS64bbdeUiORwS2JC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:52:09', '2022-03-10 19:52:09', NULL, NULL, NULL, NULL, NULL, NULL),
(523, 'Kamrul Hasan', '01854042391', '01854042391', NULL, NULL, '$2y$10$v3iI/D/y57i6NNh4g8DZAOJMMPrksbFaWjNnqWT8A8DxupMY5MBYa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:53:23', '2022-03-10 19:53:23', NULL, NULL, NULL, NULL, NULL, NULL),
(524, 'Abdullah Al Hossain', '01854042391', '01854042391', NULL, NULL, '$2y$10$4BeZUWNbF7sHOQfzgCKfLeeiZ1EGnOylicrbx4DBfi4aGABFPKhES', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:54:31', '2022-03-10 19:54:31', NULL, NULL, NULL, NULL, NULL, NULL),
(525, 'Khalid Hasan', '01854042391', '01854042391', NULL, NULL, '$2y$10$k7EpENx8nX7t0BZCMsF2pePSXf1EipTMAfTg.Zlf/OTJNdynu1n5u', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:55:31', '2022-03-10 19:55:31', NULL, NULL, NULL, NULL, NULL, NULL),
(526, 'Mohi Uddin', '01854042391', '01854042391', NULL, NULL, '$2y$10$jzumEet9IWx.YaNkzNTUjeokR4czoJZQsUi8SiqgfAVdkMElCgGmq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:57:11', '2022-03-10 19:57:11', NULL, NULL, NULL, NULL, NULL, NULL),
(527, 'Prity Rani', '01854042391', '01854042391', NULL, NULL, '$2y$10$JH/W/nBtXPms74pSm86zR.KQmnOckKXczV.WKK3.4g5VTQHejbjY2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:58:23', '2022-03-10 19:58:23', NULL, NULL, NULL, NULL, NULL, NULL),
(528, 'Arif', '01854042391', '01854042391', NULL, NULL, '$2y$10$CDsRcs83aorFvhzAHHqA.O9jnzBmVMkHzW8XU9Y1sIcPO1J8agPxy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 19:59:18', '2022-03-10 19:59:18', NULL, NULL, NULL, NULL, NULL, NULL),
(529, 'No Name', '01854975329', '01854975329', NULL, NULL, '$2y$10$ueZhg3PxOa8IVFAAgY9qL.vrM6/0wtQINIy7YuR7VsK4TqZ/Ky8cq', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:00:27', '2022-03-10 20:00:27', NULL, NULL, NULL, NULL, NULL, NULL),
(530, 'Md Fakhrul Islam', '01925177380', '01925177380', NULL, NULL, '$2y$10$LnAenFPc/o0a5RwsKU3qyulRk8ODlW9b387tNS0tuf3Wxw5jWtXZW', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:01:51', '2022-03-10 20:01:51', NULL, NULL, NULL, NULL, NULL, NULL),
(531, 'Robiul Hoque', '01856696208', '01856696208', NULL, NULL, '$2y$10$dltGOTHHBYtUBI828Oz0Vuvh.LmMGrvqVJiaPt5PEYS8RC5ZsDvA2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:03:05', '2022-03-10 20:03:05', NULL, NULL, NULL, NULL, NULL, NULL),
(532, 'Shahadeb Mozumdar', '01816725320', '01816725320', NULL, NULL, '$2y$10$OjaP2LSv/WVIGrba8vUDeuaRNSthl5csTQLS2fBBwp4z1my42fNv2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:04:16', '2022-03-10 20:04:16', NULL, NULL, NULL, NULL, NULL, NULL),
(533, 'Shamim Pavel', '01303760140', '01303760140', NULL, NULL, '$2y$10$08wrDpyDluF9CR9P4liKouEklmBpuf8J.B3kJ5OxDeCF1K5dbN6/u', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:05:21', '2022-03-10 20:05:21', NULL, NULL, NULL, NULL, NULL, NULL),
(534, 'Mohiuddin Dalim', '01846073085', '01846073085', NULL, NULL, '$2y$10$U1eASCC4LsWG/rkP.oGg5OA9.hHJsx4WuhVaXxJWz1QM69P1cT8R6', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:06:44', '2022-03-10 20:06:44', NULL, NULL, NULL, NULL, NULL, NULL),
(535, 'Abu Shahin', '01709990754', '01709990754', NULL, NULL, '$2y$10$g9LIM5nh65ixZ81R2ZEDnujQ.UMvnyXXtCevIDSAtFJvf55CC75Pm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:08:20', '2022-03-10 20:08:20', NULL, NULL, NULL, NULL, NULL, NULL),
(536, 'Ajit Nath', '01887634928', '01887634928', NULL, NULL, '$2y$10$ZcaZqLmAXvJ1W8CR1Sw1j.6cIgsQQW9WOkpfNC1WDD3QnonJaQHMe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:09:39', '2022-03-10 20:09:39', NULL, NULL, NULL, NULL, NULL, NULL),
(537, 'Jane Alam Mahi', '01819610807', '01819610807', NULL, NULL, '$2y$10$6j3x6ATANsP2duXb.5Pua.yHV9wpQ9Jtjyrq.31vmtl5bEQpyPeku', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:10:46', '2022-03-10 20:10:46', NULL, NULL, NULL, NULL, NULL, NULL),
(538, 'Bondona Rani Nath', '01575048733', '01575048733', NULL, NULL, '$2y$10$MsjkKmxkRyqSpVI0WKQew.j.jUmcR35dzAaWAtUyHGjaRqwiIq9H2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:12:19', '2022-03-10 20:12:19', NULL, NULL, NULL, NULL, NULL, NULL),
(539, 'Md Mohi Uddin Major', '01710433311', '01710433311', NULL, NULL, '$2y$10$yu6JN2nByKwml1MXPKnsROVRCvgZy8GqQnwigZT9suOzqKdqhOaT2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-10 20:14:10', '2022-03-10 20:14:10', NULL, NULL, NULL, NULL, NULL, NULL),
(540, 'Liton Chandra Nath', '01638667983', '01638667983', NULL, NULL, '$2y$10$vRckuAWxxzrB39FDTaMxbeniWvuIVdKkciPSPqt7dAO7JR8fzqJRe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 05:10:36', '2022-03-11 05:10:36', NULL, NULL, NULL, NULL, NULL, NULL),
(541, 'সুমন চন্দ্র দাস', '01841647284', '01841647284', NULL, NULL, '$2y$10$4PwaayhzQQXfbdsTV3TBeufIfKRcKGzRNy0VLspC0IkY7m3kOvZke', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 08:17:53', '2022-03-11 08:17:53', NULL, NULL, NULL, NULL, NULL, NULL),
(542, 'ফারহান আক্তার', '01831655332', '01831655332', NULL, NULL, '$2y$10$wxa3cQLoQvHi/Ma00krMQuZXMNG5X2jQ10Js9KmBMspNaVbRtRr0i', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:40:27', '2022-03-11 09:40:27', NULL, NULL, NULL, NULL, NULL, NULL),
(543, 'নন্দিতা দাস', '01845408620', '01845408620', NULL, NULL, '$2y$10$dc51W57A6vqknuPVt5qj4OkIDIhFUhl0KTAISC5mtw90W3df.6NHm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:41:31', '2022-03-11 09:41:31', NULL, NULL, NULL, NULL, NULL, NULL),
(544, 'পলাশ নাথ', '01932592803', '01932592803', NULL, NULL, '$2y$10$tIJ387BmUEOPJaldZWwSLeP2Dr0yLTMI7uKccHW5owBeLFOK3JZyK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:47:56', '2022-03-11 09:47:56', NULL, NULL, NULL, NULL, NULL, NULL),
(545, 'বোরহান উদ্দিন শিমুল', '01932592803', '01932592803', NULL, NULL, '$2y$10$zZSCqI84fXwHrNfdFtPdP.mGwKAv4gq9Y93T0rn/JwyRm99ejZ2sK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:49:16', '2022-03-11 09:49:16', NULL, NULL, NULL, NULL, NULL, NULL),
(546, 'অন্তর রায়', '01830458976', '01830458976', NULL, NULL, '$2y$10$urHjoisCs4nmdT2PT2Z3I.kPohQYMC/bis.WBgdCSjB1ErZXkOJJa', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:50:03', '2022-03-11 09:50:03', NULL, NULL, NULL, NULL, NULL, NULL),
(547, 'জাহিদ মাসুদ', '01932592803', '01932592803', NULL, NULL, '$2y$10$FrgIiD0xRQGBcL0osG9YrOTDZIK5aNVeRxxAeBELHzEMslgFuvg7K', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:50:27', '2022-03-11 09:50:27', NULL, NULL, NULL, NULL, NULL, NULL),
(548, 'Abdul Sukkur', '01999843161', '01999843161', NULL, NULL, '$2y$10$Mcg8impIPLqwjaz1125/p.NNAPHl/GjwPJW8d3yPSJtBKjFptIv02', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:50:59', '2022-03-11 09:50:59', NULL, NULL, NULL, NULL, NULL, NULL),
(549, 'রুবেল কামাল উদ্দিন', '01932592803', '01932592803', NULL, NULL, '$2y$10$wSBOLQWOUbS00mpFz7xQqum3OPwRPbaZ82yRlgGIzfR3FUox08arK', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:51:07', '2022-03-11 09:51:07', NULL, NULL, NULL, NULL, NULL, NULL),
(550, 'মীর বোরহান', '01932592803', '01932592803', NULL, NULL, '$2y$10$y6kWOFjbtX2q7e.Ip.LBDu/HJIALa1FvKHvzdYQ7K1QxSYmENRJI.', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:51:37', '2022-03-11 09:51:37', NULL, NULL, NULL, NULL, NULL, NULL),
(551, 'আব্দুল আজিজ', '01769556357', '01769556357', NULL, NULL, '$2y$10$1bkU7lmy6xIIND6jHSoINOj4jpQERiTQF.QStLQ9Err8UF/lgKxo2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:52:32', '2022-03-11 09:52:32', NULL, NULL, NULL, NULL, NULL, NULL),
(552, 'নজরুল ইসলাম শাকিল', '01682767521', '01682767521', NULL, NULL, '$2y$10$oWSk9FgxBPD9bY7t3W69G.WtTxmCpP/uAZtp1oHA74w9f7jk/aCKm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:53:33', '2022-03-11 09:53:33', NULL, NULL, NULL, NULL, NULL, NULL),
(553, 'Md. Omar Faruk (Shohag)', '01839707645', '01839707645', NULL, NULL, '$2y$10$DEEalywQQz2M8dbcEtEnBulDbOg8BN3N6N0RzFhr3O/VOTjbtQxAC', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 09:54:06', '2022-03-11 09:54:06', NULL, NULL, NULL, NULL, NULL, NULL),
(554, 'Saiful Islam', '01846665851', '01846665851', NULL, NULL, '$2y$10$jylpmqvGg6PDc30Sp0n0EOIf/ZV7Se7Mpq.QQW.3gB2eyy9SexIEO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 11:33:24', '2022-03-11 11:33:24', NULL, NULL, NULL, NULL, NULL, NULL),
(555, 'Nimai Gowshami', '01730580571', '01730580571', NULL, NULL, '$2y$10$IvKUohTaDjdLEDRX/NEPSe2.RACv6Qu3h4jWtLErTXSZkSqCDRp9G', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:46:54', '2022-03-11 18:46:54', NULL, NULL, NULL, NULL, NULL, NULL),
(556, 'Sirajul Islam', '01730580571', '01730580571', NULL, NULL, '$2y$10$hZFrCwPwU5xlLib397j8aecZdCHNxxMjwTW0OA5S2RFWa0DjBb2oy', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:48:40', '2022-03-11 18:48:40', NULL, NULL, NULL, NULL, NULL, NULL),
(557, 'Md Harun', '01730580571', '01730580571', NULL, NULL, '$2y$10$Op7X1oCtO6/GUOOoPiGcEe6RweVEDNMprVwYPKg54w06sdbDXujvm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:49:49', '2022-03-11 18:49:49', NULL, NULL, NULL, NULL, NULL, NULL),
(558, 'Asaduzzaman', '01730580571', '01730580571', NULL, NULL, '$2y$10$HjoOThQjsXzLlgAxNCzIY.SI3jSswwpiurBXbQTQBRPtOjDzTr/7i', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:51:35', '2022-03-11 18:51:35', NULL, NULL, NULL, NULL, NULL, NULL),
(559, 'Komol Chandra nath', '01730580571', '01730580571', NULL, NULL, '$2y$10$762yccuKvefbVWcZUgU92OwHptf4sBt9C3y03tl9ciVvelDAY5I5G', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:52:46', '2022-03-11 18:52:46', NULL, NULL, NULL, NULL, NULL, NULL),
(560, 'Belal Hossain', '01730580571', '01730580571', NULL, NULL, '$2y$10$Nr5uYgwRinJqONqEvmJlsO2zy2.HLgnMpMRLsAwlxxqxQLcEWzhBG', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:54:12', '2022-03-11 18:54:12', NULL, NULL, NULL, NULL, NULL, NULL),
(561, 'Saddam Hossain', '01730580571', '01730580571', NULL, NULL, '$2y$10$yA264BnZsNIP9xm2.akkjeysZQcp2YMcOVhiFTFdVNKvYPQcAbqTm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:55:10', '2022-03-11 18:55:10', NULL, NULL, NULL, NULL, NULL, NULL),
(562, 'Adv. Anwar hossain', '01812340600', '01812340600', NULL, NULL, '$2y$10$D4I0OyGOkOKswTC8f7wXwug2GDaFFN/SthvGGUardfwsVi/pblk0i', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:56:40', '2022-03-11 18:56:40', NULL, NULL, NULL, NULL, NULL, NULL),
(563, 'Nantu Kumar Deb Nath', '01812340600', '01812340600', NULL, NULL, '$2y$10$N.5zUgROD34oYf1OAufiTOk097Nlw8E1Li/wK0/b7Xq2cbAlYrRNe', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:57:53', '2022-03-11 18:57:53', NULL, NULL, NULL, NULL, NULL, NULL),
(564, 'Samir Bhowmick', '01812865203', '01812865203', NULL, NULL, '$2y$10$BELvCk4zXj9/NcHmQ3OlbucH7xSxH3d4P.ffdOvqZuXrjOCT1CNRm', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 18:59:17', '2022-03-11 18:59:17', NULL, NULL, NULL, NULL, NULL, NULL),
(565, 'Md Monsurul Alam Chowdhury', '01741661066', '01741661066', NULL, NULL, '$2y$10$YIZmXIIVi.gYqdvrL/Np3uIXGIJAIGtBVsW8WgM7UzuzhkClIg2Ru', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 19:01:17', '2022-03-11 19:01:17', NULL, NULL, NULL, NULL, NULL, NULL),
(566, 'Mojammel Hoque', '01829604201', '01829604201', NULL, NULL, '$2y$10$nMbZGPSDmwncgigKoX3dE.ii6dYRmPZKLrsPqSJXwlW.ptCz2t2BO', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-11 19:02:47', '2022-03-11 19:02:47', NULL, NULL, NULL, NULL, NULL, NULL),
(567, 'Aynoon Afroz Dola', '01892415363', '01892415363', NULL, NULL, '$2y$10$414fSoyfB5rYEYQ2R1n.sukpa0J.yFUrk95q657LlELkqcXbZPhX2', 1, NULL, NULL, 5, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-03-12 03:14:40', '2022-03-12 03:14:40', NULL, NULL, NULL, NULL, NULL, NULL),
(568, 'tes', 'batch2020@gmail.com', '01839707645', '01765656555', NULL, '$2y$10$gu9zRGQtOPDUCE9zL3XGZeSLfjXRNjjMyOKhE56z3hMA3w3mZCHza', 1, NULL, '2022-03-12 18:26:34', 7, 0, 2010, 1, 0, NULL, NULL, NULL, '2022-03-12 10:22:50', '2022-03-12 18:26:34', NULL, 1, NULL, NULL, NULL, '::1'),
(569, 'operator', 'operator@gmail.com', '01839707645', '01839707645', NULL, '$2y$10$tzwulmW3EaixicLRbHeoz.f7roG.uP1lL5esa0PZARxXdZRFNjIKm', 1, NULL, '2022-03-17 05:22:33', 4, 0, 2022, 1, 0, NULL, NULL, NULL, '2022-03-17 05:22:12', '2022-03-17 05:22:33', NULL, NULL, NULL, NULL, NULL, NULL),
(571, 'd', 'info@gmail.com', '01830320809', NULL, NULL, '$2y$10$uywWPyWv2okDA0774d1HAuh3UUc9M6JRwZv4YhCG7aH9bUneuBzOi', 1, NULL, NULL, 10, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-05-19 18:52:05', '2022-05-19 18:52:05', NULL, NULL, NULL, NULL, NULL, NULL),
(572, 'Ariful Islam', '01521572228', 'arif@gmail.com', NULL, NULL, '$2y$10$ik0uHYZ4ebMmOBnEh16wLexLZ2Fxfi3gT0s.TWYK3cDNtx2ZL1mT6', 1, NULL, '2022-05-20 20:29:51', 10, 0, NULL, 1, 0, NULL, NULL, NULL, '2022-05-20 02:49:19', '2022-05-20 20:29:51', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_customer_ledger`
--
ALTER TABLE `acc_customer_ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_general_ledger`
--
ALTER TABLE `acc_general_ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_transactional_coa`
--
ALTER TABLE `acc_transactional_coa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_settings`
--
ALTER TABLE `all_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_loan_info`
--
ALTER TABLE `customer_loan_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donarinfos`
--
ALTER TABLE `donarinfos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_participants_info`
--
ALTER TABLE `event_participants_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqueInfoCheque` (`name`,`batch`,`mobile`,`is_active`) USING BTREE;

--
-- Indexes for table `invoice_infos`
--
ALTER TABLE `invoice_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `phone` (`phone`);

--
-- Indexes for table `registrationrecord`
--
ALTER TABLE `registrationrecord`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_gust_infos`
--
ALTER TABLE `reg_gust_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_rate_chart`
--
ALTER TABLE `reg_rate_chart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_history`
--
ALTER TABLE `sms_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_info`
--
ALTER TABLE `supplier_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pos_accounts`
--
ALTER TABLE `tbl_pos_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_info`
--
ALTER TABLE `transaction_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `password` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_customer_ledger`
--
ALTER TABLE `acc_customer_ledger`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_general_ledger`
--
ALTER TABLE `acc_general_ledger`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `acc_transactional_coa`
--
ALTER TABLE `acc_transactional_coa`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `all_settings`
--
ALTER TABLE `all_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_info`
--
ALTER TABLE `customer_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_loan_info`
--
ALTER TABLE `customer_loan_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donarinfos`
--
ALTER TABLE `donarinfos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT for table `event_participants_info`
--
ALTER TABLE `event_participants_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `invoice_infos`
--
ALTER TABLE `invoice_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registrationrecord`
--
ALTER TABLE `registrationrecord`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reg_gust_infos`
--
ALTER TABLE `reg_gust_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reg_rate_chart`
--
ALTER TABLE `reg_rate_chart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sms_history`
--
ALTER TABLE `sms_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111263;

--
-- AUTO_INCREMENT for table `supplier_info`
--
ALTER TABLE `supplier_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_pos_accounts`
--
ALTER TABLE `tbl_pos_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transaction_info`
--
ALTER TABLE `transaction_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=573;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
