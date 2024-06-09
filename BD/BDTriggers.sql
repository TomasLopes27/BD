DELIMITER ;;
CREATE TRIGGER atualizar_materiais
 AFTER INSERT ON evento_material 
 FOR EACH ROW BEGIN
    UPDATE material
    SET Quantidade = Quantidade - NEW.Quantidade
    WHERE ID = NEW.Material_ID;
END;
DELIMITER ;;
