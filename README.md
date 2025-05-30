# 🧪 Chemistry website

1 trang web đơn giản để bạn có thể tìm hiểu , nghiên cứu bộ môn hóa học .
Trang web được xây dựng với Frontend sử dụng React và Backend sử dụng spring boot

## 📸 Demo

![demo screenshot](./image.png)

## ✨ Tính năng nổi bật

- 🔍 Tìm kiếm chất hóa học
- 🔐 Đăng nhập / Đăng ký người dùng
- 🧪 Thí nghiệm hóa học 

## 💻  Cấu hình yêu cầu 
- NodeJS version 20 trở lên 
- JDK version 17 trở lên 
- Maven bản  mới nhất 
- Docker bản mới nhất 
- Cấu hình biến môi trưởng cho NodeJS, JDK , Maven 
- Cài đặt docker 
- Sử dụng port 3307 cho mysql để tránh xung đột xảy ra !
## 🔧 Công nghệ sử dụng

- Backend: **Spring Boot**, **MySQL**
- Frontend: **ReactTS**
- Build tool : **Vite** , **Maven**
- ORM: **JPA/Hibernate**
- Auth: **JWT**
- Dockerized ✅

---

## 🚀 Cài đặt dự án

### 1. Clone project

```bash
git clone https://github.com/NaGit09/ChemistryApp.git
```

### 2. config database

```bash
spring.datasource.url=jdbc:mysql://localhost:3306/chemistry
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### 3 . run Backend

```bash
cd chemistry-App/Server/ChemistryBE ( cho backend với intelij , eclipse)
./mvnw spring-boot:run

```

### 4 . run Frontend

```bash
cd chemistry-App/Client/ChemistryApp ( cho frontend  với cursor , visual studio code )
npx vite
```
## 🧬 Các bảng dữ liệu chính
| Table                   | Description                       |
| ----------------------- | --------------------------------- |
| `users`                 | Tài khoản người dùng              |
| `experiments`           | Danh sách thí nghiệm              |
| `chemicals`             | Hóa chất sử dụng trong thí nghiệm |
| `experiment_conditions` | Nhiệt độ, thời gian, áp suất      |
| `questions`             | Câu hỏi trắc nghiệm               |
| `answers`               | Đáp án người dùng nhập vào        |

## 📚 API Reference

| Method | Endpoint               | Description                |
| ------ | ---------------------- | -------------------------- |
| POST   | /User/register         | Tạo tài khoản người dùng   |
| POST   | /User/login            | Đăng nhập vào hệ thống     |
| GET    | /Chemiscals/           | Lấy toàn bô chất hóa học   |
| POST   | /Experiment/{id1}/{id2}|Lấy kết quả thí nghiệm từ id|

## 📄 License
MIT License © 2025 [NaGit09]
## Document 
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/NaGit09/ChemistryApp)