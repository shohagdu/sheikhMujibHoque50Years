<?php
/*
 * ALTER TABLE `registrationrecord` ADD `paidInvoiceId` BIGINT(20) UNSIGNED NULL DEFAULT NULL AFTER `is_active`;
 * ALTER TABLE `invoice_infos` CHANGE `paidStatus` `paidStatus` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Paid, 3=Cancelled';
 * ALTER TABLE `registrationrecord` ADD `isApprovedAuthority` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Approved by authority' AFTER `paidInvoiceId`;
 * ALTER TABLE `registrationrecord` ADD `hasFamilyMember` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1= No Member , 2= Yes Has Member' AFTER `isApprovedAuthority`;
 */
