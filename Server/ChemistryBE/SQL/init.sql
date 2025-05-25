CREATE DATABASE IF NOT EXISTS chemistry;
USE chemistry;

-- users table
CREATE TABLE IF NOT EXISTS users
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    full_name     VARCHAR(255)                              NOT NULL,
    email         VARCHAR(255) UNIQUE                       NOT NULL,
    password_hash VARCHAR(255)                              NOT NULL,
    role          ENUM ('student', 'teacher', 'researcher') NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- types table
CREATE TABLE IF NOT EXISTS types
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        NVARCHAR(50) DEFAULT NULL,
    description TEXT         DEFAULT NULL
);

-- chemicals table (phụ thuộc vào types)
CREATE TABLE IF NOT EXISTS chemicals
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    name          NVARCHAR(50) DEFAULT NULL,
    atomic_weight DOUBLE       DEFAULT NULL,
    symbol        NVARCHAR(50) DEFAULT NULL,
    type_id       INT          DEFAULT NULL,
    hazard_infor  NVARCHAR(255),
    status        NVARCHAR(255),
    description   TEXT         DEFAULT NULL,
    category      VARCHAR(5)   DEFAULT NULL,
    image         TEXT         DEFAULT NULL,
    FOREIGN KEY (type_id) REFERENCES types (id) ON DELETE CASCADE
);

-- experiment table (phụ thuộc vào chemicals)
CREATE TABLE IF NOT EXISTS experiment
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    chemical_1  INT,
    chemical_2  INT,
    description NVARCHAR(255),
    FOREIGN KEY (chemical_1) REFERENCES chemicals (id),
    FOREIGN KEY (chemical_2) REFERENCES chemicals (id)
);

-- question_categories table
CREATE TABLE IF NOT EXISTS question_categories
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- questions table (phụ thuộc vào question_categories)
CREATE TABLE IF NOT EXISTS questions
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    content     TEXT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES question_categories (id)
);

-- answers table (phụ thuộc vào questions)
CREATE TABLE IF NOT EXISTS answers
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT,
    content     TEXT NOT NULL,
    is_correct  BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (question_id) REFERENCES questions (id)
);

-- user_answers table (phụ thuộc vào users, questions, answers)
CREATE TABLE IF NOT EXISTS user_answers
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT,
    question_id INT,
    answer_id   INT,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (question_id) REFERENCES questions (id),
    FOREIGN KEY (answer_id) REFERENCES answers (id)
);

-- INSERT DATA
INSERT INTO types (name, description)
VALUES 
('Noble Gas', 'Inert gas group'),
('Alkali Metal', 'Strong metals that react with water'),
('Alkaline Earth Metal', 'Less reactive than alkali metals'),
('Halogen', 'Highly reactive nonmetal group'),
('Transition Metal', 'Durable metals with good electrical conductivity'),
('Nonmetal', 'Non-conductive and volatile elements'),
('Post-Transition Metal', 'Less conductive than transition metals'),
('Rare Earth Element', 'Rare elements used in industry'),
('Actinide', 'Heavy radioactive elements'),
('Acid', 'Compounds with acidic properties, corrosive and reactive with bases'),
('Base', 'Alkaline compounds that typically react with acids to form salts and water'),
('Salt', 'Compounds formed from acid-base reactions'),
('Compound', 'Other chemical compounds not classified above');


INSERT INTO chemicals (name, atomic_weight, symbol, type_id, hazard_infor, status, description, category, image)
VALUES
-- Khí hiếm (type_id = 1)
('Helium', 4.0026, 'He', 1, 'Safe, non-reactive', 'In stock', 'Colorless noble gas used for cooling',
 1, 'https://upload.wikimedia.org/wikipedia/commons/8/84/Electron_shell_002_Helium_-_no_label.svg'),
('Neon', 20.180, 'Ne', 1, 'Safe', 'In stock', 'Noble gas used in lighting',
 1, 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Electron_shell_010_Neon_-_no_label.svg'),
('Argon', 39.948, 'Ar', 1, 'Safe', 'In stock', 'Noble gas used in welding and lighting',
 1, 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Electron_shell_018_Argon_-_no_label.svg'),

('Lithium', 6.94, 'Li', 2, 'Reacts with water, flammable', 'Handle with care', 'Light metal used in batteries',
 1, 'https://upload.wikimedia.org/wikipedia/commons/a/ae/Electron_shell_003_Lithium_-_no_label.svg'),
('Sodium', 22.990, 'Na', 2, 'Highly reactive with water', 'Handle with care', 'Soft metal with good conductivity',
 1, 'https://upload.wikimedia.org/wikipedia/commons/8/87/Electron_shell_011_Sodium_-_no_label.svg'),
('Potassium', 39.098, 'K', 2, 'Highly reactive with water', 'Dangerous', 'Soft, silvery metal',
 1, 'https://upload.wikimedia.org/wikipedia/commons/9/92/Electron_shell_019_Potassium_-_no_label.svg'),
-- Alkaline earth metals (type_id = 3)
('Beryllium', 9.0122, 'Be', 3, 'Toxic if inhaled', 'Dangerous', 'Light, hard metal used in alloys',
 1, 'https://upload.wikimedia.org/wikipedia/commons/4/40/Electron_shell_004_Beryllium_-_no_label.svg'),
('Magnesium', 24.305, 'Mg', 3, 'Flammable in powder form', 'Handle with care', 'Used in flares and lightweight alloys',
 1, 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Electron_shell_012_Magnesium_-_no_label.svg'),
('Calcium', 40.078, 'Ca', 3, 'Reacts with water', 'Handle with care', 'Alkaline earth metal, essential for bones',
 1, 'https://upload.wikimedia.org/wikipedia/commons/5/57/Electron_shell_020_Calcium_-_no_label.svg'),

-- Halogens (type_id = 4)
('Fluorine', 18.998, 'F', 4, 'Highly toxic, highly corrosive', 'Dangerous', 'Strongest halogen, pale yellow',
 1, 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Electron_shell_009_Fluorine_-_no_label.svg'),
('Chlorine', 35.45, 'Cl', 4, 'Toxic gas, causes suffocation', 'Dangerous', 'Halogen gas, used in water treatment',
 1, 'https://upload.wikimedia.org/wikipedia/commons/1/17/Electron_shell_017_Chlorine_-_no_label.svg'),

-- Nonmetals (type_id = 6)
('Hydrogen', 1.008, 'H', 6, 'Flammable and explosive when combined with oxygen', 'In stock', 'Lightest element, abundant in the universe',
 1, 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Electron_shell_001_Hydrogen_-_no_label.svg'),
('Carbon', 12.011, 'C', 6, 'Non-toxic in charcoal/graphite form', 'In stock', 'Fundamental element for life',
 1, 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Electron_shell_006_Carbon_-_no_label.svg'),
('Nitrogen', 14.007, 'N', 6, 'Non-toxic but can cause suffocation', 'In stock', 'Gas that makes up most of the atmosphere',
 1, 'https://upload.wikimedia.org/wikipedia/commons/6/69/Electron_shell_007_Nitrogen_-_no_label.svg'),
('Oxygen', 15.999, 'O', 6, 'Supports combustion, non-toxic', 'In stock', 'Essential for life',
 1, 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Electron_shell_008_Oxygen_-_no_label.svg'),
('Phosphorus', 30.974, 'P', 6, 'White phosphorus is very toxic and flammable', 'Dangerous', 'Nonmetal essential for biology',
 1, 'https://upload.wikimedia.org/wikipedia/commons/0/09/Electron_shell_015_Phosphorus_-_no_label.svg'),
('Sulfur', 32.06, 'S', 6, 'Irritant', 'Handle with care', 'Yellow solid, used in industry',
 1, 'https://upload.wikimedia.org/wikipedia/commons/9/96/Electron_shell_016_Sulfur_-_no_label.svg'),
('Silicon', 28.085, 'Si', 6, 'Non-toxic', 'In stock', 'Widely used in semiconductor technology',
 1, 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Electron_shell_014_Silicon_-_no_label.svg'),
('Boron', 10.81, 'B', 6, 'Non-toxic, but dust can be harmful', 'In stock', 'Nonmetal used in semiconductors',
 1, 'https://upload.wikimedia.org/wikipedia/commons/8/89/Electron_shell_005_Boron_-_no_label.svg'),

-- Transition metals (type_id = 5)
('Iron', 55.845, 'Fe', 5, 'Non-toxic', 'In stock', 'Common metal used for steel',
 1, 'https://upload.wikimedia.org/wikipedia/commons/c/c6/Electron_shell_026_Iron_-_no_label.svg'),
('Copper', 63.546, 'Cu', 5, 'Non-toxic', 'In stock', 'Good conductor, reddish-brown color',
 1, 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Electron_shell_029_Copper_-_no_label.svg'),
('Zinc', 65.38, 'Zn', 5, 'Non-toxic', 'In stock', 'Corrosion resistant, used for plating metals',
 1, 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Electron_shell_030_Zinc_-_no_label.svg'),
('Nickel', 58.693, 'Ni', 5, 'May cause allergies', 'In stock', 'Durable metal, corrosion resistant',
 1, 'https://upload.wikimedia.org/wikipedia/commons/d/d2/Electron_shell_028_Nickel_-_no_label.svg'),
('Chromium', 51.996, 'Cr', 5, 'Some forms are toxic', 'Handle with care', 'Provides shine for stainless steel',
 1, 'https://upload.wikimedia.org/wikipedia/commons/6/67/Electron_shell_024_Chromium_-_no_label.svg'),

-- Post-transition metals (type_id = 7)
('Aluminum', 26.982, 'Al', 7, 'Non-toxic', 'In stock', 'Lightweight, non-rusting metal',
 1, 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Electron_shell_013_Aluminium_-_no_label.svg'),
('Lead', 207.2, 'Pb', 7, 'Highly toxic with long-term exposure', 'Dangerous', 'Heavy metal, formerly used in paints',
 1, 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Electron_shell_082_Lead_-_no_label.svg'),
('Tin', 118.71, 'Sn', 7, 'Non-toxic', 'In stock', 'Used as protective coating for other metals',
 1, 'https://upload.wikimedia.org/wikipedia/commons/1/13/Electron_shell_050_Tin_-_no_label.svg'),

-- Rare earth elements (type_id = 8)
('Lanthanum', 138.91, 'La', 8, 'Non-toxic in small amounts', 'In stock', 'Used in batteries and catalysts',
 1, 'https://upload.wikimedia.org/wikipedia/commons/1/14/Electron_shell_057_Lanthanum_-_no_label.svg'),
('Cerium', 140.12, 'Ce', 8, 'Non-toxic', 'In stock', 'Used in glass and catalysts',
 1, 'https://upload.wikimedia.org/wikipedia/commons/e/ea/Electron_shell_058_Cerium_-_no_label.svg'),
('Neodymium', 144.24, 'Nd', 8, 'Non-toxic', 'In stock', 'Used in strong magnets',
 1, 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Electron_shell_060_Neodymium_-_no_label.svg'),

-- Actinides (type_id = 9)
('Uranium', 238.03, 'U', 9, 'Radioactive, toxic', 'Dangerous', 'Used in nuclear energy',
 1, 'https://upload.wikimedia.org/wikipedia/commons/4/40/Electron_shell_092_Uranium_-_no_label.svg'),
('Thorium', 232.04, 'Th', 9, 'Weakly radioactive', 'Dangerous', 'Potential for clean nuclear energy',
 1, 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Electron_shell_090_Thorium_-_no_label.svg'),
('Plutonium', 244, 'Pu', 9, 'Highly radioactive, extremely toxic', 'Dangerous', 'Used in nuclear weapons and energy',
 1, 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Electron_shell_094_Plutonium_-_no_label.svg'),

-- Compound group
('Water', 18.015, 'H2O', (SELECT id FROM types WHERE name = 'Compound'), 'Non-toxic, essential for life', 'Stable',
 'The most common compound on Earth, essential for all forms of life.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Water_drop_001.jpg'),
('Hydrochloric Acid', 36.46, 'HCl', (SELECT id FROM types WHERE name = 'Acid'), 'Strongly corrosive, can cause skin burns',
 'Stable', 'A strong acid widely used in industry and laboratories.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/d/da/Hydrochloric_acid_01.jpg'),
('Sulfuric Acid', 98.079, 'H2SO4', (SELECT id FROM types WHERE name = 'Acid'), 'Strongly corrosive, can cause severe burns',
 'Stable', 'Used to produce fertilizers, detergents, and in the chemical industry.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/b/b6/Sulphuric_acid_96_percent_extra_pure.jpg'),
('Nitric Acid', 63.01, 'HNO3', (SELECT id FROM types WHERE name = 'Acid'), 'Strongly corrosive, causes chemical burns',
 'Unstable at high temperatures', 'Used to produce nitrogen fertilizers and explosives.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/4/48/Nitric_acid_lab.jpg'),
('Acetic Acid', 60.05, 'CH3COOH', (SELECT id FROM types WHERE name = 'Acid'), 'Low toxicity, has a distinctive smell', 'Stable',
 'Main component of vinegar, used in the food industry and chemicals.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/b/b3/AceticAcid012.jpg'),
('Phosphoric Acid', 97.994, 'H3PO4', (SELECT id FROM types WHERE name = 'Acid'), 'Mildly corrosive, can cause irritation',
 'Stable', 'Used in food, pharmaceuticals, and fertilizer production.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/5/59/Phosphoric-acid-3D-vdW.svg'),
('Sodium Hydroxide', 39.997, 'NaOH', (SELECT id FROM types WHERE name = 'Base'), 'Strongly corrosive, causes skin burns', 'Stable',
 'Strong base, used in soap and detergent production.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/3/34/SodiumHydroxide.jpg'),
('Potassium Hydroxide', 56.11, 'KOH', (SELECT id FROM types WHERE name = 'Base'), 'Strongly corrosive, dangerous upon contact',
 'Stable', 'Used to produce alkaline batteries and liquid soap.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/3/33/Potassium_hydroxide.jpg'),
('Sodium Chloride', 58.44, 'NaCl', (SELECT id FROM types WHERE name = 'Salt'), 'Non-toxic, highly soluble in water', 'Stable',
 'Commonly known as table salt, essential for human life.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Selpologne.jpg'),
('Calcium Carbonate', 100.086, 'CaCO3', (SELECT id FROM types WHERE name = 'Salt'), 'Non-toxic, poorly soluble in water',
 'Stable', 'Found in limestone, shells, used in construction and food.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/0/04/Calcium_carbonate.jpg'),
('Sodium Bicarbonate', 84.006, 'NaHCO3', (SELECT id FROM types WHERE name = 'Salt'), 'Non-toxic, used in food',
 'Stable', 'Also called baking soda, used in cooking and cleaning.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/8/81/Sodium_bicarbonate.jpg'),
('Ammonia', 17.031, 'NH3', (SELECT id FROM types WHERE name = 'Compound'), 'Toxic gas, causes strong irritation',
 'Unstable at high temperatures', 'Widely used in fertilizer industry and refrigeration.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Hydrochloric_acid_ammonia.jpg'),
('Carbon Dioxide', 44.01, 'CO2', (SELECT id FROM types WHERE name = 'Compound'),
 'Non-toxic at low concentrations, suffocating at high concentrations', 'Stable',
 'Common greenhouse gas, byproduct of respiration and combustion.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/4/41/Carbon-dioxide-3D-vdW.png'),
('Sulfur Dioxide', 64.07, 'SO2', (SELECT id FROM types WHERE name = 'Compound'), 'Irritates eyes and respiratory tract',
 'Unstable at high temperatures', 'Toxic gas, produced by burning fossil fuels, causes acid rain.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/e/e4/Sulfur-dioxide-2D.svg'),
('Silver Nitrate', 169.87, 'AgNO3', (SELECT id FROM types WHERE name = 'Salt'), 'Can be corrosive, causes skin irritation', 'Stable',
 'Used in silver plating reactions and pharmaceutical production.',
 2, 'https://upload.wikimedia.org/wikipedia/commons/0/02/AgNO3.jpg');

-- Assume chemical_1 = Sodium (id = 7), chemical_2 = Hydrochloric Acid (id = 30), condition = 'Room Temperature' (id = 1)
INSERT INTO experiment (chemical_1, chemical_2, description)
VALUES 
  (1, 2,N'No reaction'),
  (5, 11,N'NaCl + H₂O'),
  (12, 15,N'H₂O'),
  (35, 40,N'NaCl + H₂O'),
  (48, 42,N' AgCl↓ + NaNO₃'),

  (3, 10,N'No reaction'),
  (4, 5,N'Li-Na alloy'),
  (6, 7,N'K-Be alloy'),
  (8, 9,N'Mg-Ca alloy'),
  (13, 14,N'CN⁻ or organic compounds'),
  (16, 17,N'PS'),
  (18, 19,N'Si-B alloy'),
  (20, 21,N'Fe-Cu alloy'),
  (22, 23,N'Zn-Ni alloy'),
  (24, 25,N'Cr-Al alloy'),
  (26, 27,N'Pb-Sn alloy'),
  (28, 29,N'La-Ce alloy'),
  (30, 31,N'Nd-U compound'),
  (32, 33,N'Th-Pu compound'),
  (34, 35,N'Diluted HCl'),

  (36, 40,N'Na₂SO₄ + H₂O'),
  (37, 41,N'KNO₃ + H₂O'),
  (38, 42,N'Acetate solution + NaCl'),
  (39, 43,N'Ca₃(PO₄)₂ + H₂O + CO₂↑'),
  (43, 44,N'NaHCO₃ + H₂O + CO₂↑'),
  (45, 46,N'Na₂SO₄ + H₂O'),
  (47, 48,N'KNO₃ + H₂O'),
  (44, 45,N'Na₂CO₃ + H₂O + CO₂↑'),
  (11, 34,N'HCl + HClO + H₂O'),
  (10, 12,N'Na₂SO₄ + H₂O + CO₂↑'),
  (13, 14,N'NH₃ + H₂O'),
  (15, 16,N'CO₂ + H₂O'),
  (17, 18,N'SO₂ + H₂O'),
  (19, 20,N'AgNO₃ + NaCl'),
  (21, 22,N'AgNO₃ + NaHCO₃'),
  (23, 24,N'AgNO₃ + Na₂SO₄'),
  (25, 26,N'AgNO₃ + KNO₃'),
  (27, 28,N'AgNO₃ + CaCO₃'),
  (5, 15,N'Na₂O'),
  (12, 16,N'PH₃');

INSERT INTO question_categories (name)
VALUES ('Inorganic Chemistry'),
('Organic Chemistry'),
('Chemical Reactions'),
('General Chemistry');
-- Câu hỏi 1
INSERT INTO questions (content, category_id)
VALUES ('Phản ứng nào sau đây tạo ra khí H₂?', 1);

INSERT INTO answers (question_id, content, is_correct)
VALUES (LAST_INSERT_ID(), 'Na + H₂O → NaOH + H₂↑', TRUE),
       (LAST_INSERT_ID(), 'NaCl + AgNO₃ → AgCl↓ + NaNO₃', FALSE),
       (LAST_INSERT_ID(), 'HCl + NaOH → NaCl + H₂O', FALSE),
       (LAST_INSERT_ID(), 'CaCO₃ → CaO + CO₂↑', FALSE);

-- Câu hỏi 2
INSERT INTO questions (content, category_id)
VALUES ('Chất nào tạo kết tủa vàng khi phản ứng với Pb(NO₃)₂?', 1);

INSERT INTO answers (question_id, content, is_correct)
VALUES (LAST_INSERT_ID(), 'KI', TRUE),
       (LAST_INSERT_ID(), 'NaCl', FALSE),
       (LAST_INSERT_ID(), 'KBr', FALSE),
       (LAST_INSERT_ID(), 'KNO₃', FALSE);

-- Câu hỏi 3
INSERT INTO questions (content, category_id)
VALUES ('Chất nào sau đây là axit mạnh?', 1);

INSERT INTO answers (question_id, content, is_correct)
VALUES (LAST_INSERT_ID(), 'HCl', TRUE),
       (LAST_INSERT_ID(), 'CH₃COOH', FALSE),
       (LAST_INSERT_ID(), 'H₂CO₃', FALSE),
       (LAST_INSERT_ID(), 'H₂O', FALSE);

-- Câu hỏi 4
INSERT INTO questions (content, category_id)
VALUES ('Phản ứng nào sau đây là phản ứng oxi hóa-khử?', 3);

INSERT INTO answers (question_id, content, is_correct)
VALUES (LAST_INSERT_ID(), 'Zn + 2HCl → ZnCl₂ + H₂↑', TRUE),
       (LAST_INSERT_ID(), 'NaCl + AgNO₃ → AgCl↓ + NaNO₃', FALSE),
       (LAST_INSERT_ID(), 'NaOH + HCl → NaCl + H₂O', FALSE),
       (LAST_INSERT_ID(), 'CaCO₃ → CaO + CO₂↑', FALSE);

-- Câu hỏi 5
INSERT INTO questions (content, category_id)
VALUES ('Nguyên tố nào sau đây thuộc nhóm halogen?', 4);

INSERT INTO answers (question_id, content, is_correct)
VALUES (LAST_INSERT_ID(), 'Cl', TRUE),
       (LAST_INSERT_ID(), 'Na', FALSE),
       (LAST_INSERT_ID(), 'Fe', FALSE),
       (LAST_INSERT_ID(), 'Si', FALSE);

-- -- Câu hỏi 6
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây tạo kết tủa trắng với AgNO₃?', 1);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'NaCl', TRUE),
--        (LAST_INSERT_ID(), 'KNO₃', FALSE),
--        (LAST_INSERT_ID(), 'Na₂SO₄', FALSE),
--        (LAST_INSERT_ID(), 'Na₃PO₄', FALSE);

-- -- Câu hỏi 7
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng nào sau đây tạo ra khí CO₂?', 3);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'CaCO₃ + 2HCl → CaCl₂ + H₂O + CO₂↑', TRUE),
--        (LAST_INSERT_ID(), 'Zn + H₂SO₄ → ZnSO₄ + H₂↑', FALSE),
--        (LAST_INSERT_ID(), 'NaOH + HCl → NaCl + H₂O', FALSE),
--        (LAST_INSERT_ID(), 'AgNO₃ + NaCl → AgCl↓ + NaNO₃', FALSE);

-- -- Câu hỏi 8
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây là bazơ mạnh?', 1);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'NaOH', TRUE),
--        (LAST_INSERT_ID(), 'NH₃', FALSE),
--        (LAST_INSERT_ID(), 'Al(OH)₃', FALSE),
--        (LAST_INSERT_ID(), 'H₂O', FALSE);

-- -- Câu hỏi 9
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng nào sau đây là phản ứng trao đổi?', 3);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'AgNO₃ + NaCl → AgCl↓ + NaNO₃', TRUE),
--        (LAST_INSERT_ID(), 'Zn + 2HCl → ZnCl₂ + H₂↑', FALSE),
--        (LAST_INSERT_ID(), 'CH₄ + 2O₂ → CO₂ + 2H₂O', FALSE),
--        (LAST_INSERT_ID(), '2H₂O → 2H₂↑ + O₂↑', FALSE);

-- -- Câu hỏi 10
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây là muối tan?', 1);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'NaCl', TRUE),
--        (LAST_INSERT_ID(), 'AgCl', FALSE),
--        (LAST_INSERT_ID(), 'BaSO₄', FALSE),
--        (LAST_INSERT_ID(), 'CaCO₃', FALSE);

-- -- Câu hỏi 11
-- INSERT INTO questions (content, category_id)
-- VALUES ('Kim loại nào phản ứng mãnh liệt với nước tạo thành dung dịch kiềm và khí H₂?', 1);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Kali (K)', TRUE),
--        (LAST_INSERT_ID(), 'Sắt (Fe)', FALSE),
--        (LAST_INSERT_ID(), 'Đồng (Cu)', FALSE),
--        (LAST_INSERT_ID(), 'Bạc (Ag)', FALSE);

-- -- Câu hỏi 12
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây là hidrocacbon đơn giản nhất?', 2);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Metan (CH₄)', TRUE),
--        (LAST_INSERT_ID(), 'Etanol (C₂H₅OH)', FALSE),
--        (LAST_INSERT_ID(), 'Axit axetic (CH₃COOH)', FALSE),
--        (LAST_INSERT_ID(), 'Glucose (C₆H₁₂O₆)', FALSE);

-- -- Câu hỏi 13
-- INSERT INTO questions (content, category_id)
-- VALUES ('Hiện tượng gì xảy ra khi nhỏ dung dịch NaOH vào dung dịch CuSO₄?', 3);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Xuất hiện kết tủa xanh lam', TRUE),
--        (LAST_INSERT_ID(), 'Sủi bọt khí không màu', FALSE),
--        (LAST_INSERT_ID(), 'Dung dịch chuyển sang màu hồng', FALSE),
--        (LAST_INSERT_ID(), 'Không có hiện tượng gì', FALSE);

-- -- Câu hỏi 14
-- INSERT INTO questions (content, category_id)
-- VALUES ('Nguyên tử được cấu tạo bởi các loại hạt nào?', 4);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Proton, neutron và electron', TRUE),
--        (LAST_INSERT_ID(), 'Chỉ có proton và electron', FALSE),
--        (LAST_INSERT_ID(), 'Chỉ có neutron và electron', FALSE),
--        (LAST_INSERT_ID(), 'Photon và electron', FALSE);

-- -- Câu hỏi 15
-- INSERT INTO questions (content, category_id)
-- VALUES ('Oxit nào sau đây là oxit axit?', 1);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'SO₂', TRUE),
--        (LAST_INSERT_ID(), 'CaO', FALSE),
--        (LAST_INSERT_ID(), 'Na₂O', FALSE),
--        (LAST_INSERT_ID(), 'Fe₂O₃', FALSE);

-- -- Câu hỏi 16
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây có phản ứng tráng bạc?', 2);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Glucose', TRUE),
--        (LAST_INSERT_ID(), 'Etanol', FALSE),
--        (LAST_INSERT_ID(), 'Axit axetic', FALSE),
--        (LAST_INSERT_ID(), 'Metan', FALSE);

-- -- Câu hỏi 17
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng nào sau đây dùng để điều chế khí O₂ trong phòng thí nghiệm?', 3);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Nhiệt phân KClO₃ với xúc tác MnO₂', TRUE),
--        (LAST_INSERT_ID(), 'Cho CaCO₃ tác dụng với HCl', FALSE),
--        (LAST_INSERT_ID(), 'Điện phân dung dịch NaCl', FALSE),
--        (LAST_INSERT_ID(), 'Nung nóng Cu(NO₃)₂', FALSE);

-- -- Câu hỏi 18
-- INSERT INTO questions (content, category_id)
-- VALUES ('Liên kết hóa học giữa các nguyên tử trong phân tử nước là loại liên kết gì?', 4);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Liên kết cộng hóa trị phân cực', TRUE),
--        (LAST_INSERT_ID(), 'Liên kết ion', FALSE),
--        (LAST_INSERT_ID(), 'Liên kết kim loại', FALSE),
--        (LAST_INSERT_ID(), 'Liên kết hydro', FALSE);

-- -- Câu hỏi 19
-- INSERT INTO questions (content, category_id)
-- VALUES ('Dung dịch nào sau đây có pH < 7?', 1);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Dung dịch HCl 0.1M', TRUE),
--        (LAST_INSERT_ID(), 'Dung dịch NaOH 0.1M', FALSE),
--        (LAST_INSERT_ID(), 'Dung dịch NaCl 0.1M', FALSE),
--        (LAST_INSERT_ID(), 'Nước cất', FALSE);

-- -- Câu hỏi 20
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây thuộc loại ankan?', 2);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Butan (C₄H₁₀)', TRUE),
--        (LAST_INSERT_ID(), 'Etilen (C₂H₄)', FALSE),
--        (LAST_INSERT_ID(), 'Axetilen (C₂H₂)', FALSE),
--        (LAST_INSERT_ID(), 'Benzen (C₆H₆)', FALSE);

-- -- Câu hỏi 21
-- INSERT INTO questions (content, category_id)
-- VALUES ('Kim loại nào dẫn điện tốt nhất?', 1);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Bạc (Ag)', TRUE),
--        (LAST_INSERT_ID(), 'Đồng (Cu)', FALSE),
--        (LAST_INSERT_ID(), 'Nhôm (Al)', FALSE),
--        (LAST_INSERT_ID(), 'Vàng (Au)', FALSE);

-- -- Câu hỏi 22
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây là ancol?', 2);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'C₂H₅OH', TRUE),
--        (LAST_INSERT_ID(), 'CH₃COOH', FALSE),
--        (LAST_INSERT_ID(), 'C₆H₁₂O₆', FALSE),
--        (LAST_INSERT_ID(), 'CH₄', FALSE);

-- -- Câu hỏi 23
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng nào sau đây là phản ứng nhiệt phân?', 3);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), '2KClO₃ → 2KCl + 3O₂', TRUE),
--        (LAST_INSERT_ID(), 'Zn + 2HCl → ZnCl₂ + H₂', FALSE),
--        (LAST_INSERT_ID(), 'NaOH + HCl → NaCl + H₂O', FALSE),
--        (LAST_INSERT_ID(), 'AgNO₃ + NaCl → AgCl + NaNO₃', FALSE);

-- -- Câu hỏi 24
-- INSERT INTO questions (content, category_id)
-- VALUES ('Số electron tối đa trong lớp vỏ thứ 2 là bao nhiêu?', 4);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), '8', TRUE),
--        (LAST_INSERT_ID(), '2', FALSE),
--        (LAST_INSERT_ID(), '18', FALSE),
--        (LAST_INSERT_ID(), '32', FALSE);

-- -- Câu hỏi 25
-- INSERT INTO questions (content, category_id)
-- VALUES ('Dung dịch làm quỳ tím hóa xanh là:', 1);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'NaOH', TRUE),
--        (LAST_INSERT_ID(), 'HCl', FALSE),
--        (LAST_INSERT_ID(), 'H₂SO₄', FALSE),
--        (LAST_INSERT_ID(), 'NaCl', FALSE);

-- -- Câu hỏi 26
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây có liên kết đôi C=C?', 2);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Etilen (C₂H₄)', TRUE),
--        (LAST_INSERT_ID(), 'Metan (CH₄)', FALSE),
--        (LAST_INSERT_ID(), 'Axetilen (C₂H₂)', FALSE),
--        (LAST_INSERT_ID(), 'Etan (C₂H₆)', FALSE);

-- -- Câu hỏi 27
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng giữa axit và bazơ tạo thành muối và nước được gọi là gì?', 3);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Phản ứng trung hòa', TRUE),
--        (LAST_INSERT_ID(), 'Phản ứng oxi hóa-khử', FALSE),
--        (LAST_INSERT_ID(), 'Phản ứng thế', FALSE),
--        (LAST_INSERT_ID(), 'Phản ứng phân hủy', FALSE);

-- -- Câu hỏi 28
-- INSERT INTO questions (content, category_id)
-- VALUES ('Nguyên tố có số hiệu nguyên tử 17 thuộc nhóm nào?', 4);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Nhóm halogen (VIIA)', TRUE),
--        (LAST_INSERT_ID(), 'Nhóm kim loại kiềm (IA)', FALSE),
--        (LAST_INSERT_ID(), 'Nhóm khí hiếm (VIIIA)', FALSE),
--        (LAST_INSERT_ID(), 'Nhóm kim loại kiềm thổ (IIA)', FALSE);

-- -- Câu hỏi 29
-- INSERT INTO questions (content, category_id)
-- VALUES ('Oxit nào sau đây tác dụng với nước tạo thành axit?', 1);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'SO₃', TRUE),
--        (LAST_INSERT_ID(), 'CaO', FALSE),
--        (LAST_INSERT_ID(), 'Na₂O', FALSE),
--        (LAST_INSERT_ID(), 'Fe₂O₃', FALSE);

-- -- Câu hỏi 30
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây thuộc loại axit cacboxylic?', 2);

-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'CH₃COOH', TRUE),
--        (LAST_INSERT_ID(), 'C₂H₅OH', FALSE),
--        (LAST_INSERT_ID(), 'CH₃CHO', FALSE),
--        (LAST_INSERT_ID(), 'C₆H₆', FALSE);

-- -- Câu 31
-- INSERT INTO questions (content, category_id)
-- VALUES ('Kim loại nào nhẹ nhất trong bảng tuần hoàn?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Liti (Li)', TRUE),
--        (LAST_INSERT_ID(), 'Nhôm (Al)', FALSE),
--        (LAST_INSERT_ID(), 'Magie (Mg)', FALSE),
--        (LAST_INSERT_ID(), 'Natri (Na)', FALSE);

-- -- Câu 32
-- INSERT INTO questions (content, category_id)
-- VALUES ('Khí nào gây ra hiệu ứng nhà kính mạnh nhất?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'CFC', TRUE),
--        (LAST_INSERT_ID(), 'CO₂', FALSE),
--        (LAST_INSERT_ID(), 'CH₄', FALSE),
--        (LAST_INSERT_ID(), 'N₂O', FALSE);

-- -- Câu 33
-- INSERT INTO questions (content, category_id)
-- VALUES ('Khoáng vật nào là nguồn chính của nhôm?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Bauxite', TRUE),
--        (LAST_INSERT_ID(), 'Hematite', FALSE),
--        (LAST_INSERT_ID(), 'Galena', FALSE),
--        (LAST_INSERT_ID(), 'Magnetite', FALSE);

-- -- Câu 34
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây được dùng để khử chua đất?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'CaO', TRUE),
--        (LAST_INSERT_ID(), 'NaCl', FALSE),
--        (LAST_INSERT_ID(), 'H₂SO₄', FALSE),
--        (LAST_INSERT_ID(), 'KNO₃', FALSE);

-- -- Câu 35
-- INSERT INTO questions (content, category_id)
-- VALUES ('Kim loại nào có nhiệt độ nóng chảy cao nhất?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Wolfram (W)', TRUE),
--        (LAST_INSERT_ID(), 'Sắt (Fe)', FALSE),
--        (LAST_INSERT_ID(), 'Đồng (Cu)', FALSE),
--        (LAST_INSERT_ID(), 'Vàng (Au)', FALSE);

-- -- Câu 36
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phèn chua có công thức hóa học là gì?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'KAl(SO₄)₂.12H₂O', TRUE),
--        (LAST_INSERT_ID(), 'Na₂CO₃', FALSE),
--        (LAST_INSERT_ID(), 'CaSO₄.2H₂O', FALSE),
--        (LAST_INSERT_ID(), 'MgSO₄', FALSE);

-- -- Câu 37
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây không phải là muối?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'NaOH', TRUE),
--        (LAST_INSERT_ID(), 'NaCl', FALSE),
--        (LAST_INSERT_ID(), 'CaCO₃', FALSE),
--        (LAST_INSERT_ID(), 'KNO₃', FALSE);

-- -- Câu 38
-- INSERT INTO questions (content, category_id)
-- VALUES ('Khí nào được dùng để khử trùng nước sinh hoạt?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Clo (Cl₂)', TRUE),
--        (LAST_INSERT_ID(), 'Oxi (O₂)', FALSE),
--        (LAST_INSERT_ID(), 'Nitơ (N₂)', FALSE),
--        (LAST_INSERT_ID(), 'CO₂', FALSE);

-- -- Câu 39
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây có đồng phân hình học?', 2);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'But-2-en', TRUE),
--        (LAST_INSERT_ID(), 'Etan', FALSE),
--        (LAST_INSERT_ID(), 'Axetilen', FALSE),
--        (LAST_INSERT_ID(), 'Metan', FALSE);

-- -- Câu 40
-- INSERT INTO questions (content, category_id)
-- VALUES ('Loại đường nào có trong sữa?', 2);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Lactose', TRUE),
--        (LAST_INSERT_ID(), 'Glucose', FALSE),
--        (LAST_INSERT_ID(), 'Fructose', FALSE),
--        (LAST_INSERT_ID(), 'Sucrose', FALSE);

-- -- Câu 41
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất béo có đặc điểm gì?', 2);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Không tan trong nước', TRUE),
--        (LAST_INSERT_ID(), 'Tan tốt trong nước', FALSE),
--        (LAST_INSERT_ID(), 'Là hợp chất vô cơ', FALSE),
--        (LAST_INSERT_ID(), 'Có nhiệt độ sôi thấp', FALSE);

-- -- Câu 42
-- INSERT INTO questions (content, category_id)
-- VALUES ('Protein được cấu tạo từ các đơn phân nào?', 2);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Amino acid', TRUE),
--        (LAST_INSERT_ID(), 'Glucose', FALSE),
--        (LAST_INSERT_ID(), 'Nucleotide', FALSE),
--        (LAST_INSERT_ID(), 'Glycerol', FALSE);

-- -- Câu 43
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây là hydrocarbon thơm?', 2);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Benzen (C₆H₆)', TRUE),
--        (LAST_INSERT_ID(), 'Etan (C₂H₆)', FALSE),
--        (LAST_INSERT_ID(), 'Axetilen (C₂H₂)', FALSE),
--        (LAST_INSERT_ID(), 'Etilen (C₂H₄)', FALSE);

-- -- Câu 44
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng đặc trưng của anken là gì?', 2);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Phản ứng cộng', TRUE),
--        (LAST_INSERT_ID(), 'Phản ứng thế', FALSE),
--        (LAST_INSERT_ID(), 'Phản ứng trùng hợp', FALSE),
--        (LAST_INSERT_ID(), 'Phản ứng oxi hóa', FALSE);

-- -- Câu 45
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây là dẫn xuất halogen?', 2);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'CH₃Cl', TRUE),
--        (LAST_INSERT_ID(), 'CH₃OH', FALSE),
--        (LAST_INSERT_ID(), 'CH₃COOH', FALSE),
--        (LAST_INSERT_ID(), 'CH₃CHO', FALSE);

-- -- Câu 46
-- INSERT INTO questions (content, category_id)
-- VALUES ('Polime nào có nguồn gốc tự nhiên?', 2);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Cellulose', TRUE),
--        (LAST_INSERT_ID(), 'PVC', FALSE),
--        (LAST_INSERT_ID(), 'PE', FALSE),
--        (LAST_INSERT_ID(), 'PS', FALSE);

-- -- Câu 47
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng nào sau đây sinh ra khí clo?', 3);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Điện phân dung dịch NaCl có màng ngăn', TRUE),
--        (LAST_INSERT_ID(), 'Nhiệt phân KClO₃', FALSE),
--        (LAST_INSERT_ID(), 'Cho Cu tác dụng với HCl', FALSE),
--        (LAST_INSERT_ID(), 'Cho NaOH tác dụng với HCl', FALSE);

-- -- Câu 48
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng giữa kim loại và axit loãng thường sinh ra khí gì?', 3);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'H₂', TRUE),
--        (LAST_INSERT_ID(), 'O₂', FALSE),
--        (LAST_INSERT_ID(), 'CO₂', FALSE),
--        (LAST_INSERT_ID(), 'Cl₂', FALSE);

-- -- Câu 49
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng nào dùng để nhận biết ion SO₄²⁻?', 3);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Tác dụng với BaCl₂ tạo kết tủa trắng', TRUE),
--        (LAST_INSERT_ID(), 'Tác dụng với NaOH', FALSE),
--        (LAST_INSERT_ID(), 'Tác dụng với HCl', FALSE),
--        (LAST_INSERT_ID(), 'Tác dụng với AgNO₃', FALSE);

-- -- Câu 50
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng nào sau đây là phản ứng tỏa nhiệt?', 3);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Đốt cháy than', TRUE),
--        (LAST_INSERT_ID(), 'Nhiệt phân CaCO₃', FALSE),
--        (LAST_INSERT_ID(), 'Điện phân nước', FALSE),
--        (LAST_INSERT_ID(), 'Quang hợp của cây xanh', FALSE);

-- -- Câu 51
-- INSERT INTO questions (content, category_id)
-- VALUES ('Nguyên tử có số proton bằng số gì?', 4);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Số electron', TRUE),
--        (LAST_INSERT_ID(), 'Số neutron', FALSE),
--        (LAST_INSERT_ID(), 'Số khối', FALSE),
--        (LAST_INSERT_ID(), 'Số lớp electron', FALSE);

-- -- Câu 52
-- INSERT INTO questions (content, category_id)
-- VALUES ('Đồng vị là những nguyên tử có cùng số proton nhưng khác số gì?', 4);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Neutron', TRUE),
--        (LAST_INSERT_ID(), 'Electron', FALSE),
--        (LAST_INSERT_ID(), 'Lớp vỏ', FALSE),
--        (LAST_INSERT_ID(), 'Orbital', FALSE);

-- -- Câu 53
-- INSERT INTO questions (content, category_id)
-- VALUES ('Liên kết ion hình thành do hiện tượng gì?', 4);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Cho-nhận electron', TRUE),
--        (LAST_INSERT_ID(), 'Chia sẻ electron', FALSE),
--        (LAST_INSERT_ID(), 'Tương tác yếu', FALSE),
--        (LAST_INSERT_ID(), 'Hút tĩnh điện', FALSE);

-- -- Câu 54
-- INSERT INTO questions (content, category_id)
-- VALUES ('Nguyên tố nào có độ âm điện cao nhất?', 4);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Flo (F)', TRUE),
--        (LAST_INSERT_ID(), 'Oxi (O)', FALSE),
--        (LAST_INSERT_ID(), 'Nitơ (N)', FALSE),
--        (LAST_INSERT_ID(), 'Clo (Cl)', FALSE);

-- -- Câu 55
-- INSERT INTO questions (content, category_id)
-- VALUES ('Cấu hình electron của nguyên tử Na (Z=11) là gì?', 4);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), '1s² 2s² 2p⁶ 3s¹', TRUE),
--        (LAST_INSERT_ID(), '1s² 2s² 2p⁶', FALSE),
--        (LAST_INSERT_ID(), '1s² 2s² 2p⁶ 3s²', FALSE),
--        (LAST_INSERT_ID(), '1s² 2s² 2p⁶ 3s² 3p¹', FALSE);

-- -- Câu 56
-- INSERT INTO questions (content, category_id)
-- VALUES ('Kim loại nào sau đây có tính khử mạnh nhất?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Kali (K)', TRUE),
--        (LAST_INSERT_ID(), 'Natri (Na)', FALSE),
--        (LAST_INSERT_ID(), 'Nhôm (Al)', FALSE),
--        (LAST_INSERT_ID(), 'Sắt (Fe)', FALSE);

-- -- Câu 57
-- INSERT INTO questions (content, category_id)
-- VALUES ('Dung dịch nào sau đây có pH > 7?', 1);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'KOH 0.1M', TRUE),
--        (LAST_INSERT_ID(), 'HCl 0.1M', FALSE),
--        (LAST_INSERT_ID(), 'H₂SO₄ 0.1M', FALSE),
--        (LAST_INSERT_ID(), 'NaCl 0.1M', FALSE);

-- -- Câu 58
-- INSERT INTO questions (content, category_id)
-- VALUES ('Chất nào sau đây thuộc loại amin?', 2);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'CH₃NH₂', TRUE),
--        (LAST_INSERT_ID(), 'CH₃COOH', FALSE),
--        (LAST_INSERT_ID(), 'C₂H₅OH', FALSE),
--        (LAST_INSERT_ID(), 'CH₃CHO', FALSE);

-- -- Câu 59
-- INSERT INTO questions (content, category_id)
-- VALUES ('Phản ứng nào sau đây dùng để điều chế khí CO₂ trong phòng thí nghiệm?', 3);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'CaCO₃ + 2HCl → CaCl₂ + H₂O + CO₂↑', TRUE),
--        (LAST_INSERT_ID(), '2KClO₃ → 2KCl + 3O₂↑', FALSE),
--        (LAST_INSERT_ID(), 'Zn + H₂SO₄ → ZnSO₄ + H₂↑', FALSE),
--        (LAST_INSERT_ID(), 'NH₄Cl + NaOH → NaCl + NH₃↑ + H₂O', FALSE);

-- -- Câu 60
-- INSERT INTO questions (content, category_id)
-- VALUES ('Nguyên tố nào sau đây là kim loại kiềm?', 4);
-- INSERT INTO answers (question_id, content, is_correct)
-- VALUES (LAST_INSERT_ID(), 'Rubidi (Rb)', TRUE),
--        (LAST_INSERT_ID(), 'Nhôm (Al)', FALSE),
--        (LAST_INSERT_ID(), 'Kẽm (Zn)', FALSE),
--        (LAST_INSERT_ID(), 'Chì (Pb)', FALSE);