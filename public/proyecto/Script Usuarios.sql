DROP USER IF EXISTS 'admin', 'proyecto', 'gestionador', 'consultor';

CREATE USER 'admin' IDENTIFIED BY 'Admin_2026';
GRANT ALL PRIVILEGES ON conducar.* TO 'admin';

CREATE USER 'proyecto' IDENTIFIED BY 'Proyecto_2026';
GRANT ALL PRIVILEGES ON conducar.* TO 'proyecto';

CREATE USER 'gestionador' IDENTIFIED BY 'Gestion_2026';
GRANT SELECT, INSERT, UPDATE, DELETE ON conducar.* TO 'gestionador';

CREATE USER 'consultor' IDENTIFIED BY 'Consultor_2026';
GRANT SELECT ON conducar.* TO 'consultor';

SHOW GRANTS FOR 'consultor';
