CREATE DATABASE IF NOT exists CHEMISTRY;

USE CHEMISTRY;

-- CREATE TABLE USER 
CREATE TABLE
    IF NOT EXISTS Users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        full_name VARCHAR(255) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        password_hash VARCHAR(255) NOT NULL,
        role ENUM ('student', 'teacher', 'researcher') NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- CREATE TABLE type 
CREATE TABLE
    IF NOT EXISTS Types (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name nvarchar (50) DEFAULT NULL,
        description TEXT DEFAULT NULL
    );

-- CREATE TABKE Chemicals 
CREATE TABLE
    IF NOT EXISTS Chemicals (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name NVARCHAR (50) DEFAULT NULL,
        atomic_weight DOUBLE DEFAULT NULL,
        symbol NVARCHAR (50) DEFAULT NULL,
        type_id INT DEFAULT NULL,
        hazard_infor NVARCHAR (255),
        status NVARCHAR (255),
        description TEXT DEFAULT NULL,
        category VARCHAR(5) DEFAULT NULL,
        image TEXT DEFAULT NULL,
        FOREIGN KEY (type_id) REFERENCES Types (id) ON DELETE CASCADE
    );


CREATE TABLE
    Experiment (
        id INT PRIMARY KEY AUTO_INCREMENT,
        chemical_1 INT,
        chemical_2 INT,
        description NVARCHAR (255),
        FOREIGN KEY (chemical_1) REFERENCES Chemicals (id),
        FOREIGN KEY (chemical_2) REFERENCES Chemicals (id)
    );

CREATE TABLE
    question_categories (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL
    );

CREATE TABLE
    questions (
        id INT AUTO_INCREMENT PRIMARY KEY,
        content TEXT NOT NULL,
        category_id INT,
        FOREIGN KEY (category_id) REFERENCES question_categories (id)
    );

CREATE TABLE
    answers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        question_id INT,
        content TEXT NOT NULL,
        is_correct BOOLEAN DEFAULT FALSE,
        FOREIGN KEY (question_id) REFERENCES questions (id)
    );

CREATE TABLE
    user_answers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT,
        question_id INT,
        answer_id INT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users (id)
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


INSERT INTO Chemicals (name, atomic_weight, symbol, type_id, hazard_infor, status, description, category ,  image)
VALUES
-- Khí hiếm (type_id = 1)
('Helium', 4.0026, 'He', 1, 'An toàn, không phản ứng', 'Còn hàng', 'Khí hiếm không màu, dùng trong làm mát',
 1,'https://upload.wikimedia.org/wikipedia/commons/8/84/Electron_shell_002_Helium_-_no_label.svg'),
('Neon', 20.180, 'Ne', 1, 'An toàn', 'Còn hàng', 'Khí hiếm dùng trong đèn',
 1,'https://upload.wikimedia.org/wikipedia/commons/3/3e/Electron_shell_010_Neon_-_no_label.svg'),
('Argon', 39.948, 'Ar', 1, 'An toàn', 'Còn hàng', 'Khí hiếm dùng trong hàn và đèn',
 1,'https://upload.wikimedia.org/wikipedia/commons/5/5c/Electron_shell_018_Argon_-_no_label.svg'),

-- Kim loại kiềm (type_id = 2)
('Lithium', 6.94, 'Li', 2, 'Phản ứng với nước, dễ cháy', 'Cẩn thận', 'Kim loại nhẹ, dùng trong pin',
 1,'https://upload.wikimedia.org/wikipedia/commons/a/ae/Electron_shell_003_Lithium_-_no_label.svg'),
('Sodium', 22.990, 'Na', 2, 'Phản ứng mạnh với nước', 'Cẩn thận', 'Kim loại mềm, dẫn điện tốt',
 1,'https://upload.wikimedia.org/wikipedia/commons/8/87/Electron_shell_011_Sodium_-_no_label.svg'),
('Potassium', 39.098, 'K', 2, 'Phản ứng mạnh với nước', 'Nguy hiểm', 'Kim loại mềm, màu bạc',
 1,'https://upload.wikimedia.org/wikipedia/commons/9/92/Electron_shell_019_Potassium_-_no_label.svg'),

-- Kim loại kiềm thổ (type_id = 3)
('Beryllium', 9.0122, 'Be', 3, 'Độc hại khi hít phải', 'Nguy hiểm', 'Kim loại nhẹ, cứng, dùng trong hợp kim',
 1,'https://upload.wikimedia.org/wikipedia/commons/4/40/Electron_shell_004_Beryllium_-_no_label.svg'),
('Magnesium', 24.305, 'Mg', 3, 'Dễ cháy ở dạng bột', 'Cẩn thận', 'Dùng trong pháo sáng và hợp kim nhẹ',
 1,'https://upload.wikimedia.org/wikipedia/commons/d/d7/Electron_shell_012_Magnesium_-_no_label.svg'),
('Calcium', 40.078, 'Ca', 3, 'Phản ứng với nước', 'Cẩn thận', 'Kim loại kiềm thổ, cần thiết cho xương',
 1,'https://upload.wikimedia.org/wikipedia/commons/5/57/Electron_shell_020_Calcium_-_no_label.svg'),

-- Halogen (type_id = 4)
('Fluorine', 18.998, 'F', 4, 'Rất độc, ăn mòn cao', 'Nguy hiểm', 'Halogen mạnh nhất, màu vàng nhạt',
 1,'https://upload.wikimedia.org/wikipedia/commons/b/b5/Electron_shell_009_Fluorine_-_no_label.svg	'),
('Chlorine', 35.45, 'Cl', 4, 'Khí độc, gây ngạt', 'Nguy hiểm', 'Khí halogen, dùng trong xử lý nước',
 1,'https://upload.wikimedia.org/wikipedia/commons/1/17/Electron_shell_017_Chlorine_-_no_label.svg'),

-- Phi kim (type_id = 6)
('Hydrogen', 1.008, 'H', 6, 'Dễ cháy nổ khi kết hợp với oxy', 'Còn hàng', 'Nguyên tố nhẹ nhất, phổ biến trong vũ trụ',
 1,'https://upload.wikimedia.org/wikipedia/commons/e/ee/Electron_shell_001_Hydrogen_-_no_label.svg'),
('Carbon', 12.011, 'C', 6, 'Không độc ở dạng than/kc', 'Còn hàng', 'Nguyên tố cơ bản của sự sống',
 1,'https://upload.wikimedia.org/wikipedia/commons/b/b3/Electron_shell_006_Carbon_-_no_label.svg'),
('Nitrogen', 14.007, 'N', 6, 'Không độc, nhưng có thể gây ngạt', 'Còn hàng', 'Khí chiếm phần lớn khí quyển',
 1,'https://upload.wikimedia.org/wikipedia/commons/6/69/Electron_shell_007_Nitrogen_-_no_label.svg'),
('Oxygen', 15.999, 'O', 6, 'Hỗ trợ cháy, không độc', 'Còn hàng', 'Cần thiết cho sự sống',
 1,'https://upload.wikimedia.org/wikipedia/commons/f/f7/Electron_shell_008_Oxygen_-_no_label.svg'),
('Phosphorus', 30.974, 'P', 6, 'Trắng rất độc, dễ cháy', 'Nguy hiểm', 'Phi kim, cần thiết cho sinh học',
 1,'https://upload.wikimedia.org/wikipedia/commons/0/09/Electron_shell_015_Phosphorus_-_no_label.svg'),
('Sulfur', 32.06, 'S', 6, 'Gây kích ứng', 'Cẩn thận', 'Chất rắn màu vàng, dùng trong công nghiệp',
 1,'https://upload.wikimedia.org/wikipedia/commons/9/96/Electron_shell_016_Sulfur_-_no_label.svg'),
('Silicon', 28.085, 'Si', 6, 'Không độc', 'Còn hàng', 'Dùng nhiều trong công nghệ bán dẫn',
 1,'https://upload.wikimedia.org/wikipedia/commons/1/1f/Electron_shell_014_Silicon_-_no_label.svg'),
('Boron', 10.81, 'B', 6, 'Không độc, nhưng bụi có thể gây hại', 'Còn hàng', 'Phi kim, dùng trong chất bán dẫn',
 1,'https://upload.wikimedia.org/wikipedia/commons/8/89/Electron_shell_005_Boron_-_no_label.svg'),
('Iron', 55.845, 'Fe', 5, 'Không độc', 'Còn hàng', 'Kim loại phổ biến, dùng làm thép',
 1,'https://upload.wikimedia.org/wikipedia/commons/c/c6/Electron_shell_026_Iron_-_no_label.svg'),
('Copper', 63.546, 'Cu', 5, 'Không độc', 'Còn hàng', 'Kim loại dẫn điện tốt, màu đỏ nâu',
 1,'https://upload.wikimedia.org/wikipedia/commons/f/f7/Electron_shell_029_Copper_-_no_label.svg'),
('Zinc', 65.38, 'Zn', 5, 'Không độc', 'Còn hàng', 'Chống ăn mòn, dùng mạ kim loại',
 1,'https://upload.wikimedia.org/wikipedia/commons/c/c5/Electron_shell_030_Zinc_-_no_label.svg'),
('Nickel', 58.693, 'Ni', 5, 'Có thể gây dị ứng', 'Còn hàng', 'Kim loại bền, chống ăn mòn',
 1,'https://upload.wikimedia.org/wikipedia/commons/d/d2/Electron_shell_028_Nickel_-_no_label.svg'),
('Chromium', 51.996, 'Cr', 5, 'Một số dạng độc', 'Cẩn thận', 'Tạo độ bóng cho thép không gỉ',
 1,'https://upload.wikimedia.org/wikipedia/commons/6/67/Electron_shell_024_Chromium_-_no_label.svg'),

-- Kim loại yếu (type_id = 7)
('Aluminum', 26.982, 'Al', 7, 'Không độc', 'Còn hàng', 'Kim loại nhẹ, không gỉ',
 1,'https://upload.wikimedia.org/wikipedia/commons/4/4d/Electron_shell_013_Aluminium_-_no_label.svg'),
('Lead', 207.2, 'Pb', 7, 'Rất độc nếu hấp thụ lâu dài', 'Nguy hiểm', 'Kim loại nặng, từng dùng trong sơn',
 1,'https://upload.wikimedia.org/wikipedia/commons/7/7d/Electron_shell_082_Lead_-_no_label.svg'),
('Tin', 118.71, 'Sn', 7, 'Không độc', 'Còn hàng', 'Dùng phủ bảo vệ kim loại khác',
 1,'https://upload.wikimedia.org/wikipedia/commons/1/13/Electron_shell_050_Tin_-_no_label.svg'),

-- Đất hiếm (type_id = 8)

('Lanthanum', 138.91, 'La', 8, 'Không độc ở lượng nhỏ', 'Còn hàng', 'Dùng trong pin, xúc tác',
 1,'https://upload.wikimedia.org/wikipedia/commons/1/14/Electron_shell_057_Lanthanum_-_no_label.svg'),
('Cerium', 140.12, 'Ce', 8, 'Không độc', 'Còn hàng', 'Dùng trong kính và chất xúc tác',
 1,'https://upload.wikimedia.org/wikipedia/commons/e/ea/Electron_shell_058_Cerium_-_no_label.svg'),
('Neodymium', 144.24, 'Nd', 8, 'Không độc', 'Còn hàng', 'Dùng trong nam châm mạnh',
 1,'https://upload.wikimedia.org/wikipedia/commons/b/b3/Electron_shell_060_Neodymium_-_no_label.svg'),

-- Actini (type_id = 9)

('Uranium', 238.03, 'U', 9, 'Phóng xạ, độc hại', 'Nguy hiểm', 'Dùng trong năng lượng hạt nhân',
 1,'https://upload.wikimedia.org/wikipedia/commons/4/40/Electron_shell_092_Uranium_-_no_label.svg'),
('Thorium', 232.04, 'Th', 9, 'Phóng xạ yếu', 'Nguy hiểm', 'Tiềm năng trong năng lượng hạt nhân sạch',
 1,'https://upload.wikimedia.org/wikipedia/commons/d/d1/Electron_shell_090_Thorium_-_no_label.svg'),
('Plutonium', 244, 'Pu', 9, 'Rất phóng xạ, cực độc', 'Nguy hiểm', 'Dùng trong vũ khí và năng lượng hạt nhân',
 1,'https://upload.wikimedia.org/wikipedia/commons/b/bc/Electron_shell_094_Plutonium_-_no_label.svg'),

-- Nhóm hợp chất
('Nước', 18.015, 'H2O', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Không độc, cần thiết cho sự sống', 'Ổn định', 'Hợp chất phổ biến nhất trên Trái Đất, cần thiết cho mọi dạng sống.' ,
2, 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Water_drop_001.jpg'),
('Axit Clohidric', 36.46, 'HCl', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn mạnh, có thể gây bỏng da', 'Ổn định', 'Axit mạnh được dùng phổ biến trong công nghiệp và phòng thí nghiệm.' ,
2, 'https://upload.wikimedia.org/wikipedia/commons/d/da/Hydrochloric_acid_01.jpg'),
('Axit Sulfuric', 98.079, 'H2SO4', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn mạnh, có thể gây bỏng nặng', 'Ổn định', 'Dùng để sản xuất phân bón, chất tẩy rửa và trong ngành hóa chất.' ,
2, 'https://upload.wikimedia.org/wikipedia/commons/b/b6/Sulphuric_acid_96_percent_extra_pure.jpg'),
('Axit Nitric', 63.01, 'HNO3', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn mạnh, gây bỏng hóa học', 'Không ổn định dưới nhiệt độ cao', 'Được sử dụng để sản xuất phân đạm và thuốc nổ.',
2,'https://upload.wikimedia.org/wikipedia/commons/4/48/Nitric_acid_lab.jpg'),
('Axit Axetic', 60.05, 'CH3COOH', (SELECT id FROM Types WHERE name = 'Axit'), 'Ít độc, có mùi đặc trưng', 'Ổn định', 'Là thành phần chính của giấm ăn, dùng trong công nghiệp thực phẩm và hóa chất.',
2,'https://upload.wikimedia.org/wikipedia/commons/b/b3/AceticAcid012.jpg'),
('Axit Photphoric', 97.994, 'H3PO4', (SELECT id FROM Types WHERE name = 'Axit'), 'Ăn mòn nhẹ, có thể gây kích ứng', 'Ổn định', 'Sử dụng trong thực phẩm, dược phẩm và sản xuất phân bón.',
2,'https://upload.wikimedia.org/wikipedia/commons/5/59/Phosphoric-acid-3D-vdW.svg'),
('Natri Hydroxide', 39.997, 'NaOH', (SELECT id FROM Types WHERE name = 'Bazơ'), 'Ăn mòn mạnh, gây bỏng da', 'Ổn định', 'Bazơ mạnh, được sử dụng trong sản xuất xà phòng và tẩy rửa.',
2,'https://upload.wikimedia.org/wikipedia/commons/3/34/SodiumHydroxide.jpg'),
('Kali Hydroxide', 56.11, 'KOH', (SELECT id FROM Types WHERE name = 'Bazơ'), 'Ăn mòn mạnh, nguy hiểm khi tiếp xúc', 'Ổn định', 'Dùng để sản xuất pin kiềm và xà phòng lỏng.',
2,'https://upload.wikimedia.org/wikipedia/commons/3/33/Potassium_hydroxide.jpg'),
('Natri Clorua', 58.44, 'NaCl', (SELECT id FROM Types WHERE name = 'Muối'), 'Không độc, tan tốt trong nước', 'Ổn định', 'Tên gọi thông thường là muối ăn, thiết yếu cho sự sống con người.',
2,'https://upload.wikimedia.org/wikipedia/commons/7/7c/Selpologne.jpg'),
('Canxi Carbonat', 100.086, 'CaCO3', (SELECT id FROM Types WHERE name = 'Muối'), 'Không độc, tan kém trong nước', 'Ổn định', 'Được tìm thấy trong đá vôi, vỏ sò, dùng trong xây dựng và thực phẩm.',
2,'https://upload.wikimedia.org/wikipedia/commons/0/04/Calcium_carbonate.jpg'),
('Natri Bicarbonat', 84.006, 'NaHCO3', (SELECT id FROM Types WHERE name = 'Muối'), 'Không độc, dùng trong thực phẩm', 'Ổn định', 'Còn gọi là baking soda, được dùng trong nấu ăn và làm sạch.',
2,'https://upload.wikimedia.org/wikipedia/commons/8/81/Sodium_bicarbonate.jpg'),
('Amoniac', 17.031, 'NH3', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Khí độc, gây kích ứng mạnh', 'Không ổn định ở nhiệt độ cao', 'Ứng dụng rộng rãi trong công nghiệp phân bón và làm lạnh.',
2,'https://upload.wikimedia.org/wikipedia/commons/a/a0/Hydrochloric_acid_ammonia.jpg'),
('Carbon Dioxide', 44.01, 'CO2', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Không độc ở nồng độ thấp, gây ngạt ở nồng độ cao', 'Ổn định', 'Khí nhà kính phổ biến, sản phẩm phụ của quá trình hô hấp và đốt cháy.',
2,'https://upload.wikimedia.org/wikipedia/commons/4/41/Carbon-dioxide-3D-vdW.png'),
('Lưu huỳnh Dioxide', 64.07, 'SO2', (SELECT id FROM Types WHERE name = 'Hợp chất'), 'Gây kích ứng mắt và đường hô hấp', 'Không ổn định dưới nhiệt độ cao', 'Khí độc, phát sinh từ đốt nhiên liệu hóa thạch, gây mưa axit.',
2,'https://upload.wikimedia.org/wikipedia/commons/e/e4/Sulfur-dioxide-2D.svg'),
('AgNO3', 169.87, 'AgNO3', (SELECT id FROM Types WHERE name = 'Muối'), 'Có thể ăn mòn, gây kích ứng da', 'Ổn định', 'Dùng trong phản ứng tráng bạc và sản xuất thuốc.',
2,'https://upload.wikimedia.org/wikipedia/commons/0/02/AgNO3.jpg');

-- Giả sử chemical_1 = Natri (id = 7), chemical_2 = Axit Clohidric (id = 30), condition = 'Nhiệt độ thường' (id = 1)
INSERT INTO Experiment (chemical_1, chemical_2, description) VALUES
(1, 2, N'Không phản ứng'),
(5, 11, N'NaCl'),
(12, 15, N'H₂O'),
(35, 40, N'NaCl'),
(48, 42, N'AgCl'),

(3, 10, N'Không phản ứng'),
(4, 5, N'Hợp kim Li-Na'),
(6, 7, N'Hợp kim K-Be'),
(8, 9, N'Hợp kim Mg-Ca'),
(13, 14, N'CN⁻ hoặc hợp chất hữu cơ'),
(16, 17, N'PS'),
(18, 19, N'Hợp kim Si-B'),
(20, 21, N'Hợp kim Fe-Cu'),
(22, 23, N'Hợp kim Zn-Ni'),
(24, 25, N'Hợp kim Cr-Al'),
(26, 27, N'Hợp kim Pb-Sn'),
(28, 29, N'Hợp kim La-Ce'),
(30, 31, N'Hợp chất Nd-U'),
(32, 33, N'Hợp chất Th-Pu'),
(34, 35, N'HCl pha loãng'),

(36, 40, N'Na₂SO₄'),
(37, 41, N'KNO₃'),
(38, 42, N'Dung dịch axetat + NaCl'),
(39, 43, N'Ca₃(PO₄)₂'),
(44, 45, N'Na₂CO₃'),
(46, 47, N'Không rõ'),
(2, 48, N'Không phản ứng'),
(11, 34, N'HCl + HClO'),
(5, 15, N'Na₂O'),
(12, 16, N'PH₃');

INSERT INTO question_categories (name) VALUES 
('Hóa vô cơ'),
('Hóa hữu cơ'),
('Phản ứng hóa học'),
('Hóa học đại cương');

-- Câu hỏi 1
INSERT INTO questions (content, category_id) 
VALUES ('Phản ứng nào sau đây tạo ra khí H₂?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Na + H₂O → NaOH + H₂↑', TRUE),
(LAST_INSERT_ID(), 'NaCl + AgNO₃ → AgCl↓ + NaNO₃', FALSE),
(LAST_INSERT_ID(), 'HCl + NaOH → NaCl + H₂O', FALSE),
(LAST_INSERT_ID(), 'CaCO₃ → CaO + CO₂↑', FALSE);

-- Câu hỏi 2
INSERT INTO questions (content, category_id) 
VALUES ('Chất nào tạo kết tủa vàng khi phản ứng với Pb(NO₃)₂?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'KI', TRUE),
(LAST_INSERT_ID(), 'NaCl', FALSE),
(LAST_INSERT_ID(), 'KBr', FALSE),
(LAST_INSERT_ID(), 'KNO₃', FALSE);

-- Câu hỏi 3
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây là axit mạnh?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'HCl', TRUE),
(LAST_INSERT_ID(), 'CH₃COOH', FALSE),
(LAST_INSERT_ID(), 'H₂CO₃', FALSE),
(LAST_INSERT_ID(), 'H₂O', FALSE);

-- Câu hỏi 4
INSERT INTO questions (content, category_id)
VALUES ('Phản ứng nào sau đây là phản ứng oxi hóa-khử?', 3);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Zn + 2HCl → ZnCl₂ + H₂↑', TRUE),
(LAST_INSERT_ID(), 'NaCl + AgNO₃ → AgCl↓ + NaNO₃', FALSE),
(LAST_INSERT_ID(), 'NaOH + HCl → NaCl + H₂O', FALSE),
(LAST_INSERT_ID(), 'CaCO₃ → CaO + CO₂↑', FALSE);

-- Câu hỏi 5
INSERT INTO questions (content, category_id)
VALUES ('Nguyên tố nào sau đây thuộc nhóm halogen?', 4);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Cl', TRUE),
(LAST_INSERT_ID(), 'Na', FALSE),
(LAST_INSERT_ID(), 'Fe', FALSE),
(LAST_INSERT_ID(), 'Si', FALSE);

-- Câu hỏi 6
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây tạo kết tủa trắng với AgNO₃?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'NaCl', TRUE),
(LAST_INSERT_ID(), 'KNO₃', FALSE),
(LAST_INSERT_ID(), 'Na₂SO₄', FALSE),
(LAST_INSERT_ID(), 'Na₃PO₄', FALSE);

-- Câu hỏi 7
INSERT INTO questions (content, category_id)
VALUES ('Phản ứng nào sau đây tạo ra khí CO₂?', 3);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'CaCO₃ + 2HCl → CaCl₂ + H₂O + CO₂↑', TRUE),
(LAST_INSERT_ID(), 'Zn + H₂SO₄ → ZnSO₄ + H₂↑', FALSE),
(LAST_INSERT_ID(), 'NaOH + HCl → NaCl + H₂O', FALSE),
(LAST_INSERT_ID(), 'AgNO₃ + NaCl → AgCl↓ + NaNO₃', FALSE);

-- Câu hỏi 8
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây là bazơ mạnh?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'NaOH', TRUE),
(LAST_INSERT_ID(), 'NH₃', FALSE),
(LAST_INSERT_ID(), 'Al(OH)₃', FALSE),
(LAST_INSERT_ID(), 'H₂O', FALSE);

-- Câu hỏi 9
INSERT INTO questions (content, category_id)
VALUES ('Phản ứng nào sau đây là phản ứng trao đổi?', 3);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'AgNO₃ + NaCl → AgCl↓ + NaNO₃', TRUE),
(LAST_INSERT_ID(), 'Zn + 2HCl → ZnCl₂ + H₂↑', FALSE),
(LAST_INSERT_ID(), 'CH₄ + 2O₂ → CO₂ + 2H₂O', FALSE),
(LAST_INSERT_ID(), '2H₂O → 2H₂↑ + O₂↑', FALSE);

-- Câu hỏi 10
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây là muối tan?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'NaCl', TRUE),
(LAST_INSERT_ID(), 'AgCl', FALSE),
(LAST_INSERT_ID(), 'BaSO₄', FALSE),
(LAST_INSERT_ID(), 'CaCO₃', FALSE);

-- Câu hỏi 11
INSERT INTO questions (content, category_id)
VALUES ('Kim loại nào phản ứng mãnh liệt với nước tạo thành dung dịch kiềm và khí H₂?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Kali (K)', TRUE),
(LAST_INSERT_ID(), 'Sắt (Fe)', FALSE),
(LAST_INSERT_ID(), 'Đồng (Cu)', FALSE),
(LAST_INSERT_ID(), 'Bạc (Ag)', FALSE);

-- Câu hỏi 12
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây là hidrocacbon đơn giản nhất?', 2);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Metan (CH₄)', TRUE),
(LAST_INSERT_ID(), 'Etanol (C₂H₅OH)', FALSE),
(LAST_INSERT_ID(), 'Axit axetic (CH₃COOH)', FALSE),
(LAST_INSERT_ID(), 'Glucose (C₆H₁₂O₆)', FALSE);

-- Câu hỏi 13
INSERT INTO questions (content, category_id)
VALUES ('Hiện tượng gì xảy ra khi nhỏ dung dịch NaOH vào dung dịch CuSO₄?', 3);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Xuất hiện kết tủa xanh lam', TRUE),
(LAST_INSERT_ID(), 'Sủi bọt khí không màu', FALSE),
(LAST_INSERT_ID(), 'Dung dịch chuyển sang màu hồng', FALSE),
(LAST_INSERT_ID(), 'Không có hiện tượng gì', FALSE);

-- Câu hỏi 14
INSERT INTO questions (content, category_id)
VALUES ('Nguyên tử được cấu tạo bởi các loại hạt nào?', 4);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Proton, neutron và electron', TRUE),
(LAST_INSERT_ID(), 'Chỉ có proton và electron', FALSE),
(LAST_INSERT_ID(), 'Chỉ có neutron và electron', FALSE),
(LAST_INSERT_ID(), 'Photon và electron', FALSE);

-- Câu hỏi 15
INSERT INTO questions (content, category_id)
VALUES ('Oxit nào sau đây là oxit axit?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'SO₂', TRUE),
(LAST_INSERT_ID(), 'CaO', FALSE),
(LAST_INSERT_ID(), 'Na₂O', FALSE),
(LAST_INSERT_ID(), 'Fe₂O₃', FALSE);

-- Câu hỏi 16
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây có phản ứng tráng bạc?', 2);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Glucose', TRUE),
(LAST_INSERT_ID(), 'Etanol', FALSE),
(LAST_INSERT_ID(), 'Axit axetic', FALSE),
(LAST_INSERT_ID(), 'Metan', FALSE);

-- Câu hỏi 17
INSERT INTO questions (content, category_id)
VALUES ('Phản ứng nào sau đây dùng để điều chế khí O₂ trong phòng thí nghiệm?', 3);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Nhiệt phân KClO₃ với xúc tác MnO₂', TRUE),
(LAST_INSERT_ID(), 'Cho CaCO₃ tác dụng với HCl', FALSE),
(LAST_INSERT_ID(), 'Điện phân dung dịch NaCl', FALSE),
(LAST_INSERT_ID(), 'Nung nóng Cu(NO₃)₂', FALSE);

-- Câu hỏi 18
INSERT INTO questions (content, category_id)
VALUES ('Liên kết hóa học giữa các nguyên tử trong phân tử nước là loại liên kết gì?', 4);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Liên kết cộng hóa trị phân cực', TRUE),
(LAST_INSERT_ID(), 'Liên kết ion', FALSE),
(LAST_INSERT_ID(), 'Liên kết kim loại', FALSE),
(LAST_INSERT_ID(), 'Liên kết hydro', FALSE);

-- Câu hỏi 19
INSERT INTO questions (content, category_id)
VALUES ('Dung dịch nào sau đây có pH < 7?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Dung dịch HCl 0.1M', TRUE),
(LAST_INSERT_ID(), 'Dung dịch NaOH 0.1M', FALSE),
(LAST_INSERT_ID(), 'Dung dịch NaCl 0.1M', FALSE),
(LAST_INSERT_ID(), 'Nước cất', FALSE);

-- Câu hỏi 20
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây thuộc loại ankan?', 2);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Butan (C₄H₁₀)', TRUE),
(LAST_INSERT_ID(), 'Etilen (C₂H₄)', FALSE),
(LAST_INSERT_ID(), 'Axetilen (C₂H₂)', FALSE),
(LAST_INSERT_ID(), 'Benzen (C₆H₆)', FALSE);

-- Câu hỏi 21
INSERT INTO questions (content, category_id)
VALUES ('Kim loại nào dẫn điện tốt nhất?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Bạc (Ag)', TRUE),
(LAST_INSERT_ID(), 'Đồng (Cu)', FALSE),
(LAST_INSERT_ID(), 'Nhôm (Al)', FALSE),
(LAST_INSERT_ID(), 'Vàng (Au)', FALSE);

-- Câu hỏi 22
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây là ancol?', 2);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'C₂H₅OH', TRUE),
(LAST_INSERT_ID(), 'CH₃COOH', FALSE),
(LAST_INSERT_ID(), 'C₆H₁₂O₆', FALSE),
(LAST_INSERT_ID(), 'CH₄', FALSE);

-- Câu hỏi 23
INSERT INTO questions (content, category_id)
VALUES ('Phản ứng nào sau đây là phản ứng nhiệt phân?', 3);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), '2KClO₃ → 2KCl + 3O₂', TRUE),
(LAST_INSERT_ID(), 'Zn + 2HCl → ZnCl₂ + H₂', FALSE),
(LAST_INSERT_ID(), 'NaOH + HCl → NaCl + H₂O', FALSE),
(LAST_INSERT_ID(), 'AgNO₃ + NaCl → AgCl + NaNO₃', FALSE);

-- Câu hỏi 24
INSERT INTO questions (content, category_id)
VALUES ('Số electron tối đa trong lớp vỏ thứ 2 là bao nhiêu?', 4);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), '8', TRUE),
(LAST_INSERT_ID(), '2', FALSE),
(LAST_INSERT_ID(), '18', FALSE),
(LAST_INSERT_ID(), '32', FALSE);

-- Câu hỏi 25
INSERT INTO questions (content, category_id)
VALUES ('Dung dịch làm quỳ tím hóa xanh là:', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'NaOH', TRUE),
(LAST_INSERT_ID(), 'HCl', FALSE),
(LAST_INSERT_ID(), 'H₂SO₄', FALSE),
(LAST_INSERT_ID(), 'NaCl', FALSE);

-- Câu hỏi 26
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây có liên kết đôi C=C?', 2);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Etilen (C₂H₄)', TRUE),
(LAST_INSERT_ID(), 'Metan (CH₄)', FALSE),
(LAST_INSERT_ID(), 'Axetilen (C₂H₂)', FALSE),
(LAST_INSERT_ID(), 'Etan (C₂H₆)', FALSE);

-- Câu hỏi 27
INSERT INTO questions (content, category_id)
VALUES ('Phản ứng giữa axit và bazơ tạo thành muối và nước được gọi là gì?', 3);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Phản ứng trung hòa', TRUE),
(LAST_INSERT_ID(), 'Phản ứng oxi hóa-khử', FALSE),
(LAST_INSERT_ID(), 'Phản ứng thế', FALSE),
(LAST_INSERT_ID(), 'Phản ứng phân hủy', FALSE);

-- Câu hỏi 28
INSERT INTO questions (content, category_id)
VALUES ('Nguyên tố có số hiệu nguyên tử 17 thuộc nhóm nào?', 4);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Nhóm halogen (VIIA)', TRUE),
(LAST_INSERT_ID(), 'Nhóm kim loại kiềm (IA)', FALSE),
(LAST_INSERT_ID(), 'Nhóm khí hiếm (VIIIA)', FALSE),
(LAST_INSERT_ID(), 'Nhóm kim loại kiềm thổ (IIA)', FALSE);

-- Câu hỏi 29
INSERT INTO questions (content, category_id)
VALUES ('Oxit nào sau đây tác dụng với nước tạo thành axit?', 1);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'SO₃', TRUE),
(LAST_INSERT_ID(), 'CaO', FALSE),
(LAST_INSERT_ID(), 'Na₂O', FALSE),
(LAST_INSERT_ID(), 'Fe₂O₃', FALSE);

-- Câu hỏi 30
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây thuộc loại axit cacboxylic?', 2);

INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'CH₃COOH', TRUE),
(LAST_INSERT_ID(), 'C₂H₅OH', FALSE),
(LAST_INSERT_ID(), 'CH₃CHO', FALSE),
(LAST_INSERT_ID(), 'C₆H₆', FALSE);

-- Câu 31
INSERT INTO questions (content, category_id) VALUES ('Kim loại nào nhẹ nhất trong bảng tuần hoàn?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Liti (Li)', TRUE),
(LAST_INSERT_ID(), 'Nhôm (Al)', FALSE),
(LAST_INSERT_ID(), 'Magie (Mg)', FALSE),
(LAST_INSERT_ID(), 'Natri (Na)', FALSE);

-- Câu 32
INSERT INTO questions (content, category_id) VALUES ('Khí nào gây ra hiệu ứng nhà kính mạnh nhất?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'CFC', TRUE),
(LAST_INSERT_ID(), 'CO₂', FALSE),
(LAST_INSERT_ID(), 'CH₄', FALSE),
(LAST_INSERT_ID(), 'N₂O', FALSE);

-- Câu 33
INSERT INTO questions (content, category_id) VALUES ('Khoáng vật nào là nguồn chính của nhôm?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Bauxite', TRUE),
(LAST_INSERT_ID(), 'Hematite', FALSE),
(LAST_INSERT_ID(), 'Galena', FALSE),
(LAST_INSERT_ID(), 'Magnetite', FALSE);

-- Câu 34
INSERT INTO questions (content, category_id) VALUES ('Chất nào sau đây được dùng để khử chua đất?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'CaO', TRUE),
(LAST_INSERT_ID(), 'NaCl', FALSE),
(LAST_INSERT_ID(), 'H₂SO₄', FALSE),
(LAST_INSERT_ID(), 'KNO₃', FALSE);

-- Câu 35
INSERT INTO questions (content, category_id) VALUES ('Kim loại nào có nhiệt độ nóng chảy cao nhất?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Wolfram (W)', TRUE),
(LAST_INSERT_ID(), 'Sắt (Fe)', FALSE),
(LAST_INSERT_ID(), 'Đồng (Cu)', FALSE),
(LAST_INSERT_ID(), 'Vàng (Au)', FALSE);

-- Câu 36
INSERT INTO questions (content, category_id) VALUES ('Phèn chua có công thức hóa học là gì?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'KAl(SO₄)₂.12H₂O', TRUE),
(LAST_INSERT_ID(), 'Na₂CO₃', FALSE),
(LAST_INSERT_ID(), 'CaSO₄.2H₂O', FALSE),
(LAST_INSERT_ID(), 'MgSO₄', FALSE);

-- Câu 37
INSERT INTO questions (content, category_id) VALUES ('Chất nào sau đây không phải là muối?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'NaOH', TRUE),
(LAST_INSERT_ID(), 'NaCl', FALSE),
(LAST_INSERT_ID(), 'CaCO₃', FALSE),
(LAST_INSERT_ID(), 'KNO₃', FALSE);

-- Câu 38
INSERT INTO questions (content, category_id) VALUES ('Khí nào được dùng để khử trùng nước sinh hoạt?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Clo (Cl₂)', TRUE),
(LAST_INSERT_ID(), 'Oxi (O₂)', FALSE),
(LAST_INSERT_ID(), 'Nitơ (N₂)', FALSE),
(LAST_INSERT_ID(), 'CO₂', FALSE);

-- Câu 39
INSERT INTO questions (content, category_id) VALUES ('Chất nào sau đây có đồng phân hình học?', 2);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'But-2-en', TRUE),
(LAST_INSERT_ID(), 'Etan', FALSE),
(LAST_INSERT_ID(), 'Axetilen', FALSE),
(LAST_INSERT_ID(), 'Metan', FALSE);

-- Câu 40
INSERT INTO questions (content, category_id) VALUES ('Loại đường nào có trong sữa?', 2);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Lactose', TRUE),
(LAST_INSERT_ID(), 'Glucose', FALSE),
(LAST_INSERT_ID(), 'Fructose', FALSE),
(LAST_INSERT_ID(), 'Sucrose', FALSE);

-- Câu 41
INSERT INTO questions (content, category_id) VALUES ('Chất béo có đặc điểm gì?', 2);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Không tan trong nước', TRUE),
(LAST_INSERT_ID(), 'Tan tốt trong nước', FALSE),
(LAST_INSERT_ID(), 'Là hợp chất vô cơ', FALSE),
(LAST_INSERT_ID(), 'Có nhiệt độ sôi thấp', FALSE);

-- Câu 42
INSERT INTO questions (content, category_id) VALUES ('Protein được cấu tạo từ các đơn phân nào?', 2);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Amino acid', TRUE),
(LAST_INSERT_ID(), 'Glucose', FALSE),
(LAST_INSERT_ID(), 'Nucleotide', FALSE),
(LAST_INSERT_ID(), 'Glycerol', FALSE);

-- Câu 43
INSERT INTO questions (content, category_id) VALUES ('Chất nào sau đây là hydrocarbon thơm?', 2);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Benzen (C₆H₆)', TRUE),
(LAST_INSERT_ID(), 'Etan (C₂H₆)', FALSE),
(LAST_INSERT_ID(), 'Axetilen (C₂H₂)', FALSE),
(LAST_INSERT_ID(), 'Etilen (C₂H₄)', FALSE);

-- Câu 44
INSERT INTO questions (content, category_id) VALUES ('Phản ứng đặc trưng của anken là gì?', 2);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Phản ứng cộng', TRUE),
(LAST_INSERT_ID(), 'Phản ứng thế', FALSE),
(LAST_INSERT_ID(), 'Phản ứng trùng hợp', FALSE),
(LAST_INSERT_ID(), 'Phản ứng oxi hóa', FALSE);

-- Câu 45
INSERT INTO questions (content, category_id) VALUES ('Chất nào sau đây là dẫn xuất halogen?', 2);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'CH₃Cl', TRUE),
(LAST_INSERT_ID(), 'CH₃OH', FALSE),
(LAST_INSERT_ID(), 'CH₃COOH', FALSE),
(LAST_INSERT_ID(), 'CH₃CHO', FALSE);

-- Câu 46
INSERT INTO questions (content, category_id) VALUES ('Polime nào có nguồn gốc tự nhiên?', 2);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Cellulose', TRUE),
(LAST_INSERT_ID(), 'PVC', FALSE),
(LAST_INSERT_ID(), 'PE', FALSE),
(LAST_INSERT_ID(), 'PS', FALSE);

-- Câu 47
INSERT INTO questions (content, category_id) VALUES ('Phản ứng nào sau đây sinh ra khí clo?', 3);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Điện phân dung dịch NaCl có màng ngăn', TRUE),
(LAST_INSERT_ID(), 'Nhiệt phân KClO₃', FALSE),
(LAST_INSERT_ID(), 'Cho Cu tác dụng với HCl', FALSE),
(LAST_INSERT_ID(), 'Cho NaOH tác dụng với HCl', FALSE);

-- Câu 48
INSERT INTO questions (content, category_id) VALUES ('Phản ứng giữa kim loại và axit loãng thường sinh ra khí gì?', 3);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'H₂', TRUE),
(LAST_INSERT_ID(), 'O₂', FALSE),
(LAST_INSERT_ID(), 'CO₂', FALSE),
(LAST_INSERT_ID(), 'Cl₂', FALSE);

-- Câu 49
INSERT INTO questions (content, category_id) VALUES ('Phản ứng nào dùng để nhận biết ion SO₄²⁻?', 3);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Tác dụng với BaCl₂ tạo kết tủa trắng', TRUE),
 (LAST_INSERT_ID(), 'Tác dụng với NaOH', FALSE),
(LAST_INSERT_ID(), 'Tác dụng với HCl', FALSE),
(LAST_INSERT_ID(), 'Tác dụng với AgNO₃', FALSE);

-- Câu 50
INSERT INTO questions (content, category_id) VALUES ('Phản ứng nào sau đây là phản ứng tỏa nhiệt?', 3);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Đốt cháy than', TRUE),
(LAST_INSERT_ID(), 'Nhiệt phân CaCO₃', FALSE),
(LAST_INSERT_ID(), 'Điện phân nước', FALSE),
(LAST_INSERT_ID(), 'Quang hợp của cây xanh', FALSE);

-- Câu 51
INSERT INTO questions (content, category_id) VALUES ('Nguyên tử có số proton bằng số gì?', 4);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Số electron', TRUE),
(LAST_INSERT_ID(), 'Số neutron', FALSE),
(LAST_INSERT_ID(), 'Số khối', FALSE),
(LAST_INSERT_ID(), 'Số lớp electron', FALSE);

-- Câu 52
INSERT INTO questions (content, category_id) VALUES ('Đồng vị là những nguyên tử có cùng số proton nhưng khác số gì?', 4);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Neutron', TRUE),
(LAST_INSERT_ID(), 'Electron', FALSE),
(LAST_INSERT_ID(), 'Lớp vỏ', FALSE),
(LAST_INSERT_ID(), 'Orbital', FALSE);

-- Câu 53
INSERT INTO questions (content, category_id) VALUES ('Liên kết ion hình thành do hiện tượng gì?', 4);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Cho-nhận electron', TRUE),
(LAST_INSERT_ID(), 'Chia sẻ electron', FALSE),
(LAST_INSERT_ID(), 'Tương tác yếu', FALSE),
(LAST_INSERT_ID(), 'Hút tĩnh điện', FALSE);

-- Câu 54
INSERT INTO questions (content, category_id) VALUES ('Nguyên tố nào có độ âm điện cao nhất?', 4);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Flo (F)', TRUE),
(LAST_INSERT_ID(), 'Oxi (O)', FALSE),
(LAST_INSERT_ID(), 'Nitơ (N)', FALSE),
(LAST_INSERT_ID(), 'Clo (Cl)', FALSE);

-- Câu 55
INSERT INTO questions (content, category_id) VALUES ('Cấu hình electron của nguyên tử Na (Z=11) là gì?', 4);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), '1s² 2s² 2p⁶ 3s¹', TRUE),
(LAST_INSERT_ID(), '1s² 2s² 2p⁶', FALSE),
(LAST_INSERT_ID(), '1s² 2s² 2p⁶ 3s²', FALSE),
(LAST_INSERT_ID(), '1s² 2s² 2p⁶ 3s² 3p¹', FALSE);

-- Câu 56
INSERT INTO questions (content, category_id) VALUES ('Kim loại nào sau đây có tính khử mạnh nhất?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Kali (K)', TRUE),
(LAST_INSERT_ID(), 'Natri (Na)', FALSE),
(LAST_INSERT_ID(), 'Nhôm (Al)', FALSE),
(LAST_INSERT_ID(), 'Sắt (Fe)', FALSE);

-- Câu 57
INSERT INTO questions (content, category_id) VALUES ('Dung dịch nào sau đây có pH > 7?', 1);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'KOH 0.1M', TRUE),
(LAST_INSERT_ID(), 'HCl 0.1M', FALSE),
(LAST_INSERT_ID(), 'H₂SO₄ 0.1M', FALSE),
(LAST_INSERT_ID(), 'NaCl 0.1M', FALSE);

-- Câu 58
INSERT INTO questions (content, category_id) VALUES ('Chất nào sau đây thuộc loại amin?', 2);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'CH₃NH₂', TRUE),
(LAST_INSERT_ID(), 'CH₃COOH', FALSE),
(LAST_INSERT_ID(), 'C₂H₅OH', FALSE),
(LAST_INSERT_ID(), 'CH₃CHO', FALSE);

-- Câu 59
INSERT INTO questions (content, category_id) VALUES ('Phản ứng nào sau đây dùng để điều chế khí CO₂ trong phòng thí nghiệm?', 3);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'CaCO₃ + 2HCl → CaCl₂ + H₂O + CO₂↑', TRUE),
(LAST_INSERT_ID(), '2KClO₃ → 2KCl + 3O₂↑', FALSE),
(LAST_INSERT_ID(), 'Zn + H₂SO₄ → ZnSO₄ + H₂↑', FALSE),
(LAST_INSERT_ID(), 'NH₄Cl + NaOH → NaCl + NH₃↑ + H₂O', FALSE);

-- Câu 60
INSERT INTO questions (content, category_id) VALUES ('Nguyên tố nào sau đây là kim loại kiềm?', 4);
INSERT INTO answers (question_id, content, is_correct) VALUES
(LAST_INSERT_ID(), 'Rubidi (Rb)', TRUE),
(LAST_INSERT_ID(), 'Nhôm (Al)', FALSE),
(LAST_INSERT_ID(), 'Kẽm (Zn)', FALSE),
(LAST_INSERT_ID(), 'Chì (Pb)', FALSE);