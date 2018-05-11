-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-05-11 14:12:58
-- 服务器版本： 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meishi`
--

-- --------------------------------------------------------

--
-- 表的结构 `meishi_admin`
--

CREATE TABLE `meishi_admin` (
  `id` tinyint(4) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `meishi_admin`
--

INSERT INTO `meishi_admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `meishi_food`
--

CREATE TABLE `meishi_food` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `price` int(11) NOT NULL,
  `pic` varchar(200) COLLATE utf8_bin NOT NULL,
  `num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `meishi_food`
--

INSERT INTO `meishi_food` (`id`, `name`, `price`, `pic`, `num`) VALUES
(1, '玫瑰香酥西兰花', 29, '20180415\\acaf92c313c9d9837779f48c94259d78.jpg', 1),
(2, '波格力蟹', 49, '20180415\\bd88cf8aaecf14ac4daeec017ea69017.jpg', 2),
(3, '纸上鱿鱼', 35, '20180415\\bbdaa914aa97c94241871517db0a2354.jpg', 3),
(4, '铁板红烧肉', 35, '20180415\\e3c0f9bdcb980154d8a28bcbba7a7f8c.jpg', 4),
(5, '黄金脆皮虾', 55, '20180415\\294f07a7bcacf1e097c3f458700d4573.jpg', 5),
(6, '石锅卷心菜', 18, '20180415\\4b827dbe154dca3917dd42bd166c8cb2.jpg', 6),
(7, '油条巧克力', 20, '20180415\\1763c41fdab4d68cb10d9f5793c79d4d.jpg', 7),
(8, '烟熏排骨', 40, '20180415\\43a5cb29b648600f3ba0b4bceab58c5e.jpg', 8),
(9, '酥油肉皮', 29, '20180415\\8403708d3db0dafc05cf205448039a3c.jpg', 9),
(10, '铁板煎豆腐', 15, '20180415\\0e2ec103a2607d62c3b55ea16ea32354.jpg', 10),
(11, '油炸春卷', 20, '20180415\\99ddf965924e4612f6adb39ca70aa343.jpg', 11),
(12, '爆炒菌真菇', 25, '20180415\\c3844babb7f1fd42701737c139cb7711.jpg', 12);

-- --------------------------------------------------------

--
-- 表的结构 `meishi_liuyan`
--

CREATE TABLE `meishi_liuyan` (
  `id` tinyint(4) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `email` varchar(20) COLLATE utf8_bin NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `time` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `meishi_liuyan`
--

INSERT INTO `meishi_liuyan` (`id`, `username`, `name`, `phone`, `email`, `message`, `time`) VALUES
(2, 'user', '小王', '13123456789', '11@qq.com', '大人都有一种感觉，那就是近几年像原来那样按部就班地做饮食好像越来越难了，行业里的“套路”越来越深。行业竞争越来越大，饮食健康却还是很好。', '1523495321');

-- --------------------------------------------------------

--
-- 表的结构 `meishi_order`
--

CREATE TABLE `meishi_order` (
  `id` tinyint(4) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `price` int(11) NOT NULL,
  `time` varchar(20) COLLATE utf8_bin NOT NULL,
  `zhuangtai` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '未配送'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `meishi_order`
--

INSERT INTO `meishi_order` (`id`, `username`, `name`, `price`, `time`, `zhuangtai`) VALUES
(2, 'user', '铁板红烧肉', 30, '1523172753', '已配送'),
(3, 'user', '波格力蟹', 49, '1523432684', '未配送'),
(4, 'user', '石锅卷心菜', 18, '1523432764', '未配送'),
(5, 'user', '黄金脆皮虾', 55, '1523436042', '已配送'),
(6, 'user', '爆炒菌真菇', 25, '1523453375', '未配送'),
(8, 'user', '油炸春卷', 20, '1523453652', '已配送'),
(9, 'user', '烟熏排骨', 40, '1523453924', '未配送'),
(10, 'user', '酥油肉皮', 29, '1523495528', '已配送'),
(11, 'user', '纸上鱿鱼', 35, '1523495541', '已配送'),
(12, 'user1', '玫瑰香酥西兰花', 25, '1523498428', '已配送'),
(13, 'user1', '烟熏排骨', 40, '1523498452', '未配送'),
(14, 'user', '油炸春卷', 20, '1523783767', '未配送');

-- --------------------------------------------------------

--
-- 表的结构 `meishi_seller`
--

CREATE TABLE `meishi_seller` (
  `id` tinyint(4) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `meishi_seller`
--

INSERT INTO `meishi_seller` (`id`, `username`, `password`) VALUES
(1, 'seller', 'seller');

-- --------------------------------------------------------

--
-- 表的结构 `meishi_user`
--

CREATE TABLE `meishi_user` (
  `id` tinyint(4) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `meishi_user`
--

INSERT INTO `meishi_user` (`id`, `username`, `password`) VALUES
(1, 'user', 'user'),
(5, 'user2', 'user2'),
(6, 'user1', 'user1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meishi_admin`
--
ALTER TABLE `meishi_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meishi_food`
--
ALTER TABLE `meishi_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meishi_liuyan`
--
ALTER TABLE `meishi_liuyan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meishi_order`
--
ALTER TABLE `meishi_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meishi_seller`
--
ALTER TABLE `meishi_seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meishi_user`
--
ALTER TABLE `meishi_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `meishi_admin`
--
ALTER TABLE `meishi_admin`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `meishi_food`
--
ALTER TABLE `meishi_food`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `meishi_liuyan`
--
ALTER TABLE `meishi_liuyan`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `meishi_order`
--
ALTER TABLE `meishi_order`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `meishi_seller`
--
ALTER TABLE `meishi_seller`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `meishi_user`
--
ALTER TABLE `meishi_user`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
