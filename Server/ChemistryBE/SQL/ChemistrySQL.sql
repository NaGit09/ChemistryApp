CREATE DATABASE IF NOT exists CHEMISTRY;
USE CHEMISTRY;
-- CREATE TABLE USER 
CREATE TABLE IF NOT EXISTS Users
(
    user_id       INT PRIMARY KEY AUTO_INCREMENT,
    full_name     VARCHAR(255)                              NOT NULL,
    email         VARCHAR(255) UNIQUE                       NOT NULL,
    password_hash VARCHAR(255)                              NOT NULL,
    role          ENUM ('student', 'teacher', 'researcher') NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- CREATE TABLE type 
CREATE TABLE IF NOT EXISTS Types
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        nvarchar(50) DEFAULT NULL,
    description TEXT         DEFAULT NULL
);
-- CREATE TABKE Chemicals 
CREATE TABLE IF NOT EXISTS Chemicals
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    name          NVARCHAR(50) DEFAULT NULL,
    atomic_weight DOUBLE       DEFAULT NULL,
    symbol        NVARCHAR(50) DEFAULT NULL,
    type_id       INT          DEFAULT NULL,
    hazard_infor  NVARCHAR(255),
    status        NVARCHAR(255),
    description   TEXT         DEFAULT NULL,
    image         TEXT         DEFAULT NULL,
    FOREIGN KEY (type_id) REFERENCES Types (id) ON DELETE CASCADE
);

CREATE TABLE ExperimentCondition
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    condition_name NVARCHAR(50)
);



CREATE TABLE Experiment
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    chemical_1   INT,
    chemical_2   INT,
    condition_id INT,
    description  NVARCHAR(255),
    FOREIGN KEY (chemical_1) REFERENCES Chemicals (id),
    FOREIGN KEY (chemical_2) REFERENCES Chemicals (id),
    FOREIGN KEY (condition_id) REFERENCES ExperimentCondition (id)
);
CREATE TABLE ExperimentResult
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    experiment_id INT,
    result_text   NVARCHAR(50),
    FOREIGN KEY (experiment_id) REFERENCES Experiment (id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS lession
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    title      TEXT     DEFAULT NULL,
    created_at datetime DEFAULT NULL
);
CREATE TABLE IF NOT EXISTS datas
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    lession_id INT  DEFAULT NULL,
    subtitle   TEXT DEFAULT NULL,
    content    TEXT DEFAULT NULL,
    image      TEXT DEFAULT NULL,
    CONSTRAINT `fk_lession` FOREIGN KEY (lession_id) REFERENCES lession (id)
);

-- INSERT DATA
INSERT INTO Types (name, description)
VALUES ('Khí hiếm', 'Nhóm khí trơ'),
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
('Helium', 4.0026, 'He', 1, 'An toàn, không phản ứng', 'Còn hàng', 'Khí hiếm không màu, dùng trong làm mát',
 'https://upload.wikimedia.org/wikipedia/commons/8/84/Electron_shell_002_Helium_-_no_label.svg'),
('Neon', 20.180, 'Ne', 1, 'An toàn', 'Còn hàng', 'Khí hiếm dùng trong đèn',
 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Electron_shell_010_Neon_-_no_label.svg'),
('Argon', 39.948, 'Ar', 1, 'An toàn', 'Còn hàng', 'Khí hiếm dùng trong hàn và đèn',
 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Electron_shell_018_Argon_-_no_label.svg'),

-- Kim loại kiềm (type_id = 2)
('Lithium', 6.94, 'Li', 2, 'Phản ứng với nước, dễ cháy', 'Cẩn thận', 'Kim loại nhẹ, dùng trong pin',
 'https://upload.wikimedia.org/wikipedia/commons/a/ae/Electron_shell_003_Lithium_-_no_label.svg'),
('Sodium', 22.990, 'Na', 2, 'Phản ứng mạnh với nước', 'Cẩn thận', 'Kim loại mềm, dẫn điện tốt',
 'https://upload.wikimedia.org/wikipedia/commons/8/87/Electron_shell_011_Sodium_-_no_label.svg'),
('Potassium', 39.098, 'K', 2, 'Phản ứng mạnh với nước', 'Nguy hiểm', 'Kim loại mềm, màu bạc',
 'https://upload.wikimedia.org/wikipedia/commons/9/92/Electron_shell_019_Potassium_-_no_label.svg'),

-- Kim loại kiềm thổ (type_id = 3)
('Beryllium', 9.0122, 'Be', 3, 'Độc hại khi hít phải', 'Nguy hiểm', 'Kim loại nhẹ, cứng, dùng trong hợp kim',
 'https://upload.wikimedia.org/wikipedia/commons/4/40/Electron_shell_004_Beryllium_-_no_label.svg'),
('Magnesium', 24.305, 'Mg', 3, 'Dễ cháy ở dạng bột', 'Cẩn thận', 'Dùng trong pháo sáng và hợp kim nhẹ',
 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Electron_shell_012_Magnesium_-_no_label.svg'),
('Calcium', 40.078, 'Ca', 3, 'Phản ứng với nước', 'Cẩn thận', 'Kim loại kiềm thổ, cần thiết cho xương',
 'https://upload.wikimedia.org/wikipedia/commons/5/57/Electron_shell_020_Calcium_-_no_label.svg'),

-- Halogen (type_id = 4)
('Fluorine', 18.998, 'F', 4, 'Rất độc, ăn mòn cao', 'Nguy hiểm', 'Halogen mạnh nhất, màu vàng nhạt',
 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Electron_shell_009_Fluorine_-_no_label.svg	'),
('Chlorine', 35.45, 'Cl', 4, 'Khí độc, gây ngạt', 'Nguy hiểm', 'Khí halogen, dùng trong xử lý nước',
 'https://upload.wikimedia.org/wikipedia/commons/1/17/Electron_shell_017_Chlorine_-_no_label.svg'),

-- Phi kim (type_id = 6)
('Hydrogen', 1.008, 'H', 6, 'Dễ cháy nổ khi kết hợp với oxy', 'Còn hàng', 'Nguyên tố nhẹ nhất, phổ biến trong vũ trụ',
 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Electron_shell_001_Hydrogen_-_no_label.svg'),
('Carbon', 12.011, 'C', 6, 'Không độc ở dạng than/kc', 'Còn hàng', 'Nguyên tố cơ bản của sự sống',
 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Electron_shell_006_Carbon_-_no_label.svg'),
('Nitrogen', 14.007, 'N', 6, 'Không độc, nhưng có thể gây ngạt', 'Còn hàng', 'Khí chiếm phần lớn khí quyển',
 'https://upload.wikimedia.org/wikipedia/commons/6/69/Electron_shell_007_Nitrogen_-_no_label.svg'),
('Oxygen', 15.999, 'O', 6, 'Hỗ trợ cháy, không độc', 'Còn hàng', 'Cần thiết cho sự sống',
 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Electron_shell_008_Oxygen_-_no_label.svg'),
('Phosphorus', 30.974, 'P', 6, 'Trắng rất độc, dễ cháy', 'Nguy hiểm', 'Phi kim, cần thiết cho sinh học',
 'https://upload.wikimedia.org/wikipedia/commons/0/09/Electron_shell_015_Phosphorus_-_no_label.svg'),
('Sulfur', 32.06, 'S', 6, 'Gây kích ứng', 'Cẩn thận', 'Chất rắn màu vàng, dùng trong công nghiệp',
 'https://upload.wikimedia.org/wikipedia/commons/9/96/Electron_shell_016_Sulfur_-_no_label.svg'),
('Silicon', 28.085, 'Si', 6, 'Không độc', 'Còn hàng', 'Dùng nhiều trong công nghệ bán dẫn',
 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Electron_shell_014_Silicon_-_no_label.svg'),
('Boron', 10.81, 'B', 6, 'Không độc, nhưng bụi có thể gây hại', 'Còn hàng', 'Phi kim, dùng trong chất bán dẫn',
 'https://upload.wikimedia.org/wikipedia/commons/8/89/Electron_shell_005_Boron_-_no_label.svg'),
('Iron', 55.845, 'Fe', 5, 'Không độc', 'Còn hàng', 'Kim loại phổ biến, dùng làm thép',
 'https://upload.wikimedia.org/wikipedia/commons/c/c6/Electron_shell_026_Iron_-_no_label.svg'),
('Copper', 63.546, 'Cu', 5, 'Không độc', 'Còn hàng', 'Kim loại dẫn điện tốt, màu đỏ nâu',
 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Electron_shell_029_Copper_-_no_label.svg'),
('Zinc', 65.38, 'Zn', 5, 'Không độc', 'Còn hàng', 'Chống ăn mòn, dùng mạ kim loại',
 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Electron_shell_030_Zinc_-_no_label.svg'),
('Nickel', 58.693, 'Ni', 5, 'Có thể gây dị ứng', 'Còn hàng', 'Kim loại bền, chống ăn mòn',
 'https://upload.wikimedia.org/wikipedia/commons/d/d2/Electron_shell_028_Nickel_-_no_label.svg'),
('Chromium', 51.996, 'Cr', 5, 'Một số dạng độc', 'Cẩn thận', 'Tạo độ bóng cho thép không gỉ',
 'https://upload.wikimedia.org/wikipedia/commons/6/67/Electron_shell_024_Chromium_-_no_label.svg'),

-- Kim loại yếu (type_id = 7)
('Aluminum', 26.982, 'Al', 7, 'Không độc', 'Còn hàng', 'Kim loại nhẹ, không gỉ',
 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Electron_shell_013_Aluminium_-_no_label.svg'),
('Lead', 207.2, 'Pb', 7, 'Rất độc nếu hấp thụ lâu dài', 'Nguy hiểm', 'Kim loại nặng, từng dùng trong sơn',
 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Electron_shell_082_Lead_-_no_label.svg'),
('Tin', 118.71, 'Sn', 7, 'Không độc', 'Còn hàng', 'Dùng phủ bảo vệ kim loại khác',
 'https://upload.wikimedia.org/wikipedia/commons/1/13/Electron_shell_050_Tin_-_no_label.svg'),

-- Đất hiếm (type_id = 8)

('Lanthanum', 138.91, 'La', 8, 'Không độc ở lượng nhỏ', 'Còn hàng', 'Dùng trong pin, xúc tác',
 'https://upload.wikimedia.org/wikipedia/commons/1/14/Electron_shell_057_Lanthanum_-_no_label.svg'),
('Cerium', 140.12, 'Ce', 8, 'Không độc', 'Còn hàng', 'Dùng trong kính và chất xúc tác',
 'https://upload.wikimedia.org/wikipedia/commons/e/ea/Electron_shell_058_Cerium_-_no_label.svg'),
('Neodymium', 144.24, 'Nd', 8, 'Không độc', 'Còn hàng', 'Dùng trong nam châm mạnh',
 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Electron_shell_060_Neodymium_-_no_label.svg'),

-- Actini (type_id = 9)

('Uranium', 238.03, 'U', 9, 'Phóng xạ, độc hại', 'Nguy hiểm', 'Dùng trong năng lượng hạt nhân',
 'https://upload.wikimedia.org/wikipedia/commons/4/40/Electron_shell_092_Uranium_-_no_label.svg'),
('Thorium', 232.04, 'Th', 9, 'Phóng xạ yếu', 'Nguy hiểm', 'Tiềm năng trong năng lượng hạt nhân sạch',
 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Electron_shell_090_Thorium_-_no_label.svg'),
('Plutonium', 244, 'Pu', 9, 'Rất phóng xạ, cực độc', 'Nguy hiểm', 'Dùng trong vũ khí và năng lượng hạt nhân',
 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Electron_shell_094_Plutonium_-_no_label.svg')
        ,
-- Nhóm hợp chất 
('Nước', 18.015, 'H2O', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Không độc, cần thiết cho sự sống', 'Ổn định', 'Hợp chất phổ biến nhất trên Trái Đất, cần thiết cho mọi dạng sống.' , 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Water_drop_001.jpg'),
('Axit Clohidric', 36.46, 'HCl', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn mạnh, có thể gây bỏng da', 'Ổn định', 'Axit mạnh được dùng phổ biến trong công nghiệp và phòng thí nghiệm.' , 'https://upload.wikimedia.org/wikipedia/commons/d/da/Hydrochloric_acid_01.jpg'),
('Axit Sulfuric', 98.079, 'H2SO4', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn mạnh, có thể gây bỏng nặng', 'Ổn định', 'Dùng để sản xuất phân bón, chất tẩy rửa và trong ngành hóa chất.' , 'https://upload.wikimedia.org/wikipedia/commons/b/b6/Sulphuric_acid_96_percent_extra_pure.jpg'),
('Axit Nitric', 63.01, 'HNO3', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn mạnh, gây bỏng hóa học', 'Không ổn định dưới nhiệt độ cao', 'Được sử dụng để sản xuất phân đạm và thuốc nổ.'),
('Axit Axetic', 60.05, 'CH3COOH', (SELECT id FROM Types WHERE name = 'Axit'), 'Ít độc, có mùi đặc trưng', 'Ổn định', 'Là thành phần chính của giấm ăn, dùng trong công nghiệp thực phẩm và hóa chất.'),
('Axit Photphoric', 97.994, 'H3PO4', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn nhẹ, có thể gây kích ứng', 'Ổn định', 'Sử dụng trong thực phẩm, dược phẩm và sản xuất phân bón.'),
('Natri Hydroxide', 39.997, 'NaOH', (SELECT id FROM Types WHERE name = 'Bazơ'), 'Ăn mòn mạnh, gây bỏng da', 'Ổn định', 'Bazơ mạnh, được sử dụng trong sản xuất xà phòng và tẩy rửa.'),
('Kali Hydroxide', 56.11, 'KOH', (SELECT id FROM Types WHERE name = 'Bazơ'), 'Ăn mòn mạnh, nguy hiểm khi tiếp xúc', 'Ổn định', 'Dùng để sản xuất pin kiềm và xà phòng lỏng.'),
('Natri Clorua', 58.44, 'NaCl', (SELECT id FROM Types WHERE name = 'Muối'), 'Không độc, tan tốt trong nước', 'Ổn định', 'Tên gọi thông thường là muối ăn, thiết yếu cho sự sống con người.'),
('Canxi Carbonat', 100.086, 'CaCO3', (SELECT id FROM Types WHERE name = 'Muối'), 'Không độc, tan kém trong nước', 'Ổn định', 'Được tìm thấy trong đá vôi, vỏ sò, dùng trong xây dựng và thực phẩm.'),
('Natri Bicarbonat', 84.006, 'NaHCO3', (SELECT id FROM Types WHERE name = 'Muối'), 'Không độc, dùng trong thực phẩm', 'Ổn định', 'Còn gọi là baking soda, được dùng trong nấu ăn và làm sạch.'),
('Amoniac', 17.031, 'NH3', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Khí độc, gây kích ứng mạnh', 'Không ổn định ở nhiệt độ cao', 'Ứng dụng rộng rãi trong công nghiệp phân bón và làm lạnh.'),
('Carbon Dioxide', 44.01, 'CO2', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Không độc ở nồng độ thấp, gây ngạt ở nồng độ cao', 'Ổn định', 'Khí nhà kính phổ biến, sản phẩm phụ của quá trình hô hấp và đốt cháy.'),
('Lưu huỳnh Dioxide', 64.07, 'SO2', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Gây kích ứng mắt và đường hô hấp', 'Không ổn định dưới nhiệt độ cao', 'Khí độc, phát sinh từ đốt nhiên liệu hóa thạch, gây mưa axit.'),
('AgNO3', 169.87, 'AgNO3', (SELECT id FROM Types WHERE name = 'Muối'), 'Có thể ăn mòn, gây kích ứng da', 'Ổn định', 'Dùng trong phản ứng tráng bạc và sản xuất thuốc.');

INSERT INTO ExperimentCondition (condition_name)
VALUES ('Nhiệt độ thường'),
       ('Đun nóng'),
       ('Môi trường nước'),
       ('Có ánh sáng'),
       ('Môi trường axit'),
       ('Môi trường kiềm');

-- Giả sử chemical_1 = Natri (id = 7), chemical_2 = Axit Clohidric (id = 30), condition = 'Nhiệt độ thường' (id = 1)
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description)
VALUES (7, 30, 1, 'Phản ứng giữa Natri và HCl tạo ra khí Hydro và muối Natri Clorua'),
       (6, 32, 1, 'Liti phản ứng với Axit Nitric tạo khí và dung dịch muối'),
       (35, 30, 1, 'Phản ứng trung hòa giữa NaOH và HCl'),
       (8, 31, 5, 'Phản ứng giữa Kali và Axit Sulfuric tạo khí Hydro'),
       (36, 31, 2, 'Phản ứng giữa KOH và H2SO4 tạo muối Kali Sulfat'),
       (30, 2, 1, 'Axit Clohidric không phản ứng với khí hiếm Neon'),
       (37, 34, 3, 'Natri Clorua phản ứng với Axit Photphoric - không có phản ứng xảy ra'),
       (44, 29, 6, 'CuSO4 phản ứng với Đồng - không có phản ứng xảy ra'),
       (29, 42, 1, 'Đồng phản ứng với Lưu huỳnh Dioxide - không có phản ứng xảy ra'),
       (29, 26, 1, 'Đồng phản ứng với Sắt - không có phản ứng xảy ra'),
       (44, 40, 6, 'CuSO4 phản ứng với Amoniac - tạo phức màu xanh đậm'),
       (28, 42, 6, 'Kẽm phản ứng với Lưu huỳnh Dioxide - không có phản ứng xảy ra'),
       (6, 43, 1, 'Liti phản ứng với AgNO3 - tạo kết tủa xám và dung dịch không màu'),
       (44, 26, 2, 'CuSO4 phản ứng với Sắt - tạo kết tủa màu đỏ nâu'),
       (42, 43, 1, 'Lưu huỳnh Dioxide phản ứng với AgNO3 - không có phản ứng xảy ra'),
       (35, 6, 2, 'Natri Hydroxide phản ứng với Liti - không có phản ứng xảy ra'),
       (35, 28, 3, 'Natri Hydroxide phản ứng với Kẽm - tạo dung dịch không màu'),
       (39, 44, 3, 'Natri Bicarbonat phản ứng với CuSO4 - không có phản ứng xảy ra'),
       (40, 41, 1, 'Amoniac phản ứng với Carbon Dioxide - tạo muối amoni'),
       (8, 38, 2, 'Kali phản ứng với Canxi Carbonat - không có phản ứng xảy ra'),
       (8, 37, 3, 'Kali phản ứng với Natri Clorua - không có phản ứng xảy ra'),
       (28, 30, 2, 'Kẽm phản ứng với Axit Clohidric - tạo khí không màu'),
       (34, 42, 3, 'Axit Photphoric phản ứng với Lưu huỳnh Dioxide - không có phản ứng xảy ra'),
       (30, 39, 5, 'Axit Clohidric phản ứng với Natri Bicarbonat - tạo khí CO₂'),
       (33, 42, 1, 'Axit Axetic phản ứng với Lưu huỳnh Dioxide - không có phản ứng xảy ra'),
       (30, 39, 4, 'Axit Clohidric phản ứng với Natri Bicarbonat - tạo khí CO₂'),
       (6, 29, 2, 'Liti phản ứng với Đồng - không có phản ứng xảy ra'),
       (31, 6, 2, 'Axit Sulfuric phản ứng với Liti - tạo khí và muối'),
       (44, 43, 4, 'CuSO4 phản ứng với AgNO3 - không có phản ứng xảy ra'),
       (33, 37, 5, 'Axit Axetic phản ứng với Natri Clorua - không có phản ứng xảy ra'),
       (33, 35, 2, 'Axit Axetic phản ứng với Natri Hydroxide - tạo muối và nước'),
       (6, 44, 5, 'Liti phản ứng với CuSO4 - tạo kết tủa xám'),
       (26, 6, 5, 'Sắt phản ứng với Liti - không có phản ứng xảy ra'),
       (7, 34, 1, 'Natri phản ứng với Axit Photphoric - tạo khí và muối'),
       (6, 37, 1, 'Liti phản ứng với Natri Clorua - không có phản ứng xảy ra'),
       (38, 44, 6, 'Canxi Carbonat phản ứng với CuSO4 - tạo kết tủa trắng'),
       (28, 40, 1, 'Kẽm phản ứng với Amoniac - tạo phức chất'),
       (39, 6, 6, 'Natri Bicarbonat phản ứng với Liti - không có phản ứng xảy ra'),
       (38, 29, 6, 'Canxi Carbonat phản ứng với Đồng - không có phản ứng xảy ra'),
       (26, 28, 5, 'Sắt phản ứng với Kẽm - không có phản ứng xảy ra'),
       (32, 37, 4, 'Axit Nitric phản ứng với Natri Clorua - không có phản ứng xảy ra'),
       (36, 38, 4, 'Kali Hydroxide phản ứng với Canxi Carbonat - không có phản ứng xảy ra'),
       (34, 42, 3, 'Axit Photphoric phản ứng với Lưu huỳnh Dioxide - không có phản ứng xảy ra'),
       (28, 7, 1, 'Kẽm phản ứng với Natri - không có phản ứng xảy ra'),
       (36, 30, 5, 'Kali Hydroxide phản ứng với Axit Clohidric - tạo muối và nước'),
       (30, 40, 4, 'Axit Clohidric phản ứng với Amoniac - tạo muối amoni'),
       (1, 2, 1, 'Phản ứng tạo ra khí Hydro'),
       (3, 4, 2, 'Phản ứng oxi hóa khử tạo kết tủa đỏ gạch'),
       (5, 6, 3, 'Phản ứng trung hòa tạo muối và nước'),
       (7, 8, 1, 'Phản ứng phân hủy khi đun nóng'),
       (9, 10, 4, 'Phản ứng trao đổi tạo kết tủa trắng'),
       (11, 12, 1, 'Phản ứng tạo muối và nước'),
       (13, 14, 2, 'Phản ứng oxi hóa tạo kết tủa màu nâu đỏ'),
       (15, 16, 3, 'Phản ứng tỏa nhiệt mạnh'),
       (17, 18, 1, 'Phản ứng trao đổi ion tạo kết tủa'),
       (19, 20, 4, 'Phản ứng đốt cháy tạo CO₂ và H₂O'),
       (21, 22, 2, 'Phản ứng tạo dung dịch màu xanh lục'),
       (23, 24, 3, 'Phản ứng khử tạo khí H₂S'),
       (25, 26, 1, 'Phản ứng tráng bạc'),
       (27, 28, 2, 'Phản ứng khử MnO₄⁻ thành Mn²⁺'),
       (29, 30, 3, 'Phản ứng tạo kết tủa vàng với Pb²⁺'),
       (31, 32, 1, 'Phản ứng kết hợp tạo muối không tan'),
       (33, 34, 2, 'Phản ứng tạo màu xanh lam do Cu²⁺'),
       (35, 36, 4, 'Phản ứng cháy tạo khí độc'),
       (37, 38, 1, 'Phản ứng oxi hóa Fe²⁺ thành Fe³⁺'),
       (39, 40, 3, 'Phản ứng thủy phân tạo bazơ'),
       (41, 42, 1, 'Phản ứng giải phóng khí NH₃'),
       (43, 44, 4, 'Phản ứng tạo khí SO₂'),
       (45, 46, 3, 'Phản ứng tạo kết tủa đen của S'),
       (47, 48, 2, 'Phản ứng tỏa nhiệt kèm ánh sáng'),
       (49, 50, 1, 'Phản ứng kết hợp tạo hợp chất ion'),
       (51, 52, 2, 'Phản ứng khử NO₃⁻ thành NO'),
       (53, 54, 3, 'Phản ứng chuyển màu từ tím sang không màu'),
       (55, 56, 1, 'Phản ứng oxi hóa etanol thành axit axetic'),
       (57, 58, 4, 'Phản ứng nổ tạo khí N₂'),
       (59, 60, 2, 'Phản ứng phân hủy có xúc tác MnO₂'),
       (61, 62, 3, 'Phản ứng giữa kim loại mạnh và axit yếu'),
       (63, 64, 4, 'Phản ứng oxi hóa hoàn toàn glucozo'),
       (65, 66, 2, 'Phản ứng oxi hóa - khử trong môi trường kiềm'),
       (67, 68, 1, 'Phản ứng tạo este và nước'),
       (69, 70, 3, 'Phản ứng phân hủy muối amoni khi đun nóng');

-- Experiment ID = 1
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (1, 'Tỏa nhiệt'),
       (1, 'Tạo khí'),
       (1, 'Dung dịch không màu');

-- Experiment ID = 2
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (2, 'Tạo khí'),
       (2, 'Bong bóng khí nổi');

-- Experiment ID = 3
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (3, 'Phản ứng trung hòa'),
       (3, 'Tạo muối và nước');

-- Experiment ID = 4
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (4, 'Phản ứng mạnh'),
       (4, 'Tỏa nhiệt'),
       (4, 'Tạo khí');

-- Experiment ID = 5
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (5, 'Tỏa nhiệt mạnh'),
       (5, 'Tạo kết tủa trắng');

-- Experiment ID = 6
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (6, 'Không phản ứng');

-- Experiment ID = 7
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (7, 'Không có phản ứng'),
       (7, 'Kết tủa màu xanh');

-- Experiment ID = 8
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (8, 'Có ánh sáng phát ra'),
       (8, 'Nhiệt độ tăng nhẹ');

-- Experiment ID = 9
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (9, 'Sản phẩm có màu xanh lam'),
       (9, 'Dung dịch đổi màu');

-- Experiment ID = 10 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (10, 'Tỏa nhiệt'),
       (10, 'Có ánh sáng phát ra');

-- Experiment ID = 11 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (11, 'Nhiệt độ tăng nhẹ'),
       (11, 'Kết tủa nâu đỏ');

-- Experiment ID = 12 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (12, 'Bong bóng khí nổi'),
       (12, 'Dung dịch không màu');

-- Experiment ID = 13 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (13, 'Kết tủa màu xanh'),
       (13, 'Dung dịch đổi màu'),
       (13, 'Tỏa nhiệt');

-- Experiment ID = 14 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (14, 'Nhiệt độ tăng nhẹ'),
       (14, 'Sủi bọt mạnh');

-- Experiment ID = 15 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (15, 'Kết tủa nâu đỏ'),
       (15, 'Dung dịch đổi màu'),
       (15, 'Nhiệt độ tăng nhẹ');

-- Experiment ID = 16 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (16, 'Bong bóng khí nổi'),
       (16, 'Kết tủa trắng'),
       (16, 'Kết tủa nâu đỏ');

-- Experiment ID = 17 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (17, 'Kết tủa nâu đỏ'),
       (17, 'Không có phản ứng'),
       (17, 'Sủi bọt mạnh');

-- Experiment ID = 18
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (18, 'Kết tủa trắng'),
       (18, 'Tạo khí'),
       (18, 'Sủi bọt mạnh');

-- Experiment ID = 19 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (19, 'Tạo khí'),
       (19, 'Dung dịch không màu'),
       (19, 'Mùi khai thoát ra');

-- Experiment ID = 20 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (20, 'Kết tủa trắng'),
       (20, 'Dung dịch không màu'),
       (20, 'Nhiệt độ tăng nhẹ');

-- Experiment ID = 21 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (21, 'Nhiệt độ tăng nhẹ'),
       (21, 'Có ánh sáng phát ra');

-- Experiment ID = 22
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (22, 'Sản phẩm có màu xanh lam'),
       (22, 'Mùi khai thoát ra'),
       (22, 'Bong bóng khí nổi');

-- Experiment ID = 23
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (23, 'Kết tủa nâu đỏ'),
       (23, 'Tỏa nhiệt'),
       (23, 'Mùi khai thoát ra');

-- Experiment ID = 24 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (24, 'Sủi bọt mạnh'),
       (24, 'Sản phẩm có màu xanh lam'),
       (24, 'Kết tủa màu xanh');

-- Experiment ID = 25
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (25, 'Dung dịch đổi màu'),
       (25, 'Dung dịch không màu');


-- Experiment ID = 26
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (26, 'Mùi khai thoát ra'),
       (26, 'Không có phản ứng'),
       (26, 'Tạo khí');

-- Experiment ID = 27 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (27, 'Tạo khí'),
       (27, 'Kết tủa nâu đỏ'),
       (27, 'Dung dịch không màu');

-- Experiment ID = 28
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (28, 'Mùi khai thoát ra'),
       (28, 'Tỏa nhiệt'),
       (28, 'Nhiệt độ tăng nhẹ');

-- Experiment ID = 29
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (29, 'Không có phản ứng'),
       (29, 'Dung dịch không màu');

-- Experiment ID = 30 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (30, 'Dung dịch đổi màu'),
       (30, 'Có ánh sáng phát ra'),
       (30, 'Kết tủa màu xanh');

-- Experiment ID = 31
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (31, 'Tạo khí'),
       (31, 'Kết tủa trắng');

-- Experiment ID = 32 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (32, 'Dung dịch không màu'),
       (32, 'Sủi bọt mạnh');

-- Experiment ID = 33 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (33, 'Nhiệt độ tăng nhẹ'),
       (33, 'Có ánh sáng phát ra'),
       (33, 'Tỏa nhiệt');

-- Experiment ID = 34
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (34, 'Dung dịch không màu'),
       (34, 'Kết tủa trắng'),
       (34, 'Có ánh sáng phát ra');

-- Experiment ID = 35 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (35, 'Kết tủa màu xanh'),
       (35, 'Bong bóng khí nổi');

-- Experiment ID = 36
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (36, 'Tạo khí'),
       (36, 'Mùi khai thoát ra'),
       (36, 'Bong bóng khí nổi');

-- Experiment ID = 37 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (37, 'Kết tủa nâu đỏ'),
       (37, 'Nhiệt độ tăng nhẹ'),
       (37, 'Tạo khí');

-- Experiment ID = 38 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (38, 'Có ánh sáng phát ra'),
       (38, 'Nhiệt độ tăng nhẹ');

-- Experiment ID = 39
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (39, 'Mùi khai thoát ra'),
       (39, 'Bong bóng khí nổi');

-- Experiment ID = 40 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (40, 'Mùi khai thoát ra'),
       (40, 'Bong bóng khí nổi'),
       (40, 'Không có phản ứng');

-- Experiment ID = 41
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (41, 'Dung dịch không màu'),
       (41, 'Nhiệt độ tăng nhẹ'),
       (41, 'Mùi khai thoát ra');

-- Experiment ID = 42 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (42, 'Kết tủa màu xanh'),
       (42, 'Tạo khí'),
       (42, 'Nhiệt độ tăng nhẹ');

-- Experiment ID = 43 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (43, 'Nhiệt độ tăng nhẹ'),
       (43, 'Tạo khí'),
       (43, 'Dung dịch không màu');

-- Experiment ID = 44
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (44, 'Sủi bọt mạnh'),
       (44, 'Sản phẩm có màu xanh lam');

-- Experiment ID = 45 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (45, 'Sủi bọt mạnh'),
       (45, 'Dung dịch đổi màu');

-- Experiment ID = 46 
INSERT INTO ExperimentResult (experiment_id, result_text)
VALUES (46, 'Nhiệt độ tăng nhẹ'),
       (46, 'Dung dịch không màu'),
       (46, 'Kết tủa màu xanh');


