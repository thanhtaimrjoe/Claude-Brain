---
name: project_kinken_tech_glossary
description: A glossary of technical terms encountered during the KINKEN project for future learning and reference.
type: reference
---

# KINKEN Technical Glossary (Từ điển Công nghệ)

Đây là danh sách các thuật ngữ kỹ thuật, công nghệ, và concept mà chúng ta đã gặp qua các báo cáo của dự án KINKEN. Tui (Claude) đã tổng hợp lại đây để sau này bạn có thể dễ dàng tra cứu hoặc yêu cầu tui "dạy kèm" nhé!

## 1. Cloud & Infrastructure (Hạ tầng & Đám mây)
- **GCP (Google Cloud Platform):** Nền tảng điện toán đám mây của Google, nơi chứa toàn bộ hệ thống KINKEN.
- **Cloud Run:** Dịch vụ của GCP dùng để chạy các ứng dụng (container) mà không cần quản lý máy chủ (Serverless), có khả năng tự động mở rộng (Auto-scaling) từ 0 đến hàng ngàn instances.
- **API Gateway (Apigee):** "Trạm gác" quản lý toàn bộ lượng truy cập vào API. Giúp bảo mật (Security), giới hạn số lượng gọi (Rate Limiting), và định tuyến (Routing).
- **Terraform (IaC - Infrastructure as Code):** Công cụ dùng code để tự động hóa việc tạo ra các server, database trên Cloud thay vì phải click chuột thủ công.
- **Docker / Container:** Đóng gói ứng dụng vào một "thùng container" chứa sẵn mọi thứ cần thiết để chạy. Giúp code chạy trên máy Dev và máy Prod giống hệt nhau ("Works on my machine").
- **Zero-downtime:** Khả năng nâng cấp hoặc bảo trì hệ thống mà không làm gián đoạn trải nghiệm của người dùng (hệ thống không bị sập).

## 2. Backend & API
- **FastAPI:** Một framework của ngôn ngữ Python dùng để xây dựng API cực kỳ nhanh và hiện đại.
- **REST API:** Chuẩn thiết kế API phổ biến nhất. Dùng các HTTP Method (GET, POST, PUT, DELETE) để tương tác với tài nguyên (Resources). Tận dụng tốt HTTP Cache.
- **GraphQL:** Một chuẩn API cho phép Frontend "tùy chỉnh" dữ liệu muốn lấy, tránh bị dư thừa dữ liệu (Over-fetching) nhưng dễ gây gánh nặng cho Database.
- **gRPC:** Giao thức giao tiếp siêu tốc giữa các Server với nhau (Microservices) do Google phát triển, dùng chuẩn Protobuf thay vì JSON.
- **API Versioning (vd: `/v1/search`):** Đánh dấu phiên bản cho API public để khi thay đổi cấu trúc không làm sập hệ thống của người đang sử dụng phiên bản cũ.
- **JWT (JSON Web Token) & Payload:** "Vé thông hành" dùng trong xác thực. `Payload` là phần ruột chứa thông tin của vé (vd: ID, Quyền hạn/id_type).
- **Push vs Pull Integration:** 
  - *Pull (Kéo):* Hệ thống mình phải liên tục đi hỏi/quét hệ thống khác xem có dữ liệu mới không (Tốn tài nguyên).
  - *Push (Đẩy):* Hệ thống khác có dữ liệu mới sẽ chủ động "bắn" sang hệ thống của mình thông qua API Gateway (Real-time hơn).

## 3. Frontend
- **NextJS:** Một framework cực kỳ mạnh mẽ xây dựng trên nền tảng React. Giúp làm web nhanh, hỗ trợ SEO tốt (nhờ SSR - Server Side Rendering).
- **Sentry:** Công cụ giám sát và bắt lỗi (Error Tracking). Khi Frontend bị crash ở máy khách hàng, Sentry sẽ gửi "hộp đen" chứa thông tin lỗi về cho Dev sửa.

## 4. CI/CD & Testing
- **CI/CD (Continuous Integration / Continuous Deployment):** Tích hợp và Triển khai liên tục. Tự động hóa quá trình Test và Đẩy code lên server (dùng GitHub Actions, Cloud Build).
- **Unit Test / Integration Test / E2E Test:** Các cấp độ kiểm thử phần mềm từ nhỏ nhất (từng hàm) đến lớn nhất (toàn bộ luồng người dùng).
- **Mock:** Tạo ra các "vật thế thân" (hàm giả, server giả) trong lúc Test để cô lập đối tượng cần test, tránh bị phụ thuộc vào môi trường ngoài.

## 5. Data & ETL (Extract - Transform - Load)
- **ETL:** Quá trình rút trích dữ liệu từ nguồn (Extract), biến đổi/làm sạch (Transform), và đổ vào kho lưu trữ mới (Load).
- **Databricks:** Công cụ xử lý dữ liệu lớn (Big Data) cực kỳ mạnh mẽ, được chọn làm công cụ ETL chính của KINKEN.
- **Cloud Dataflow / Cloud Data Fusion:** Các công cụ ETL native của nền tảng Google Cloud.
- **Delta Update (Cập nhật chênh lệch):** Chỉ cập nhật những dữ liệu bị thay đổi. Khác với *Full Refresh / Wash* là xóa hết làm lại từ đầu.

## 6. AI & Elasticsearch (Search Engine)
- **Elasticsearch (ES):** Bộ máy tìm kiếm khổng lồ, chuyên dùng để tìm kiếm văn bản tốc độ cao.
- **Index:** Giống như một "Bảng" (Table) trong Database truyền thống, nhưng được thiết kế đặc biệt để tối ưu cho việc tìm kiếm.
- **Re-index:** Quá trình đọc lại toàn bộ dữ liệu từ nguồn và tạo lại Index mới (thường mất nhiều thời gian).
- **Alias (Bí danh):** "Bảng hiệu" trỏ vào một Index. Giúp thực hiện Zero-downtime Re-index (đổi bảng hiệu từ quán cũ sang quán mới trong 1 giây).
- **Segment Bloat:** Hiện tượng ES bị phình to ổ cứng do cơ chế "chỉ đánh dấu xóa chứ không xóa thật". Cần dùng lệnh dọn rác (Force Merge).
- **Vector Search / Embedding:** Dùng AI (như OpenAI, E5-base) biến văn bản thành các dãy số (Vector) để máy tính hiểu được "ngữ nghĩa" thay vì chỉ so khớp từ khóa.
- **ANN (Approximate Nearest Neighbor):** Thuật toán tìm kiếm xấp xỉ trong Vector Search. Giúp tìm cực nhanh nhưng phải đánh đổi một chút độ chính xác (Recall).
- **RRF (Reciprocal Rank Fusion):** Thuật toán "lai" (Hybrid Search) kết hợp điểm số của Keyword Search truyền thống và Vector Search để ra kết quả tốt nhất.

---
*Ghi chú: Danh sách này sẽ liên tục được cập nhật khi chúng ta đi sâu vào các Sprint tiếp theo của dự án KINKEN.*
