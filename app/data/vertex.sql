-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 28 2018 г., 15:50
-- Версия сервера: 5.6.38
-- Версия PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vertex`
--

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `basket` (
  `order_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `Id_user` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `basket` (`order_id`, `email`, `id_item`, `quantity`, `Id_user`) VALUES
(18, 'sergei@sergei.com', 2, 1, 8),
(19, 'sergei@sergei.com', 3, 1, 8),
(20, 'sergei@sergei.com', 8, 1, 8),
(24, '0', 3, 1, 0),
(25, 'sg@sg.com', 5, 1, 9),
(26, 'sg@sg.com', 1, 1, 9),
(27, 'sergei@sergei.com', 3, 1, 8),
(28, 'sergei@sergei.com', 6, 1, 8),
(29, 'sergei@sergei.com', 7, 1, 8),
(30, 'sergei@sergei.com', 7, 1, 8),
(31, 'sergei@sergei.com', 7, 1, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(1, 'эндоскоп'),
(2, 'запчасть'),
(3, 'инструмент'),
(4, 'оптика'),
(5, 'услуга');

-- --------------------------------------------------------

--
-- Структура таблицы `equipment`
--

CREATE TABLE `equipment` (
  `id_equipment` int(11) NOT NULL,
  `part_number` int(11) NOT NULL,
  `id_category` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `file` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `equipment`
--

INSERT INTO `equipment` (`id_equipment`, `part_number`, `id_category`, `name`, `price`, `description`, `file`) VALUES
(1, 0, '1', 'Эндоскоп', 10000, 'Гастроэндоскоп Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deserunt maiores nihil numquam odit quam? Blanditiis dicta quia veritatis voluptates. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate!', '100.png'),
(2, 0, '2', 'Тубус', 2000, 'Тубус для эндоскопа Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deserunt maiores nihil numquam odit quam? Blanditiis dicta quia veritatis voluptates. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate!', '101.png'),
(3, 0, '4', 'Оптоволокно', 5000, 'Оптический канал для гастроэндоскопа Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deserunt maiores nihil numquam odit quam? Blanditiis dicta quia veritatis voluptates. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate!', '102.png'),
(4, 0, '3', 'Щипцы', 1000, 'Щипцы обычные Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deserunt maiores nihil numquam odit quam? Blanditiis dicta quia veritatis voluptates. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate!', '103.png'),
(5, 0, '2', 'Поворотный механизм', 1000, 'Обычный металлизированный Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deserunt maiores nihil numquam odit quam? Blanditiis dicta quia veritatis voluptates. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate!', '104.png'),
(6, 0, '4', 'Экран', 4000, 'Экран магнитный Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deserunt maiores nihil numquam odit quam? Blanditiis dicta quia veritatis voluptates. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate!', '105.png'),
(7, 0, '2', 'Тубус износостойкий', 7000, 'Тубус усиленный износостойкий металлический Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deserunt maiores nihil numquam odit quam? Blanditiis dicta quia veritatis voluptates. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate!', '106.png'),
(8, 0, '2', 'Ручка управления', 2000, 'Комплект Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam deserunt maiores nihil numquam odit quam? Blanditiis dicta quia veritatis voluptates. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate! Alias aperiam architecto aut autem et molestias nulla optio rem velit voluptate!', '107.png');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `position` varchar(50) NOT NULL,
  `company` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `name`, `phone`, `position`, `company`, `city`, `address`) VALUES
(5, 'test@test.com', '$2y$10$IFJfbIwxTDbAIkve4ZB1qufpOqcPf6yuwE3jpHEIDhcnpyQ6R1BNK', 'asd', '', '', '', '', ''),
(7, 'test@test.com', '$2y$10$lZKn3.gxNj1HBLgWI6CA3uXxgQ8C5t9Db8WPNF/xGou6J1ThoCnbS', 'sdf', '', '', '', '', ''),
(8, 'sergei@sergei.com', '$2y$10$oJ6J4bc7Oo8u3EauZBowpuoZEvNes11r.g9AJ3WNHdBG8krvvJDRK', 'sergei', '', '', '', '', ''),
(9, 'sg@sg.com', '$2y$10$yNi7cIux8o8GKZJY/XjLZOy1.15u0urDaSjJBjvT1eMkbmNnNR6vq', 'Сергей', '', '', '', '', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `order`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id_equipment`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `basket`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id_equipment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
