CREATE DATABASE IF NOT exists CHEMISTRY ;
USE CHEMISTRY;
-- CREATE TABLE USER 
CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student', 'teacher', 'researcher') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- CREATE TABLE type 
CREATE TABLE IF NOT EXISTS Types (
id INT PRIMARY KEY AUTO_INCREMENT ,
name nvarchar(50) DEFAULT NULL ,
description TEXT DEFAULT NULL 
); 
-- CREATE TABKE Chemicals 
CREATE TABLE IF NOT EXISTS Chemicals (
id INT PRIMARY KEY AUTO_INCREMENT ,
name NVARCHAR(50) DEFAULT NULL , 
atomic_weight DOUBLE DEFAULT NULL , 
symbol NVARCHAR(50) DEFAULT NULL ,
type_id INT DEFAULT NULL ,
hazard_infor NVARCHAR(255),
status NVARCHAR(255),
description TEXT  DEFAULT NULL , 
FOREIGN KEY (type_id) REFERENCES Types (id) ON DELETE CASCADE
);

CREATE TABLE ExperimentCondition (
  id INT PRIMARY KEY AUTO_INCREMENT,
  condition_name NVARCHAR(50)
);




CREATE TABLE Experiment (
  id INT PRIMARY KEY AUTO_INCREMENT,
  chemical_1 INT,
  chemical_2 INT,
  condition_id INT,
  description NVARCHAR(255),
  FOREIGN KEY (chemical_1) REFERENCES Chemicals(id),
  FOREIGN KEY (chemical_2) REFERENCES Chemicals(id),
  FOREIGN KEY (condition_id) REFERENCES ExperimentCondition(id)
);
CREATE TABLE ExperimentResult (
  id INT PRIMARY KEY AUTO_INCREMENT,
  experiment_id INT,
  result_text NVARCHAR(50),
  FOREIGN KEY (experiment_id) REFERENCES Experiment(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS lession (
id INT PRIMARY KEY AUTO_INCREMENT ,
title TEXT DEFAULT NULL ,
created_at datetime DEFAULT NULL 
);
CREATE TABLE IF NOT EXISTS datas(
id INT PRIMARY KEY AUTO_INCREMENT ,
lession_id INT DEFAULT NULL , 
subtitle TEXT DEFAULT NULL , 
content TEXT DEFAULT NULL , 
image TEXT DEFAULT NULL , 
 CONSTRAINT `fk_lession`  FOREIGN KEY (lession_id) REFERENCES lession (id) 
);

 -- INSERT DATA 
 INSERT INTO Types  (name, description) VALUES
('Khí hiếm', 'Nhóm khí trơ'),
('Kim loại kiềm', 'Kim loại mạnh, phản ứng với nước'),
('Kim loại kiềm thổ', 'Ít hoạt động hơn kim loại kiềm'),
('Halogen', 'Nhóm phi kim hoạt động mạnh'),
('Kim loại chuyển tiếp', 'Kim loại bền, dẫn điện tốt'),
('Phi kim', 'Không dẫn điện, dễ bay hơi'),
('Kim loại yếu', 'Dẫn điện kém hơn kim loại chuyển tiếp'),
('Đất hiếm', 'Nguyên tố hiếm, dùng trong công nghiệp'),
('Actini', 'Nguyên tố phóng xạ nặng'),
('Axit', 'Các hợp chất có tính axit, có thể ăn mòn và phản ứng với bazơ'),
('Bazơ', 'Các hợp chất có tính kiềm, thường phản ứng với axit để tạo muối và nước'),
('Muối', 'Hợp chất được tạo thành từ phản ứng giữa axit và bazơ'),
('Hợp chất', 'Các hợp chất hóa học khác không thuộc nhóm trên');


INSERT INTO Chemicals (name, atomic_weight, symbol, type_id, hazard_infor, status) VALUES
-- Nhóm Khí hiếm (type_id = 1)
('Heli', 4.0026, 'He', 1, 'Không độc, không cháy', 'Ổn định'),
('Neon', 20.180, 'Ne', 1, 'Không độc, không cháy', 'Ổn định'),
('Argon', 39.948, 'Ar', 1, 'Không độc, không cháy', 'Ổn định'),
('Krypton', 83.798, 'Kr', 1, 'Không độc, không cháy', 'Ổn định'),
('Xenon', 131.293, 'Xe', 1, 'Không độc, không cháy', 'Ổn định'),

-- Nhóm Kim loại kiềm (type_id = 2)
('Liti', 6.94, 'Li', 2, 'Phản ứng mạnh với nước', 'Dễ cháy'),
('Natri', 22.990, 'Na', 2, 'Phản ứng mạnh với nước', 'Dễ cháy'),
('Kali', 39.098, 'K', 2, 'Phản ứng mạnh với nước', 'Dễ cháy'),

-- Nhóm Kim loại kiềm thổ (type_id = 3)
('Beri', 9.0122, 'Be', 3, 'Độc, có thể gây kích ứng', 'Ổn định'),
('Magie', 24.305, 'Mg', 3, 'Cháy mạnh khi đốt', 'Ổn định'),
('Canxi', 40.078, 'Ca', 3, 'Phản ứng nhẹ với nước', 'Ổn định'),

-- Nhóm Halogen (type_id = 4)
('Flo', 18.998, 'F', 4, 'Rất độc, ăn mòn', 'Nguy hiểm'),
('Clo', 35.450, 'Cl', 4, 'Độc, gây kích ứng hô hấp', 'Nguy hiểm'),
('Brom', 79.904, 'Br', 4, 'Độc, gây kích ứng da', 'Nguy hiểm'),

-- Nhóm Kim loại chuyển tiếp (type_id = 5)
('Sắt', 55.845, 'Fe', 5, 'Không độc', 'Ổn định'),
('Đồng', 63.546, 'Cu', 5, 'Không độc, có thể gây dị ứng', 'Ổn định'),
('Kẽm', 65.38, 'Zn', 5, 'Không độc', 'Ổn định'),
('Vàng', 196.967, 'Au', 5, 'Không độc', 'Ổn định'),
('Bạc', 107.8682, 'Ag', 5, 'Không độc', 'Ổn định'),

-- Nhóm Phi kim (type_id = 6)
('Hydro', 1.008, 'H', 6, 'Dễ cháy', 'Dễ cháy'),
('Carbon', 12.011, 'C', 6, 'Không độc', 'Ổn định'),
('Oxy', 15.999, 'O', 6, 'Hỗ trợ cháy', 'Ổn định'),
('Lưu huỳnh', 32.06, 'S', 6, 'Gây kích ứng khi hít phải', 'Ổn định'),

-- Nhóm Kim loại yếu (type_id = 7)
('Nhôm', 26.982, 'Al', 7, 'Không độc', 'Ổn định'),
('Thiếc', 118.710, 'Sn', 7, 'Không độc', 'Ổn định'),

-- Nhóm Đất hiếm (type_id = 8)
('Lanthan', 138.905, 'La', 8, 'Không độc', 'Ổn định'),
('Neodymi', 144.242, 'Nd', 8, 'Không độc', 'Ổn định'),

-- Nhóm Actini (type_id = 9)
('Actini', 227, 'Ac', 9, 'Phóng xạ', 'Nguy hiểm'),
('Uranium', 238.0289, 'U', 9, 'Phóng xạ', 'Nguy hiểm'),
-- Nhóm hợp chất 
-- Nhóm nước
('Nước', 18.015, 'H2O', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Không độc, cần thiết cho sự sống', 'Ổn định'),

-- Nhóm Axit
('Axit Clohidric', 36.46, 'HCl', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn mạnh, có thể gây bỏng da', 'Ổn định'),
('Axit Sulfuric', 98.079, 'H2SO4', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn mạnh, có thể gây bỏng nặng', 'Ổn định'),
('Axit Nitric', 63.01, 'HNO3', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn mạnh, gây bỏng hóa học', 'Không ổn định dưới nhiệt độ cao'),
('Axit Axetic', 60.05, 'CH3COOH', (SELECT id FROM Types WHERE name = 'Axit'), 'Ít độc, có mùi đặc trưng', 'Ổn định'),
('Axit Photphoric', 97.994, 'H3PO4', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn nhẹ, có thể gây kích ứng', 'Ổn định'),

-- Nhóm Bazơ
('Natri Hydroxide', 39.997, 'NaOH', (SELECT id FROM Types WHERE name = 'Bazơ'), 'Ăn mòn mạnh, gây bỏng da', 'Ổn định'),
('Kali Hydroxide', 56.11, 'KOH', (SELECT id FROM Types WHERE name = 'Bazơ'), 'Ăn mòn mạnh, nguy hiểm khi tiếp xúc', 'Ổn định'),

-- Nhóm Muối
('Natri Clorua', 58.44, 'NaCl', (SELECT id FROM Types WHERE name = 'Muối'), 'Không độc, tan tốt trong nước', 'Ổn định'),
('Canxi Carbonat', 100.086, 'CaCO3', (SELECT id FROM Types WHERE name = 'Muối'), 'Không độc, tan kém trong nước', 'Ổn định'),
('Natri Bicarbonat', 84.006, 'NaHCO3', (SELECT id FROM Types WHERE name = 'Muối'), 'Không độc, dùng trong thực phẩm', 'Ổn định'),

-- Nhóm Hợp chất khác
('Amoniac', 17.031, 'NH3', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Khí độc, gây kích ứng mạnh', 'Không ổn định ở nhiệt độ cao'),
('Carbon Dioxide', 44.01, 'CO2', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Không độc ở nồng độ thấp, gây ngạt ở nồng độ cao', 'Ổn định'),
('Lưu huỳnh Dioxide', 64.07, 'SO2', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Gây kích ứng mắt và đường hô hấp', 'Không ổn định dưới nhiệt độ cao');

INSERT INTO ExperimentCondition (condition_name) VALUES
('Nhiệt độ thường'),
('Đun nóng'),
('Môi trường nước'),
('Có ánh sáng'),
('Môi trường axit'),
('Môi trường kiềm');



-- Giả sử chemical_1 = Natri (id = 7), chemical_2 = Axit Clohidric (id = 30), condition = 'Nhiệt độ thường' (id = 1)
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description) VALUES
(7, 30, 1, 'Phản ứng giữa Natri và HCl tạo ra khí Hydro và muối Natri Clorua'),

(6, 32, 1, 'Liti phản ứng với Axit Nitric tạo khí và dung dịch muối'),

(35, 30, 1, 'Phản ứng trung hòa giữa NaOH và HCl'),

(8, 31, 5, 'Phản ứng giữa Kali và Axit Sulfuric tạo khí Hydro'),

(36, 31, 2, 'Phản ứng giữa KOH và H2SO4 tạo muối Kali Sulfat'),

(30, 2, 1, 'Axit Clohidric không phản ứng với khí hiếm Neon');
-- Experiment ID = 1
INSERT INTO ExperimentResult (experiment_id, result_text) VALUES
(1, 'Tỏa nhiệt'),
(1, 'Tạo khí'),
(1, 'Dung dịch không màu');

-- Experiment ID = 2
INSERT INTO ExperimentResult (experiment_id, result_text) VALUES
(2, 'Tạo khí'),
(2, 'Bong bóng khí nổi');

-- Experiment ID = 3
INSERT INTO ExperimentResult (experiment_id, result_text) VALUES
(3, 'Phản ứng trung hòa'),
(3, 'Tạo muối và nước');

-- Experiment ID = 4
INSERT INTO ExperimentResult (experiment_id, result_text) VALUES
(4, 'Phản ứng mạnh'),
(4, 'Tỏa nhiệt'),
(4, 'Tạo khí');

-- Experiment ID = 5
INSERT INTO ExperimentResult (experiment_id, result_text) VALUES
(5, 'Tỏa nhiệt mạnh'),
(5, 'Tạo kết tủa trắng');

-- Experiment ID = 6
INSERT INTO ExperimentResult (experiment_id, result_text) VALUES
(6, 'Không phản ứng');
