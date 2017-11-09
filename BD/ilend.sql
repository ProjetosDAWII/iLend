

--
-- Database: `ilend`
--
CREATE DATABASE IF NOT EXISTS `ilend` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ilend`;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `apelido` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nome`, `desc`, `apelido`) VALUES
(1, 'Livros', 'Livros para empréstimo', 'livros'),
(2, 'Ferramentas', 'Ferramentas para empréstimo', 'ferramentas'),
(3, 'Livros Espírtas', 'Livros sobre espiritismo, doutrina e romances', 'livros-espiritas'),
(4, 'Vestidos de Formatura', 'Lindos vestidos', 'vestidos-de-formatura'),
(5, 'Mala Viagem', 'Malas para viagem', 'mala-viagem'),
(6, 'Óculos', 'Óculos diversos', 'oculos'),
(7, 'Barcos', 'Barcos e Canoas', 'barcos'),
(8, 'Tablets', 'Tablets e dispositivos', 'tablets'),
(9, 'PETs', 'Acessórios PETs', 'pets'),
(10, 'Carretinhas', 'Carretinhas e acessórios', 'carretinhas');

-- --------------------------------------------------------

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
CREATE TABLE IF NOT EXISTS `emprestimo` (
  `idEmprestimo` int(11) NOT NULL AUTO_INCREMENT,
  `dataI` date NOT NULL COMMENT 'Data de retirada do empréstimo\n',
  `dataFPrev` date NOT NULL COMMENT 'Data final prevista, setada pelo dono',
  `dataF` date DEFAULT NULL COMMENT 'Data de devolução\n',
  `statusPgt` enum('Pago','Pendente') NOT NULL,
  `idProduto` int(11) NOT NULL,
  `idPessoa` int(11) NOT NULL,
  `idPreco` int(11) NOT NULL COMMENT 'preço ativo no ato do empréstimo\n',
  PRIMARY KEY (`idEmprestimo`),
  KEY `fk_emprestimo_produto1_idx` (`idProduto`),
  KEY `fk_emprestimo_pessoa1_idx` (`idPessoa`),
  KEY `fk_emprestimo_preco1_idx` (`idPreco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

DROP TABLE IF EXISTS `foto`;
CREATE TABLE IF NOT EXISTS `foto` (
  `idFoto` int(11) NOT NULL AUTO_INCREMENT,
  `foto` longblob NOT NULL COMMENT 'a foto propriamente dita!',
  `desc` longtext,
  PRIMARY KEY (`idFoto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movimentacaoFinanceira`
--

DROP TABLE IF EXISTS `movimentacaoFinanceira`;
CREATE TABLE IF NOT EXISTS `movimentacaoFinanceira` (
  `idMovimentacaoFinanceira` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Crédito','Débito') NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `dataLancamento` datetime NOT NULL COMMENT 'data em que foi lançada no sistema',
  `dataEfetivado` datetime DEFAULT NULL COMMENT 'data da efetivação. Se foi crédito, é quando ele foi pago pela empresa ao cliente\n',
  `idPessoa` int(11) NOT NULL,
  `idEmprestimo` int(11) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMovimentacaoFinanceira`),
  KEY `fk_movimentacaoFinanceira_pessoa1_idx` (`idPessoa`),
  KEY `fk_movimentacaoFinanceira_emprestimo1_idx` (`idEmprestimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
CREATE TABLE IF NOT EXISTS `pessoa` (
  `idPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `emailSec` varchar(200) DEFAULT NULL COMMENT 'e-mail para recuperação de contas\n',
  `genero` enum('Masc','Fem','Outro') DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `status` enum('Ativo','Inativo','Bloqueado','Em Confirmação') DEFAULT NULL,
  PRIMARY KEY (`idPessoa`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pessoa`
--

INSERT INTO `pessoa` (`idPessoa`, `nome`, `cpf`, `email`, `emailSec`, `genero`, `nascimento`, `status`) VALUES
(1, 'Victor Hugo', '00011122233', 'hullopes@hotmail.com', 'victorhullopes@gmail.com', 'Masc', '1982-07-23', 'Ativo'),
(2, 'Dono 1', '00111222334', 'fulano@hotmail.com', 'fulano@gmail.com', 'Masc', '1992-07-23', 'Ativo'),
(3, 'Locador 1', '00211322435', 'locador@hotmail.com', 'locador@gmail.com', 'Masc', '1999-07-23', 'Ativo'),
(4, 'Pessoa', '00311422536', 'pessoa@hotmail.com', 'pessoa@gmail.com', 'Masc', '2001-07-23', 'Ativo');

-- --------------------------------------------------------

--
-- Table structure for table `pessoa_has_user`
--

DROP TABLE IF EXISTS `pessoa_has_user`;
CREATE TABLE IF NOT EXISTS `pessoa_has_user` (
  `pessoa_idPessoa` int(11) NOT NULL,
  `user_idUser` int(11) NOT NULL,
  PRIMARY KEY (`pessoa_idPessoa`,`user_idUser`),
  KEY `fk_pessoa_has_user_user1_idx` (`user_idUser`),
  KEY `fk_pessoa_has_user_pessoa_idx` (`pessoa_idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pessoa_has_user`
--

INSERT INTO `pessoa_has_user` (`pessoa_idPessoa`, `user_idUser`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `preco`
--

DROP TABLE IF EXISTS `preco`;
CREATE TABLE IF NOT EXISTS `preco` (
  `idPreco` int(11) NOT NULL AUTO_INCREMENT,
  `preco` varchar(45) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` enum('Normal','Promocional') NOT NULL,
  `status` enum('Ativo','Inativo') NOT NULL,
  `tipoMulta` enum('1% pd','10% pm','20% pp') NOT NULL,
  PRIMARY KEY (`idPreco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `preco`
--

INSERT INTO `preco` (`idPreco`, `preco`, `nome`, `tipo`, `status`, `tipoMulta`) VALUES
(1, '0.0', 'Grátis', 'Normal', 'Ativo', '1% pd');

-- --------------------------------------------------------

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `desc` longtext NOT NULL,
  `idPreco` int(11) NOT NULL,
  `status` enum('Ativo','Inativo') NOT NULL,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_produto_preco1_idx` (`idPreco`),
  KEY `fk_produto_pessoa1_idx` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produto`
--

INSERT INTO `produto` (`idProduto`, `nome`, `desc`, `idPreco`, `status`, `idPessoa`) VALUES
(1, 'Produto Teste', 'Produto de teste do sistema - Cadastrado via script', 1, 'Ativo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produto_has_categoria`
--

DROP TABLE IF EXISTS `produto_has_categoria`;
CREATE TABLE IF NOT EXISTS `produto_has_categoria` (
  `produto_idProduto` int(11) NOT NULL,
  `categoria_idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`produto_idProduto`,`categoria_idCategoria`),
  KEY `fk_produto_has_categoria_categoria1_idx` (`categoria_idCategoria`),
  KEY `fk_produto_has_categoria_produto1_idx` (`produto_idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produto_has_categoria`
--

INSERT INTO `produto_has_categoria` (`produto_idProduto`, `categoria_idCategoria`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produto_has_foto`
--

DROP TABLE IF EXISTS `produto_has_foto`;
CREATE TABLE IF NOT EXISTS `produto_has_foto` (
  `produto_idProduto` int(11) NOT NULL,
  `foto_idFoto` int(11) NOT NULL,
  PRIMARY KEY (`produto_idProduto`,`foto_idFoto`),
  KEY `fk_produto_has_foto_foto1_idx` (`foto_idFoto`),
  KEY `fk_produto_has_foto_produto1_idx` (`produto_idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `social`
--

DROP TABLE IF EXISTS `social`;
CREATE TABLE IF NOT EXISTS `social` (
  `idSocial` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(400) DEFAULT NULL,
  `idPessoa` int(11) NOT NULL,
  `nmRede` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idSocial`),
  KEY `fk_social_pessoa1_idx` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `social`
--

INSERT INTO `social` (`idSocial`, `url`, `idPessoa`, `nmRede`) VALUES
(1, 'https://www.facebook.com/victorhullopes', 1, 'Facebook');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `user` varchar(400) NOT NULL,
  `passWd` varchar(400) NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `user_UNIQUE` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `nome`, `user`, `passWd`, `nivel`) VALUES
(1, '', 'admin', 'admin', 0),
(2, '', 'dono', 'dono', 1),
(3, '', 'locador1', 'locador2', 1),
(4, '', 'pessoa1', 'pessoa1', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `fk_emprestimo_pessoa1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_emprestimo_preco1` FOREIGN KEY (`idPreco`) REFERENCES `preco` (`idPreco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprestimo_produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON UPDATE CASCADE;

--
-- Constraints for table `movimentacaoFinanceira`
--
ALTER TABLE `movimentacaoFinanceira`
  ADD CONSTRAINT `fk_movimentacaoFinanceira_emprestimo1` FOREIGN KEY (`idEmprestimo`) REFERENCES `emprestimo` (`idEmprestimo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movimentacaoFinanceira_pessoa1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON UPDATE CASCADE;

--
-- Constraints for table `pessoa_has_user`
--
ALTER TABLE `pessoa_has_user`
  ADD CONSTRAINT `fk_pessoa_has_user_pessoa` FOREIGN KEY (`pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pessoa_has_user_user1` FOREIGN KEY (`user_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_pessoa1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produto_preco1` FOREIGN KEY (`idPreco`) REFERENCES `preco` (`idPreco`) ON UPDATE CASCADE;

--
-- Constraints for table `produto_has_categoria`
--
ALTER TABLE `produto_has_categoria`
  ADD CONSTRAINT `fk_produto_has_categoria_categoria1` FOREIGN KEY (`categoria_idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produto_has_categoria_produto1` FOREIGN KEY (`produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produto_has_foto`
--
ALTER TABLE `produto_has_foto`
  ADD CONSTRAINT `fk_produto_has_foto_foto1` FOREIGN KEY (`foto_idFoto`) REFERENCES `foto` (`idFoto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produto_has_foto_produto1` FOREIGN KEY (`produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `social`
--
ALTER TABLE `social`
  ADD CONSTRAINT `fk_social_pessoa1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
