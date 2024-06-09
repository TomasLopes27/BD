DELIMITER ;;
CREATE PROCEDURE Top3ParticipantesEntreDatas(
    IN data_inicio DATE,
    IN data_fim DATE
)
BEGIN
    SELECT P.NIF, P.Nome, P.Idade, COUNT(*) AS Participacoes
    FROM Participante P
    JOIN Participante_Evento PE ON P.NIF = PE.Participante_NIF
    JOIN Evento E ON PE.Evento_ID = E.ID
    WHERE E.DataEvento BETWEEN data_inicio AND data_fim
    GROUP BY P.NIF
    ORDER BY Participacoes DESC
    LIMIT 3;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE  PROCEDURE AtualizarEstado(
    IN IDEvento INT,
    IN novo_estado VARCHAR(15)
)
BEGIN
    UPDATE evento
    SET Estado = novo_estado
    WHERE ID = IDEvento;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE  PROCEDURE EventosEntreDatas(
    IN data_inicial DATE, 
    IN data_final DATE
)
BEGIN
    SELECT Nome, Descricao, Estado, DataEvento, PrecoBilhete, IdadeMinima
    FROM Evento
    WHERE DataEvento BETWEEN data_inicial AND data_final
    ORDER BY DataEvento;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE  PROCEDURE EventosPorNIF(
    IN NIF INT
)
BEGIN
    SELECT E.Nome
    FROM Evento E
    JOIN participante_evento PE ON E.ID = PE.Evento_ID
    WHERE PE.Participante_NIF = NIF;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE EventosPorPrecoMaximo(
    IN preco DOUBLE
)
BEGIN
    SELECT Nome, Descricao, Estado, DataEvento, PrecoBilhete, IdadeMinima
    FROM Evento
    WHERE PrecoBilhete <= preco
    ORDER BY PrecoBilhete;
END 
DELIMITER ;;


DELIMITER ;;
CREATE  PROCEDURE MaterialFornecidoPorEvento(
    IN IDEvento INT
)
BEGIN
    SELECT E.Nome, F.Nome, M.Nome, MF.Quantidade
    FROM Evento E
    JOIN Evento_Material EM ON E.ID = EM.Evento_ID
    JOIN Material M ON EM.Material_ID = M.ID
    JOIN Material_Fornecedor MF ON M.ID = MF.Material_ID
    JOIN Fornecedor F ON MF.Fornecedor_ID = F.ID
    WHERE E.ID = IDEvento;
END ;;
DELIMITER ;