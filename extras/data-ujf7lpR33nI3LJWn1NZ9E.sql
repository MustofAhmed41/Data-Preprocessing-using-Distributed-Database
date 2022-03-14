DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `numberrange` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`numberrange`)
VALUES
  (43),
  (115),
  (3),
  (57),
  (37),
  (114),
  (14),
  (169),
  (42),
  (64);
INSERT INTO `myTable` (`numberrange`)
VALUES
  (92),
  (49),
  (156),
  (54),
  (48),
  (145),
  (185),
  (90),
  (124),
  (9);
INSERT INTO `myTable` (`numberrange`)
VALUES
  (165),
  (149),
  (139),
  (21),
  (100),
  (153),
  (106),
  (134),
  (22),
  (1);
INSERT INTO `myTable` (`numberrange`)
VALUES
  (79),
  (190),
  (149),
  (33),
  (197),
  (172),
  (174),
  (200),
  (185),
  (23);
INSERT INTO `myTable` (`numberrange`)
VALUES
  (36),
  (189),
  (118),
  (153),
  (34),
  (73),
  (70),
  (100),
  (163),
  (142);
