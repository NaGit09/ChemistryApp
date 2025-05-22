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
    ExperimentCondition (
        id INT PRIMARY KEY AUTO_INCREMENT,
        condition_name NVARCHAR (50)
    );

CREATE TABLE
    Experiment (
        id INT PRIMARY KEY AUTO_INCREMENT,
        chemical_1 INT,
        chemical_2 INT,
        condition_id INT,
        description NVARCHAR (255),
        FOREIGN KEY (chemical_1) REFERENCES Chemicals (id),
        FOREIGN KEY (chemical_2) REFERENCES Chemicals (id),
        FOREIGN KEY (condition_id) REFERENCES ExperimentCondition (id)
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

INSERT INTO ExperimentCondition (condition_name)
VALUES ('Nhiệt độ thường'),
       ('Đun nóng'),
       ('Môi trường nước'),
       ('Có ánh sáng'),
       ('Môi trường axit'),
       ('Môi trường kiềm');

-- Giả sử chemical_1 = Natri (id = 7), chemical_2 = Axit Clohidric (id = 30), condition = 'Nhiệt độ thường' (id = 1)
INSERT INTO Experiment (chemical_1, chemical_2, condition_id, description)
VALUES
(1, 2, 1, 'Zn + 2HCl → ZnCl₂ + H₂↑'),
(3, 4, 2, 'Cu + 2AgNO₃ → Cu(NO₃)₂ + 2Ag↓'),
(5, 6, 3, 'NaOH + HCl → NaCl + H₂O'),
(7, 8, 1, 'CaCO₃ → CaO + CO₂↑ (nhiệt phân)'),
(9, 10, 4, 'BaCl₂ + Na₂SO₄ → BaSO₄↓ + 2NaCl'),
(11, 12, 1, 'H₂SO₄ + KOH → K₂SO₄ + H₂O'),
(13, 14, 2, 'Fe²⁺ + KMnO₄ + H⁺ → Fe³⁺ + Mn²⁺ + H₂O'),
(15, 16, 3, '2Al + Fe₂O₃ → 2Fe + Al₂O₃ (phản ứng nhiệt nhôm)'),
(17, 18, 1, 'Na₂CO₃ + CaCl₂ → CaCO₃↓ + 2NaCl'),
(19, 20, 4, 'CH₄ + 2O₂ → CO₂ + 2H₂O'),
(21, 22, 2, 'Cr³⁺ + NaOH → Cr(OH)₃ (kết tủa xanh lục)'),
(23, 24, 3, 'FeS + 2HCl → FeCl₂ + H₂S↑'),
(25, 26, 1, 'R-CHO + 2[Ag(NH₃)₂]⁺ + 3OH⁻ → R-COO⁻ + 2Ag↓ + 2H₂O + 4NH₃'),
(27, 28, 2, 'MnO₄⁻ + 8H⁺ + 5Fe²⁺ → Mn²⁺ + 5Fe³⁺ + 4H₂O'),
(29, 30, 3, 'KI + Pb(NO₃)₂ → PbI₂↓ + 2KNO₃'),
(31, 32, 1, 'AgNO₃ + NaCl → AgCl↓ + NaNO₃'),
(33, 34, 2, 'CuSO₄ + NaOH → Cu(OH)₂↓ (xanh lam)'),
(35, 36, 4, 'S + O₂ → SO₂ (khí độc)'),
(37, 38, 1, '4Fe²⁺ + O₂ + 4H⁺ → 4Fe³⁺ + 2H₂O'),
(39, 40, 3, 'Na₂SiO₃ + H₂O → NaOH + H₂SiO₃'),
(41, 42, 1, 'NH₄Cl + Ca(OH)₂ → NH₃↑ + CaCl₂ + H₂O'),
(43, 44, 4, 'Na₂SO₃ + H₂SO₄ → Na₂SO₄ + H₂O + SO₂↑'),
(45, 46, 3, 'H₂S + SO₂ → S↓ + H₂O'),
(47, 48, 2, 'Mg + O₂ → MgO + nhiệt và ánh sáng');

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

