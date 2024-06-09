CREATE ROLE gestor;
GRANT ALL PRIVILEGES ON *.* TO gestor;
CREATE USER 'Miguel' IDENTIFIED BY 'miguel123';
CREATE USER 'Joao' IDENTIFIED BY 'joao123';
CREATE USER 'Tomas' IDENTIFIED BY 'tomas123';
CREATE USER 'Ze' IDENTIFIED BY 'ze123';
GRANT gestor TO 'Miguel';
GRANT gestor TO 'Joao';
GRANT gestor TO 'Tomas';
GRANT gestor TO 'Ze';

CREATE USER 'funcionario'@'localhost' IDENTIFIED BY '123funcionario123';
GRANT SELECT ON gestaoeventos.* TO 'funcionario'@'localhost';
GRANT EXECUTE ON gestaoeventos.* TO 'funcionario'@'localhost';

FLUSH PRIVILEGES;