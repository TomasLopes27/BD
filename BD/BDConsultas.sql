-- Querries

USE GestaoEventos;

-- Exibe todos os Eventos ativos, indicando o seu nome, a data, o preço do bilhete e a idade mínima
SELECT Nome, DataEvento, PrecoBilhete, IdadeMinima
	FROM Evento
	WHERE Estado = 'Ativo';

-- Exibe todos os eventos finalizados, organizando, por ordem crescente, pela média de idades
SELECT E.Nome AS "NomeEvento", AVG(P.Idade) AS "Media_Idade"
	FROM Evento E
		INNER JOIN Participante_Evento PE ON E.ID = PE.Evento_ID
		INNER JOIN Participante P ON PE.Participante_NIF = P.NIF
	WHERE E.Estado = 'Finalizado'
	GROUP BY E.Nome
	ORDER BY Media_Idade ASC;

-- Exibe todos os eventos ativos, indicando os seus respetivos preços e idades minimas, organizando pela data do evento
SELECT DataEvento, Nome, PrecoBilhete, IdadeMinima
	FROM Evento
	WHERE Estado = 'Ativo'
	ORDER BY DataEvento;

-- Exibe todos os clientes cujo contacto comece por '91'
SELECT *
	FROM Cliente
	WHERE Contacto like '91%';

-- Exibe todos os eventos que irão ser realizados entre uma certa data, organizando-os por data
SELECT DataEvento, Nome, PrecoBilhete, IdadeMinima
	FROM Evento
	WHERE DataEvento BETWEEN '2024-06-01' AND '2024-12-31'
	ORDER BY DataEvento;

-- Exibe todos os eventos finalizados, ordenando pela média de idades de modo descendente
SELECT E.Nome AS "NomeEvento", AVG(P.Idade) AS "MediaIdade"
	FROM Evento E
		INNER JOIN Participante_Evento PE ON E.ID = PE.Evento_ID
		INNER JOIN Participante P ON PE.Participante_NIF = P.NIF
	WHERE E.Estado = 'Finalizado'
	GROUP BY NomeEvento
	ORDER BY MediaIdade DESC;

-- Exibe todos os materiais que foram utilizados, organizando por ordem descendente de quantidade
SELECT M.Nome As "NomeMaterial", SUM(EM.Quantidade) AS "QuantidadeUtilizada"
	FROM Material M
		INNER JOIN Evento_Material EM ON M.ID = EM.Material_ID
	GROUP BY NomeMaterial
	ORDER BY QuantidadeUtilizada DESC;

-- Exibe os eventos que o seu preço seja menor que o preço médio de todos os eventos
SELECT DataEvento, Nome, PrecoBilhete, IdadeMinima
	FROM Evento
	WHERE PrecoBilhete < (SELECT AVG(PrecoBilhete) FROM Evento)
	ORDER BY DataEvento;




