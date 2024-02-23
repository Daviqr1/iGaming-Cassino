-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 23/12/2023 às 14:18
-- Versão do servidor: 5.7.23-23
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mileni97_tiger`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `inviter` int(10) UNSIGNED NOT NULL,
  `commission` decimal(20,2) NOT NULL DEFAULT '0.00',
  `commission_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposited` tinyint(4) DEFAULT '0',
  `deposited_amount` decimal(10,2) DEFAULT '0.00',
  `losses` bigint(20) DEFAULT '0',
  `losses_amount` decimal(10,2) DEFAULT '0.00',
  `commission_paid` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bet_categories`
--

CREATE TABLE `bet_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bet_section_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `bet_categories`
--

INSERT INTO `bet_categories` (`id`, `bet_section_id`, `name`, `description`, `image`, `active`, `slug`, `created_at`, `updated_at`) VALUES
(2, 1, 'Campeonato Brasileiro - Série B', 'Campeonato Brasileiro - Série B', NULL, 1, 'brasileirao-serie-b', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(45, 1, 'Campeonato Mineiro - Segunda Divisão', 'Campeonato Mineiro - Segunda Divisão', NULL, 1, 'mineiro-segunda-divisao', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(3, 1, 'Campeonato Paraense Feminino', 'Campeonato Paraense Feminino', NULL, 1, 'paraense-feminino', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(4, 1, 'Campeonato Paulista - Sub-20', '<p>Campeonato Paulista - Sub-20</p>', NULL, 1, 'paulista-sub-20', '2023-10-27 22:42:35', '2023-11-22 22:36:27'),
(5, 1, 'Campeonato Espanhol', 'Campeonato Espanhol', NULL, 1, 'campeonato-espanhol', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(6, 1, 'Campeonato Inglês', '<p>Campeonato Inglêss</p>', NULL, 1, 'campeonato-ingles', '2023-10-27 22:42:35', '2023-11-22 22:45:30'),
(7, 1, 'Campeonato Alemão - Bundesliga', 'Campeonato Alemão - Bundesliga', NULL, 1, 'campeonato-alemao', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(8, 1, 'Campeonato Italiano', 'Campeonato Italiano', NULL, 1, 'campeonato-italiano', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(9, 1, 'Campeonato Francês', 'Campeonato Francês', NULL, 1, 'campeonato-frances', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(10, 1, 'Campeonato Português', '<p>Campeonato Português</p>', NULL, 1, 'campeonato-portugues', '2023-10-27 22:42:35', '2023-11-22 22:38:53'),
(11, 1, 'Campeonato Holandês', 'Campeonato Holandês', NULL, 1, 'campeonato-holandes', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(12, 1, 'Campeonato Mexicano', 'Campeonato Mexicano', NULL, 1, 'campeonato-mexicano', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(13, 1, 'Campeonato Colombiano', 'Campeonato Colombiano', NULL, 1, 'campeonato-colombiano', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(14, 1, 'Campeonato Equatoriano', 'Campeonato Equatoriano', NULL, 1, 'campeonato-equatoriano', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(15, 1, 'Liga das Nações Feminina da UEFA', 'Liga das Nações Feminina da UEFA', NULL, 1, 'liga-das-nacoes-da-uefa-feminina', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(16, 1, 'Campeonato Japonês', 'Campeonato Japonês', NULL, 1, 'japao-j1-league', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(17, 1, 'Campeonato Paraguaio', 'Campeonato Paraguaio', NULL, 1, 'campeonato-paraguaio', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(18, 1, 'Campeonato Saudita', 'Campeonato Saudita', NULL, 1, 'arabia-saudita-pro-league', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(19, 1, 'Campeonato Alemão - Segunda Divisão', 'Campeonato Alemão - Segunda Divisão', NULL, 1, 'bundesliga-2-divisao', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(20, 1, 'Campeonato Russo', 'Campeonato Russo', NULL, 1, 'campeonato-russo', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(21, 1, 'Campeonato Turco', 'Campeonato Turco', NULL, 1, 'campeonato-turco', '2023-10-27 22:42:35', '2023-10-27 22:42:35'),
(22, 1, 'Copa Sul-Americana', 'Copa Sul-Americana', NULL, 1, 'copa-sul-americana', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(1, 1, 'Campeonato Brasileiro', 'Campeonato Brasileiro', NULL, 1, 'brasileirao-serie-a', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(24, 1, 'Campeonato Carioca Feminino', 'Campeonato Carioca Feminino', NULL, 1, 'carioca-feminino', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(25, 1, 'Campeonato Carioca - Série B1', 'Campeonato Carioca - Série B1', NULL, 1, 'carioca-serie-b1', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(26, 1, 'Campeonato Mineiro Feminino', 'Campeonato Mineiro Feminino', NULL, 1, 'mineiro-feminino', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(27, 1, 'Campeonato Paraense - 2ª Divisão', 'Campeonato Paraense - 2ª Divisão', NULL, 1, 'paraense-2-divisao', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(28, 1, 'Campeonato Paraense Sub-20', 'Campeonato Paraense Sub-20', NULL, 1, 'paraense-sub-20', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(29, 1, 'Campeonato Paranaense - Terceira Divisão', 'Campeonato Paranaense - Terceira Divisão', NULL, 1, 'paranaense-3-divisao', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(30, 1, 'Campeonato Pernambucano - A2', 'Campeonato Pernambucano - A2', NULL, 1, 'pernambucano-a2', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(31, 1, 'Campeonato Pernambucano - A3', 'Campeonato Pernambucano - A3', NULL, 1, 'pernambucano-a3', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(32, 1, 'Campeonato Potiguar - 2ª Divisão', 'Campeonato Potiguar - 2ª Divisão', NULL, 1, 'potiguar-2-divisao', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(33, 1, 'Campeonato Potiguar Feminino', 'Campeonato Potiguar Feminino', NULL, 1, 'potiguar-feminino', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(34, 1, 'Campeonato Sergipano - A2', 'Campeonato Sergipano - A2', NULL, 1, 'sergipano-a2', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(35, 1, 'Jogos Pan-Americanos Feminino', 'Jogos Pan-Americanos Feminino', NULL, 1, 'jogos-pan-americanos-feminino', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(36, 1, 'Campeonato Argentino', 'Campeonato Argentino', NULL, 1, 'campeonato-argentino', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(37, 1, 'Major League Soccer', 'Major League Soccer', NULL, 1, 'mls-eua', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(38, 1, 'Campeonato Peruano', 'Campeonato Peruano', NULL, 1, 'campeonato-peruano', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(39, 1, 'EFL Championship', 'EFL Championship', NULL, 1, 'efl-championship', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(40, 1, 'Amistosos de Seleções - Feminino', 'Amistosos de Seleções - Feminino', NULL, 1, 'amistosos-selecoes-feminino', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(41, 1, 'Campeonato Francês - Segunda Divisão', 'Campeonato Francês - Segunda Divisão', NULL, 1, 'frances-2-divisao', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(42, 1, 'Campeonato Sueco', 'Campeonato Sueco', NULL, 1, 'campeonato-sueco', '2023-10-28 21:01:11', '2023-10-28 21:01:11'),
(43, 1, 'Campeonato Sul-Coreano - K-League', 'Campeonato Sul-Coreano - K-League', NULL, 1, 'coreia-do-sul-k-league', '2023-10-28 21:01:11', '2023-10-28 21:01:11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bet_events`
--

CREATE TABLE `bet_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bet_category_id` bigint(20) UNSIGNED NOT NULL,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_a` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_a_logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_b` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_b_logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_day` datetime NOT NULL,
  `event_result_a` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_result_b` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finished` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bet_sections`
--

CREATE TABLE `bet_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `bet_sections`
--

INSERT INTO `bet_sections` (`id`, `name`, `image`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Futebol', 'ALVXctT91C99nxCSwT75jMhB6i6MEv-metac3BvcnQucG5n-.png', 1, '2023-10-21 21:17:46', '2023-10-21 21:17:46'),
(2, 'Voleibol ', '0cMzW5nEZekYTEgAsTRc06uvckbGEc-metadm9sbGV5YmFsbF9zcG9ydF81MDQ0LnBuZw==-.png', 1, '2023-10-21 21:21:19', '2023-10-21 21:21:19'),
(3, 'Fórmula 1', 'u1ieAxuLnYL4RlVEE4xkB4QE0chWEG-metaNjE4OTUxLnBuZw==-.png', 1, '2023-10-21 21:23:57', '2023-10-21 21:23:57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bet_users`
--

CREATE TABLE `bet_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bet_event_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `event_result_a` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_result_b` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward_received` decimal(20,2) DEFAULT NULL,
  `winner` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Dice', 'dice', 'uploads/FVhYh3uD7bROOUdTafezE6J7JDFeWW-metaZGljZS5wbmc=-.png', 'dice', '2023-09-25 23:25:42', '2023-09-25 23:25:42'),
(2, 'Double', 'Double', 'uploads/KTscMQl3mngUQ4441RJQqINepXTgOE-metaZG91YmxlLnBuZw==-.png', 'double', '2023-09-25 23:29:38', '2023-09-25 23:29:38'),
(3, 'Crash', 'Crash', 'uploads/dpPb2YvmrlWLYCFrO0XxjMhyWEYAG6-metaaWNvbnM4LWRlbW9saXRpb24tNTAucG5n-.png', 'crash', '2023-09-25 23:30:31', '2023-09-25 23:30:31'),
(4, 'Tower', 'Tower', 'uploads/qD3gUkE07AeYsvroWqrM8UXKpenXKI-metaaWNvbnM4LXRvcnJlLTUwLnBuZw==-.png', 'tower', '2023-09-25 23:31:17', '2023-09-25 23:31:17'),
(5, 'X-Double', 'X-Double', 'uploads/pE1laLME4ggInuIdpspUCjQSPcL0nm-metaeC1kb3VibGUucG5n-.png', 'x-double', '2023-09-25 23:33:07', '2023-09-25 23:33:07'),
(6, 'Mines', 'Mines', 'uploads/8yRTwbfeIgo8aPKzymrrGZZ7bANMhp-metaaWNvbnM4LWJvbWItNDgucG5n-.png', 'mines', '2023-09-25 23:34:35', '2023-09-25 23:34:35'),
(7, 'Tiger', 'Tiger', 'uploads/kDgvRPFObiX26VDgpec3Z1TlFNm6cc-metaaWNvbnM4LXRpZ3JlLTI0LnBuZw==-.png', 'tiger', '2023-09-25 23:35:34', '2023-09-25 23:35:34'),
(8, 'Esporte', 'Categoria de esporte', 'uploads/O8vUSyxtsatglpETWea9gFmHCqTsdS-metaZXNwb3J0ZS5wbmc=-.png', 'esporte', '2023-09-26 00:11:16', '2023-09-26 00:11:16'),
(9, 'Fortune', 'TIme da Fortuna', 'uploads/dhqWc86Wqx5r901RUSDA6Lc8U3gpHc-metaZm9ydHVuZS5wbmc=-.png', 'fortune', '2023-10-07 19:59:56', '2023-10-07 19:59:56'),
(10, 'Slots', 'Slots', 'uploads/JWf8xxlROE4Fut2PrfTyaPGpS8voOB-metac2xvdHMucG5n-.png', 'slots', '2023-10-08 00:09:01', '2023-10-08 00:09:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `debug`
--

CREATE TABLE `debug` (
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `debug`
--

INSERT INTO `debug` (`text`) VALUES
('{\"idTransaction\":\"a0572507-29da-422d-b609-3be5ef0f9ae2\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"f4651878-bfa4-426d-972b-fe5bc8eda232\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"14ab2350-9d36-4fca-97d8-817bf750df60\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"b183737f-2ab8-40a1-ac9e-c0c38454df04\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"f95b1cc3-b104-433a-8f45-66119fe9394a\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"afb01456-a7c1-405b-b852-0ecdb7dbc17f\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"4044b314-b605-4ae5-92db-4ecc23d7cb6b\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"90693a8b-f40f-4440-b336-9bff05c03efc\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"9c80b293-19d4-4543-ad10-ae26cca5c1fa\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"3f24f374-a0e8-43d9-80d1-ff9b1d256b00\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"e32c7fef-9081-4aad-af78-0cfcd5bd4ecd\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"b5b507b8-09b4-4134-a145-18c2d0fff387\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"894d9f9e-c73b-407c-b4aa-cc02ee1d2557\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"a646a468-72d5-4cdb-9eb9-565ac16b013f\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"bea31ce9-279a-4bff-a82b-c2fb7ea91269\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"0d5698a9-5f00-44a4-8d89-60c7549edb71\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}'),
('{\"idTransaction\":\"23f8b869-6b56-4b70-995b-0991b904b924\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"acquirer_message\":null,\"acquirer_return_code\":null}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `deposits`
--

INSERT INTO `deposits` (`id`, `payment_id`, `user_id`, `amount`, `type`, `proof`, `status`, `created_at`, `updated_at`) VALUES
(210, NULL, 336, 10.00, 'Pix', 'zh15uAB0Gf49cE3LFha26k3Yv2bsu9-metaYTA1ZjhkMWUtMDAwNS00MTg4LTkyM2QtNDNiMmU4YzVkNTFiLmpwZw==-.jpg', 1, '2023-12-21 17:31:42', '2023-12-23 17:02:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `deposit_user`
--

CREATE TABLE `deposit_user` (
  `id` int(11) NOT NULL,
  `deposit_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `deposit_user`
--

INSERT INTO `deposit_user` (`id`, `deposit_id`, `user_id`) VALUES
(1, '210', '336');

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_service` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technology` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `has_lobby` tinyint(4) NOT NULL DEFAULT '0',
  `is_mobile` tinyint(4) NOT NULL DEFAULT '0',
  `has_freespins` tinyint(4) NOT NULL DEFAULT '0',
  `has_tables` tinyint(4) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `views` bigint(20) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games`
--

INSERT INTO `games` (`id`, `category_id`, `name`, `uuid`, `image`, `type`, `provider`, `provider_service`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `slug`, `active`, `views`, `created_at`, `updated_at`) VALUES
(2, 7, 'Fortune Tiger', 'd2eca6ec0cee46189bcc99620e08f844', '45PcOZKe8thultp9Z1IFpO7UE9dbOx-metadGh1bWItbWFnbmF0YS1mb3J0dW5lLnBuZw==-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 1, 0, 0, 'pgsoft-fortune-tiger', 0, 72, '2023-09-25 01:19:54', '2023-10-07 03:27:07'),
(3, 8, 'Mines', '7c34301b8c194a99a80bf1082f353bdd', 'PDv47vjk9evn1ynVZS7oXjzRIcxJFd-metabWluZXNwcm8tdGh1bWIucG5n-.png', 'mini games', 'Spribe', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'spribe-mines', 0, 28, '2023-09-29 23:31:04', '2023-10-03 00:20:32'),
(4, 7, 'Fortune Ox', 'a05e42412e1b4ea2aa385d46cab73815', 'OmGtj5H94ZHXIMIdOdQJBMxbidDUwq-metadGh1bWItZm9ydHVuZW94LnBuZw==-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 1, 0, 0, 'pgsoft-fortune-ox', 0, 5, '2023-09-29 23:39:25', '2023-09-30 09:52:06'),
(5, 7, 'Fortune Rabbit', 'c3befcf4f6e24010a5bc41da10054f23', 'HvVGCyDvICECXlM3KQClrJNl75ReF1-metadGh1bWItZm9ydHVuZXJhYmJpdC5wbmc=-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 1, 0, 0, 'pgsoft-fortune-rabbit', 0, 12, '2023-09-29 23:42:38', '2023-10-02 15:31:56'),
(6, 3, 'Aviator', '5b1b299bf4f04b9f84643730a882e682', '8WhyWMX9WocMSTzisdYpTQ2Wv2bHD3-metadGh1bWItYXZpYXRvci1tYWduYXRhLnBuZw==-.png', 'crash', 'PragmaticPlayLive', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'pragmaticplaylive-aviator', 0, 8, '2023-09-30 01:51:21', '2023-10-02 22:50:15'),
(7, 3, 'Spaceman', 'db196682b2fca3650b42526b642fac3a16a374b5', 'UuvpLelMvtK7LGFTl55ZMq0dM4Jzik-metac3BhY2VtYW4tdGh1bWIucG5n-.png', 'crash', 'PragmaticPlayLive', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'pragmaticplaylive-spaceman', 0, 5, '2023-09-30 02:04:09', '2023-09-30 16:30:31'),
(8, 7, 'Fortune Mouse', 'b50151fecdcc409b82d2e1542d9c7531', 'oE9xGt81IrgaOoviohAYAahIyVyvfd-metaQnlsTHpkV28xRy1iOTg0NGUwOWFhNjNkYWMwNWI4MjY5NDg0MWEwZjNlNC5wbmc=-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'pgsoft-fortune-mouse', 0, 16, '2023-09-30 06:11:56', '2023-10-04 12:39:27'),
(9, 3, 'JetX', 'cfcd1ed15cf62e9cde42482e2dcc0699f2f30d6f', '3xsmvSHyyJCAaJ15Jodn8T01wzAtug-metadGh1bWJqZXR4LnBuZw==-.png', 'slots', 'SmartSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'smartsoft-jetx', 0, 7, '2023-09-30 06:21:43', '2023-10-03 00:03:46'),
(10, 1, 'Plinko X', 'f6573dfe5225f0d3eb56fc99a4e0eca894268f1e', 'NPAHmHXFnyAESnzOF8sp51YVZ7y59u-metadGh1bWItcGxpbmtveC5wbmc=-.png', 'slots', 'SmartSoft', NULL, 'HTML5', 0, 0, 0, 0, 'smartsoft-plinko-x', 0, 0, '2023-09-30 06:24:06', '2023-09-30 10:26:41'),
(11, 7, 'Piggy Gold', 'fe21a6cfa2e94e6087a0fdc86dae2f3b', 'wYIGgatRNObHuWwE4ucXnKAWqVHkMv-metacGdzX3BpZ2d5Z29sZC1lbi1VUy5wbmcuZTUyMzY3MTAyYzA0YWM0OGE2ZDRjN2Y1ODFiNDA3NTYucG5n-.png', 'slots', 'PGSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'pgsoft-piggy-gold', 0, 3, '2023-09-30 06:37:33', '2023-09-30 22:11:12'),
(12, 3, 'Balloon', '9d102c4944c742acbb3ac49dad3bda1e', '2AJCX333BJFDNqHiUtCg5y7n1tFIBO-metadGh1bWItYmFsbG9vbi5wbmc=-.png', 'slots', 'SmartSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'smartsoft-balloon', 0, 9, '2023-09-30 14:03:43', '2023-10-02 23:58:20'),
(16, 4, 'Plinko', 'd3ea2911ae7c4a1c8230117db0295318', 'ChVHzBeeTgGgxfnzKEJhAhhSAzLrk1-metaaW1hZ2VtXzIwMjMtMDktMzBfMTUxNzA5OTg0LnBuZw==-.png', 'mini games', 'Spribe', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'spribe-plinko', 0, 5, '2023-09-30 15:17:37', '2023-09-30 22:53:28'),
(14, 7, 'Gates of Olympus Mobile', '260d4a6e9f99c91940517ac650330683f6f42408', 'EUuXwKqZfTUJ433ha5FicmDifZjweG-metadGh1bWItZ2F0ZXMtb2Ytb2x5bXB1cy5wbmc=-.png', 'slots', 'PragmaticPlay', 'slotegrator', 'HTML5', 0, 1, 0, 0, 'pragmaticplay-gates-of-olympus-mobile', 0, 3, '2023-09-30 14:47:52', '2023-10-01 18:59:54'),
(15, 3, 'Cappadocia', '40f1aaa03a5c403ea3148b17e1894ece', 'WqZ6M9oli8VmY4USb6TUrU3p52kWnT-metadGh1bWItY2FwcGFkb2NpYS5wbmc=-.png', 'slots', 'SmartSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'smartsoft-cappadocia', 0, 11, '2023-09-30 15:02:05', '2023-10-02 23:27:12'),
(17, 3, 'Football x', 'eb2fbec7b7095e687125e86536e22bf661867bec', 'XZvLSNPGhEcFGMNxfoiJwoSqVY1N0c-metaaW1hZ2VtXzIwMjMtMTAtMDJfMTQ0ODAwMjAwLnBuZw==-.png', 'Crash', 'SmartSoft', 'slotegrator', 'HTML5', 0, 0, 0, 0, 'smartsoft-football-x', 0, 2, '2023-10-02 14:48:04', '2023-10-02 23:03:42');

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_hashes`
--

CREATE TABLE `games_hashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_kscinus`
--

CREATE TABLE `games_kscinus` (
  `id` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `cover` varchar(128) DEFAULT NULL,
  `description` text,
  `rtp` decimal(10,2) DEFAULT '0.00',
  `category_id` tinyint(4) DEFAULT '0',
  `developer` varchar(26) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '2',
  `key` varchar(64) DEFAULT NULL,
  `money_ratio` varchar(5) DEFAULT NULL,
  `device` tinyint(4) DEFAULT '0',
  `views` bigint(20) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games_kscinus`
--

INSERT INTO `games_kscinus` (`id`, `title`, `cover`, `description`, `rtp`, `category_id`, `developer`, `type`, `key`, `money_ratio`, `device`, `views`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ancient Egypt', 'pragmatic/pragmatic-ancient-egypt.jpg', 'Consiga as riquezas do velho mundo no Antigo Egito™, a Slot de vídeo de 3×5, 10 linhas. Agarre  o BÓNUS GAME para ganhar SPINS GRÁTIS com um símbolo especial de expansão que paga em qualquer lugar ou ganhe prémios diretos até 500 vezes a sua aposta!', 0.00, 10, NULL, 2, 'pragmatic-ancient-egypt', '1x1', 0, 0, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:24'),
(2, 'Ancient Egypt Classic', 'pragmatic/pragmatic-ancient-egypt-classic.jpg', 'Capture os símbolos especiais no Ancient Egypt Classic, a videoslot 3 × 5, 10 linhas. Acerte a rodada de Free Spins com 3 Wilds dispersos para revelar o símbolo especial que se expande e paga em qualquer lugar por vitórias incríveis.', 0.00, 10, NULL, 2, 'pragmatic-ancient-egypt-classic', '1x1', 0, 1, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:25'),
(3, 'Ancient Egypt', 'pragmatic/pragmatic-ancient-egypt-pm.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-ancient-egypt-pm', '1x1', 0, 6, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:30'),
(4, 'Aztec Gems', 'pragmatic/pragmatic-aztec-gems.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-aztec-gems', '1x1', 0, 1, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:31'),
(5, 'Aztec King', 'pragmatic/pragmatic-aztec-king.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-aztec-king', '1x1', 0, 0, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:32'),
(6, 'Big Bass Bonanza', 'pragmatic/pragmatic-big-bass-bonanza.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-big-bass-bonanza', '1x1', 0, 4, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:33'),
(7, 'Big Bass Keeping it Reel', 'pragmatic/pragmatic-big-bass-keeping-it-reel.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-big-bass-keeping-it-reel', '1x1', 0, 1, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:34'),
(8, 'Big Bass Splash', 'pragmatic/pragmatic-big-bass-splash.jpg', 'Está na hora de pegar novamente na cana de pesca e regressar à linha de costa, na slot Big Bass Splash™. Quanto aos símbolos de jogo, existem os royals padrão, 10 até ao A, bem como alguns símbolos mais temáticos. Estes incluem uma libélula, uma caixa de isco, uma cana de pesca, um camião e, claro, peixes de diferentes tamanhos que fazem parte da ronda de bónus. Os dois símbolos de características são o Wild e o Scatter. O Wild é um alegre pescador barbudo. Quando aterrar nas bobinas, ele vai ajudar os jogadores a formar ganhos, substituindo o símbolo necessário para completar uma combinação em diferentes linhas de pagamento. Enquanto isso, o símbolo Scatter é um peixe Robalo em anzol saltando fora de água. Este monstro é a chave para desbloquear a funcionalidade de Rodadas Grátis onde os jogadores podem ganhar até um potencial de 5.000x a sua aposta. Repleto de características, espere multiplicadores cada vez maiores, subidas de nível, empurrões, Re-trigger, símbolos empilhados e muito mais em Big Bass Splash™!', 0.00, 10, NULL, 2, 'pragmatic-big-bass-splash', '1x1', 0, 3, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:37'),
(9, 'Bigger Bass Blizzard', 'pragmatic/pragmatic-bigger-bass-blizzard.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-bigger-bass-blizzard', '1x1', 0, 0, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:38'),
(10, 'Bigger Bass Bonanza', 'pragmatic/pragmatic-bigger-bass-bonanza.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-bigger-bass-bonanza', '1x1', 0, 1, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:41'),
(11, 'Bonanza Gold', 'pragmatic/pragmatic-bonanza-gold.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-bonanza-gold', '1x1', 0, 0, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:50'),
(12, 'Book of Aztec King', 'pragmatic/pragmatic-book-of-aztec-king.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-book-of-aztec-king', '1x1', 0, 1, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:51'),
(13, 'Book Of ELDorado', 'pragmatic/pragmatic-book-of-eldorado.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-book-of-eldorado', '1x1', 0, 0, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:51'),
(14, 'Book of Kingdoms', 'pragmatic/pragmatic-book-of-kingdoms.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-book-of-kingdoms', '1x1', 0, 0, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:52'),
(15, 'Book of the Fallen', 'pragmatic/pragmatic-book-of-the-fallen.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-book-of-the-fallen', '1x1', 0, 1, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:53'),
(16, 'Book of Tut PM', 'pragmatic/pragmatic-book-of-tut-pm.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-book-of-tut-pm', '1x1', 0, 0, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:54'),
(17, 'BookofTutRespin', 'pragmatic/pragmatic-book-of-tut-respin.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-book-of-tut-respin', '1x1', 0, 0, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:54'),
(18, 'Book of Vikings', 'pragmatic/pragmatic-book-of-vikings.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-book-of-vikings', '1x1', 0, 5, 0, '2023-11-23 05:48:07', '2023-12-05 22:19:55'),
(19, 'Bubble Pop', 'pragmatic/pragmatic-bubble-pop.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-bubble-pop', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:19:56'),
(20, 'Bull Fiesta', 'pragmatic/pragmatic-bull-fiesta.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-bull-fiesta', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:37'),
(21, 'Candy Village', 'pragmatic/pragmatic-candy-village.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-candy-village', '1x1', 0, 1, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:38'),
(22, 'Cash Patrol', 'pragmatic/pragmatic-cash-patrol.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-cash-patrol', '1x1', 0, 1, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:39'),
(23, 'Chilli Heat', 'pragmatic/pragmatic-chilli-heat.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-chilli-heat', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:39'),
(24, 'Christmas Big Bass Bonanza', 'pragmatic/pragmatic-christmas-big-bass-bonanza.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-christmas-big-bass-bonanza', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:40'),
(25, 'Cleocatra', 'pragmatic/pragmatic-cleocatra.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-cleocatra', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:41'),
(26, 'Clover Gold', 'pragmatic/pragmatic-clover-gold.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-clover-gold', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:42'),
(27, 'Cowboys Gold', 'pragmatic/pragmatic-cowboys-gold.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-cowboys-gold', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:42'),
(28, 'Day of Dead', 'pragmatic/pragmatic-day-of-dead.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-day-of-dead', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:43'),
(29, 'Dragons 888', 'pragmatic/pragmatic-dragons-888.jpg', 'Faça a sua fortuna no 888 Dragons™, um jogo de slot de 3×3 e 1 linha. Ter sorte nunca foi tão fácil, acerte os dragões e vença!', 0.00, 10, NULL, 2, 'pragmatic-dragons-888', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:44'),
(30, 'Egyptian Fortunes', 'pragmatic/pragmatic-egyptian-fortunes.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-egyptian-fortunes', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:44'),
(31, 'Extra Juicy', 'pragmatic/pragmatic-extra-juicy.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-extra-juicy', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:45'),
(32, 'Eye of the Storm', 'pragmatic/pragmatic-eye-of-the-storm.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-eye-of-the-storm', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:46'),
(33, 'Fire Hot - 100', 'pragmatic/pragmatic-fire-hot-100.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fire-hot-100', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:46'),
(34, 'Fire Hot - 20', 'pragmatic/pragmatic-fire-hot-20.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fire-hot-20', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:47'),
(35, 'Fire Hot - 40', 'pragmatic/pragmatic-fire-hot-40.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fire-hot-40', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:48'),
(36, 'Fire Hot - 5', 'pragmatic/pragmatic-fire-hot-5.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fire-hot-5', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:50'),
(37, 'Fortune of Giza', 'pragmatic/pragmatic-fortune-of-giza.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fortune-of-giza', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:50'),
(38, 'Fruit Party', 'pragmatic/pragmatic-fruit-party.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fruit-party', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:51'),
(39, 'Fruit Party 2', 'pragmatic/pragmatic-fruit-party-2.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fruit-party-2', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:53'),
(40, 'Fruit Rainbow', 'pragmatic/pragmatic-fruit-rainbow.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fruit-rainbow', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:54'),
(41, 'Gates of Olympus', 'pragmatic/pragmatic-gates-of-olympus.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-gates-of-olympus', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:54'),
(42, 'Glorious Rome', 'pragmatic/pragmatic-glorious-rome.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-glorious-rome', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:55'),
(43, 'Golden Ox', 'pragmatic/pragmatic-golden-ox.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-golden-ox', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:56'),
(44, 'Gold Rush', 'pragmatic/pragmatic-gold-rush.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-gold-rush', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:56'),
(45, 'Great Reef', 'pragmatic/pragmatic-great-reef.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-great-reef', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:57'),
(46, 'Great Rhino Deluxe', 'pragmatic/pragmatic-great-rhino-deluxe.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-great-rhino-deluxe', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:58'),
(47, 'Great Rhino', 'pragmatic/pragmatic-great-rhino.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-great-rhino', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:20:59'),
(48, 'Heart of Rio', 'pragmatic/pragmatic-heart-of-rio.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-heart-of-rio', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:00'),
(49, 'Hercules son of Zeus', 'pragmatic/pragmatic-hercules-son-of-zeus.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-hercules-son-of-zeus', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:00'),
(50, 'Hockey League', 'pragmatic/pragmatic-hockey-league.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-hockey-league', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:01'),
(51, 'Hot Safari', 'pragmatic/pragmatic-hot-safari.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-hot-safari', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:41'),
(52, 'Hot To Burn', 'pragmatic/pragmatic-hot-to-burn.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-hot-to-burn', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:41'),
(53, 'Hotto Burn Extreme', 'pragmatic/pragmatic-hot-to-burn-extreme.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-hot-to-burn-extreme', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:42'),
(54, 'John Hunter And The Mayan Gods', 'pragmatic/pragmatic-john-hunter-and-the-mayan-gods.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-john-hunter-and-the-mayan-gods', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:42'),
(55, 'John Hunter and the Tomb of the Scarab Queen', 'pragmatic/pragmatic-john-hunter-and-the-tomb-of-the-scarab-queen.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-john-hunter-and-the-tomb-of-the-scarab-queen', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:43'),
(56, 'Joker King', 'pragmatic/pragmatic-joker-king.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-joker-king', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:44'),
(57, 'Juicy Fruits', 'pragmatic/pragmatic-juicy-fruits.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-juicy-fruits', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:44'),
(58, 'Kingdom Of Asgard', 'pragmatic/pragmatic-kingdom-of-asgard.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-kingdom-of-asgard', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:45'),
(59, 'Lady Godiva', 'pragmatic/pragmatic-lady-godiva.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-lady-godiva', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:22:33'),
(60, 'Lucky New Year', 'pragmatic/pragmatic-lucky-new-year.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-lucky-new-year', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:22:34'),
(61, 'Lucky New Year Tiger Treasures', 'pragmatic/pragmatic-lucky-new-year-tiger-treasures.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-lucky-new-year-tiger-treasures', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:36'),
(62, 'Madame Destiny', 'pragmatic/pragmatic-madame-destiny.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-madame-destiny', '1x1', 0, 1, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:35'),
(63, 'Money Mouse', 'pragmatic/pragmatic-money-mouse.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-money-mouse', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:35'),
(64, '7 Monkeys', 'pragmatic/pragmatic-monkeys.jpg', 'Prepare-se para empilhar primatas em 7 Monkeys, na slot de 5, 7 linhas. A grande linha vence e até 150 rodadas grátis com multiplicador 3x estão prontos para a tomada. Palhaçada? Mais como riquezas de macacos.', 0.00, 10, NULL, 2, 'pragmatic-monkeys', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:33'),
(65, 'Mustang Gold', 'pragmatic/pragmatic-mustang-gold.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-mustang-gold', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:34'),
(66, 'Pandas Fortune', 'pragmatic/pragmatic-pandas-fortune.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-pandas-fortune', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:32'),
(67, 'Pandas Fortune 2', 'pragmatic/pragmatic-pandas-fortune-2.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-pandas-fortune-2', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:30'),
(68, '7 Piggie', 'pragmatic/pragmatic-7-piggies.jpg', 'Uma fortuna em 7 Piggies™, a Slot de vídeo 3×5, 7 linhas. Os porcos estão sempre empilhados em todas as bobinas e sabem sempre onde está o tesouro. Quando obténs o Recurso De Rodadas Grátis, podes tirar multiplicadores e jogos gratuitos adicionais dos celeiros de dispersão para vitórias extraordinárias!', 0.00, 10, NULL, 2, 'pragmatic-7-piggies', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:29'),
(69, 'Pirate Gold', 'pragmatic/pragmatic-pirate-gold.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-pirate-gold', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:28'),
(70, 'Pirate Gold Deluxe', 'pragmatic/pragmatic-pirate-gold-deluxe.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-pirate-gold-deluxe', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:28'),
(71, 'Pirate Golden Age', 'pragmatic/pragmatic-pirate-golden-age.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-pirate-golden-age', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:28'),
(72, 'Pyramid Bonanza', 'pragmatic/pragmatic-pyramid-bonanza.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-pyramid-bonanza', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:27'),
(73, 'Pyramid King', 'pragmatic/pragmatic-pyramid-king.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-pyramid-king', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:27'),
(74, 'Return Of The Dead', 'pragmatic/pragmatic-return-of-the-dead.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-return-of-the-dead', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:26'),
(75, 'Safari King', 'pragmatic/pragmatic-safari-king.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-safari-king', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:25'),
(76, 'Starlight Princess', 'pragmatic/pragmatic-starlight-princess.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-starlight-princess', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:11'),
(77, 'Striking Hot - 5', 'pragmatic/pragmatic-striking-hot-5.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-striking-hot-5', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:12'),
(78, 'Sugar Rush', 'pragmatic/pragmatic-sugar-rush.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-sugar-rush', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:12'),
(79, 'Super 7s', 'pragmatic/pragmatic-super-7s.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-super-7s', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:13'),
(80, 'Sweet Bonanza', 'pragmatic/pragmatic-sweet-bonanza.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-sweet-bonanza', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:13'),
(81, 'Sweet Bonanza Xmas', 'pragmatic/pragmatic-sweet-bonanza-xmas.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-sweet-bonanza-xmas', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:15'),
(82, 'Tales of Egypt', 'pragmatic/pragmatic-tales-of-egypt.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-tales-of-egypt', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:15'),
(83, 'The Dog House', 'pragmatic/pragmatic-the-dog-house.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-the-dog-house', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:16'),
(84, 'The Tiger Warrior', 'pragmatic/pragmatic-the-tiger-warrior.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-the-tiger-warrior', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:16'),
(85, 'Tweety House', 'pragmatic/pragmatic-tweety-house.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-tweety-house', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:17'),
(86, 'Vampires vs Wolves', 'pragmatic/pragmatic-vampires-vs-wolves.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-vampires-vs-wolves', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:19'),
(87, 'Wild Beach Party', 'pragmatic/pragmatic-wild-beach-party.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-wild-beach-party', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:21'),
(88, 'Fire Strike', 'pragmatic/pragmatic-fire-strike.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fire-strike', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:22'),
(89, 'Fishin Reels', 'pragmatic/pragmatic-fishin-reels.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-fishin-reels', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:22'),
(90, 'Rise of Samurai 3', 'pragmatic/pragmatic-rise-of-samurai-3.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-rise-of-samurai-3', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:23'),
(91, 'Shining Hot 5', 'pragmatic/pragmatic-shining-hot-5.jpg', NULL, 0.00, 10, NULL, 2, 'pragmatic-shining-hot-5', '1x1', 0, 0, 0, '2023-11-23 05:48:08', '2023-12-05 22:21:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_exclusives`
--

CREATE TABLE `game_exclusives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `winLength` bigint(20) NOT NULL DEFAULT '3',
  `loseLength` bigint(20) NOT NULL DEFAULT '20',
  `influencer_winLength` bigint(20) NOT NULL DEFAULT '20',
  `influencer_loseLength` bigint(20) NOT NULL DEFAULT '1',
  `iconsJson` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) DEFAULT '1',
  `views` bigint(20) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `game_exclusives`
--

INSERT INTO `game_exclusives` (`id`, `category_id`, `uuid`, `name`, `description`, `cover`, `icon`, `winLength`, `loseLength`, `influencer_winLength`, `influencer_loseLength`, `iconsJson`, `active`, `views`, `created_at`, `updated_at`) VALUES
(1, 9, 'fortunetiger', 'Fortune Tiger', '<p>&nbsp;Diz a lenda que existe um imperador de mil anos que governa um império chamado Imortal. O segredo de sua imortalidade é seu raro tigre dourado que sempre fica ao seu lado como guardião. Possui lindo pelo listrado que brilha como a luz do sol e um par de olhos dourados que podem arrebatar a alma de quem olha para eles. Não só este tigre mantém a paz em Immortal, mas também concedeu ao imperador uma vida imortal. O tigre só dá à luz uma vez a cada doze anos, e este ano é um desses anos! O imperador está muito animado em convidar o povo para testemunhar o milagre. Diz-se que uma chuva dourada cairá do céu quando o filhote de tigre nascer. A chuva tem o poder de fertilizar o solo e curar todo tipo de doenças. Jogue “Fortune Tiger” agora para testemunhar o nascimento do tigre dourado e ser abençoado com uma vida inteira de sorte!\\n\\nFortune Tiger é um vídeo slot de 3 cilindros e 3 linhas com respins e multiplicador x10. O recurso Fortune Tiger pode ser acionado aleatoriamente durante qualquer giro! Se houver 1 ou mais símbolos adicionais (seja um símbolo escolhido aleatoriamente ou um símbolo Wild) aparecendo nas bobinas, todas as bobinas girarão novamente! Além disso, quando todos os símbolos nos rolos estiverem envolvidos numa vitória, a vitória será multiplicada por x10.&nbsp;</p>', 'mk2R9W6GNeocbopKDvkrh0cM78oukO-metaZm9ydHVuZS10aWdlci1kaXZ1bGdhY2FvLmpwZw==-.jpg', 'Lq6sofAr3rU4AvAbUaw2dazLpOhoFD-metadGlnZXItMi5wbmc=-.png', 20, 20, 1, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 2742, '2023-10-07 19:18:46', '2023-12-21 14:49:44'),
(2, 9, 'fortuneox', 'Fortune OX', '<p>&nbsp;Ox is the second of the 12-year periodic sequence of animals in the Chinese zodiac. It plays an important role throughout China agriculture history and acts as the symbol of “productivity” due to its diligence and tenacity. The ancient Chinese always said: “Farming is best done in the year of the Ox”. This is because there is always fair weather in every year of the Ox, making all the work go smoothly! The Ox also represents an auspicious animal. Legend has it, there is an immortal person who rides his mighty Ox in Mount Taibai. It is said that whoever has the chance to touch the horns of the Ox will be blessed with happiness for their whole life! However, this immortal person and his ox are hard to track, and only the destined few can meet them and be blessed with good luck! Play “Fortune Ox” now, let the Ox bless you with good fortune and prosperity! Fortune Ox is a 3-reel, 3-row (for reel 1 and 3) and 4-row (for reel 2) video slot featuring respins until win and x10 multiplier. Fortune Ox Feature may be randomly triggered during any spin! During the Fortune Ox Feature, when the first and third reel share the same symbols, all reels will respin until there is a win! Not only that, full reels win will reward x10 wins too!&nbsp;</p>', 'v9Y8flwXWH7NxQGHVQ0qAbvwYvUTsY-metaZm9ydHVuZS10aWdlci1kaXZ1bGdhY2FvLnBuZw==-.png', 'eSwugWYqXBDiRKo4V3a93fivawpzqc-metab3gucG5n-.png', 1, 20, 20, 1, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 625, '2023-10-07 19:58:11', '2023-12-18 21:50:45'),
(3, 9, 'fortunemouse', 'Fortune Mouse', '<p>&nbsp;Legend has it that the Jade Emperor organized a river crossing competition to select twelve animals to be the twelve zodiac signs. Many animals enthusiastically entered after hearing about this news. On the day of the competition, the cow was ahead of the race. But unbeknownst to the cow, the clever mouse had been hiding on the cow’s back. When the cow was about to cross the finish line, the mouse jumped off the cow’s back and thus became the first of the zodiac signs.<br>Mice are not only clever; they were also regarded as a symbol of wealth during ancient times. It was said that if your home had mice stealing food, it meant your family was rich and prosperous enough to have a surplus of food at home for the mice to steal! So let “Fortune Mouse” bring you unlimited luck and endless wealth in the year of the Mouse!<br>Fortune Mouse is a 3-reel, 3-row video slot featuring respins until win. 3 Wild symbols may be added to the middle reel during any spin in the Fortune Mouse Feature. The first and third reel will respin until there is a win. Be awarded with 1000x of the total bet in Maximum Win when Wild symbols occupy all the reels!&nbsp;</p>', 'Knn2Qh5Gq4QyOKWds0gxcJpFFv8ZqG-metaZm9ydHVuZSBtb3VzZS5wbmc=-.png', 'BsJCiMUt4sLYcvRUaw4zqAjsUW4oqk-metabW91c2UucG5n-.png', 1, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 675, '2023-10-07 20:06:52', '2023-12-18 20:30:48'),
(4, 9, 'fortunepanda', 'Fortune Panda', '<p>\"Uma emocionante jornada que promete trazer grandes ganhos financeiros! Bem-vindo ao Panda, a nova adição à Família Fortune.\"</p>', 'YIoo9HT7MihiVmNWKcI2FIW1WZrEvU-metaZm9ydHVuZXBhbmRhLnBuZw==-.png', 'x9jw5Eu29n3UIJzr6ud8zhdqiO8u4d-metacGFuZGEucG5n-.png', 1, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 547, '2023-10-07 23:18:52', '2023-12-16 04:54:45'),
(5, 10, 'phoenixrises', 'Phoenix Rises', '<p>&nbsp;Ressurge das cinzas para trazer sorte até você. Venha se divertir com nossa nova atração!&nbsp;</p>', 'PCXR4RCPk9RLDn1HsufExp71pZqUCQ-metacGhvZW5peC1yaXNlcy5qcGc=-.jpg', 'x7iN6vEcayfBZIQoy7XC7zbe2UVgns-metaZmVuaXgucG5n-.png', 1, 20, 2, 20, '{\n    \"success\": true,\n    \"data\": [\n        {\n            \"icon_name\": \"Symbol_0\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 0,\n            \"win_4\": 0,\n            \"win_5\": 0,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_1\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 0,\n            \"win_4\": 0,\n            \"win_5\": 0,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_2\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 20,\n            \"win_4\": 50,\n            \"win_5\": 120,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_3\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 15,\n            \"win_4\": 45,\n            \"win_5\": 100,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_4\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 10,\n            \"win_4\": 45,\n            \"win_5\": 80,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_5\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 6,\n            \"win_4\": 15,\n            \"win_5\": 50,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_6\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 30,\n            \"win_4\": 60,\n            \"win_5\": 150,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_7\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 5,\n            \"win_4\": 10,\n            \"win_5\": 40,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_8\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 5,\n            \"win_4\": 10,\n            \"win_5\": 40,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_9\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 10,\n            \"win_4\": 45,\n            \"win_5\": 80,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        }\n    ],\n    \"message\": \"List icons success\"\n}', 1, 387, '2023-10-07 23:58:18', '2023-12-16 01:39:34'),
(6, 10, 'queenofbounty', 'Queen of Bounty', '<p>Queen of Bounty</p>', 'xrRXaL88Iff3ULrsQLHsXmyaM3Y2NL-metaY2FwYS5wbmc=-.png', 'D4KfDqMiKGkeNYXnnTNdofzXAuohRj-metadGVzb3VyZS5wbmc=-.png', 1, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 16, '2023-10-08 00:43:26', '2023-12-18 21:50:28'),
(7, 10, 'treasuresofaztec', 'Treasures of Aztec', '<p>Treasures of Aztec</p>', 'KHExUPRNFajcxZWzdoPdzCe4O2h5Pr-metaYXp0ZWMucG5n-.png', 'SvaQYvS346lt4Qt4UTdAJ5k34Iv6Ew-metaMTM1NzUzOS5wbmc=-.png', 1, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 270, '2023-10-08 01:22:00', '2023-12-18 20:32:02'),
(8, 10, 'bikiniparadise', 'Bikini Paradise', '<p>Bikini Paradise</p>', 'fZADwOr23g2Hx5y7YLKGk2FnLMYlLm-metaYmlraW5pLXBhcmFkaXNlLmpwZw==-.jpg', 'zSBdC8WTBkhpKWeL1qBv4ZU5NR3bdY-metaMjc5MzkzMy5wbmc=-.png', 1, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 48, '2023-10-09 01:57:29', '2023-12-18 20:32:39'),
(9, 10, 'hoodvswoolf', 'Hood VS Wolf', '<p>Hood VS Wolf</p>', 'VRHFIg7KH8dogUT5lK9xdqE5pVr7AC-metaaG9vZHZjd29sZi5wbmc=-.png', 'llnN2dNJTN2FAyFYDvoW4pGhX6mQkQ-metadHJhbnNmZXJpci5wbmc=-.png', 1, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 22, '2023-10-09 02:07:30', '2023-12-18 21:49:47'),
(10, 10, 'jackfrost', 'Jack Frost´s', '<p>Jack Frost´s</p>', 'uutSKVtwTeceqW6lXsERHhTSlTnu1r-metaamFja2Zyb3N0LnBuZw==-.png', 'ciJKswrHRTZocwtMtDfIjerQp7y8od-metaMjQ5MjAyNi5wbmc=-.png', 1, 20, 2, 20, '{\n\"success\": true,\n\"data\": [\n{\n\"icon_name\": \"Symbol_0\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_1\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 0,\n\"win_4\": 0,\n\"win_5\": 0,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_2\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 50,\n\"win_4\": 250,\n\"win_5\": 2500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_3\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 20,\n\"win_4\": 100,\n\"win_5\": 1000,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_4\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 15,\n\"win_4\": 50,\n\"win_5\": 500,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_5\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 10,\n\"win_4\": 25,\n\"win_5\": 200,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_6\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 5,\n\"win_4\": 20,\n\"win_5\": 100,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_7\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 4,\n\"win_4\": 15,\n\"win_5\": 75,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n},\n{\n\"icon_name\": \"Symbol_8\",\n\"win_1\": 0,\n\"win_2\": 0,\n\"win_3\": 3,\n\"win_4\": 10,\n\"win_5\": 50,\n\"win_6\": 0,\n\"wild_card\": null,\n\"free_spin\": null,\n\"free_num\": 0,\n\"scaler_spin\": null\n}\n],\n\"message\": \"List icons success\"\n}', 1, 28, '2023-10-09 23:23:13', '2023-12-16 15:33:26'),
(11, 10, 'songkranparty', 'Song Kran Party', '<p>Song Kran Party</p>', 'Pw3uLU7FMRJP3CexPbcfS626QXyOdP-metac29uZ2tyYW4ucG5n-.png', '6li5RylQgxWOwFaKx5ijUbfG8GJ2x7-metaMTQ3MTQzNS0yMDAucG5n-.png', 1, 20, 2, 20, '{\n    \"success\": true,\n    \"data\": [\n        {\n            \"icon_name\": \"Symbol_0\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 0,\n            \"win_4\": 0,\n            \"win_5\": 0,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_1\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 0,\n            \"win_4\": 0,\n            \"win_5\": 0,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_2\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 20,\n            \"win_4\": 50,\n            \"win_5\": 120,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_3\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 15,\n            \"win_4\": 45,\n            \"win_5\": 100,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_4\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 10,\n            \"win_4\": 45,\n            \"win_5\": 80,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_5\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 6,\n            \"win_4\": 15,\n            \"win_5\": 50,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_6\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 30,\n            \"win_4\": 60,\n            \"win_5\": 150,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_7\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 5,\n            \"win_4\": 10,\n            \"win_5\": 40,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_8\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 5,\n            \"win_4\": 10,\n            \"win_5\": 40,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        },\n        {\n            \"icon_name\": \"Symbol_9\",\n            \"win_1\": 0,\n            \"win_2\": 0,\n            \"win_3\": 10,\n            \"win_4\": 45,\n            \"win_5\": 80,\n            \"win_6\": 0,\n            \"wild_card\": null,\n            \"free_spin\": null,\n            \"free_num\": 0,\n            \"scaler_spin\": null\n        }\n    ],\n    \"message\": \"List icons success\"\n}', 1, 22, '2023-10-09 23:25:21', '2023-12-16 15:39:34'),
(12, 10, 'fortunerabbit', 'Fortune Rabbit', '<p>Fortune Rabbit</p>', '1RR2Nx53VXjLjwCiYxQ4s5vmahnQ0W-metacmFiYml0LnBuZw==-.png', 'G6c2v0xJxlqTdY3nPMhk4MsyF0cuem-metacmFiaWl0aWNvbi5wbmc=-.png', 20, 20, 2, 20, '[]', 1, 1147, '2023-10-10 23:45:45', '2023-12-21 16:14:25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_24_214554_add_field_to_users_table', 2),
(6, '2023_09_24_215008_create_wallets_table', 2),
(7, '2023_09_24_215356_create_games_table', 2),
(8, '2023_09_24_215619_create_games_hashes_table', 2),
(9, '2023_09_24_215903_create_orders_table', 2),
(10, '2023_09_24_233733_create_settings_table', 3),
(11, '2023_09_24_211517_create_teams_table', 4),
(12, '2023_09_24_214013_add_team_id_to_users_table', 5),
(13, '2023_09_25_113635_create_withdrawals_table', 6),
(14, '2023_09_25_113654_create_deposits_table', 6),
(15, '2023_09_25_204419_add_fields_to_settings_table', 7),
(16, '2023_09_24_214008_create_categories_table', 8),
(17, '2023_09_27_214903_create_wallet_changes_table', 9),
(18, '2023_09_30_230009_create_transactions_table', 10),
(19, '2023_10_01_171432_add_smtp_to_settings_table', 11),
(20, '2023_10_02_213820_create_affiliate_histories_table', 12),
(22, '2023_10_07_183921_create_game_exclusives_table', 13),
(23, '2023_10_08_111755_add_fields_to_game_exclusives_table', 14),
(24, '2023_10_10_010619_create_soccer_categories_table', 15),
(25, '2023_10_10_010632_create_soccer_matches_table', 15),
(26, '2023_10_10_010641_create_soccer_bets_table', 15),
(27, '2023_10_11_144956_create_system_wallets_table', 16),
(31, '2023_10_12_185145_create_permission_tables', 18),
(30, '2023_10_12_183005_create_teams_table', 17),
(32, '2023_10_13_005036_add_is_admin_to_users_table', 19),
(33, '2023_10_16_103614_create_permission_tables', 20),
(34, '2023_10_17_105300_create_suit_pay_payments_table', 21),
(35, '2023_10_17_212504_create_notifications_table', 22),
(36, '2023_10_21_112530_create_bet_sections_table', 23),
(37, '2023_10_21_112532_create_bet_categories_table', 24),
(38, '2023_10_21_112826_create_bet_events_table', 25),
(39, '2023_10_21_112906_create_bet_users_table', 26),
(40, '2023_10_23_115759_add_auth_to_users_table', 27),
(41, '2023_10_25_132459_create_game_pragmatics_table', 28),
(42, '2023_10_25_140317_create_game_logs_table', 28),
(43, '2023_10_25_150440_create_jpg_table', 29),
(44, '2023_10_25_152044_create_sessions_table', 29);

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 27),
(1, 'App\\Models\\User', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('18439289-cc53-4e6a-9670-ff2492dbb3fd', 'App\\Notifications\\NewWithdrawalNotification', 'App\\Models\\User', 1, '{\"message\":\"Ol\\u00e1 Administrador, Foi solicitado um saque de R$500,00 , pelo usu\\u00e1rioAdmin\"}', NULL, '2023-12-18 20:20:04', '2023-12-18 20:20:04'),
('0cb219e4-247d-4fd4-aa6c-5572ce196ab4', 'App\\Notifications\\NewWithdrawalNotification', 'App\\Models\\User', 1, '{\"message\":\"Ol\\u00e1 Administrador, Foi solicitado um saque de R$300,00 , pelo usu\\u00e1rioAdmin\"}', NULL, '2023-12-21 14:38:43', '2023-12-21 14:38:43');

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `game` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_money` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `providers` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refunded` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `round_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(10033, 1, 'BoIkJmUwptYduyYe70H5', 'prwNzuvjoYgn9WUcGrDzqhQLCMcRVTel7okgbFTX', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 0.80, 'VGames', 0, 0, '0', '2023-12-17 17:25:29', '2023-12-17 17:25:29'),
(10034, 1, '52mEi0zrLSqgLVSD0tiL', 'UCyWhGPh9j8KNcRqPBDB4tSgJ0XmscToyR6QgKYk', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-17 17:25:34', '2023-12-17 17:25:34'),
(10035, 1, '7E9OFLqeQyMFNfN6jCml', 'SCNWPoV9SbCN9ckZ1FJXaN2tP81uABdCHqgFQMu3', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-17 17:25:42', '2023-12-17 17:25:42'),
(10036, 1, 'Z1Sk3WyqCj7DdZs7kfH6', 'PyTiSM3hmTubYCgLelH49zsgDnFPf9RjjFWjkw9H', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-17 17:25:45', '2023-12-17 17:25:45'),
(10037, 1, 'TIwMgeFa7w2Sku3lKfU6', 'KkVol1MPKukewt9HD1voFnNaPvgpAf7oKsxG3uY2', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-17 18:14:42', '2023-12-17 18:14:42'),
(10038, 1, 'OuAn9OsZdMpnlLMSvpUz', 'OVa8RG0W3RISaLUorVkqaOxws3NFAiNIarR1bmHi', 'Bikini Paradise', 'bikiniparadise', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-17 18:15:06', '2023-12-17 18:15:06'),
(10039, 1, 'pKSLi8XnnZeJXWlWNJ2y', 'MDpuba0c5MUpbk2NgQMl9aETsDvrUG61XDrNFx13', 'Bikini Paradise', 'bikiniparadise', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-17 18:15:18', '2023-12-17 18:15:18'),
(10040, 1, 'wBWtgI922Aj67uUfVqGE', 'sHjuaWMBi7zftYr7kgcf97CdvntihfJgqASvjIqg', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 3.00, 'VGames', 0, 0, '0', '2023-12-18 01:12:23', '2023-12-18 01:12:23'),
(10041, 1, '712NHShKXYAArjnpAwRt', '5xnIc7EkZuFPZA5uK3KN2UEzT1ajTcr7xyXa6GZj', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 3.00, 'VGames', 0, 0, '0', '2023-12-18 01:12:29', '2023-12-18 01:12:29'),
(10042, 1, 'Kl4DRCjUwVLwcWM1DWDK', 'GhC8w1kkvUwpBrikCyVeolWIE6wkXlqjRQvwD5fI', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 150.00, 'VGames', 0, 0, '0', '2023-12-18 01:12:37', '2023-12-18 01:12:37'),
(10043, 1, 'xTHGW3JxrpOtzHxoGNN2', 'TvfONnqUDBbK8G5LXramHthAKJ3lodCgVJKjsGh1', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:13:10', '2023-12-18 01:13:10'),
(10044, 1, 'xK6xDik6qbIGoraUXdgR', '6IUWTUMpJFLoMZj389t1grqusDOsWBgItYXqDJWn', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:13:14', '2023-12-18 01:13:14'),
(10045, 1, 'sJKSxRYc0LXDPZxVyfc2', 'iM6ldTBqVJ7DiX15GN7ZBmUh01X7WYfF8n2XU4jj', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 01:13:19', '2023-12-18 01:13:19'),
(10046, 1, '5Px2lnA6QRk1Q2agweuP', 'DXxTJBCgxAMjNzYaMeMllCYFSeq68ON62g6ILa5b', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:13:40', '2023-12-18 01:13:40'),
(10047, 1, '3V4wEmhIEdDD72e2KF5G', 'T0R2mR12w9gjienrbl4iNMHuF5IbnP3jVEhntlZh', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:13:43', '2023-12-18 01:13:43'),
(10048, 1, 'TTW5zZXICgx9LfVuSzql', 'oODcu3I5rR1TjBdsyCJ1AwNKLHSXCzvgRCyFclXs', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:13:47', '2023-12-18 01:13:47'),
(10049, 1, 'lZ2z6tUPtVDsZQ1MMvVh', 'Vd8M2Xmmxs0xKQSr5dmlezYtnI7z621RLjkSh6Xx', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:13:56', '2023-12-18 01:13:56'),
(10050, 1, 'yGXV8l74Xla2C73u9aOF', 'L5F9wSkZOJaoWbqR9Dstj9E84p8XbdL4H7xcawgU', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:03', '2023-12-18 01:14:03'),
(10051, 1, 'LzP3Suuv0cPc90LUW6IN', '2vET4WoJMDMVg7tJd2iZihXBfD9GtRah47bUuipz', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:07', '2023-12-18 01:14:07'),
(10052, 1, 'OETQKXysfKyWkek10lQh', 'RVLtSYyPLuEZ9OkskbC9P08YfQxrVf538KR92bIa', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 15.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:11', '2023-12-18 01:14:11'),
(10053, 1, 'r8MWcPDeiSwcdjUt6iEK', 'CWmbBrx7wfG37aqWMRBXSxyoOkqNPQYi87gvjhpl', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:16', '2023-12-18 01:14:16'),
(10054, 1, 'dogcU0i5efQ1PGXkGqcG', 'uUAGAP14iWLjv4vk6v2tajMoXBRC0N6VCZIfKMlY', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:20', '2023-12-18 01:14:20'),
(10055, 1, 'scMumnkXqdmT4xvobxKm', 'GjZvhcluwYWTfBhkKIhFKeB6Avt7BNrZWHHmWhFk', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:34', '2023-12-18 01:14:34'),
(10056, 1, 'VmMkyEnFpsQtkj9I5bbX', 'YESb8rkrRjoKxObC7G3a9Kv9S3pdLGdlIKLFqGrN', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:38', '2023-12-18 01:14:38'),
(10057, 1, 'hH4oSN4lbwjRBvgShZ79', '4oeqDd3baYOadLbwWztS1oyTq1B7k65SpPyyy9Uc', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:41', '2023-12-18 01:14:41'),
(10058, 1, '0gBPxdTCQucjvfz2LVuP', '0u2t2qvWj21ULD07xiCBBEx2he2HWdJ7P3A4BFmq', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:49', '2023-12-18 01:14:49'),
(10059, 1, 'ssgSE2GAxLeBFhCxpLhk', 'jibqrgXjucnzZ9Dl5e9MVgO8su9FlEXTs1NZgZuD', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 250.00, 'VGames', 0, 0, '0', '2023-12-18 01:14:52', '2023-12-18 01:14:52'),
(10060, 1, 'n7piTIy1sqSW5GWXGjMm', 'ZA6NIAtRUx31nKHWAfHLYKxcCBWkbFGKG6S1K2iM', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:15:06', '2023-12-18 01:15:06'),
(10061, 1, 'zGgbYpOWV4OcsStjZk9j', 'q5XMgIEe4tAWyNqQeFnS9AcN4MeZcvS6T7M8t2Mm', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 01:15:25', '2023-12-18 01:15:25'),
(10062, 1, 'tdtkfoSmAXnq06PXtThQ', 'RCMGIySslpgJc8NSVxwWT6rIEfxe9nZguA3DezhC', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 150.00, 'VGames', 0, 0, '0', '2023-12-18 01:16:09', '2023-12-18 01:16:09'),
(10063, 1, '7c7OuqVo0g4iRBhYeaVW', 'DcAly9Pe6Q6MCYkajgUB0iGZxd0ePLHDEJJIh3Id', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 1000.00, 'VGames', 0, 0, '0', '2023-12-18 01:16:15', '2023-12-18 01:16:15'),
(10064, 1, 'pCG7FXaEbFTVZQZqOkYN', 'IftRxzM0ObPP9tB8Arkjf80etEnw4ENAhYwdRwHe', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 150.00, 'VGames', 0, 0, '0', '2023-12-18 01:16:34', '2023-12-18 01:16:34'),
(10065, 1, '7T7iRjeb6DRgYX2pl3vC', 'ySFoOc1fzhKDETHm3RmkvgAyA1FM6AAOyOl29PVe', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 2500.00, 'VGames', 0, 0, '0', '2023-12-18 01:16:37', '2023-12-18 01:16:37'),
(10066, 1, 'ZrPbTig3yZkmdxrflXEQ', 'LkWiaBYZTqvNSQai73dyCn5YCfHxtiqUcS0DZHtA', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 01:17:08', '2023-12-18 01:17:08'),
(10067, 1, 'g4OAfmdkC4up9GmZCwVw', 'u5qiMBpi1B3VQwRy2r0QTjdW1MZStGeozeKyrzHA', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 50.00, 'VGames', 0, 0, '0', '2023-12-18 01:17:12', '2023-12-18 01:17:12'),
(10068, 1, 'Z3tw7uFxuh9AXryMUATz', 'BKe2tbkQuxjmmjGoe2pDnlMhLQHSYyxQCQLzNhqP', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 50.00, 'VGames', 0, 0, '0', '2023-12-18 01:17:16', '2023-12-18 01:17:16'),
(10069, 1, 'gMOIpBEB7FFF0LOWFoms', 'ozfW7S8tAliNfvcV60beTif2fJEKXzUbZH8FDM2f', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 2500.00, 'VGames', 0, 0, '0', '2023-12-18 01:17:19', '2023-12-18 01:17:19'),
(10070, 1, 'KoX2gzDDsxyOpPz8YSih', 'Z60vGBLr0RQZ15QUUIKElb8zXKp0NvCHYvmu0XNH', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:17:54', '2023-12-18 01:17:54'),
(10071, 1, 'kreXlcMtZyPnmM9DNkgn', '5bs6n4TS2Nh3ZRNtBxc9WeaGTsD57VLZGgut3ufv', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:18:00', '2023-12-18 01:18:00'),
(10072, 1, 'ADL2NjWnPfiJC2p4ogqC', '7O7vT8OkX62LZKR6X1wgykpTIqoMzDuDT0HRttBm', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:18:06', '2023-12-18 01:18:06'),
(10073, 1, 'xjWS94yOAeNAkaTtXnym', 'zsOcKrkKJ4kPcwEOfbU1kXjab0NBAVrwtSyh35a2', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:18:11', '2023-12-18 01:18:11'),
(10074, 1, 'BFsuda9oB0Dc68S5Iouv', '88Ix1zrB0KRlURKhKk5OLVjtRJxmeYkAX5DyW0tY', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:18:18', '2023-12-18 01:18:18'),
(10075, 1, 'NEFQd9DGsC1vbR0xavaQ', 'lm6lR44l94oM6Mpa9SMJLfFVhyo9T3pI0JKJ7z9l', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:18:24', '2023-12-18 01:18:24'),
(10076, 1, 'egKgDkSZqA16DnDopMdX', '8H8Lpah6v9f3UNofSkROGHBbSOnS0qwfRp7z1X4k', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:18:32', '2023-12-18 01:18:32'),
(10077, 1, 'zLiglbJ0oBNmNVHaxotk', 'GDmLsw57wJKOPE3Kzu1PmqxO5Pny4Tbsspr9Ke4h', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:18:37', '2023-12-18 01:18:37'),
(10078, 1, 'imhs5oTyIBcUjYNx2TD5', 'NCPJDNAcwn6PQ1EG0dOMcx5WXTnLTYkN1cGUPfMo', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:19:02', '2023-12-18 01:19:02'),
(10079, 1, 'bfmp61hgDnbeb71ce4xY', 'lcIfarRLM5fd0cxpTcELtAz96ifdfJiZy6McVFKW', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:19:07', '2023-12-18 01:19:07'),
(10080, 1, 'tHMi9dOmfk0esegWQMPc', 'MzZHayGdtRBAY1L2XV9K8smY0jFP60UwEoPvlPit', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:19:13', '2023-12-18 01:19:13'),
(10081, 1, 'Ar1YzMdksV7pGBBiOzL4', 'h4rycjcZTwU1pcTgK44b7bBKKj6F68ga4RDX6YLE', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:19:18', '2023-12-18 01:19:18'),
(10082, 1, 'VDt4bNIEH62Yqg3mgzxb', 'Am2RnyG4Z0ziKMt6iNLQypCsolP7XWI2ANqxuELh', 'Fortune OX', 'fortuneox', 'win', 'balance_bonus', 3.00, 'VGames', 0, 0, '0', '2023-12-18 01:19:23', '2023-12-18 01:19:23'),
(10083, 1, 'rmHKj3RzGsLeAAE5ynA7', 'edbQvG3ZdQfJu5DGYZrfKhbg8FDMOzQ4zl0Zj4Yp', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:19:29', '2023-12-18 01:19:29'),
(10084, 1, 'qSoqpGFzAYCJ2wx5FXb0', 'n95SzG9OQQKdxHwxXei1ZyOx6TBBx5k57D3xUJd2', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:19:34', '2023-12-18 01:19:34'),
(10085, 1, 'dVKg43coYSNPWNiZIwlV', 'NAno4WthlvD53N1ZOXGktKN7eUUZG2G1ke4jgeFq', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:19:39', '2023-12-18 01:19:39'),
(10086, 1, 'K7duLD280OZxCAzypnHt', '88L3OI1f8HkkdsQ0JSsVJMwqAiDIasC3P1mOkd10', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:19:44', '2023-12-18 01:19:44'),
(10087, 1, 'OKBwXO9PSRQMnfQ0Vkm3', 'AMclB5jNsDKXxVXLTMHIw7kOvERbMf7bwQfjchFa', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:00', '2023-12-18 01:20:00'),
(10088, 1, 'prkJmLpztxl5y9Mj82XG', 'qcQc0WXZpTbefzQdL3lMLnhQGPxpv007m66qMBYW', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:06', '2023-12-18 01:20:06'),
(10089, 1, 'vKYkbcSdciYt7HNYf9So', 'aU4nEVSUGR2QvgFhRYWvEPxLX7dbVE1EKniPz8jG', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:14', '2023-12-18 01:20:14'),
(10090, 1, 'D5RhUavKp4WB0ocNxS7b', 'r899KjJyhmTYBxgiHmABqjsAz1w0kU6dx2lJusoI', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:18', '2023-12-18 01:20:18'),
(10091, 1, 'KOdhkzQtXHv22XQpKnaN', '9kedzVQR1mBd9AeXXqdmAmh7qVxI9zxsiyzJgniu', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:21', '2023-12-18 01:20:21'),
(10092, 1, 'WCN4xQFDXB50WYUTspb1', '1HH6GR3A2afJt0e8NvDa5Yh3zAnFaG7S3ZoiTul4', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:24', '2023-12-18 01:20:24'),
(10093, 1, 'S5c5LGSA1cMrGU6VpLab', 'ZmZEWmiJFa9EG9WCwUkRa1ESjNo0loiLurCTLxud', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:28', '2023-12-18 01:20:28'),
(10094, 1, 'oiqe0PAVl40IQHOAFVXH', 'uZoWbDDWgJDvkDwsQnuugImG33u3gmWHLrRIBEEc', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:31', '2023-12-18 01:20:31'),
(10095, 1, 'AsuxlT1sH0EmBpwzh8wg', 'c5hCHvyZxBx5GDM2jLG9Yln1UVzu8xpls0S9DJ1P', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:35', '2023-12-18 01:20:35'),
(10096, 1, 'lrHwZZYI9oaLya1MmGgJ', 'O7dIx9C6NBbZcVx4qzU1RIyykWNMif2ISncRQjCn', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:38', '2023-12-18 01:20:38'),
(10097, 1, 'SvUlAr0Vb6lanPWvu8HL', 'lnrFqLGJ7x9VpdwprJuDl4rUG6N2jRdKepnMdZub', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:42', '2023-12-18 01:20:42'),
(10098, 1, 'RxG2GX9sDFVqvAdNn1Gi', 'LZlVlgtCHWBS1PGxt4NZuqL19GCQnWiuxrAWfPfA', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:45', '2023-12-18 01:20:45'),
(10099, 1, 'o9KTIMOi1lYQizb8qQRj', 'v1xlfci007NznALt1rvOEUE9unT0pIDKTbQgGWsd', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:48', '2023-12-18 01:20:48'),
(10100, 1, 'tdJkkAhLO5OHYlvFn0Vt', 'cz7MqWfaXkIsvJNg6jkqjuMVcxHv5AiS74AGBNYZ', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:51', '2023-12-18 01:20:51'),
(10101, 1, 'zDkQGcfRr5CtDAcwZqXD', 'qg9Az1mSszKyW2lIPosCxQTlTHIDVL0FP09LRgHx', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:56', '2023-12-18 01:20:56'),
(10102, 1, 'ylw9kEBZsiaBRZKQZwu0', 'IQ4iMOpR0f3kahzrWo2AYpsYhpqMRoR5QLDbBnfv', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:20:59', '2023-12-18 01:20:59'),
(10103, 1, '7S8gJTTNwTozlzvHETjs', 'ca5KRpsLWfDjR8IjdrOie7Qv3UivPKtJgVfG7gwx', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 01:22:23', '2023-12-18 01:22:23'),
(10104, 1, 'UIUh5nnE8ZmEG5K3K6m2', 'eWAi5KwyGjdEipXgSWPh9miHHQxspKczQ7MnLBIF', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:22:29', '2023-12-18 01:22:29'),
(10105, 1, '9BqfRvJpUra4oviBZFHA', 'KtYvhHePYjvT54TlUeVh7xva7IFXgSalsyKRfDJt', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 10.00, 'VGames', 0, 0, '0', '2023-12-18 01:22:33', '2023-12-18 01:22:33'),
(10106, 1, '5r60LhjKcbsUsUWwsxG7', '9oyCb0nh0RBmx92KIbtdiKqOSImfT4DCnUxcrlPY', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 01:22:37', '2023-12-18 01:22:37'),
(10107, 1, 'NnN8tL7IzuiU9naarZud', 'RauVy4bScu3iWvzADnLLPjn7cEihiaBSCRxgwJSg', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 3.00, 'VGames', 0, 0, '0', '2023-12-18 01:22:40', '2023-12-18 01:22:40'),
(10108, 1, '4OI58oXXbhKS9oYNnH9E', 'egVozy5okzM4zkjjNhqkbGSyXezktVkzLyIrB8zH', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 01:22:45', '2023-12-18 01:22:45'),
(10109, 1, '5y747LQNgN7KFXBhyXlr', 'Mj1R1WKS4APNPWsWsw6ku6aT5krQ4c56sVFNeR7V', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 01:22:49', '2023-12-18 01:22:49'),
(10110, 1, 'gaDy52znpO76oaUUcQdN', 'gryBGTJU5UAja3jvS9Sxfw9hGFdpZ2hKwB9G8nne', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 3.00, 'VGames', 0, 0, '0', '2023-12-18 01:23:00', '2023-12-18 01:23:00'),
(10111, 1, 'FK5DZfM6FzUjj17WjLaX', 'bB2hAoJsHtIkixwTvrwbvLRVDLkf6RlIZfCybcFm', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 15.00, 'VGames', 0, 0, '0', '2023-12-18 01:23:05', '2023-12-18 01:23:05'),
(10112, 1, 'mYUqL4K13AyUPu0xiSnH', '2DEwnQnLrXAQ6on5QSw0weLhGekGtlUSp3WDL83K', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 01:23:09', '2023-12-18 01:23:09'),
(10113, 1, 'bKwPYvmdgDQEFGWyr3dR', 'LkjoSnsAmnSXh8pMygs4CN3PFJnOZzBKwoZY496q', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 01:23:13', '2023-12-18 01:23:13'),
(10114, 1, 'oDQUapCfpkkq42SrTIOA', '5CAv8lQoXIvgcEXSnv0XodkYwAtL2f4xq7t2IJzC', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 15.00, 'VGames', 0, 0, '0', '2023-12-18 01:23:18', '2023-12-18 01:23:18'),
(10115, 1, 'lyUkOYdjwt9EQkv8Vjim', 'KAJ5fSudltJeQTWdlLaz2beJbo6js2Ku94cv5x96', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:23:22', '2023-12-18 01:23:22'),
(10116, 1, 'KmL61rW3Xpk0TA4Fnzuh', 'tXTm0mUimmijNaCMyGeZlSF8ZzViCoqcEjdQGvS4', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 01:23:25', '2023-12-18 01:23:25'),
(10117, 1, 'gjsjfap0tQglBQPHhP6K', 'TZosv0p8WIqoRc1uGxMnbnf6hxyWP4bsFOzIOxBb', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 15.00, 'VGames', 0, 0, '0', '2023-12-18 01:24:01', '2023-12-18 01:24:01'),
(10118, 1, 'yiByHMQpaQjJ22lyDFRv', 'upFZcbTjeY3zYrejVPsQ3pqWnVy0B1TIVmdH0zFM', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:24:06', '2023-12-18 01:24:06'),
(10119, 1, 'StpcZnlTZkry9M40cIhN', 'lVZQXUDluXEbh9P5sn579nwOq9wTSe7tL3ggG8EY', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:24:11', '2023-12-18 01:24:11'),
(10120, 1, 'P7BRCScjJe8rNMplmqMj', 'hWRwz9Tfdy6ATdkPkegfPJblNB0a87GhqDiT6C22', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 01:24:15', '2023-12-18 01:24:15'),
(10121, 1, '17kI4xUhPUpL502BGOl5', '2iGq5oixyIKilA47swPX41MacM5LBNueglTQfNmB', 'Fortune Rabbit', 'fortunerabbit', 'win', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 01:24:34', '2023-12-18 01:24:34'),
(10122, 1, 'LTFsiM4prZxwEwj5st02', 'APTkkY98bgj7FwlWNVwsKXYxZ7ddnonyDsJ1T1xa', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 5.00, 'VGames', 0, 0, '0', '2023-12-18 01:24:38', '2023-12-18 01:24:38'),
(10123, 1, 'pWKYpuQDMWcdVAnxB0kR', 'cfjtgHZ9PlrE52YWTHFXIQX0Yy0vHECkvi2UG5Nj', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 11:59:30', '2023-12-18 11:59:30'),
(10124, 1, 'P7qRxm19AmQoR6cZuUT4', 'JWiiSmJTubUCCz8RpysURoNDi7SFw6bUzqvAEIgh', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 1.20, 'VGames', 0, 0, '0', '2023-12-18 15:19:07', '2023-12-18 15:19:07'),
(10125, 1, 'KhSphIkBfNj1dOAvGFFW', 'BH3iUSHGJNkvNb2nqE3KSyIvyF81maXb9NeLk6CT', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 15:19:12', '2023-12-18 15:19:12'),
(10126, 1, 'QfiCWOKDlgU4WPUAhBZ2', 'p80wNiUfbXmmxT8o9SsGt7rRVg8m4uGE3W2IAX7F', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 40.00, 'VGames', 0, 0, '0', '2023-12-18 15:19:18', '2023-12-18 15:19:18'),
(10127, 1, 'YoVUAcJUqcKkPkvx215N', 'MTYbx1YO3toFOAUHdi84EtKztPgz7MUydA6E72Yr', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 15:23:03', '2023-12-18 15:23:03'),
(10128, 1, 'P4lquC1qGLfi3uYnraUK', 'b3qCq88rY0wCW94ybZWvFLNVVs03oc0ROzUxWkol', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 15:23:08', '2023-12-18 15:23:08'),
(10129, 1, 'UEtMVSB1xhKvDJ2ljk6F', 'sGa5DRiqHhFezLzb7NByKk2WqEGkFQHVyXzKBcHE', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 1.20, 'VGames', 0, 0, '0', '2023-12-18 15:23:14', '2023-12-18 15:23:14'),
(10130, 1, 'X17AAq2zzatoOXvfQMp3', 'uUmZCL2AoD4yXYBR7CNJlHHzk2gH0l3mwipWDfPw', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 2.00, 'VGames', 0, 0, '0', '2023-12-18 15:23:20', '2023-12-18 15:23:20'),
(10131, 1, 'HlluK4Aj82ZCoCuf8hnE', 'MQphTbf5SqCEQW9DnGsGsllYHc8brwxnNHyiGnbi', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 2.00, 'VGames', 0, 0, '0', '2023-12-18 15:23:26', '2023-12-18 15:23:26'),
(10132, 1, 'eKWvZ8i7N2ndU91wEmkS', 'nMvCLS2XoIlN7WeyPW1Kk3GPIGhcxjXsiERDFFVA', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 15:23:31', '2023-12-18 15:23:31'),
(10133, 1, 'NwJJw9HEJl4Wg0lbJvoZ', 'hdFJ1mfCHZDoX4tr3R5WEijcGI6FQW2YYwB3OMuR', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 2.00, 'VGames', 0, 0, '0', '2023-12-18 15:23:38', '2023-12-18 15:23:38'),
(10134, 1, 'yxicIlkEUphWlWUHHKBF', '2ucfXgFIsDAuXfW1CEEMHCoUqYRxQGto1HV25zuQ', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 15:23:44', '2023-12-18 15:23:44'),
(10135, 1, '7wkwhSzXABYw5RFec1sZ', 'xNRAidr1oAmWjyIIGsPzpfMk3c5VJBc4NisLCEYc', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 2.00, 'VGames', 0, 0, '0', '2023-12-18 15:23:50', '2023-12-18 15:23:50'),
(10136, 1, 'pu2tEN98NslS3VVANwV3', 'q9a6cipeJXOsi9Vp44Ixo76PVvPUhrssQOEkDbXT', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 2.00, 'VGames', 0, 0, '0', '2023-12-18 15:23:56', '2023-12-18 15:23:56'),
(10137, 1, 'eT4Pi7mQ8tTLo5iFM7IG', 'tYRnjLBviurVnJrIuW3TcACoZUyJpqoqnV2lYQvN', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 2.00, 'VGames', 0, 0, '0', '2023-12-18 15:24:01', '2023-12-18 15:24:01'),
(10138, 1, 'xeoAJDy234kSMaL5Q5df', 'U7lCV4UhI4JX2J3Xh5aMOjbirBLJX4lEmk8obRxG', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 2.00, 'VGames', 0, 0, '0', '2023-12-18 15:24:07', '2023-12-18 15:24:07'),
(10139, 1, 'nIzCOZBM5Z8PlNKSKKm8', 'BtmzEV0tTKNKoICHbj6L9O4yPTeWMGXe6jH25RxM', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 2.00, 'VGames', 0, 0, '0', '2023-12-18 15:24:12', '2023-12-18 15:24:12'),
(10140, 1, '7R2VpElMO3ElsFOYS2xQ', 'Fgc0yoofSfUUeqkbPa0HNJJP0BygMO6PAI2d22r3', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 15:24:18', '2023-12-18 15:24:18'),
(10141, 336, 'AhH5bUaCbSeGwD9PxZDz', 'uy0dejgIsuRADUnrxqeNZsOuskZBZrletmrDYdIZ', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:14:06', '2023-12-18 18:14:06'),
(10142, 336, 'KNGprCNw4DzYa83GL7Xk', 'hjSPgbgfXWMVyEPZKvFBUoYluTg4TDQzithC2CR2', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:14:09', '2023-12-18 18:14:09'),
(10143, 336, 'sD2qCGwGwzJAM1pSwHF7', '9I2LeTOivoyWKBkXDwGzRxGwRF7itzrFi8Oevvq3', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:14:16', '2023-12-18 18:14:16'),
(10144, 336, 'FMm6eW9BmiZgQdxFwxOg', 'm868IgqOeyJsc89QT054imFs2oNTETXsN9gFROik', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:14:30', '2023-12-18 18:14:30'),
(10145, 336, 'DkRFXmdw7bWvqEGleeSq', 'Rr4nZzjXsK1wIOl8IMvbgY8m49HmvuAiy0YaZ2Yb', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:14:35', '2023-12-18 18:14:35'),
(10146, 336, 'JKfD0Pj9zWTUL19ghvSi', 'xcHYzSCs2QqLtf2XRa6HYslPJWp34zbyZoFyitFz', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:14:40', '2023-12-18 18:14:40'),
(10147, 336, 'g1ZFUftjaTFSrFrQxWco', 'gmSzoSDxTodfAvWRQ1d01PXUwWiiodM8MA2YhZrL', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:14:45', '2023-12-18 18:14:45'),
(10148, 336, '5yRN0exM1umpH6NA3aJa', 'HA1PbLlYngD1NThJNp5TuL8VWyKJxBcrRUMptuAB', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:14:51', '2023-12-18 18:14:51'),
(10149, 336, '2J3UeHw7TlBCE0wvwrkL', 'SMNQTxjf2TfSVncRblwu6IucDGD2bVt10Azlzo2v', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:14:56', '2023-12-18 18:14:56'),
(10150, 336, '5QfETnJDvbaMFjwfQh8c', 'u8Z7GUDLf43PadTMnI5zsAMCTZpgH1YomuPtaSOZ', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:15:01', '2023-12-18 18:15:01'),
(10151, 336, 'ZGy5aLQA2HS71EYDT5dm', '1YoC60y1fmAmcx59gEsX6cGbpWuKmsRmutDWMSNP', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:15:06', '2023-12-18 18:15:06'),
(10152, 336, 'eDAbB9FuQ9d0cLWDFKNs', 'xegaAmoO4LPAzSVE4Iq7B8hnqZKECQjB8vcVGLi8', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:15:11', '2023-12-18 18:15:11'),
(10153, 336, 'NIet8JcqRaEqwq1FqfmV', '8ymX2JuGYowPM8pmm9bgMKSBdSWiPuNGAHOjvrFE', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 500.00, 'VGames', 0, 0, '0', '2023-12-18 18:15:16', '2023-12-18 18:15:16'),
(10154, 336, 'Kar0FAqalXVUjyjIgCAl', 'mSbpnNC7P9ZabgHxZmmcA14GX5tdc781ZXO5ROqc', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:18:50', '2023-12-18 18:18:50'),
(10155, 336, 'pqF9mOJtYn2bPb0XBN3B', 'gkVptnWRzLp8WSTx8EUZBqNWNDrR26ArXfeiSe61', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:18:53', '2023-12-18 18:18:53'),
(10156, 336, 'QfIgNpc4qvZ46iNwdKYb', 'hHBB0sI3QRJBu2AUIHEe7RFPnoVhwt0pY6zuTuvl', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:18:56', '2023-12-18 18:18:56'),
(10157, 336, 'wlTk5bPZIuSjFFWQnP50', 'oLP571cagKerXytjOEznG1aUjXrVsA2RR7i7LuPo', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:18:59', '2023-12-18 18:18:59'),
(10158, 336, 'GQIHKpnPU93uNgpFYhN6', 'PatK8dUYgJCG6vT2H9VWB437sRLOP01QcAc5OEDy', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:02', '2023-12-18 18:19:02'),
(10159, 336, 'eI30ATJHCzWquYr2D6wj', 'py3egnUGl7K5z4jeyozsFPhLmrGzioNnOckY5y9u', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:05', '2023-12-18 18:19:05'),
(10160, 336, 'c731jwwNVo29a7Gf5aOo', 'tn9XVNqsup6SZHfKBUPuuAutvV6v6XaPge2zd1io', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:09', '2023-12-18 18:19:09'),
(10161, 336, 'fKwnj9Tm06o8QRP9ZoCf', 'AFw2k0YBxmi6PEaJTs6GPIZFOZMzZvQdt2gGdqhX', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:12', '2023-12-18 18:19:12'),
(10162, 336, 'czm9z4Yx2ZsudTUJv6E0', 'gmHnVF3RjAWa8Be39MTL0VM9OOBkmomHT1xZCdM0', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:15', '2023-12-18 18:19:15'),
(10163, 336, 'tb1ErUoaWUy0B9lVV4tW', '5zav5BSBSmHd9XDYeXuQbaZMgLCgCEqmDaNxYlgp', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 400.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:18', '2023-12-18 18:19:18'),
(10164, 336, 'eIsag98mjav6KUcgJyxo', 'ic3zX4BPha4Jp08Kb6nCBeOzfKJkLPhAxZgkABHC', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:30', '2023-12-18 18:19:30'),
(10165, 336, 'CFZTXOsIAUWO31eYWKnD', 'nptuDwnKatKOOwvzBGdPvqFWvGp7vY2n7X6zR6Iz', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:33', '2023-12-18 18:19:33'),
(10166, 336, 'zJhRISTNYKYF1xZKkV7Z', '7hjOQz65H7gTQEig5uooSfWudL0VxTrP6xLetZQl', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:37', '2023-12-18 18:19:37'),
(10167, 336, 'UWYgmG7onsSbrmmjgkPE', '2tgEOIxiHZkh1sXHZdpQkRAXuLd61YcxD4I0wJjj', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:40', '2023-12-18 18:19:40'),
(10168, 336, '3YaPZcv6EUKHGA6OmoGT', '6ZvlC2lqaW6iLM7JLJG8DJmtuyx1e6BdW3Nm45zL', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 12.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:43', '2023-12-18 18:19:43'),
(10169, 336, 'RfF8jEJTw3i7CMPLjhP2', 'qJ8S5eZ9OXEuFOINingOw3wY9ZKIjmmvQVOUjgD7', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:46', '2023-12-18 18:19:46'),
(10170, 336, 'Zn6oUwJbkL7ROA9vW2a8', 'sEP5CMNYlKDzDzQIoIzRmJIutPOs9xuNkhVPWNNh', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:49', '2023-12-18 18:19:49'),
(10171, 336, 'ksurrqwwGp2UHW89LmsS', '9Qf3LGhsURqqkivTdFvTQOjnAMrNzrDWlmNtWhgb', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:52', '2023-12-18 18:19:52'),
(10172, 336, 'QjvJHJuEl4fEUcCfOUsU', 'RPDJb1zRprSn0WoGXqkA23fqUEOQLxqPdyfbjM1E', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:55', '2023-12-18 18:19:55'),
(10173, 336, '8VEog3khCBp1HnNKVK4O', 'SJsvcoumxozAWwnlA1yJnTHlgDRbrg1QIlmabZ5X', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:19:59', '2023-12-18 18:19:59'),
(10174, 336, '6Df0qqOX1MFPDcuy1yFq', '2uvWmHd3X3AegXS1mI7vIq9HDihZZpSZ6NIIjDcr', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:02', '2023-12-18 18:20:02'),
(10175, 336, 'JOLlHHp2DOE8ivmSTRUN', 'nFQjRrQrLXhTAjO5OiQyJc3cq3i9JVv2iyUDU5u4', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:05', '2023-12-18 18:20:05'),
(10176, 336, 'nSqZMVwXaZpz8VZEjAD1', 'ozIbQw17w944S6FZSqQlqNmclLlE3dl7mPYHPm2q', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:08', '2023-12-18 18:20:08'),
(10177, 336, 'FGEwKVwIeGu1RTG2ypLF', 'tmcKjxm8xkAEL23GErTs0vO0DXNKZNyxrfNDNrkY', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:11', '2023-12-18 18:20:11'),
(10178, 336, 'ECOQ9ro9hKXtz8LUIsdJ', '7T3Zmf0v9cN6Cy0KnQ0ml35boGN5iO93bzwDBOFE', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:14', '2023-12-18 18:20:14'),
(10179, 336, 'DczaOXBkNYMo7N8rUejV', 'hqsDlaJ74y2Dw5Zf1VQhONSpPCUD44mOsUWzWmHY', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:18', '2023-12-18 18:20:18'),
(10180, 336, 'NZCZO9Kter6bNaiZHA2D', 'PEyEzWV2v2XLolhmtJAwu7mD2HO7oYBlVrqY7iHs', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:21', '2023-12-18 18:20:21'),
(10181, 336, '8Yh2Qizc7Rd9cZezXcRC', 'T8oStReK7r7Bu0mbMmqT6V7pyWY56PyNFMfS4iwJ', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:24', '2023-12-18 18:20:24'),
(10182, 336, 'v0UXJqgZsrUtXwjbJ6yG', '8rob8TKZ23tZl9cWrnfRyLRjeKmU70EUN0KDEWVS', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:27', '2023-12-18 18:20:27'),
(10183, 336, 'fLwPGhmCBWjsj7PsgKbZ', '3KWUV2otMjj8TXhAxpJC0OrPRSgnpFxWsaE060HY', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:30', '2023-12-18 18:20:30'),
(10184, 336, 'Qe7ObuC81JyxZ8BlvQw1', 'soVsiqyKH4prtTEKcLNdK5jUCP6mdNu6Q1kBrAhh', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:33', '2023-12-18 18:20:33'),
(10185, 336, '9uIxFieYJuKvxIhHYY1x', 'JeZnuk6DmPrAAIJAwMKWXAlVgIaQGKfGtGhnJm8B', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:36', '2023-12-18 18:20:36'),
(10186, 336, 'xyvBUk7M3quMxtbzEqX7', 'ebzc9beTZPowD99Oa8JJXaQD8gsf8sRF0OQlyTG2', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:40', '2023-12-18 18:20:40'),
(10187, 336, 'YvVLcPrCiG6vefh73KMI', 'fhQymsWiE3y1Ugcdttwbzyl0b7k2lXbeJpWyMQiM', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:43', '2023-12-18 18:20:43'),
(10188, 336, 'c5ebpkq2rUyq56hMGlad', 'qF6EUbdKQVQhqix9W85mVCQGPCH2PZuP3fyKntDj', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:46', '2023-12-18 18:20:46'),
(10189, 336, 'PyDze3gqcBshJ4qWhZ4E', 'bajRJbl3b0VE8YZ6L9viBAnNGiUwIBFjR2BS6gMS', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:49', '2023-12-18 18:20:49'),
(10190, 336, 'uFmyOOzaSRqQVOP5ISPn', 'sgwtnXctWquLQynPCQ3O7d9HAt3f5meDCORLEobd', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 60.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:52', '2023-12-18 18:20:52'),
(10191, 336, 'ihJWtXAgUBfzV1vBwEkZ', 'cdRwxL3LPTCtiCzOfPsnuUlzB87lBiVc5MD9AQ7I', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:55', '2023-12-18 18:20:55'),
(10192, 336, 'M7YsEmHyCk1VuwWWzrBb', 'F5M9SsuPgvAPaCiIqTC0qTRkhykLm717gpj74FMw', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:20:59', '2023-12-18 18:20:59'),
(10193, 336, 'fpoIlwPu9kkqEj3Ti7Qk', 'GWouNelbkyLMCeqlnNfZvENvf7xcMwKccz6VqUmY', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:02', '2023-12-18 18:21:02'),
(10194, 336, 'NC5nVfdwm1cq0hui25EO', 'cYvRxozOgEvj4BdjtluMrOWbtAzfLq5VbLsmyJCB', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:05', '2023-12-18 18:21:05'),
(10195, 336, 'PWCaG7KA9xEXRwJxqV3l', '7WwbaRF4djg9u7Y25nsCqKZSjJDE2794FuaLWi9F', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:08', '2023-12-18 18:21:08'),
(10196, 336, 'oq1ukEsNgYknzXMRiTzZ', 'vXBOGVduw7muxxVkZd8kLTi5AGhI7OdGOdfzgNYe', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:11', '2023-12-18 18:21:11'),
(10197, 336, 'DEPCcQZV7GTPbiwWnNne', '0mZPbEtWlxhsuEM18kW8PcTnPB8oGXttW7ptWXk8', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:14', '2023-12-18 18:21:14'),
(10198, 336, 'l8Umvyc8yAmOLNE3JERz', 'B0nTZ9crfaBmRYzb2XSQifPuTHQsLvBpkC1WhqQ5', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:17', '2023-12-18 18:21:17'),
(10199, 336, 'ICis1sSeI6oDll0Q50xF', 'DtegOjie7668ztZ1NJhtGCKuH7dL20DDdX2o7Pl1', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:21', '2023-12-18 18:21:21'),
(10200, 336, 'h8RKSlfElo0fqOTMpM1n', 'IsZQWqamqp3mzQf4Pdx6FkApA3wkWoUMMSfXGhVM', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:24', '2023-12-18 18:21:24'),
(10201, 336, 'VXOixm9UtajNA23UaXGE', 'C4g8F1njl66nZxnfWgCRAPMRGUFZX78NPMF9fbc9', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:27', '2023-12-18 18:21:27'),
(10202, 336, 'sV6d4etH7YsVZBDM7I2E', 'q0faFptSWMlEpHGE1RfoACHILm50YykF7zEsasan', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:30', '2023-12-18 18:21:30'),
(10203, 336, 'tqoyxH39D9tfciekVhwi', 'UJgUvSCL6irm4DaTKy9tNhafFvEEDO2TIQtqJ1BW', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:33', '2023-12-18 18:21:33'),
(10204, 336, 's08o89gbmbew16MoZnaN', 'r9Gu6KqwLORRXZBBB45WH995PDobJUDDGj1DXqyl', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:21:36', '2023-12-18 18:21:36'),
(10205, 336, 'vVgdwV5TumXy6bohRoph', 'HWGzx0dmPYSjW5kx1JgWN69IpH8cs08hRmpNWEi5', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:05', '2023-12-18 18:23:05'),
(10206, 336, '6YCh7JIwOIg8xNprpXFI', 'YiQv7bk6YC0oWa2Ecq06R1df9QKr6iX5kkfr7IXr', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:11', '2023-12-18 18:23:11'),
(10207, 336, 'ABioDULz9AeZ0AlvdyHW', 'NgaOSWwHhTyTmz6KQyl7amVefahdiedKCcEJbj2Q', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:14', '2023-12-18 18:23:14'),
(10208, 336, 'sZQJTRnhYWfs03t4eXNd', 'A68n0kbv8BDBbexoeYG4ywzFqxQPT9sMb6PaTBaI', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:17', '2023-12-18 18:23:17'),
(10209, 336, 'Dl66hNZrGNYzoqZoF0bn', 'hqjKIV7CjP9Sf8zzKoM5k2fNG6EElbRR4gMkbVeD', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:20', '2023-12-18 18:23:20'),
(10210, 336, 'uT4pmAj4IHgxIya9HBnR', 'zXb30NFpF243j3i0JUPXPXt2DVWA8bZtBPc7rhRS', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:23', '2023-12-18 18:23:23'),
(10211, 336, 'UyWstOgPKASJZSTW3onm', 'qNUAOXC3pPq5ncyU5VqKHRgKDXGX6deAkzvGD2fk', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:26', '2023-12-18 18:23:26'),
(10212, 336, 'MnJdC02yOoQjplIcO500', 'FeAoUtvzdUO1G9TlOfE7UHE4DkOjTgHu5cwjvx4E', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:30', '2023-12-18 18:23:30'),
(10213, 336, 'erDRxSIoBg68wfqZuEaO', 'ga4tf2xmD1NhHOyXKxDX1p8ZPeQBw9icZSBhpzBq', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:33', '2023-12-18 18:23:33'),
(10214, 336, 'xLOFSbwfxR7oSwX2i6bG', 'j3HvptGizoJP7PFIT9BVqQuYYwCNNagokQ6quCjW', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:36', '2023-12-18 18:23:36'),
(10215, 336, '6ysIjjP7xYkOFLiaHwKR', '7WfK46CqoOUqYWU3R6ZleY6SlrRpDxRHWU3Qq9wO', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:39', '2023-12-18 18:23:39'),
(10216, 336, 'nAUlXYZxqMILTQlcWYxC', 'A6X4bZf4zv1oi18qrA9sBPrKt10Yg9fUQFz06q4D', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:42', '2023-12-18 18:23:42'),
(10217, 336, '8xTGPqOgdoGn1ZTnbPxn', '0wGQK1D3JpRUobX1kNRlId0KFAIKlz7rIlurFJXD', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:45', '2023-12-18 18:23:45'),
(10218, 336, 'LaHc79ZMHwVtFbqdPX49', '9VSXw73ew5wEearlurdLsq92Se9ezAQC5pHp0F6T', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:49', '2023-12-18 18:23:49'),
(10219, 336, 'vVG54kj0BGyRtO8IiIKY', 'bUMHTKpr0zDHqcxiJoMu9kylAglRSItY1raMNpbc', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:52', '2023-12-18 18:23:52'),
(10220, 336, 'MjRCEwUb56UwnZh3nnI3', 'utaaEGReQFk36qUHRC9rMRsgNDOpwCk5PLkxK2LT', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 300.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:55', '2023-12-18 18:23:55'),
(10221, 336, 'MXuYHZzqf9TXu5Wx3Rqn', 'zLyJ0aWlqQDaPAKp1TwaIf2pclLlqWIa5hLoC3CM', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:23:59', '2023-12-18 18:23:59'),
(10222, 336, '6rJMluep3G9mkRI2uoEA', 'wRyK2reRAX0wM2I6qqNXh6yc56AIn13i0ShdsE5Y', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:02', '2023-12-18 18:24:02'),
(10223, 336, 'tNr7eGCIdCJuoerrQP0f', 'IiNLgo43WIlfAi5AqP4qNTUnFz8yQsAc95FE8yuU', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:05', '2023-12-18 18:24:05'),
(10224, 336, 'Og1kIliuMbKLfqlvnbUm', 'IX1H0aL7J1RHsu5xR5xrhboQJ8zlLEWky3Eunww9', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:08', '2023-12-18 18:24:08'),
(10225, 336, 'MJ26VuLHJOy7AYKQY6le', 'uidxXxzUV0lfWEZpxOjri94akK0aHJfnZPcE2dKY', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:11', '2023-12-18 18:24:11'),
(10226, 336, 'SOd5n7rDDLZyBKcSPwOM', '4iUH35aQ6IgZLeorNXo0mxWSv6JzXrEzq4JNJBaI', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:14', '2023-12-18 18:24:14'),
(10227, 336, 'ufvJrjRPABHcDwAvzGNt', 'NoCmOoeNN3rhP1DcRNST92uaMpitIgCDpTqASmXZ', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:18', '2023-12-18 18:24:18'),
(10228, 336, 'S9PuDf2Cc1pgvy8hJHH5', 'M9fPvewDYbLhDbcDxj28GP1UUwoGBOXJWyaCxsIA', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:21', '2023-12-18 18:24:21'),
(10229, 336, 'LjxW93HpAjMkFvMqpF88', 'WRBUDlHcXLSYeuJlcaGVe9phPSsiv2kDCPn2dkwV', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:24', '2023-12-18 18:24:24'),
(10230, 336, '0YLBNLB9BdHEPEmoDmZs', 'w9T8Z3JOlJtRKlvmuT8jY3wfmKLmmDOTL50oZOxE', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:27', '2023-12-18 18:24:27'),
(10231, 336, 'GTuUVGlTSrd64sMw940d', 'H9gq28Q1SlIG6bsXIqDgwCFcv7qscB7QJCTontcZ', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:30', '2023-12-18 18:24:30'),
(10232, 336, 'hFr0mGKiBUqkSHlAM4AE', '3u61NoBeyM6k2MLwlD693Kj5AASULcXQ0Amu50lL', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:33', '2023-12-18 18:24:33'),
(10233, 336, 'uvVithJZVIlchiqcX0YF', '33tv05wXfTSeANDIXoUVRmbEFZ7IGUeSpMTSE7nV', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:36', '2023-12-18 18:24:36'),
(10234, 336, 'ITtzCEmwKWhSIFvUTy4r', 'DVVri65NqbTG8BHMooWK3hJD4IMTLql328F15AcE', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 18:24:47', '2023-12-18 18:24:47'),
(10235, 1, 'F7V5b6SKNsZYygl0pnTM', 'ojl7KJKCqaszm2jGYtT6W4Tai7iSXIpFeyIHVFSW', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 3.00, 'VGames', 0, 0, '0', '2023-12-18 18:40:50', '2023-12-18 18:40:50'),
(10236, 1, 'LjNe2qYbLHcAOyr3NmIl', '3oJBLn4sn0WQfiYChiAB7nOKkkLrknsTfuc9gdwf', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 50.00, 'VGames', 0, 0, '0', '2023-12-18 18:40:57', '2023-12-18 18:40:57'),
(10237, 1, '6w2SqpYEqVQbygaLoiiW', 'VnF2pFmRlxUvoaCD5Ascg8S3fHmwTfepkOZdHnvv', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 18:41:15', '2023-12-18 18:41:15'),
(10238, 1, 'V04zx1QVj9mPgbPib93r', 'd85wWPFVhZrMIpqimqfvYDea4eSJMsUoJnE98OT9', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 18:41:23', '2023-12-18 18:41:23'),
(10239, 1, 'H2qYf2ae4sv2PthcZtYW', 'tmya9dBSso6cVQiX4Rx0jaJUYcShhmt9OXYZPsin', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:41:28', '2023-12-18 18:41:28'),
(10240, 1, 'V48gYJWYBtA2kIAT6b5s', 'FPLldR764UYELeJApkFuVRwNZKO58YZmKg9w3al8', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 18:42:18', '2023-12-18 18:42:18'),
(10241, 1, 'vxPmnzYZp2wkl2ThJg2v', 'rtxRAPExShHCHNdpmVe1UsgfTF8E0mY0A9UtopJV', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 18:42:23', '2023-12-18 18:42:23'),
(10242, 1, 'h2NKPMUuuXpi0oUNQ0Ee', 'iwYuqXtpxPqmmiJCnVp5c9x53Girwwm3BbnknA8x', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 18:42:28', '2023-12-18 18:42:28'),
(10243, 1, 'saQsCxqdCboETULzLe3V', 'xzeKjQfaeeOgIGDAc0Fmms6PSrLQFNUundTVktWK', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 18:42:33', '2023-12-18 18:42:33'),
(10244, 1, 'xMpoaX7JDa4qUTHxT2nd', 'nav1U8tE7Vd8tRWs3XKsLT5DlcClhnBQaMTutavn', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 18:42:38', '2023-12-18 18:42:38'),
(10245, 1, 'paDvWkGNuCcOJeYjXa69', '0vviQXKMd3uDLbPYvAv9hmxYdf0xLQYiOduRGQur', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-18 18:42:43', '2023-12-18 18:42:43'),
(10246, 1, 'aMlPeo2ngOkEeEFWt0Tl', 'z284b8bkdjH5xf7g6dlpSbGzPVcy8LRF8DmRlVYU', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:18:05', '2023-12-18 19:18:05'),
(10247, 1, 'LafDTwJkATTDmjph1PRZ', 'lBIzOcYj6KxpL7vbeSDiEx2D87DtIo8EOXWKitpK', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:35:00', '2023-12-18 19:35:00'),
(10248, 1, 'Ob4cD2S3m5Oc3Et6Hepi', 'MBNJkjWKIFsbWbhQz5VUXJRYrC0218lOcawwxi58', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:35:16', '2023-12-18 19:35:16'),
(10249, 1, '8085z66DLQrS2sANSSlQ', 'S4k0AxGOCRa2FLyaZ3kOacJIBxxUrkeiz1GP3rB2', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:36:04', '2023-12-18 19:36:04'),
(10250, 1, 'U0IoSxSEsi7QohIbOJ0g', '2Stnpf3cx1gEJ16KpLtmT7xL7EI4tNCidCKyFhaQ', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:36:10', '2023-12-18 19:36:10'),
(10251, 1, 'lGnutNeSltXAhoI5zwjX', 'brqiLfsNQcrht8DhpnVq8ge3Y5dzeS2UAuavDi6a', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:36:19', '2023-12-18 19:36:19'),
(10252, 1, 'yyP75D7X96zBnQcl80Cb', '0QngCxH0vlmNwl97ekA6fjDj5KhuGqXCyxDMKKe5', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:36:22', '2023-12-18 19:36:22'),
(10253, 1, 'pyecfLrVNfrUrTX0bwyp', 'BirlsuCXqGF5jFwaaN76GVeB010HkJej2IsZ8L9y', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:36:25', '2023-12-18 19:36:25'),
(10254, 1, 'G3lkwEKWi0UFsMOvGC8I', 'ZckSDZZy88wA6qVZvcG3ErGw86GzI1XS5XpRGFEe', 'Fortune Rabbit', 'fortunerabbit', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:36:29', '2023-12-18 19:36:29'),
(10255, 1, 'nHtMwj2DrQmDxKWQokGw', 'Yfhab79jkZUx0O9NFns7V79JA5rhZzKwGv3sLYwJ', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:57:58', '2023-12-18 19:57:58'),
(10256, 1, 'D1z8rpD4fQkLm0G4359b', 'yvn5LICwC3vL3YIOjpo1fwZCVwQRWXozSND52Uzo', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 19:58:04', '2023-12-18 19:58:04'),
(10257, 1, 'X8w41laLs6r508CTAEzd', 'd9XsescSNF8xVHIjsop9Mv2nPx1fwsH4aj9xM1fZ', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 50.00, 'VGames', 0, 0, '0', '2023-12-18 19:58:09', '2023-12-18 19:58:09'),
(10258, 1, 'EUDQgekcpmEoIOMM3h1C', '8Kghi1Fjy6y6wIp0Ck5IS8AKc1aC0sMhF91s223p', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 180.00, 'VGames', 0, 0, '0', '2023-12-18 19:58:36', '2023-12-18 19:58:36'),
(10259, 1, '1ROvHNn7kiu2SjwfANeN', 'hHJN7N9J2QvVnICJ3Q5cIwAZ1TLpExzHP6UmrFSh', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 19:58:40', '2023-12-18 19:58:40'),
(10260, 1, 'qZKRCLobELbezrptoyyt', 'EPTdpjcoZ1zvYfiT7t6JEgHBxPwBhb02qJeIhvk6', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 19:58:44', '2023-12-18 19:58:44'),
(10261, 1, 'NqXTTKRIvJ4ciBCWic4R', 'wKCGdTeZFn81JN4UEkQ4jafgwoZvxcmpdIGAm5sm', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 90.00, 'VGames', 0, 0, '0', '2023-12-18 19:58:47', '2023-12-18 19:58:47'),
(10262, 1, 'p4y0CULZNVvVd3lUIYwr', 'v9qWad1did5PDwngue9qtEtgCTOFhiOFLLSb1qmn', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 300.00, 'VGames', 0, 0, '0', '2023-12-18 19:58:50', '2023-12-18 19:58:50'),
(10263, 1, 'Gc7TZCsrq7XBDpxnNWTn', 'mcRg9jrkRSGE332mdGsIbK1l2ZPxlOs1VWo166X5', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 90.00, 'VGames', 0, 0, '0', '2023-12-18 19:58:54', '2023-12-18 19:58:54'),
(10264, 1, '9PmLBJDOqUmUtgnD5Q66', 'OjXMFGrXIdWNxjmrDo4Hxg329hBg4gqHxxzbcBdM', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 180.00, 'VGames', 0, 0, '0', '2023-12-18 19:58:58', '2023-12-18 19:58:58'),
(10265, 1, 'Y6CBcDkEp6O53W31kHhB', '4WCDxdpFOWdhjTuhra7jnLLAPfvspk0ONzGQiqJo', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 24.00, 'VGames', 0, 0, '0', '2023-12-18 19:59:01', '2023-12-18 19:59:01'),
(10266, 1, 'pcznf0r2vs5eqe40BSFz', '4kjnUnknQKMBU2MIvOROpzoRlUVuoCedQU7WeWvk', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 300.00, 'VGames', 0, 0, '0', '2023-12-18 19:59:08', '2023-12-18 19:59:08'),
(10267, 1, 'cEJKlwaT9c31HgkBtANb', 'ChKiKpI7HlZQAKVN2JI1IvS0IRhZ93yeVnZ0kQaE', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 90.00, 'VGames', 0, 0, '0', '2023-12-18 19:59:11', '2023-12-18 19:59:11'),
(10268, 1, 'TFzORZo4uJfBCWARbqTS', 'H2Dmbt1SyGuRAlcDAvWdNBWJ8b92LoO2AwBfOgnm', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 19:59:14', '2023-12-18 19:59:14');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(10269, 1, 'ThhB5LsEgheiTgMXegQ3', 'cj43LfnS6BPIHwaLAS61vPt8g5ppLOVUSWaDRris', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 19:59:17', '2023-12-18 19:59:17'),
(10270, 1, 'FDlFUVDvr6LwyzpD3vcG', 'FmAUZxaKJqWc44cReiumK8q7hxgYioTvG2F7xnS0', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 19:59:21', '2023-12-18 19:59:21'),
(10271, 1, 'uncr5TufNcMkPoiz0Iwh', 'EQ8X5lrhBgyOxB9ZbSYU9AAOQLhS59oUBlHz0n4B', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 19:59:24', '2023-12-18 19:59:24'),
(10272, 1, 'DSNtTWQNMXeYtPd0eYPH', 'MjSfm5IuPPbKhNHHwDQDnsff7KREBCkhxnckzAJX', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 19:59:27', '2023-12-18 19:59:27'),
(10273, 1, 'eb86x5fRFTzb9UPUirk7', '0sBz8cPppbAEJPsHdKxGdeecUx1ZOvGjEDXGOlva', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 180.00, 'VGames', 0, 0, '0', '2023-12-18 19:59:31', '2023-12-18 19:59:31'),
(10274, 1, 'XjdFE0h1qT7s0uMAUKO2', 'vljYtH2CD0B6wJRUCdCO9zQvcU05EwlU4m3gSbef', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:01:38', '2023-12-18 20:01:38'),
(10275, 1, '9GueTKvbDx7wB3DPSIHb', 'kFNRV9OsX67QALSq0zbSxLQzaNmsQz3ce8HrP0eg', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 180.00, 'VGames', 0, 0, '0', '2023-12-18 20:01:44', '2023-12-18 20:01:44'),
(10276, 1, 'NDRRGsfo0lbyDTgDim3J', '5hp6Ia8cIncJXrYM9Zy1zv3HPZmjdUH180DOctq3', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 180.00, 'VGames', 0, 0, '0', '2023-12-18 20:01:50', '2023-12-18 20:01:50'),
(10277, 1, 'm7qEoL9L2CRyEYJqxACq', 'nzSyLNo1VxlU9SUfLgMApRwSL9sPF5MITtkCfGRn', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:01:56', '2023-12-18 20:01:56'),
(10278, 1, 'JNAN6651INyBeZKxZTlk', 'AQhD6JKf8dWY7ElCCJZjyG8FWepzRFB0X0tfsFNI', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:02:02', '2023-12-18 20:02:02'),
(10279, 1, 'dOoplDWNnQks2msM2iSj', 'PexdPLCQPzhI6fDuBjuSypTKigXOL9uROy8bSkBp', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:02:08', '2023-12-18 20:02:08'),
(10280, 1, 'lOAXtVFoaNfHHyPcG0Q2', '8nWzyEG9gmvsHtZ9hvf8pNQX1aqTrglV2dGyYUN0', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:02:14', '2023-12-18 20:02:14'),
(10281, 1, 'EgU7Gc4f4tnpxgs34kod', 'CbLaSrEESTnOuAkinOQrmsS2usYv22SKBzQuwrX9', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:02:19', '2023-12-18 20:02:19'),
(10282, 1, 'EZTHRbO8bE4k32k7RE2Z', 'WraT72Nj7cApw8jB5Pa2h9QwrH6YWVj2YMQGAKKC', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:02:25', '2023-12-18 20:02:25'),
(10283, 1, 'z4UiUqmDD6IKWSZdctye', 'ubL4rO6UCKQhQcVAPBCkdylfv4bneEV3MSnsrn18', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 180.00, 'VGames', 0, 0, '0', '2023-12-18 20:02:31', '2023-12-18 20:02:31'),
(10284, 1, 'AL7wixPIG9IsiKe5QK1w', 'fGWQG4SOXZkWe1k2k0Tb9mt7nXxiCG36t3ZBeDac', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 24.00, 'VGames', 0, 0, '0', '2023-12-18 20:02:58', '2023-12-18 20:02:58'),
(10285, 1, 'vo3786jRTPb1kFCb4nny', 'kPOjvMELbmGNu46GhlARApuvVoh7CxPWyDtzQmWr', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:03:04', '2023-12-18 20:03:04'),
(10286, 1, 'qwQF087pG0ug0rps8ltZ', '0UUwkRZV6VQBexQf0ahh0DJGPuaSgLn3NuFwon7E', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 1500.00, 'VGames', 0, 0, '0', '2023-12-18 20:03:10', '2023-12-18 20:03:10'),
(10287, 1, 'sN8khsg2XtXNCXWgQF6p', '8PHR9vW0dBQ0LQjJXey4tQLzNX3KMsven1LJtzEf', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 1500.00, 'VGames', 0, 0, '0', '2023-12-18 20:03:34', '2023-12-18 20:03:34'),
(10288, 1, 'gELlqxaRJaPTq8MlMj96', 'NorKp9Xx3m4Y6Zj8BBA6Yg6f9o0LqYhihD6CJGUz', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 24.00, 'VGames', 0, 0, '0', '2023-12-18 20:03:55', '2023-12-18 20:03:55'),
(10289, 1, 'eM8FF0gGxjqL6XAsqbbF', 'DATrXYGbGL9PsBNKoRKAfV0AJ0rvhSTj1thdQqhs', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:01', '2023-12-18 20:04:01'),
(10290, 1, 'Xsrv3l6Hq9RD4qq6KRbd', 'zHg7BOTyjX0rj2jOzZCbtfIDhlklwnPGNiLQcGK3', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:06', '2023-12-18 20:04:06'),
(10291, 1, 'LBbelS3hBUD4Q5Y14Jpe', '4Vbu1TKewfpwu0OgKYnmJWS5sJiXdhIcXnqhdRp8', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:12', '2023-12-18 20:04:12'),
(10292, 1, 'gmVu6O1nA3fjZQil2hSk', 't0V9jaPdX8CKKhOLi1zl30v5a2tFLiY85wOT6jro', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:17', '2023-12-18 20:04:17'),
(10293, 1, '788ql4PDdm25gnZZzPyr', 'fw6Zdgsfaiwm0gXSHmwgN8FNOWwghYmGO0XAjsJn', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 18.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:23', '2023-12-18 20:04:23'),
(10294, 1, 'J5yFWMLwiWrzl7Gf085c', '5xTQ511t9s5LTitZJQNOuFv4flSMNL6sn5xd1Mle', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 180.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:28', '2023-12-18 20:04:28'),
(10295, 1, 'P6fTZWHqqVIxVU0v9NG7', 'Q4ScJGsUNNHhGFGIcVjk75bTCSX2Lfkya60M7YoT', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:34', '2023-12-18 20:04:34'),
(10296, 1, 'mojaZxTk5K9fVaONYn4B', '46Ee4Oqbt79bZgVL0gMPyQMmOncnno7gVewtMhtb', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 90.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:39', '2023-12-18 20:04:39'),
(10297, 1, 'WabPg9qor5OiZlPG416p', 'IauqCRQtwmHiyabpfX9PKGw45qYG2sGSH4lDtxdR', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 24.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:46', '2023-12-18 20:04:46'),
(10298, 1, '7mGSKFILl6WqI32GqAfi', 'lV4CzvNLPM0cvcySppEcVrUigMmyzxg9OWdsyWOr', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:51', '2023-12-18 20:04:51'),
(10299, 1, 'kypWJGwrahXnmE4O1EVy', 'sb8t3qiahL3seyHW19LCB2NFgAcESbvmy9eA0p7n', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 30.00, 'VGames', 0, 0, '0', '2023-12-18 20:04:57', '2023-12-18 20:04:57'),
(10300, 1, 'yaWSmbitz57MkUAbpouG', 'RYjmVKDsdzJLdIbcjpJG4ongRdMOp8NwPQtw2aNN', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 90.00, 'VGames', 0, 0, '0', '2023-12-18 20:05:03', '2023-12-18 20:05:03'),
(10301, 1, '415J2ik4F3Ox4aFlwMeC', 'M1VnGdHgMNJbuh33y5pITCkTlkU2thbXJ0ZTkrVw', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 1500.00, 'VGames', 0, 0, '0', '2023-12-18 20:05:10', '2023-12-18 20:05:10'),
(10302, 1, 'E5tLe2onaGToXXRlbBQF', 'Eko1sZ44lUcJTuByfOCS4Q6IyFkDAG3rn5EUJOE6', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 20:16:19', '2023-12-18 20:16:19'),
(10303, 1, 'WGUJz9ItdqLgReVguB0J', 'HGIrmkYzJQlshTgtsdBM8qxGqtQYZUgDBabNo6uI', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 1200.00, 'VGames', 0, 0, '0', '2023-12-18 20:16:27', '2023-12-18 20:16:27'),
(10304, 1, '2jQ4UTKvc0FjiOy0ZYPB', 'FJvVhbBFAGmtDmpwIA4LQStZKwsN7MZt4IozdMhj', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 4000.00, 'VGames', 0, 0, '0', '2023-12-18 20:16:33', '2023-12-18 20:16:33'),
(10305, 1, 'xfsbaQFJH9PB2AmnpYWB', 'fS44w46uRQOM7ghVU7iRMPwFId01xvlaIdQlOjf0', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 200.00, 'VGames', 0, 0, '0', '2023-12-18 20:16:57', '2023-12-18 20:16:57'),
(10306, 1, 'B8AWgNOUsfiG6G9YH2TL', 'TL0R6GvDQnawOZgjlKo6Nwnz67VP7JFpvZZuWxea', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 200.00, 'VGames', 0, 0, '0', '2023-12-18 20:17:03', '2023-12-18 20:17:03'),
(10307, 1, 'ZLaseBPZ8ZHmnaICUXae', '8F6fjmYLUrdNpEEfKfBSL4tUaxfEkHen4aa99AU1', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 600.00, 'VGames', 0, 0, '0', '2023-12-18 20:17:08', '2023-12-18 20:17:08'),
(10308, 1, 'yXTUcuf7jfitBkBOSC2Q', 'ryvcuUCXhZTcpuRO7ZGORKuICNOZr3qGyWOr1chT', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 60.00, 'VGames', 0, 0, '0', '2023-12-18 20:30:00', '2023-12-18 20:30:00'),
(10309, 1, 'ZufB0YU3RmhPDyz9Fhwe', 'd47YvFnGl8m567tl0Xf8CRCbNhgIjNwztt61ndto', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 20:30:05', '2023-12-18 20:30:05'),
(10310, 1, '1s5EQd55q9aYmzwjIK3R', 'S5QpDfLtVo1fK6UUxF4WUXQmuyjWf70FP2qPFMsK', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 20:30:11', '2023-12-18 20:30:11'),
(10311, 1, 'KGWWqjITNdU3Fj4nf96C', '6FDl7RY2H2i2IldtJYXdiAnNDqFdlMovkC2OdJhf', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 20:30:16', '2023-12-18 20:30:16'),
(10312, 1, 'XkR0JgkxchDjCCfXW4oB', 'XHJB7fA28Hm6Q91qiJC0F3rFy0zR6dlbQ2ju6Ezf', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 300.00, 'VGames', 0, 0, '0', '2023-12-18 20:30:21', '2023-12-18 20:30:21'),
(10313, 1, '4hDz7zecRuNFqOkfZukh', 'qpt181YKi3zRErrBXzwqxxjWfWJvuLWnavRMy4e3', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 20:30:26', '2023-12-18 20:30:26'),
(10314, 1, 'iXblByFDUrgHOYaNOewN', 'wicz6IV6NfcLZAa5ChgqwZb0y2x5J2ZbKPKKfnD4', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 20:30:32', '2023-12-18 20:30:32'),
(10315, 1, '8ySzJHn2nLU4H6I0vXEf', 'kjRsHBjQcyXmJCO6w3FfyM76pmMhCCaO8gRTMkf8', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:30:37', '2023-12-18 20:30:37'),
(10316, 1, 'a0EPID52iK5yRbs5Vfew', 'lQ6OsCfGyJN4JSlAL3ppBHmtHh8LJ4xlsVHspimH', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 20:30:58', '2023-12-18 20:30:58'),
(10317, 1, 'Wa9J6Y1xSOzOxU10dYAX', 'tz81nbNUh3Ce5w7gwwxz77mkEpYioIdyNxVr6fvx', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:03', '2023-12-18 20:31:03'),
(10318, 1, 'yATV1J9tZPgkV2rYeVRI', 'f11djpXAnXRpOid3OdcyU69srvNATE1YOBo6Kciw', 'Fortune Mouse', 'fortunemouse', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:06', '2023-12-18 20:31:06'),
(10319, 1, '0S7pctDXgZgxJCS4VUYB', 'IvxQA6NVpXC6RkKSdBXCj0j3oP3t8EggZlnHpDXN', 'Fortune Mouse', 'fortunemouse', 'win', 'balance_bonus', 30000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:11', '2023-12-18 20:31:11'),
(10320, 1, 'qOdsB2m2UuyZATi4o1TN', '3ALKLoGwWTWSshCA4PQWmPnLVGekD0EoIMHkza50', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 600.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:16', '2023-12-18 20:31:16'),
(10321, 1, '1Cu6e9BDPNvBLb5Qslmx', 'qGbcArOCsRtf8BnZ2Yk2eBhGUEjgp52Y2FSLLONr', 'Fortune Mouse', 'fortunemouse', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:19', '2023-12-18 20:31:19'),
(10322, 1, 'EGHN4IJhvS4O4sXLBTVy', 'jyPHQg7Sps7fein2IMzq42pI0nlyW8gMyYS6lf3d', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:24', '2023-12-18 20:31:24'),
(10323, 1, 'ySFX6gUp3DXkqQGA92ZO', 'tY1b4zr1kz7tBmDiJnsbUHbCyhhGmo9kmutr4FP8', 'Fortune Mouse', 'fortunemouse', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:25', '2023-12-18 20:31:25'),
(10324, 1, 'L1bQ7PtaOvP8rqh0Gqnr', 'kfWu7NfPDmWToKqWXXPaXpGovma3g8H8H1BNn4ZK', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 100000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:30', '2023-12-18 20:31:30'),
(10325, 1, '8X4pfNkY924Hbrs5l7jb', 'b7owSGoo57YShZUCQoQk3nrLhwlTFKbEgEtle8Q6', 'Fortune Mouse', 'fortunemouse', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:30', '2023-12-18 20:31:30'),
(10326, 1, '3fgkJ2IXKYNDCr7ojgAR', 'FQyeWCmHK1C1UrTwoTfOb01smTAGwyIqXNvNJrBk', 'Fortune Mouse', 'fortunemouse', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:35', '2023-12-18 20:31:35'),
(10327, 1, '7QtWJ8CxQPlb5KHHSKCB', 'W99ilYCtBw1V3EDHj9Rms1jIKuUs3QxTaqXkuXlG', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 100000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:38', '2023-12-18 20:31:38'),
(10328, 1, 'D7P9O0CNnipAjTNQvYV3', '7Qzg9R2KoIy1aq5pcqg255qtQGbE7HC1ROnuA06Z', 'Fortune Mouse', 'fortunemouse', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:43', '2023-12-18 20:31:43'),
(10329, 1, 'kECIMNpOIgcBoLwm1D5f', 'lCHRUdPEy5g27FupfIWOnXJpOATpTBHCz4rkyscx', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:47', '2023-12-18 20:31:47'),
(10330, 1, 'ttJtdEZ80m7EaL4Fmr1k', '0AljCRUfNi7UV64a8LRT5dfTbo0xjoOZ10ScEMKz', 'Fortune Mouse', 'fortunemouse', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:49', '2023-12-18 20:31:49'),
(10331, 1, 'DPiDXQMUr1nyUIwChaMo', '43gmrJp3MupXgeiL3pDUm1x2VqebYXsBzm7t5hP9', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 30000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:52', '2023-12-18 20:31:52'),
(10332, 1, 'Eu7eeMhPs6B6Sv2XK8oe', 'YmiDyMhxcKtUkpAaEs3bjJQGM091ZdFiFzHPHWXH', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 4000.00, 'VGames', 0, 0, '0', '2023-12-18 20:31:57', '2023-12-18 20:31:57'),
(10333, 1, '0DH5gcgJAYUL4FFjfeII', 'RD6RjyrbW1q1pA1bm9LzJZzlh1X8ddkVKjP0KVje', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 15000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:02', '2023-12-18 20:32:02'),
(10334, 1, 'Y3A8D8s6qIeWlF0zkBtX', '0GJkE9j6PBwPUwHW5P5WUaKVl4I3kjvyPB2wLKIZ', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:07', '2023-12-18 20:32:07'),
(10335, 1, '2TKvwq02UXG57sByNasB', 'k9WPSDv19SIpfi0jn85c0LsRHzi7goEkKXLftKGM', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:12', '2023-12-18 20:32:12'),
(10336, 1, 'ywvmRgoI1wdrhwWWfqc8', 'CBnOY3AMZpg4T11hRDbEozpeatUXdZUtniiZt0y5', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:17', '2023-12-18 20:32:17'),
(10337, 1, 'D5uR1YOxsPoaBKniixWz', 'dxXojzSIFec9QvCDIZphnhtAnZK4ilGwroaVCvig', 'Treasures of Aztec', 'treasuresofaztec', 'loss', 'balance_bonus', 20000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:17', '2023-12-18 20:32:17'),
(10338, 1, 'pwuGnJku7K9VesKD6fta', 'nGMr0XOZ0ZKhWWK2Y5fT9I9NG3nPVzvrgHhBrywt', 'Treasures of Aztec', 'treasuresofaztec', 'loss', 'balance_bonus', 20000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:22', '2023-12-18 20:32:22'),
(10339, 1, 'FPRGZpKu6KVNHWf7WJlK', 'F8wlhivX2W6hyLxzqB9KI4qwllJdiTFSAd8sdusv', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 3000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:23', '2023-12-18 20:32:23'),
(10340, 1, 'najpW543TE80ZqHh3NpZ', 'dCk43BoA2YzwknUprxBb84ecnd1rowYnXN9xP7r3', 'Treasures of Aztec', 'treasuresofaztec', 'loss', 'balance_bonus', 20000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:27', '2023-12-18 20:32:27'),
(10341, 1, 'WCxr0EJ4GpPfh7JKnDkO', 'wNxpWYGKgKSVOc9gI0mMubtK7bNeMvoHcdWWcjG1', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:28', '2023-12-18 20:32:28'),
(10342, 1, 'IyvowE8yaBhTzDxGI4pl', 'EaUO49HLUNZtynB03jrcF52403Kl5dB1NrxxIMZ4', 'Treasures of Aztec', 'treasuresofaztec', 'loss', 'balance_bonus', 20000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:31', '2023-12-18 20:32:31'),
(10343, 1, '27eeMHdF2iCnOLBCKjjI', 'diWWRZRxriKMm0ZbI0lcuawLkCN6RfefuPXo5MhG', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:33', '2023-12-18 20:32:33'),
(10344, 1, 'jK9FCIXVO5MxbcoqOb76', '3VwsHlohVXDZG444lol1jkzOfGL6ZAKTzi7DgM2Q', 'Treasures of Aztec', 'treasuresofaztec', 'loss', 'balance_bonus', 20000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:35', '2023-12-18 20:32:35'),
(10345, 1, 'u2hY1hEodIzUQkUjsOXK', '6kYtM5r4HRS9VAaz3Eo6s229YrNtEZ2M7F9f3AN4', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:38', '2023-12-18 20:32:38'),
(10346, 1, '5UMK8OgqR9BFIyeV2ech', 'c2rkPol4AOekQ2FoKSn4U8aKDMSXS5gP6kmHjwtw', 'Treasures of Aztec', 'treasuresofaztec', 'loss', 'balance_bonus', 20000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:40', '2023-12-18 20:32:40'),
(10347, 1, '7pQ36sBYmnMnohxN4prj', 'mNQrzGUcD47eH3U0eq2EqsITQ5kcJ9yeA2GOtq0H', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:43', '2023-12-18 20:32:43'),
(10348, 1, 'R2ur3Qe0Ta7E3o7dpDe8', 'PiI8m52KKbxKhyrXDR2RzPqjqxlHkTeOP31cOjJR', 'Treasures of Aztec', 'treasuresofaztec', 'loss', 'balance_bonus', 20000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:44', '2023-12-18 20:32:44'),
(10349, 1, 'IxUV7KJ7tiEjFbXRrE5v', '1UnnT9Mk9eqnbQXRkdRupnJNYnxbbNA15FsVOzTD', 'Bikini Paradise', 'bikiniparadise', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:47', '2023-12-18 20:32:47'),
(10350, 1, '6HdlghpQXCn8yAkl2Jfw', 'C8gEYV4d0ELkv8QwtZT5DBVYrkyaJz9rNaPQK56G', 'Treasures of Aztec', 'treasuresofaztec', 'loss', 'balance_bonus', 20000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:48', '2023-12-18 20:32:48'),
(10351, 1, 'qkGM5VXsw8WE5x9PB3nJ', 'wCLQFpTihcMlwcxeqWYnmShZrbCqc5EG1vF3vTUP', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:48', '2023-12-18 20:32:48'),
(10352, 1, 'cqnUvWIapqwtxG5hzxCK', 'Vhtw2c84dHC120WOvr8C7d7KDUYyl62SCcPazgu3', 'Bikini Paradise', 'bikiniparadise', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:51', '2023-12-18 20:32:51'),
(10353, 1, 'Uzb92xubI83m74BJZ5v7', 'vTZ24lEf9kfnzaespOYYpiMEiiraObeCmol38CNA', 'Treasures of Aztec', 'treasuresofaztec', 'loss', 'balance_bonus', 20000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:53', '2023-12-18 20:32:53'),
(10354, 1, 'XboIBefjATxCSIz6bY4v', 's3c1l0Zidr3xG4m19i52UYI0IigUmX3BhJuPH2LF', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 5000.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:54', '2023-12-18 20:32:54'),
(10355, 1, 'gxI8ufp5jLfLX2UBJWP9', '0M7aqV67eZKXE0gnyhQWcWRKdMQG47tQZrsUG0ed', 'Bikini Paradise', 'bikiniparadise', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:54', '2023-12-18 20:32:54'),
(10356, 1, 'aawFQrLmhQ9E20UlJGf0', 'bg3zb9Sajz0pWXLHFWRx7Hdd4KxSH5jFxiNuwpef', 'Bikini Paradise', 'bikiniparadise', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 20:32:58', '2023-12-18 20:32:58'),
(10357, 1, '40N9S4LqSeOLsEnDvtIW', 'Z8E2gKtQKJvnUEHHMSTivOEW9wYKNfQqEJlGXdts', 'Bikini Paradise', 'bikiniparadise', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 20:33:03', '2023-12-18 20:33:03'),
(10358, 1, 'I3O2n8503JCDvEwrAaG6', 'PSNQm2GS72sLM51SOCjGBwEdYQZ2UHn1wjVZKLXC', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:02:23', '2023-12-18 21:02:23'),
(10359, 1, '54E69bPgN2p6rfVvNw0A', 'vWinjyhn9xH8PJAnjFmCQLRMVwSN8z7QpPimsQBh', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:02:42', '2023-12-18 21:02:42'),
(10360, 1, 'wOoZxtNVzoIyNpuCVEQq', 'rFXQwqetL9HBX5zfcQOsU2IjR9Hs35tXG01klDV7', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:02:48', '2023-12-18 21:02:48'),
(10361, 1, 'cV0A0uAb4kY1Qhx77TI8', 'R8liXuc8rMZ0qrftBEOMMwkI0O9M8NbIjgMN9QzW', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 21:02:57', '2023-12-18 21:02:57'),
(10362, 1, 'QJgFfMexTqPbpjZTY290', 'ZFAESpMyMZOrmVWJljAvm8t3gPQDjp85lLC4gMwJ', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 21:03:03', '2023-12-18 21:03:03'),
(10363, 1, 'HKkpnMoMnMke9xQNSfV3', 'lHGYJvlcHvVoP1ncDmA8ZSYMw10zUXF7b4IbW8FU', 'Fortune OX', 'fortuneox', 'win', 'balance_bonus', 300.00, 'VGames', 0, 0, '0', '2023-12-18 21:03:08', '2023-12-18 21:03:08'),
(10364, 1, 'Gt4rNtsNqwjLAFotDozX', 'yqF86sv2HuQwqCpYeBwFatsvoyGUArEzZbKReK73', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 21:03:18', '2023-12-18 21:03:18'),
(10365, 1, 'FrSkAKC5MkUkzUl4zlJZ', 'szX6GXhQ5T8keMlJ83x2FmaJawlnwUnYCoas5zxZ', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 21:04:11', '2023-12-18 21:04:11'),
(10366, 1, '481uvKIcL4rb3c2Q9Bu1', 'XlbhCorvMcJQufCkPO8BOwdSLPwRHCJ3ikpHOj6p', 'Fortune OX', 'fortuneox', 'loss', 'balance_bonus', 100.00, 'VGames', 0, 0, '0', '2023-12-18 21:04:15', '2023-12-18 21:04:15'),
(10367, 1, 'y9CIyLKN2CZBq3hgDWkU', 'XklbQCfiIa0x0kWp1qH3YhzqT3cb8Wl9C3CHD1nw', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:04:41', '2023-12-18 21:04:41'),
(10368, 1, '96YU8yVLHE21f7NgdWuz', '2AczFUpNHU4jMjvQ5RYvbLXw951OMgPw0GQb5QNn', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:04:47', '2023-12-18 21:04:47'),
(10369, 1, 'eEIBDSWnv9Nvcd3xRQxr', 'ZN2DfLTM560stB6EBi4bptOSQ6VsjNYZPPAsXxzS', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 10.00, 'VGames', 0, 0, '0', '2023-12-18 21:04:52', '2023-12-18 21:04:52'),
(10370, 1, 'Fsrx4KPv0GTrjx2cnB16', 'pO801azHgBFkKg6dlQ86QB3TAmLZWfj92sZo9m3O', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:05:00', '2023-12-18 21:05:00'),
(10371, 1, 'Hvkn4zjbQzfRLwLONQfL', 'oYwJhhwG0xzpPYGQ0RkFVrT4z9UE2ZkZDvTsn9NK', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:05:05', '2023-12-18 21:05:05'),
(10372, 1, 'rvTBIzzOadbbIdBMxnsP', 'bykEFxW5TbopL0oxY0L8IgKkGQMbPirr70SypvZF', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:05:11', '2023-12-18 21:05:11'),
(10373, 1, 'TdQohYqDlzkcWz2x3QyB', 'SFdTlGGz07vNUJYhfE9BwaiuMtJzbZkZQwTGzh4d', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:05:16', '2023-12-18 21:05:16'),
(10374, 1, 'GkCcFR3zJOxc63anxVvB', 'J6ObYaY7c0kBEeQCDOuizrHSo0Qa5MmnC9vTsKKL', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-18 21:05:21', '2023-12-18 21:05:21'),
(10375, 1, 'QRjmd0j3JT5GO5X554A4', 'qoeC2CSoKZ8hUDd57Te7GbkueLObuVqvPQaIcn24', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:47:55', '2023-12-18 21:47:55'),
(10376, 1, '89KpbBwxVlihvVBPKKHJ', '8EqisQAXZgtPgmhQFWTW8MLesPIRaCW4wp1Q0h6b', 'Hood VS Wolf', 'hoodvswoolf', 'win', 'balance_bonus', 3.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:01', '2023-12-18 21:48:01'),
(10377, 1, 'ewQowOdKRNSPx6FYRUjs', '858hQBi4a8PLmUOllKECOq5A7DTaKaJe4ocbPtet', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:06', '2023-12-18 21:48:06'),
(10378, 1, 'zZtCnB0IhQPGVkr0Fhz4', 'PnVYEfNvXmQuRjBmFVV8HOKdBNcjjGWubQAyjaQ0', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:09', '2023-12-18 21:48:09'),
(10379, 1, 'rwzb0ImCpUhMqqcOvQlH', 'I4HQdg4AEgaxm92TKMWPkvJRhnFEt8HnkeimLGT2', 'Hood VS Wolf', 'hoodvswoolf', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:12', '2023-12-18 21:48:12'),
(10380, 1, 'YNQ6rtI51skoMfgxtoyD', 'dn6ZFriibrNlvYXrLfhqEluhfVsbGUeth03NWips', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:18', '2023-12-18 21:48:18'),
(10381, 1, 'j86umJAC8zA7yLCvyHul', 'ja6RvY5xpE71MuT1XJbBOrnoIIPQTcICisGOUiOB', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:21', '2023-12-18 21:48:21'),
(10382, 1, 'U6lZrVocHfgrGxvzcG5s', 'dzY46jctL3QC3BLZLZoA6dTHKh08TdINLATl3yq7', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:24', '2023-12-18 21:48:24'),
(10383, 1, 'SZIAxdIa5sGbKfxsoWXv', 'wT8dVdZ3VNn5ii9EHlFtGGvGrrhzgXwbMQTIQGhP', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:27', '2023-12-18 21:48:27'),
(10384, 1, 'UiXmUKaYtMa71zAQk9qb', '9sSYPefyvI5k9ZklK0DHfMWEFf6zID1LV5jluUCJ', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:42', '2023-12-18 21:48:42'),
(10385, 1, '6qW1VFCgA30jbMivA82s', 'kXo4msk5ayJD1wKgk2ONkyDWdzjMqzQhaKuG32UW', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:43', '2023-12-18 21:48:43'),
(10386, 1, 'G97E54JIaLS4YLd279y3', 'hIyhyw1krS6C2tyyur7bTCGTlAXK0ChFsTWmcqXd', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:43', '2023-12-18 21:48:43'),
(10387, 1, 'E1DT1DkalySNbDPgsVip', 'orvV7tQ4kDfQKTrCOIilnUpT0vdsDC6AWk58dQET', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:44', '2023-12-18 21:48:44'),
(10388, 1, 'H1MvVbGjYoCTiqN5zrHR', '1Y5Gl5VUpZOruXWYN6WWInZtqcQ503wCDGjCQvRX', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:45', '2023-12-18 21:48:45'),
(10389, 1, 'IRwd8yzo6ZdJSAwrJqh2', '2axzXkHZRNijcK8cMNtbYvNYhEGSxbU7EpmVX5rA', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:45', '2023-12-18 21:48:45'),
(10390, 1, 'haGj3YLZuF3r63Tops8U', 'tTNQvZ2rHa2JZympA5msEp7w67KemjwTxprfhfvL', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:46', '2023-12-18 21:48:46'),
(10391, 1, 'brgiEkSzKwjAavqM8Ziz', 'RgMIlSWsggOSyHS9BF5tz0Y9AfW9qsRMM2y53vlx', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:47', '2023-12-18 21:48:47'),
(10392, 1, 'q73h7HrbGMbULUwrxwAN', 'ak3kIZYl7YGk2szr9CYZO5uS3yY5OqeCjTWa1BbM', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:48', '2023-12-18 21:48:48'),
(10393, 1, 'GC44PMxPugRMtkCtb36g', '6HRHxR3vbcymeDAd0k3B5awC9rZfHTYSmV9IhBcK', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:48', '2023-12-18 21:48:48'),
(10394, 1, 'QQTddWHaQLl9IbOSYiRz', 'cTY5igI3m3DcHIRz4iepj15y6kVj2Iztk7LjDWJ8', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:49', '2023-12-18 21:48:49'),
(10395, 1, '8fTMz7mH58vXFuuIxT5F', 'bhEElkIzrLHCfxeGBbrjoFhdyamuce7KvuIDbVT1', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:50', '2023-12-18 21:48:50'),
(10396, 1, 'tutuL3Zy4swXY2TyIe6C', '1DtUvHi7y4KtfWUOwSZxFNyAHwGvLk8vQnlmibcI', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:51', '2023-12-18 21:48:51'),
(10397, 1, '8J8kbVydJYooqJPh0SGl', '1XnmtFtTQNb57HnDHmiHALNBLhezCWNIRmGuWKyG', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:51', '2023-12-18 21:48:51'),
(10398, 1, 'Xiqv94WV6wk07lVCmYKX', 'Kbcxd2pefvswu3M2QMfDcfSrApArgPJMgY6w7SRM', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:52', '2023-12-18 21:48:52'),
(10399, 1, 'hMLAkBCD3Mz6eWa0NFXt', 'Is5k6Hpo2zzem2IXf3aLrblItiO21YCeuHssM575', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:53', '2023-12-18 21:48:53'),
(10400, 1, 'SgBJD6JNd3YNmD65djbc', '5OL81L3CTcFSWzbbtDaZpPdzfwzUbZUU5ENqQVV1', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:54', '2023-12-18 21:48:54'),
(10401, 1, 'uNVKckh8DzsZWezE1nDP', 'xlXJqRANe1t1atuTvJecLnI2pCVPOYKPk1RUtGJX', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:54', '2023-12-18 21:48:54'),
(10402, 1, 'mURaFWmZVA9oFFT6feF4', 'msOwjwdeBs1ioHCj54RY31kJVx4yVopVxlrytggv', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:55', '2023-12-18 21:48:55'),
(10403, 1, 'UHpwdn3B2enG8ySVp0hb', 'fJqAG8jJ4cJorYrrhRcrNBOgbi9OJwc31hAFX6t2', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:56', '2023-12-18 21:48:56'),
(10404, 1, 'LFlxkUP4hKYL3sZT51RV', 'g4qKkuEWo8BgdFcT2ikSEIfu2FlP75ru5TxwRb2R', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:57', '2023-12-18 21:48:57'),
(10405, 1, 'lB5EqBARjML2sdnqyi8E', 'Tr2cHQqUPPBQQJrWNNSJP5YTMgD2pfBL9GZmHQ64', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:57', '2023-12-18 21:48:57'),
(10406, 1, 'xuq4FyDVLcdpNAjSsOXj', 'FQlCtAdO7C1CV4oIOwHp1k1Kizzz7gjxfniKYbQz', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:58', '2023-12-18 21:48:58'),
(10407, 1, 'F46pBMuw8cA8QYAA2ehs', '25xK0ypOobX63rVAQAqoVXKTVql9GhaiC7aGmNkn', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:48:59', '2023-12-18 21:48:59'),
(10408, 1, 'TvvNKt9JZfRjLECKgRVN', 'cKlqmBeNnRqRn4QICkdOXCWBoS2P3fWaOZVabvgu', 'Hood VS Wolf', 'hoodvswoolf', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:00', '2023-12-18 21:49:00'),
(10409, 1, 'OYWILjUXkL1BfrwAM7Oi', 'JbROIpxcXVwUgALmwP7uuf2O7WbaCkzyeeShLtE5', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:00', '2023-12-18 21:49:00'),
(10410, 1, 'GUMZISZv5OouNebPeYHc', 'xj1ard3FWT3sl0QXfIokKUCKfy94Prf6cfEHyyVU', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:01', '2023-12-18 21:49:01'),
(10411, 1, 'zAVi536ZgLFjZYrzkxmu', 'tY1gkwEDjTzzHqSFeTNqUHWScgm98tg22xSq3WL6', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:02', '2023-12-18 21:49:02'),
(10412, 1, 'q1XEFjUDNyhSFwBXkSSH', 'dWRE9Vy0RNKbZ7ujOOWqEiOzSOugoHpCjtT6dPLb', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:03', '2023-12-18 21:49:03'),
(10413, 1, 'ZsaWdXWfjPaAw5E0eKdW', 'vT8MhN8q9iUnUXgS1h4HKJuFGyQLrvhscM4mLSvQ', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:03', '2023-12-18 21:49:03'),
(10414, 1, '7zcjwPFtBQbebMnJX8Kf', '408HVJVHp3G2C0CLvxLXvcOU1YYxHVOi5fZRrCMG', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:04', '2023-12-18 21:49:04'),
(10415, 1, 'jMUYYntGbxzFY9CyNwzd', 'dkXKsCBxcDPWydMJ1Vht7GgqudneIkw5l2U4IKdT', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:06', '2023-12-18 21:49:06'),
(10416, 1, 'YEiuyGu1ExFC6gpkToOE', 'NZiyW1jsdD6OMX4uIa4wScmqrcrbcH7mk4Go4tSB', 'Hood VS Wolf', 'hoodvswoolf', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:07', '2023-12-18 21:49:07'),
(10417, 1, 'VioaMfkf4FMlzxtNN1gz', '6r1QW9szUvzYMQShLoKn2Apue426IKw7i254A2mH', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:10', '2023-12-18 21:49:10'),
(10418, 1, '2ziygCA2Y1vnDo1Rq04R', 'GT1soQIXgDUN8BqMrIXBWX8wyHrjFpqkMWleXeYS', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:12', '2023-12-18 21:49:12'),
(10419, 1, 'ViCBXuxzs6CaYA4LzwuK', 'H2fYtBVpTfTpT80Awh5roEQXiTWzdQl7tFJApMyv', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:14', '2023-12-18 21:49:14'),
(10420, 1, 'MTWE9IS7m8A89ZSUoKFA', 'dlFY0xjUrRV19DWsLVbGfiMWv67yGrcn45p5njUz', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:16', '2023-12-18 21:49:16'),
(10421, 1, '6Cvr4sOsmJQLf0Yd61hw', '1N36Y9d7az4QzKy9C9EQe8JNVz2UxUxYN9XlAeLM', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:18', '2023-12-18 21:49:18'),
(10422, 1, 'QI7d9HSfLASSSPt6NPDr', '7pgpcYh0vhA8uqs2Grq3s2kVEvXV6yUv5B0zAlMG', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:24', '2023-12-18 21:49:24'),
(10423, 1, 'ESfd5OGIZ1v9fZB8QJvh', 'e7bgsdEqqi1MN99aSgK4kFAjNu4LR95SYVhAeMON', 'Hood VS Wolf', 'hoodvswoolf', 'win', 'balance_bonus', 6.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:25', '2023-12-18 21:49:25'),
(10424, 1, 'Ls40rxIvio9CF1AiY4W0', 'UXANeOm7ZnoiMrJ0WlLt0d70VlNIJNlf1WGErkZK', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:26', '2023-12-18 21:49:26'),
(10425, 1, 'e4yy2IQhsQfSODdUlkr8', 'Qn6rQLvDSgazUOvw04hFnQFfEvTzGh0nRZtWczqy', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:26', '2023-12-18 21:49:26'),
(10426, 1, 'YSEYwFJSvi6epnvhAdG9', 'ZpMxYEj4bYWa7eAY1eLOdPZmhvoZ2tJgmVaBqyii', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:27', '2023-12-18 21:49:27'),
(10427, 1, 'rUhgJzt48S0ctF6Zinev', 'wXBiod0FVJmSNUqYrRI8ztFFeM6UsVIMitY0Jpfr', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:28', '2023-12-18 21:49:28'),
(10428, 1, '6z6M5wpZ4X3WYqfLUlAj', 'QXng6yAiAkqPjqEKm5swfqT6TuDsQc6ENGa7R1l9', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:29', '2023-12-18 21:49:29'),
(10429, 1, 'iiUQnQVKQiXpSy30lbQ3', 'zzsOPcKi35MwTyUmRWKsHIy1gIHfGiugAoGx97FX', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:29', '2023-12-18 21:49:29'),
(10430, 1, 'Rcr5TqdTTogUO87LHb1s', '597XH7qMqinr2QldalyoSrShGaFOZi5PHhuuhU7H', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:30', '2023-12-18 21:49:30'),
(10431, 1, 'xu3Px3L4b6WOr9gpN3h4', 'JrC46U8zZafn3ODGy6V1Uv392tFM5jUYXhg93eAF', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:31', '2023-12-18 21:49:31'),
(10432, 1, 'Gwz9w4Ro5fv7VpxoTlMJ', 'bnpvHutnefl5KwR7QYrDgoXFZLSqfUtJBXVBfUKq', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:32', '2023-12-18 21:49:32'),
(10433, 1, '7AfVAp6vHiBDw9qg3ByH', 'i038yaNqb3loSB7T3IAXn0L1qTotrVKQrNtNlzOY', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:33', '2023-12-18 21:49:33'),
(10434, 1, '1mz2MX0VZtJO7Mps6qBK', 'nublZlg3jhMyEK10RfCg8Fo96ZbHmU5LwY6BMFJ8', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:33', '2023-12-18 21:49:33'),
(10435, 1, 'NyvECzJ8VkFTT3hgwfPJ', 't0TFW8J79RuqJnO77oPPRD9qaEjfl7nB2bCGdZ9U', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:34', '2023-12-18 21:49:34'),
(10436, 1, 'cke8WnCvacJEMtHWXaM6', 'kJHw54t6qfwZrYKT5QvKlbFrp6IzIZAeUIgmFSIJ', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:35', '2023-12-18 21:49:35'),
(10437, 1, '5OlnCsefLfofJrTyps71', 'PyLx1ea5G8Mf2vxWxwU37KHYkbOJAiHyxjOlgBNT', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:36', '2023-12-18 21:49:36'),
(10438, 1, 'ShmhH5hpooNfutcGTzIt', 'oHEvNTL3iyEdG68EYCSYUA49ddzYpCGyv7b9sYPi', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:36', '2023-12-18 21:49:36'),
(10439, 1, 'B6ib7mBekaRb2wrvRUbM', '1jcsOslP2PCY7HguY1CQTzbIs93tdjoGY1tGeGw4', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:37', '2023-12-18 21:49:37'),
(10440, 1, 'rk3jPkbNmIUPO5uFmbRy', 'Rt1zpUccoWxy16FOgjhUP9Onuhnb5YdYbY7HOn1M', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:38', '2023-12-18 21:49:38'),
(10441, 1, 'O0N6b2UuMVtO45qUViZC', 'hfecKGEYLm0e9fTSZKVkX2Hkj1yVxpcPk7K5fZ9i', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:38', '2023-12-18 21:49:38'),
(10442, 1, 'Iv6Kg1tewdhl7ngp8kMl', 'fLWoXfP1voKu3e4JUPCuBMxo51j97GNOSSmk3LOS', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:39', '2023-12-18 21:49:39'),
(10443, 1, 'WGIBGFbmW59YL67D0znw', 'pUFViTNCn28ISS8bzUSJ8avvtOQJ9lEGvVeeSCnC', 'Hood VS Wolf', 'hoodvswoolf', 'loss', 'balance_bonus', 4.00, 'VGames', 0, 0, '0', '2023-12-18 21:49:40', '2023-12-18 21:49:40'),
(10444, 1, '8BvIVEcH2Q3dgoIM72JR', 'n3xzBgFie0AeLp9Px0DR7h31ybJvmLH1BbOCbtcV', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-21 14:39:47', '2023-12-21 14:39:47'),
(10445, 1, 'FQZDRTgnXVskuWQkRSrU', 'ySw9CtNznR7wGumO5i3z6EirVtOarlUlwRX64gPI', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-21 14:39:53', '2023-12-21 14:39:53'),
(10446, 1, 'gASegRqLFs5rlO2UkDWj', 'MAZPwKp1oi07I5U0jdz0oWLHTcbSAFRJsi8BSnU6', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-21 14:41:44', '2023-12-21 14:41:44'),
(10447, 1, 'rA6hEULW4Vfoid1iUuuV', 'EdhSZKfMjNnMnEzjbwrnLOvHOxvEYDdzxJ8kabtt', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-21 14:49:56', '2023-12-21 14:49:56'),
(10448, 1, '64BEMauSj9PTbAvgclGH', 'PnAMF9XyosCcV7LOVgXXjkaozp8PsOrXxPk0VvG3', 'Fortune Tiger', 'fortunetiger', 'loss', 'balance_bonus', 1.00, 'VGames', 0, 0, '0', '2023-12-21 14:50:02', '2023-12-21 14:50:02'),
(10449, 1, 'PQWESkwWfp0UkDstV8Fc', 'y7W4Zzt3JGOljpcr4AKHZ1WbdCMsS0glZt67P9Wl', 'Fortune Tiger', 'fortunetiger', 'win', 'balance_bonus', 20.00, 'VGames', 0, 0, '0', '2023-12-21 14:50:08', '2023-12-21 14:50:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('Rodrigo19982018@outlook.com', 'DDA8v5Yohb2tsxeMzZLB6P17IA7HtQ35N5Z0c7ZJU2oYgyJ9cNw8CKDvPdvC', '2023-12-08 20:46:19'),
('lucaspaulino.01@gmail.com', 'yiS9fviW2xRN6QuOFcmBxLirKxjVdlHc83lay4T4pT1fd292UBg0UKtodHw8', '2023-12-08 20:59:43'),
('igorcp89608@gmail.com', 'uN4Cv422A64jc7KUz4iaewMql9I7gCjhETYL5KYcco53xNMNAeHioDDePYac', '2023-12-08 23:13:24'),
('santos17julio@gmail.com', 'W3zKfTN0ImvqX8SrI8GVgvyflP7raJDBXNFdbmGuys6psRlL8f6ZdLnAXbGI', '2023-12-09 02:28:34'),
('felipecbjr@gmail.com', 'zopBiKbI53f1QJyhDUTrZYFalUoLPTWBn4A2kTIpAVXhE9egyravvfCXdjYD', '2023-12-09 09:16:19'),
('wilsonlima965@gmail.com', '6TZ5UyL166RQl3OUSZgqESy5puE5IPa1zFlDtEBf2mPI4IpXrRyTTiNdh3rc', '2023-12-09 12:45:10'),
('lucasfreitas0803@gmail.com', '5iWjuV33kzuXxtTC9A1GHLsNqu9jqe5Fn6cvQ2V8dNwMguKwDK83u5sj9EeA', '2023-12-09 14:07:51'),
('galdinoleandro202@gmail.com', '8jsH6WriG3xcskgAe1bKxUMm9pdhBhxSox3agUyYIFGMJKr5eKVGMDmkiRWf', '2023-12-09 14:51:49'),
('thiarlessg9@gmail.com', '5ecAxlepBk8WM3jo7qpyyowv9Ycqr8S1w2pOYPb3TBfYLQfUlhheMG0jODC7', '2023-12-09 15:21:32'),
('heloiseschmidt@outlook.com', 'nHII66zo2wTtDSQcdCWuZCbMMlXRz5GOHL7FQEvBRJeWGQTs626r5ml1up0i', '2023-12-10 09:29:08'),
('bynha555@hotmail.com', 'KEcr6XDaclhMZj3LScs9PDoGhEgNZoPzQI9xvP3KBi2uaXyn4uvowsoi6Gav', '2023-12-10 13:40:10'),
('gracieljaconi@gmail.com', 'PC0T6Fa1QbWbhbkOoJSRQXJCOFUHBG4aupU8rCLoGZ1QmQUC3gnFBIF0copD', '2023-12-10 14:10:59'),
('adrianocity9@hotmail.com', 'YR2l8wQ63qdGWbGX6ggnXnEIrRmdFIuimlYpuxMkFCOPAyhfM25h27s4Vxk8', '2023-12-11 15:46:58'),
('wilsonsilva5810@gmail.com', 'IpqnFtFwLWaxbsjh32xkfckKDGfeFE5N3tY5of3FbZEl2In7tUbKWl3Jc7oW', '2023-12-11 16:14:52'),
('marraalys@gmail.com', 'ca8UEr5cpLqfjbiIQav358kf5xVmZLUjKe5CGJURpgBOOiinN3oDTPwqZSxi', '2023-12-12 00:54:18'),
('carlinhos1990fla@gmail.com', 'Y7ALXrCTBzGSxr0XClw58GOHGOqn0gwPs1tZynUx4tDSkYxI3NyjuRjO0Sfw', '2023-12-12 01:48:59'),
('mailzadasilvasantos904@gmail.com', '8UXMhrQe20PVW15rbJGQw7sQ919cEidDnArQwLV6SuT0GBcFbBwA5Iaw4o7p', '2023-12-12 13:37:56'),
('elisangelaalvessilva970@gmail.com', 'aEPYSC64nBXFdnQH8bvpndIdA7WHdxhQ5UbLx7u4HXNEJ7aHKGuNOiBers5L', '2023-12-13 21:07:05'),
('contasjfb@gmail.com', 'txHL6mHN0dgFhhgIpXTBliOUjkGQOol8zKMSBDaS75eH0kEmYv4s4XspEqff', '2023-12-13 23:39:42'),
('carlosalberto.supervisor@gmail.com', 'KPU1v2sj3odn7AxipexVIgSE1lYdBxOUhxkrBUYgXSIrYJ9FMbigOjgIvPAr', '2023-12-15 17:11:49'),
('vj91686@gmail.com', 'g8N2Bb78XnfAo9TT7nzgwRqfGo4WUSZXApMyhkhgCsB8BBkJ4Ll0Gfp3Bllh', '2023-12-16 09:57:30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'games-exclusive-edit', 'web', '2023-10-12 19:23:45', '2023-10-12 21:12:28'),
(2, 'games-exclusive-view', 'web', '2023-10-12 19:23:56', '2023-10-12 21:11:25'),
(3, 'games-exclusive-create', 'web', '2023-10-12 19:25:06', '2023-10-12 21:11:10'),
(4, 'admin-view', 'web', '2023-10-12 20:56:35', '2023-10-12 20:56:35'),
(5, 'admin-create', 'api', '2023-10-12 21:56:02', '2023-11-22 15:29:37'),
(6, 'admin-edit', 'api', '2023-10-12 21:56:27', '2023-11-22 15:30:56'),
(7, 'admin-delete', 'api', '2023-10-12 21:56:55', '2023-11-22 15:32:23'),
(8, 'category-view', 'api', '2023-10-12 22:01:31', '2023-11-22 15:33:30'),
(9, 'category-create', 'api', '2023-10-12 22:01:46', '2023-11-22 15:35:30'),
(10, 'category-edit', 'api', '2023-10-12 22:01:59', '2023-11-22 15:37:17'),
(11, 'category-delete', 'api', '2023-10-12 22:02:09', '2023-11-22 15:44:05'),
(12, 'game-view', 'web', '2023-10-12 22:02:27', '2023-10-12 22:02:27'),
(13, 'game-create', 'web', '2023-10-12 22:02:36', '2023-10-12 22:02:36'),
(14, 'game-edit', 'web', '2023-10-12 22:02:44', '2023-10-12 22:02:44'),
(15, 'game-delete', 'web', '2023-10-12 22:02:54', '2023-10-12 22:02:54'),
(16, 'wallet-view', 'web', '2023-10-12 22:05:49', '2023-10-12 22:05:49'),
(17, 'wallet-create', 'web', '2023-10-12 22:06:01', '2023-10-12 22:06:01'),
(18, 'wallet-edit', 'web', '2023-10-12 22:06:11', '2023-10-12 22:06:11'),
(19, 'wallet-delete', 'api', '2023-10-12 22:06:18', '2023-11-22 15:44:20'),
(20, 'deposit-view', 'api', '2023-10-12 22:06:44', '2023-11-22 15:44:05'),
(21, 'deposit-create', 'web', '2023-10-12 22:06:56', '2023-10-12 22:06:56'),
(22, 'deposit-edit', 'web', '2023-10-12 22:07:05', '2023-10-12 22:07:05'),
(23, 'deposit-update', 'web', '2023-10-12 22:08:00', '2023-10-12 22:08:00'),
(24, 'deposit-delete', 'web', '2023-10-12 22:08:11', '2023-10-12 22:08:11'),
(25, 'withdrawal-view', 'web', '2023-10-12 22:09:31', '2023-10-12 22:09:31'),
(26, 'withdrawal-create', 'web', '2023-10-12 22:09:40', '2023-10-12 22:09:40'),
(27, 'withdrawal-edit', 'web', '2023-10-12 22:09:51', '2023-10-12 22:09:51'),
(28, 'withdrawal-update', 'web', '2023-10-12 22:10:00', '2023-10-12 22:10:00'),
(29, 'withdrawal-delete', 'web', '2023-10-12 22:10:09', '2023-10-12 22:10:09'),
(30, 'order-view', 'web', '2023-10-12 22:12:36', '2023-10-12 22:12:36'),
(31, 'order-create', 'web', '2023-10-12 22:12:47', '2023-10-12 22:12:47'),
(32, 'order-edit', 'web', '2023-10-12 22:12:56', '2023-10-12 22:12:56'),
(33, 'order-update', 'web', '2023-10-12 22:13:06', '2023-10-12 22:13:06'),
(34, 'order-delete', 'web', '2023-10-12 22:13:19', '2023-10-12 22:13:19'),
(35, 'admin-menu-view', 'web', '2023-10-12 23:26:06', '2023-10-12 23:26:06'),
(36, 'setting-view', 'web', '2023-10-13 00:25:46', '2023-10-13 00:25:46'),
(37, 'setting-create', 'web', '2023-10-13 00:25:57', '2023-10-13 00:25:57'),
(38, 'setting-edit', 'web', '2023-10-13 00:26:06', '2023-10-13 00:26:06'),
(39, 'setting-update', 'web', '2023-10-13 00:26:19', '2023-10-13 00:26:19'),
(40, 'setting-delete', 'web', '2023-10-13 00:26:33', '2023-10-13 00:26:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'api', '2023-10-12 19:20:41', '2023-11-22 15:17:25'),
(2, 'afiliado', 'api', '2023-10-12 19:21:08', '2023-11-22 15:19:31'),
(88, 'Smith', 'api', '2023-11-22 16:02:41', '2023-11-22 16:02:41'),
(90, 'Subadmin', 'api', '2023-12-07 19:58:36', '2023-12-07 19:58:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(1, 90),
(2, 90),
(3, 90),
(4, 90),
(5, 90),
(6, 90),
(7, 90),
(8, 90),
(9, 90),
(10, 90),
(11, 90),
(12, 90),
(13, 90),
(14, 90),
(15, 90),
(16, 90),
(17, 90),
(18, 90),
(19, 90),
(20, 90),
(21, 90),
(22, 90),
(23, 90),
(25, 90),
(26, 90),
(27, 90),
(28, 90),
(29, 90),
(30, 90),
(31, 90),
(32, 90),
(33, 90),
(34, 90),
(35, 90),
(36, 90),
(37, 90),
(38, 90),
(39, 90),
(40, 90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_logo_white` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_logo_black` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BRL',
  `decimal_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dot',
  `currency_position` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `revshare_percentage` bigint(20) DEFAULT '20',
  `ngr_percent` bigint(20) DEFAULT '20',
  `soccer_percentage` bigint(20) DEFAULT '30',
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'R$',
  `storage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `initial_bonus` bigint(20) DEFAULT '0',
  `merchant_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_deposit` decimal(10,2) DEFAULT '20.00',
  `max_deposit` decimal(10,2) DEFAULT '0.00',
  `min_withdrawal` decimal(10,2) DEFAULT '20.00',
  `max_withdrawal` decimal(10,2) DEFAULT '0.00',
  `suitpay_uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suitpay_cliente_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suitpay_cliente_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `maintenance_mode` tinyint(4) DEFAULT '0',
  `software_smtp_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_host` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_port` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_encryption` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_from_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_smtp_mail_from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kscinus_pub_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kscinus_pvt_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hoopay_uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hoopay_cliente_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hoopay_cliente_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `software_name`, `software_description`, `software_logo_white`, `software_logo_black`, `currency_code`, `decimal_format`, `currency_position`, `revshare_percentage`, `ngr_percent`, `soccer_percentage`, `prefix`, `storage`, `initial_bonus`, `merchant_url`, `merchant_id`, `merchant_key`, `min_deposit`, `max_deposit`, `min_withdrawal`, `max_withdrawal`, `suitpay_uri`, `suitpay_cliente_id`, `suitpay_cliente_secret`, `created_at`, `updated_at`, `maintenance_mode`, `software_smtp_type`, `software_smtp_mail_host`, `software_smtp_mail_port`, `software_smtp_mail_username`, `software_smtp_mail_password`, `software_smtp_mail_encryption`, `software_smtp_mail_from_address`, `software_smtp_mail_from_name`, `kscinus_pub_key`, `kscinus_pvt_key`, `hoopay_uri`, `hoopay_cliente_id`, `hoopay_cliente_secret`) VALUES
(1, 'MILENIUM BET', 'Plataforma de Cassino Online', '{\"b0e45766-f50e-4697-a656-9ffae12a8678\":{}}', '{\"ad9baa20-64d6-47ab-bcba-9ecee8989608\":{}}', 'BRL', 'dot', 'left', 15, 5, 40, 'R$', 'local', 50, 'https://staging.slotegrator.com/api/index.php/v1/', '', '', 5.00, 500.00, 50.00, 500.00, 'https://ws.suitpay.app/api/v1/', '', '', '2023-09-24 20:40:05', '2023-12-23 17:10:39', 0, 'smtp', 'mail.joguinho.shop', '465', 'contato@joguinho.shop', 'suasenhae', 'tsl', 'contato@joguinho.shop', 'JOGUINHO', 'b95d5abc-b731-4345-a369-fd921f7f9227', 'WZ4cUtUmnrwYlgQeElbMYAOEJ25nZSWFBHSI2M0hTfw=', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `suit_pay_payments`
--

CREATE TABLE `suit_pay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_id` bigint(20) DEFAULT NULL,
  `pix_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pix_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `observation` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `system_wallets`
--

CREATE TABLE `system_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(27,12) NOT NULL DEFAULT '0.000000000000',
  `balance_min` decimal(27,12) NOT NULL DEFAULT '10000.100000000000',
  `pay_upto_percentage` decimal(4,2) NOT NULL DEFAULT '45.00',
  `mode` enum('balance_min','percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `system_wallets`
--

INSERT INTO `system_wallets` (`id`, `label`, `balance`, `balance_min`, `pay_upto_percentage`, `mode`, `created_at`, `updated_at`) VALUES
(1, 'system', 0.000000000000, 0.000000000000, 45.00, 'percentage', '2023-10-11 19:11:15', '2023-10-16 21:42:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'usd',
  `status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` tinyint(4) DEFAULT '3',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_time` bigint(20) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logged_in` tinyint(4) DEFAULT '0',
  `banned` tinyint(4) DEFAULT '0',
  `inviter` int(10) UNSIGNED DEFAULT NULL,
  `affiliate_revenue_share` decimal(20,2) DEFAULT '0.00',
  `affiliate_cpa` decimal(20,2) DEFAULT '0.00',
  `affiliate_baseline` decimal(20,2) DEFAULT '0.00',
  `is_demo_agent` tinyint(4) DEFAULT '0',
  `oauth_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kscinus` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `is_admin`, `last_name`, `cpf`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `token_time`, `token`, `logged_in`, `banned`, `inviter`, `affiliate_revenue_share`, `affiliate_cpa`, `affiliate_baseline`, `is_demo_agent`, `oauth_id`, `oauth_type`, `status`, `created_at`, `updated_at`, `kscinus`) VALUES
(1, 0, 'Admin', 1, NULL, '100.200.300-90', '(66) 98888-4444', 'admin@admin.com', NULL, '$2y$10$3NPQDbn.sdEAhaPOsuBnMOw77ZeK8XtBgivK26F0W7/rBXU5ALFSu', '$2y$10$3NPQDbn.sdEAhaPOsuBnMOw77ZeK8XtBgivK26F0W7/rBXU5ALFSu', 1696659991, '', 0, 0, 10, 20.00, 20.00, 0.00, 0, NULL, NULL, 'active', '2023-09-24 21:13:49', '2023-12-18 22:38:29', 1),
(339, 3, 'ari', 0, NULL, NULL, '(11', 'ebnelasi@hotmail.com', NULL, '$2y$10$OQCtQB7P1QtezylWCDLTNe6oe6S7.f9yCEFHkGoIg70bfAUQtbc8.', 'ViG79ikC4L3lFjH6qbcS2CZPrfhOG63EgdPEW9YIXrx3b6Jma7vkcMMN29er', NULL, NULL, 0, 0, NULL, 0.00, 0.00, 0.00, 0, NULL, NULL, 'active', '2023-12-21 16:14:07', '2023-12-21 16:14:07', 0),
(336, 3, 'Atendimento', 0, NULL, NULL, '(00) 00000-0000', 'admin@gmail.com', NULL, '$2y$10$3NPQDbn.sdEAhaPOsuBnMOw77ZeK8XtBgivK26F0W7/rBXU5ALFSu', '$2y$10$3NPQDbn.sdEAhaPOsuBnMOw77ZeK8XtBgivK26F0W7/rBXU5ALFSu', NULL, NULL, 0, 0, NULL, 15.00, 20.00, 0.00, 1, NULL, NULL, 'active', '2023-12-18 17:51:12', '2023-12-18 18:12:33', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `anti_bot` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_won` decimal(20,2) DEFAULT '0.00',
  `total_lose` decimal(20,2) DEFAULT '0.00',
  `last_won` decimal(20,2) DEFAULT '0.00',
  `last_lose` decimal(20,2) DEFAULT '0.00',
  `hide_balance` tinyint(4) DEFAULT '0',
  `refer_rewards` decimal(20,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `balance_bonus`, `anti_bot`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `hide_balance`, `refer_rewards`, `created_at`, `updated_at`) VALUES
(1, 1, 56.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, NULL, '2023-12-21 14:50:08'),
(205, 337, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, '2023-12-18 18:25:54', '2023-12-18 18:25:54'),
(204, 336, 11752.00, 0.00, 0.00, 0.00, 5000.00, 0.00, 2500.00, 1000.00, 0, 0.00, '2023-12-18 17:51:12', '2023-12-18 18:24:47'),
(203, 335, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, '2023-12-18 17:30:03', '2023-12-18 17:30:03'),
(202, 334, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, '2023-12-18 16:23:16', '2023-12-18 16:23:16'),
(201, 333, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, '2023-12-18 16:11:33', '2023-12-18 16:11:33'),
(199, 331, 10000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, '2023-12-17 15:21:07', '2023-12-18 18:01:06'),
(206, 338, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, '2023-12-21 14:32:15', '2023-12-21 14:32:15'),
(207, 339, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, '2023-12-21 16:14:07', '2023-12-21 16:14:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallet_changes`
--

CREATE TABLE `wallet_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_roi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_entry` decimal(20,2) NOT NULL DEFAULT '0.00',
  `game` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `chave_pix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_chave` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `amount`, `type`, `proof`, `status`, `chave_pix`, `tipo_chave`, `created_at`, `updated_at`) VALUES
(1611, 1, 500.00, 'pix', NULL, 0, '10766990494', 'document', '2023-12-18 20:20:04', '2023-12-18 20:20:04'),
(1612, 1, 300.00, 'pix', 'SbL3hv1vPLUxIGxk9tNv3o6CAy6nIo-metaYTA1ZjhkMWUtMDAwNS00MTg4LTkyM2QtNDNiMmU4YzVkNTFiLmpwZw==-.jpg', 1, '11963896363', 'phoneNumber', '2023-12-21 14:38:43', '2023-12-23 16:31:53');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_histories_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `affiliate_histories_inviter_index` (`inviter`) USING BTREE;

--
-- Índices de tabela `bet_categories`
--
ALTER TABLE `bet_categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bet_categories_bet_section_id_foreign` (`bet_section_id`) USING BTREE;

--
-- Índices de tabela `bet_events`
--
ALTER TABLE `bet_events`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bet_events_bet_category_id_foreign` (`bet_category_id`) USING BTREE;

--
-- Índices de tabela `bet_sections`
--
ALTER TABLE `bet_sections`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `bet_users`
--
ALTER TABLE `bet_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `bet_users_bet_event_id_foreign` (`bet_event_id`) USING BTREE,
  ADD KEY `bet_users_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `slug` (`slug`) USING BTREE;

--
-- Índices de tabela `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `deposits_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `deposit_user`
--
ALTER TABLE `deposit_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Índices de tabela `games_hashes`
--
ALTER TABLE `games_hashes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `games_hashes_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `games_kscinus`
--
ALTER TABLE `games_kscinus`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `game_exclusives`
--
ALTER TABLE `game_exclusives`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `game_exclusives_category_id_foreign` (`category_id`) USING BTREE;

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE;

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE;

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `suit_pay_payments_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `team_user_team_id_index` (`team_id`) USING BTREE,
  ADD KEY `team_user_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `transactions_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Índices de tabela `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallets_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdrawals_user_id_foreign` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `bet_categories`
--
ALTER TABLE `bet_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `bet_events`
--
ALTER TABLE `bet_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=660;

--
-- AUTO_INCREMENT de tabela `bet_sections`
--
ALTER TABLE `bet_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `bet_users`
--
ALTER TABLE `bet_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT de tabela `deposit_user`
--
ALTER TABLE `deposit_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `games_hashes`
--
ALTER TABLE `games_hashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games_kscinus`
--
ALTER TABLE `games_kscinus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de tabela `game_exclusives`
--
ALTER TABLE `game_exclusives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10450;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT de tabela `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1613;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
