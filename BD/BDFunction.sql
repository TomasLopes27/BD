DELIMITER ;;
CREATE FUNCTION CustoTotalDeEvento(
    IDEvento INT
) RETURNS decimal(6,2)
    READS SQL DATA
BEGIN
    DECLARE custo DECIMAL(6,2);
    SELECT SUM(M.Preco) INTO custo
    FROM Material M
    JOIN evento_material EM ON M.ID = EM.Material_ID
    WHERE EM.Evento_ID = IDEvento;
    RETURN custo;
END ;;
DELIMITER ;;

DELIMITER ;;
CREATE FUNCTION DisponibilidadeDiaEspaco(
    Dia DATE,
    IDEspaco INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE ocupado INT;
    SELECT COUNT(*) INTO ocupado
    FROM evento E
    JOIN evento_espaco EE ON E.ID = EE.Evento_ID
    WHERE E.DataEvento = Dia AND EE.Espaco_ID = IDEspaco;
    IF ocupado > 0 THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END ;;
DELIMITER ;;

DELIMITER ;;
CREATE  FUNCTION LucroBilhetesEvento(
    IDEvento INT
) RETURNS decimal(8,2)
    READS SQL DATA
BEGIN 
    DECLARE Receita DECIMAL(8,2);
    SELECT SUM(E.PrecoBilhete) INTO Receita
    FROM Evento E
    JOIN participante_evento PE ON E.ID = PE.Evento_ID
    WHERE IDEvento = PE.Evento_ID;
    RETURN Receita;
END ;;
DELIMITER ;;

DELIMITER ;;
CREATE  FUNCTION MediaIdadePorEvento(
    IDEvento INT
) RETURNS decimal(8,2)
    READS SQL DATA
BEGIN
    DECLARE media DECIMAL(8, 2);
    SELECT AVG(P.Idade) INTO media
    FROM Participante P
    JOIN Participante_Evento PE ON P.NIF = PE.Participante_NIF
    WHERE PE.Evento_ID = IDEvento;
    RETURN media;
END ;;
DELIMITER ;;

DELIMITER ;;
CREATE  FUNCTION VerificarMaterialSuficiente(
    IDMaterial INT,
    quantidadeNecessaria INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE quantidadeStock INT;
    SELECT Quantidade INTO quantidadeStock
    FROM Material
    WHERE ID = IDMaterial;
    IF quantidadeStock >= quantidadeNecessaria THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END ;;
DELIMITER ;;