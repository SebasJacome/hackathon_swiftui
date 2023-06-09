INSERT INTO resena (id_estacionamiento, calificacion, comentario)
VALUES 
(21, 4, 'Excelente estacionamiento, muy bien ubicado.'),
(24, 3, 'Regular estacionamiento, el personal podria ser mas amable.'),
(37, 5, 'Fantastico estacionamiento, muy seguro y limpio.'),
(52, 2, 'Malo estacionamiento, dificil de acceder y pocos espacios disponibles.'),
(18, 5, 'Increible estacionamiento, tiene todo lo que necesitas.'),
(19, 1, 'Pesimo estacionamiento, muy sucio y descuidado.'),
(45, 4, 'Muy buen estacionamiento, amplio y comodo.'),
(33, 3, 'Estacionamiento promedio, nada especial.'),
(20, 2, 'Regular estacionamiento, podria estar mejor.'),
(27, 5, 'Excelente estacionamiento, muy organizado y eficiente.');

INSERT INTO resena (id_estacionamiento, calificacion, comentario)
VALUES (27, 5, 'Excelente estacionamiento, muy organizado y eficiente.'),
       (46, 4, 'Buen estacionamiento, fácil de acceder y con buena iluminación.'),
       (35, 3, 'Estacionamiento regular, podría estar más limpio.'),
       (22, 2, 'Malo estacionamiento, pocos espacios y muy oscuro.'),
       (18, 5, 'Increíble estacionamiento, tiene todo lo que necesitas.'),
       (41, 1, 'Pésimo estacionamiento, muy sucio y descuidado.'),
       (29, 4, 'Muy buen estacionamiento, amplio y cómodo.'),
       (50, 3, 'Estacionamiento promedio, nada especial.'),
       (49, 2, 'Regular estacionamiento, podría estar mejor.'),
       (37, 5, 'Fantástico estacionamiento, muy seguro y limpio.'),
       (23, 3, 'Regular estacionamiento, el personal podría ser más amable.'),
       (20, 2, 'Malo estacionamiento, difícil de acceder y muy descuidado.'),
       (51, 4, 'Excelente estacionamiento, muy bien ubicado y con buen servicio.'),
       (19, 1, 'Pésimo estacionamiento, muy sucio y mal iluminado.'),
       (32, 5, 'Increíble estacionamiento, muy moderno y bien organizado.'),
       (24, 4, 'Buen estacionamiento, amplio y seguro.'),
       (48, 3, 'Estacionamiento regular, podría mejorar.'),
       (38, 2, 'Malo estacionamiento, difícil de encontrar y muy descuidado.'),
       (21, 5, 'Fantástico estacionamiento, con buena ubicación y buenos servicios.'),
       (26, 3, 'Regular estacionamiento, nada especial.'),
       (40, 2, 'Regular estacionamiento, podría estar mejor.'),
       (39, 4, 'Buen estacionamiento, amplio y bien iluminado.');


INSERT INTO solicitud (id_usuario, id_estacionamiento, fecha, placasVehiculo, modeloVehiculo, formaDePago)
VALUES (5, 22, '2022-06-10', 'ABC123', 'Ford Mustang', 1),
(3, 37, '2022-06-15', 'DEF456', 'Toyota Corolla', 2),
(2, 42, '2022-06-20', 'GHI789', 'Honda Civic', 1),
(7, 21, '2022-06-25', 'JKL012', 'Nissan Altima', 2),
(1, 48, '2022-06-30', 'MNO345', 'Chevrolet Camaro', 1),
(9, 26, '2022-07-05', 'PQR678', 'Volkswagen Jetta', 2),
(4, 33, '2022-07-10', 'STU901', 'Mazda CX-5', 1),
(10, 20, '2022-07-15', 'VWX234', 'Kia Sportage', 2),
(8, 29, '2022-07-20', 'YZA567', 'Hyundai Tucson', 1),
(6, 52, '2022-07-25', 'BCD890', 'Jeep Wrangler', 2);

INSERT INTO solicitud (id_usuario, id_estacionamiento, fecha, placasVehiculo, modeloVehiculo, formaDePago)
VALUES (8, 32, '2023-05-01', 'ABC123', 'Honda Civic', 1),
(4, 26, '2023-05-01', 'XYZ789', 'Toyota Corolla', 2),
(2, 42, '2023-05-02', 'DEF456', 'Nissan Altima', 1),
(7, 49, '2023-05-02', 'GHI789', 'Jeep Grand Cherokee', 3),
(3, 23, '2023-05-03', 'LMN123', 'Ford Mustang', 2),
(5, 18, '2023-05-03', 'PQR789', 'Mazda CX-5', 1),
(1, 41, '2023-05-04', 'STU456', 'Chevrolet Silverado', 3),
(9, 31, '2023-05-04', 'VWX123', 'Subaru Outback', 2),
(10, 52, '2023-05-05', 'JKL789', 'Volkswagen Jetta', 1),
(6, 37, '2023-05-05', 'OPQ456', 'Hyundai Elantra', 3),
(8, 20, '2023-05-06', 'ABC456', 'Toyota Camry', 2),
(4, 28, '2023-05-06', 'XYZ123', 'Honda Accord', 1),
(2, 47, '2023-05-07', 'DEF789', 'Ford Escape', 3),
(7, 22, '2023-05-07', 'GHI123', 'Jeep Wrangler', 2),
(3, 51, '2023-05-08', 'LMN456', 'Mazda3', 1),
(5, 38, '2023-05-08', 'PQR123', 'Nissan Rogue', 3),
(1, 19, '2023-05-09', 'STU789', 'Chevrolet Equinox', 2),
(9, 50, '2023-05-09', 'VWX456', 'Subaru Forester', 1),
(10, 35, '2023-05-10', 'JKL123', 'Volkswagen Passat', 3),
(6, 27, '2023-05-10', 'OPQ789', 'Hyundai Sonata', 2);