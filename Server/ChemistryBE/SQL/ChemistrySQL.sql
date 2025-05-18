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
image TEXT DEFAULT NULL , 
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


INSERT INTO Chemicals (name, atomic_weight, symbol, type_id, hazard_infor, status, description, image)
VALUES
-- Khí hiếm (type_id = 1)
('Helium', 4.0026, 'He', 1, 'An toàn, không phản ứng', 'Còn hàng', 'Khí hiếm không màu, dùng trong làm mát', 'https://upload.wikimedia.org/wikipedia/commons/8/84/Electron_shell_002_Helium_-_no_label.svg'),
('Neon', 20.180, 'Ne', 1, 'An toàn', 'Còn hàng', 'Khí hiếm dùng trong đèn', 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Electron_shell_010_Neon_-_no_label.svg'),
('Argon', 39.948, 'Ar', 1, 'An toàn', 'Còn hàng', 'Khí hiếm dùng trong hàn và đèn', 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Electron_shell_018_Argon_-_no_label.svg'),

-- Kim loại kiềm (type_id = 2)
('Lithium', 6.94, 'Li', 2, 'Phản ứng với nước, dễ cháy', 'Cẩn thận', 'Kim loại nhẹ, dùng trong pin', 'https://upload.wikimedia.org/wikipedia/commons/a/ae/Electron_shell_003_Lithium_-_no_label.svg'),
('Sodium', 22.990, 'Na', 2, 'Phản ứng mạnh với nước', 'Cẩn thận', 'Kim loại mềm, dẫn điện tốt', 'https://upload.wikimedia.org/wikipedia/commons/8/87/Electron_shell_011_Sodium_-_no_label.svg'),
('Potassium', 39.098, 'K', 2, 'Phản ứng mạnh với nước', 'Nguy hiểm', 'Kim loại mềm, màu bạc', 'https://upload.wikimedia.org/wikipedia/commons/9/92/Electron_shell_019_Potassium_-_no_label.svg'),

-- Kim loại kiềm thổ (type_id = 3)
('Beryllium', 9.0122, 'Be', 3, 'Độc hại khi hít phải', 'Nguy hiểm', 'Kim loại nhẹ, cứng, dùng trong hợp kim', 'https://upload.wikimedia.org/wikipedia/commons/4/40/Electron_shell_004_Beryllium_-_no_label.svg'),
('Magnesium', 24.305, 'Mg', 3, 'Dễ cháy ở dạng bột', 'Cẩn thận', 'Dùng trong pháo sáng và hợp kim nhẹ', 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Electron_shell_012_Magnesium_-_no_label.svg'),
('Calcium', 40.078, 'Ca', 3, 'Phản ứng với nước', 'Cẩn thận', 'Kim loại kiềm thổ, cần thiết cho xương', 'https://upload.wikimedia.org/wikipedia/commons/5/57/Electron_shell_020_Calcium_-_no_label.svg'),

-- Halogen (type_id = 4)
('Fluorine', 18.998, 'F', 4, 'Rất độc, ăn mòn cao', 'Nguy hiểm', 'Halogen mạnh nhất, màu vàng nhạt', 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Electron_shell_009_Fluorine_-_no_label.svg	'),
('Chlorine', 35.45, 'Cl', 4, 'Khí độc, gây ngạt', 'Nguy hiểm', 'Khí halogen, dùng trong xử lý nước', 'https://upload.wikimedia.org/wikipedia/commons/1/17/Electron_shell_017_Chlorine_-_no_label.svg'),

-- Phi kim (type_id = 6)
('Hydrogen', 1.008, 'H', 6, 'Dễ cháy nổ khi kết hợp với oxy', 'Còn hàng', 'Nguyên tố nhẹ nhất, phổ biến trong vũ trụ', 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Electron_shell_001_Hydrogen_-_no_label.svg'),
('Carbon', 12.011, 'C', 6, 'Không độc ở dạng than/kc', 'Còn hàng', 'Nguyên tố cơ bản của sự sống', 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Electron_shell_006_Carbon_-_no_label.svg'),
('Nitrogen', 14.007, 'N', 6, 'Không độc, nhưng có thể gây ngạt', 'Còn hàng', 'Khí chiếm phần lớn khí quyển', 'https://upload.wikimedia.org/wikipedia/commons/6/69/Electron_shell_007_Nitrogen_-_no_label.svg'),
('Oxygen', 15.999, 'O', 6, 'Hỗ trợ cháy, không độc', 'Còn hàng', 'Cần thiết cho sự sống', 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Electron_shell_008_Oxygen_-_no_label.svg'),
('Phosphorus', 30.974, 'P', 6, 'Trắng rất độc, dễ cháy', 'Nguy hiểm', 'Phi kim, cần thiết cho sinh học', 'https://upload.wikimedia.org/wikipedia/commons/0/09/Electron_shell_015_Phosphorus_-_no_label.svg'),
('Sulfur', 32.06, 'S', 6, 'Gây kích ứng', 'Cẩn thận', 'Chất rắn màu vàng, dùng trong công nghiệp', 'https://upload.wikimedia.org/wikipedia/commons/9/96/Electron_shell_016_Sulfur_-_no_label.svg'),
('Silicon', 28.085, 'Si', 6, 'Không độc', 'Còn hàng', 'Dùng nhiều trong công nghệ bán dẫn', 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Electron_shell_014_Silicon_-_no_label.svg'),
('Boron', 10.81, 'B', 6, 'Không độc, nhưng bụi có thể gây hại', 'Còn hàng', 'Phi kim, dùng trong chất bán dẫn', 'https://upload.wikimedia.org/wikipedia/commons/8/89/Electron_shell_005_Boron_-_no_label.svg'),
('Iron', 55.845, 'Fe', 5, 'Không độc', 'Còn hàng', 'Kim loại phổ biến, dùng làm thép', 'https://upload.wikimedia.org/wikipedia/commons/c/c6/Electron_shell_026_Iron_-_no_label.svg'),
('Copper', 63.546, 'Cu', 5, 'Không độc', 'Còn hàng', 'Kim loại dẫn điện tốt, màu đỏ nâu', 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Electron_shell_029_Copper_-_no_label.svg'),
('Zinc', 65.38, 'Zn', 5, 'Không độc', 'Còn hàng', 'Chống ăn mòn, dùng mạ kim loại', 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Electron_shell_030_Zinc_-_no_label.svg'),
('Nickel', 58.693, 'Ni', 5, 'Có thể gây dị ứng', 'Còn hàng', 'Kim loại bền, chống ăn mòn', 'https://upload.wikimedia.org/wikipedia/commons/d/d2/Electron_shell_028_Nickel_-_no_label.svg'),
('Chromium', 51.996, 'Cr', 5, 'Một số dạng độc', 'Cẩn thận', 'Tạo độ bóng cho thép không gỉ', 'https://upload.wikimedia.org/wikipedia/commons/6/67/Electron_shell_024_Chromium_-_no_label.svg'),

-- Kim loại yếu (type_id = 7)
('Aluminum', 26.982, 'Al', 7, 'Không độc', 'Còn hàng', 'Kim loại nhẹ, không gỉ', 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Electron_shell_013_Aluminium_-_no_label.svg'),
('Lead', 207.2, 'Pb', 7, 'Rất độc nếu hấp thụ lâu dài', 'Nguy hiểm', 'Kim loại nặng, từng dùng trong sơn', 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Electron_shell_082_Lead_-_no_label.svg'),
('Tin', 118.71, 'Sn', 7, 'Không độc', 'Còn hàng', 'Dùng phủ bảo vệ kim loại khác', 'https://upload.wikimedia.org/wikipedia/commons/1/13/Electron_shell_050_Tin_-_no_label.svg'),

-- Đất hiếm (type_id = 8)

('Lanthanum', 138.91, 'La', 8, 'Không độc ở lượng nhỏ', 'Còn hàng', 'Dùng trong pin, xúc tác', 'https://upload.wikimedia.org/wikipedia/commons/1/14/Electron_shell_057_Lanthanum_-_no_label.svg'),
('Cerium', 140.12, 'Ce', 8, 'Không độc', 'Còn hàng', 'Dùng trong kính và chất xúc tác', 'https://upload.wikimedia.org/wikipedia/commons/e/ea/Electron_shell_058_Cerium_-_no_label.svg'),
('Neodymium', 144.24, 'Nd', 8, 'Không độc', 'Còn hàng', 'Dùng trong nam châm mạnh', 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Electron_shell_060_Neodymium_-_no_label.svg'),

-- Actini (type_id = 9)

('Uranium', 238.03, 'U', 9, 'Phóng xạ, độc hại', 'Nguy hiểm', 'Dùng trong năng lượng hạt nhân', 'https://upload.wikimedia.org/wikipedia/commons/4/40/Electron_shell_092_Uranium_-_no_label.svg'),
('Thorium', 232.04, 'Th', 9, 'Phóng xạ yếu', 'Nguy hiểm', 'Tiềm năng trong năng lượng hạt nhân sạch', 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Electron_shell_090_Thorium_-_no_label.svg'),
('Plutonium', 244, 'Pu', 9, 'Rất phóng xạ, cực độc', 'Nguy hiểm', 'Dùng trong vũ khí và năng lượng hạt nhân', 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Electron_shell_094_Plutonium_-_no_label.svg');

INSERT INTO ExperimentCondition ( description) VALUES
( 'Nhiệt độ phòng'),
('Đun nóng'),
( 'Trong dung dịch nước'),
( 'Trong không khí'),
( 'Trong môi trường không có oxy');

-- Phản ứng giữa Na và H2O
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description)
VALUES (1, 23, 3, 'Natri phản ứng với nước tạo ra khí hydro và bazơ');

-- Phản ứng giữa Fe và S
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description)
VALUES (6, 20, 2, 'Sắt phản ứng với lưu huỳnh khi đun nóng tạo FeS');

-- Phản ứng giữa HCl và NaOH
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description)
VALUES (16, 25, 3, 'Phản ứng trung hòa tạo muối và nước');

-- Phản ứng giữa H2SO4 và CaCO3
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description)
VALUES (17, 28, 3, 'Phản ứng tạo khí CO₂, muối và nước');

-- Phản ứng giữa Ba(OH)2 và H2SO4
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description)
VALUES (26, 17, 3, 'Phản ứng tạo kết tủa BaSO₄');

-- Phản ứng giữa Cu và HNO3
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description)
VALUES (7, 18, 3, 'Đồng bị oxi hóa bởi axit nitric, tạo NO₂');

-- Phản ứng giữa CH₄ và O₂
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description)
VALUES (31, 21, 4, 'Đốt cháy methane tạo CO₂ và H₂O');

INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES
(1, 'Tạo khí hydro'),
(2, 'Tạo hợp chất sắt sunfua'),
(3, 'Tạo muối và nước'),
(4, 'Tạo CO2 và sủi bọt'),
(5, 'Kết tủa trắng'),
(6, 'Tạo khí độc màu nâu'),
(7, 'Cháy tạo CO2 và nước');

