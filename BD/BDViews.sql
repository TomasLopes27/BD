-- Views

-- Vista da quantidade de eventos participados
CREATE VIEW quantidade_eventos_participados AS
SELECT P.NIF AS Nif, P.Nome AS Nome, P.Idade AS Idade, COUNT(PE.Evento_ID) AS Eventos
FROM participante P
JOIN participante_evento PE ON P.NIF = PE.Participante_NIF
GROUP BY P.NIF
ORDER BY Eventos DESC;

-- Vista de todos os eventos ativos
CREATE VIEW eventos_ativos AS
SELECT evento.Nome AS Nome, evento.DataEvento AS DataEvento,evento.PrecoBilhete AS PrecoBilhete,evento.IdadeMinima AS IdadeMinima
FROM evento 
WHERE(evento.Estado = 'Ativo') order by evento.DataEvento;
SELECT * FROM eventos_ativos;

CREATE VIEW eventos_finalizados AS
	SELECT E.Nome, E.DataEvento, E.PrecoBilhete, E.IdadeMinima, ROUND(AVG(P.Idade), 2) AS 'Media_Idade'
    FROM evento E
    JOIN participante_evento PE ON E.ID = PE.Evento_ID
    JOIN participante P ON PE.Participante_NIF = P.NIF
    WHERE E.Estado = 'Finalizado'
    GROUP BY E.ID
    ORDER BY E.DataEvento DESC;
    
CREATE VIEW ResumoEvento AS
SELECT E.Nome,E.Descricao,E.Estado,COUNT(P.NIF) AS TotalParticipantes
FROM Evento E
JOIN participante_evento PE ON PE.Evento_ID = E.ID
JOIN participante P ON P.NIF = PE.Participante_NIF
GROUP BY E.ID;

CREATE VIEW material_utilizado AS
	SELECT M.Nome,SUM(EM.Quantidade) AS 'Quantidade_Utilizada'
    FROM material M
    JOIN evento_material EM ON M.ID = EM.Material_ID
    GROUP BY M.Nome
    ORDER BY Quantidade_Utilizada DESC;
