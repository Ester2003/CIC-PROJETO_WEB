-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/06/2024 às 17:12
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbabcenglish`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `alunoID` int(11) NOT NULL,
  `usuarioID` int(11) NOT NULL,
  `alunoNome` varchar(225) NOT NULL,
  `cursoID` int(11) NOT NULL,
  `alunoEmail` varchar(45) NOT NULL,
  `alunoCPF` varchar(11) NOT NULL,
  `alunoRG` varchar(20) NOT NULL,
  `alunoCEP` varchar(8) NOT NULL,
  `alunoTelefone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE `curso` (
  `cursoID` int(11) NOT NULL,
  `nivelID` int(11) NOT NULL,
  `precoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nivel`
--

CREATE TABLE `nivel` (
  `nivelID` int(11) NOT NULL,
  `nivel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orcamento`
--

CREATE TABLE `orcamento` (
  `orcamentoID` int(11) NOT NULL,
  `alunoID` int(11) NOT NULL,
  `cursoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `pagamentoID` int(11) NOT NULL,
  `orcamentoID` int(11) NOT NULL,
  `tipoPagamento` varchar(20) NOT NULL,
  `pagamentoStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `preco`
--

CREATE TABLE `preco` (
  `precoID` int(11) NOT NULL,
  `preco` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuarioID` int(11) NOT NULL,
  `usuarioApelido` varchar(45) NOT NULL,
  `usuarioSenha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`alunoID`),
  ADD KEY `FK_Aluno_usuarioID` (`usuarioID`),
  ADD KEY `FK_Curso_cursoID` (`cursoID`);

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cursoID`),
  ADD KEY `FK_Curso_nivelID` (`nivelID`),
  ADD KEY `FK_Curso_precoID` (`precoID`);

--
-- Índices de tabela `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`nivelID`);

--
-- Índices de tabela `orcamento`
--
ALTER TABLE `orcamento`
  ADD PRIMARY KEY (`orcamentoID`),
  ADD KEY `FK_Orcamento_alunoID` (`alunoID`),
  ADD KEY `FK_Orcamento_cursoID` (`cursoID`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`pagamentoID`),
  ADD KEY `FK_Pagamento_orcamentoID` (`orcamentoID`);

--
-- Índices de tabela `preco`
--
ALTER TABLE `preco`
  ADD PRIMARY KEY (`precoID`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioID`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `FK_Aluno_usuarioID` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`),
  ADD CONSTRAINT `FK_Curso_cursoID` FOREIGN KEY (`cursoID`) REFERENCES `curso` (`cursoID`);

--
-- Restrições para tabelas `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `FK_Curso_nivelID` FOREIGN KEY (`nivelID`) REFERENCES `nivel` (`nivelID`),
  ADD CONSTRAINT `FK_Curso_precoID` FOREIGN KEY (`precoID`) REFERENCES `preco` (`precoID`);

--
-- Restrições para tabelas `orcamento`
--
ALTER TABLE `orcamento`
  ADD CONSTRAINT `FK_Orcamento_alunoID` FOREIGN KEY (`alunoID`) REFERENCES `aluno` (`alunoID`),
  ADD CONSTRAINT `FK_Orcamento_cursoID` FOREIGN KEY (`cursoID`) REFERENCES `curso` (`cursoID`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `FK_Pagamento_orcamentoID` FOREIGN KEY (`orcamentoID`) REFERENCES `orcamento` (`orcamentoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
