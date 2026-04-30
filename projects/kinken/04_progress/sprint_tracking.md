---
name: project_kinken_sprint_tracking
description: Tracking the overall progress and flow of KINKEN project from early sprints to SPRINT 25 (PROD release).
type: project
originSessionId: 9bdebdd7-459b-474e-a4df-4bd3a1513398
---

# KINKEN Sprint Tracking & Retrospective

## Overview

Dự án hiện tại đang ở **SPRINT 25**, giai đoạn chuẩn bị release lên môi trường PROD. Tài liệu này dùng để nhìn lại (retrospective) toàn bộ quá trình phát triển dự án từ sơ khai, theo dõi tiến độ tổng thể, các vấn đề gặp phải và cách giải quyết (case studies) qua từng giai đoạn.

## Sprint History (Từ SPRINT 9 đến SPRINT 25)

Dưới đây là danh sách các Output Summary Report qua các mốc thời gian:

- **SPRINT 25** *(Current - Preparing for PROD Release)*
- **SPRINT 24**
  - 2025/04/24: Output Summary Report (SPRINT 24 Finish)
  - 2025/04/17: Output Summary Report (SPRINT 24 During)
- **SPRINT 23**
  - 2025/04/10: Output Summary Report (SPRINT 23 Finish)
  - 2025/04/03: Output Summary Report (SPRINT 23 During)
- **SPRINT 22**
  - 2025/03/30: Output Summary Report (SPRINT 22 Finish)
  - 2025/03/23: Output Summary Report (SPRINT 22 During)
- **SPRINT 21**
  - 2025/03/13: Output Summary Report (SPRINT 21 Finish)
  - 2025/03/06: Output Summary Report (SPRINT 21 During)
- **SPRINT 20**
  - 2025/02/27: Output Summary Report (SPRINT 20 Finish)
- **SPRINT 19**
  - 2025/02/13: Output Summary Report (SPRINT 19 Finish)
  - 2025/02/06: Output Summary Report (SPRINT 19 During)
- **SPRINT 18**
  - 2025/01/30: Output Summary Report (SPRINT 18 Finish)
  - 2025/01/23: Output Summary Report (SPRINT 18 During)
- **SPRINT 17**
  - 2025/01/16: Output Summary Report (SPRINT 17 Finished)
  - 2026/01/09: Output Summary Report (SPRINT 17 During) *(Note: Year typo in original list)*
- **SPRINT 16**
  - 2025/12/26: Output Summary Report (SPRINT 16 During)
- **SPRINT 15**
  - 2025/12/19: Output Summary Report (SPRINT 15 Finished)
  - 2025/12/12: Output Summary Report (SPRINT 15 During)
- **SPRINT 14**
  - 2025/12/05: Output Summary Report (SPRINT 14 Finished)
  - 2025/11/28: Output Summary Report (SPRINT 14 During)
- **SPRINT 13**
  - 2025/11/21: Output Summary Report (SPRINT 13 Finished)
  - 2025/11/14: Output Summary Report (SPRINT 13 During)
- **SPRINT 12**
  - 2025/11/07: Output Summary Report (SPRINT 12 Finished)
  - 2025/10/31: Output Summary Report (SPRINT 12 During)
- **SPRINT 11**
  - 2025/10/24: Output Summary Report (SPRINT 11 Finished)
  - 2025/10/17: Output Summary Report (SPRINT 11 During)
- **SPRINT 10**
  - 2025/10/14: Output Summary Report (SPRINT 10)
  - 2025/10/03: Output Summary Report (SPRINT 10 During)
- **SPRINT 9**
  - 2025/09/26: Output Summary Report (SPRINT 9)

*(Các Sprint cũ hơn sẽ được bổ sung nếu cần thiết)*

## Key Milestones & Case Studies

### Giai đoạn sơ khai (Tháng 5-6/2025 - Foundation & Infrastructure Planning)

#### Thống nhất Tài liệu & Quy trình (Documentation Strategy)

**Vấn đề**: Tránh việc duy trì song song tài liệu thiết kế (Excel) và code (DDL, Backend Code) gây lãng phí effort (double maintenance).

**Giải quyết**:
- Quản lý Message tập trung trong code thay vì file MessageList.
- Không duy trì Database Design document song song với DDL, chỉ làm khi khách hàng yêu cầu đặc thù.
- Sử dụng công cụ hiện đại (Confluence Whiteboard) thay cho Excel truyền thống cho Screen Transition Diagram để giảm chi phí bảo trì.

**Guideline**: Ưu tiên dùng Markdown/Docs để viết tài liệu kỹ thuật, chỉ dùng Excel/Google Sheet khi thực sự cần thiết và gắn link vào Markdown chính để quản lý tập trung.

#### Thiết kế hạ tầng & Giải quyết bài toán kế thừa (Infrastructure & ETL Pipeline)

**Vấn đề**: Hệ thống cũ (SAGAS) có nhiều pattern nhập liệu (Direct DB, CSV Import). Cần tích hợp vào kiến trúc mới trên GCP.

**Giải quyết (ETL Evolution)**:
- Ban đầu dự kiến dùng Databricks và thêm Cloud Run làm middleware lấy data.
- **Quyết định quan trọng**: Cần đánh giá thêm các giải pháp ETL native của GCP như **Cloud Dataflow**, **Cloud Data Fusion** bên cạnh Databricks để tìm ra phương án tối ưu nhất.

**Security**: Tích hợp AuthN/AuthZ tại tầng **API Gateway** để bảo vệ hệ thống. Thêm WAF và Monitoring.

**Cost Management**: Lập danh sách Infrastructure Resources để dự toán chi phí (Cost Estimation) hàng tháng cho môi trường Staging và Production.

#### Lựa chọn Tech Stack & Architecture Pattern

**Backend Pattern**: Quyết định áp dụng **Clean Architecture** để thống nhất guideline cho team phát triển, đảm bảo code maintainable.

#### Môi trường & Quản lý Dự án (Project Management)

**Tư duy IaC**: Khuyến khích sử dụng Terraform để quản lý hạ tầng.

**Tracking**: Đồng bộ task giữa các công cụ (Pivotal Tracker, Monday) bằng cách map ID để dễ dàng tra cứu.

### Giai đoạn Tháng 8/2025 (Tương ứng SPRINT 2 & 3)

#### Lên kế hoạch các Phương pháp luận (Methodologies Planning)

**Batch Processing**: Đánh giá cách triển khai Batch (Job vs Notebook) tập trung vào khả năng "re-execution" (Retry) dễ dàng. Lên danh sách thiết kế lịch trình (Schedule), Trigger, Retry policy và Logging cho toàn bộ Batch.

**Search (Elasticsearch)**: Cân nhắc chiến lược cập nhật Index: **Delta Update** (chỉ cập nhật phần chênh lệch) hay **Full Reindex** (xóa và tạo lại toàn bộ).

**API Integration**: Đánh giá phương thức cung cấp tính năng Search cho các hệ thống khác (chỉ cung cấp Search Engine hay toàn bộ API) và phạm vi liên kết xác thực (Auth Integration).

**AI/Vector Search**: Bắt đầu quá trình chọn model cho Vector Embedding (so sánh giữa các Open-source model như **E5** và API thương mại như **OpenAI**).

**Observability & Error Handling**: Quy hoạch chiến lược Logging (API, ES) và thiết kế Exception Handling Policy (chuẩn hóa Error Response Format, Exception Patterns).

#### Phía Khách hàng (GW Tasks)

- Chuẩn bị "Blueprint" (Hành trình người dùng/Behavior Flow).
- Lên danh sách Core Functions và Sitemap.
- Thu thập tài liệu về System Interface từ End-client để share cho Offshore.

### Giai đoạn Tháng 8/2025 (Tương ứng SPRINT 4)

#### Tối ưu hóa Chi phí & Hạ tầng (Cost & Infra Optimization)

**Estimate 2.0**: Hoàn thành bản dự toán chi phí hạ tầng lần 2. Khách hàng yêu cầu tách biệt **Initial Cost** (chi phí ban đầu) và **Monthly Cost** (chi phí hàng tháng).

**Multimodal AI**: Bổ sung dự toán chi phí cho việc triển khai **Multimodal** (xử lý đa phương thức: hình ảnh, văn bản...).

#### Cuộc chiến ETL: Databricks vs Data Fusion vs Dataflow

**Databricks**: Được đánh giá cực mạnh về Data Analysis (Phân tích), nhưng Ingest (Thu thập) không phải là thế mạnh tuyệt đối.

**Cloud Data Fusion**: Mạnh về Ingest nhờ hệ thống Connector đa dạng cho nhiều Data Source. Tuy nhiên, có quan ngại về chi phí (phải duy trì server chạy liên tục) và định hướng sản phẩm (Low-code, phù hợp cho non-engineer).

**Cloud Dataflow**: Kết hợp tốt với Apache Beam, mạnh về xử lý Realtime và Batch nhưng đòi hỏi team phải học (Learning curve cao).

**Kết luận chiến lược**: Dự đoán phía Client (Lixil) đang dùng *Data Fusion* để thu thập và *Dataflow* để xử lý. Team offshore (MOR) đề xuất giữ Data Fusion để thu thập, còn phần ETL và Analysis (không yêu cầu realtime) sẽ đẩy sang **Databricks** để tận dụng sức mạnh phân tích.

#### Xây dựng môi trường PoC (Proof of Concept)

Lên kế hoạch chi tiết cho PoC Environment bao gồm:
- **Infra**: Compute Engine (n1-standard-4), ElasticCloud (360GB/8GB RAM).
- **Security**: Cấu hình DNS, SSL/TLS cho subdomain.
- **Elasticsearch**: Cấu hình Index Template, Mapping, Plugin/Extension.
- **AI Integration (Indexing Strategy)**: Thử nghiệm Indexing data với nhiều model khác nhau để so sánh: **OpenAI**, **VertexAI**, và **E5-base**.

#### Thiết kế chi tiết (Detailed Design Phase)

- Bắt đầu vẽ Overall Use Case Diagram.
- Thiết kế ES Schema, Analyzer, và đặc biệt là **Relevance Scoring & Boosting** (đây là "linh hồn" của Search Engine - quyết định kết quả nào hiện lên đầu).
- Xây dựng danh sách chức năng chính (VN version) để team offshore nắm bắt.

### Giai đoạn Tháng 8/2025 (Tương ứng SPRINT 5)

#### Chuẩn hóa Tài liệu & Ngôn ngữ (Standardization & Translation)

- Các tài liệu thiết kế quan trọng như **Model Selection** (E5 vs OpenAI) và **Exception Handling Policy** đã hoàn thành bản draft.
- **BrSE Task**: Đội offshore (MOR) cần dịch toàn bộ tài liệu sang tiếng Nhật (hạn chót 19/06) để GW review. Đây là công việc điển hình của BrSE để đảm bảo sự thấu hiểu giữa hai bên.

#### Tối ưu hóa Data Pipeline (The "T" in ETL)

**Tranh luận kiến trúc**: Đang cân nhắc xem việc chuẩn hóa format dữ liệu (từ PULL sang PUSH format) nên làm ở đâu:
- **Option A**: Làm tại tầng thu thập dữ liệu (Cloud Run phía GCP).
- **Option B**: Gom toàn bộ logic biến đổi dữ liệu (Transformation) vào **Databricks**.

**Hướng xử lý**: GW sẽ cân nhắc và thảo luận lại với MOR sau.

#### Triển khai PoC (PoC Implementation)

- **Hạ tầng**: Thiết lập subdomain riêng cho MOR để chủ động xây dựng môi trường PoC trong lúc chờ subdomain từ GW.
- **Indexing Strategy**: Chốt phương án ưu tiên cho PoC: Sử dụng **形態素 (Morpheme - Phân tích từ vựng)** kết hợp với **OpenAI Model**. Các model khác sẽ chỉ thêm vào nếu khách hàng (Lixil) yêu cầu.
- **Tracking**: Sử dụng **PoC CheckList** để theo dõi tiến độ Indexing và kết quả kiểm tra.

#### Quản lý Yêu cầu (Requirement Management)

- Đội offshore chủ động hỏi về tiến độ của **Danh sách chức năng (Feature List)** và **Interface giữa các hệ thống**.
- GW phản hồi: Feature List đã ổn định khoảng 80% (đến cột D trong Excel), khuyến khích MOR đặt câu hỏi (QA) hoặc họp Zoom ngay cả khi tài liệu chưa hoàn thiện 100% để tránh nghẽn cổ chai.

### Giai đoạn Tháng 8/2025 (Tương ứng SPRINT 6)

#### Đánh giá PoC & Giải quyết "Bóng ma" Dữ liệu (PoC Benchmark & Data Consistency)

**Sự cố Benchmark**: Kết quả search của PoC hiện tại (tháng 5/2025) khác với kết quả của bản PoC cũ (tháng 12/2024) dù dùng chung một bộ data đã extract.

**Troubleshooting (Quá trình phân tích nguyên nhân)**:
1. **Embedding Vector**: Model AI nhúng (embedding) có tính "non-deterministic" (không tất định). Cùng một text đầu vào chưa chắc đã sinh ra vector giống hệt nhau ở các thời điểm khác nhau.
2. **Model Version**: Đã check, version model không đổi.
3. **ES Version**: Không lưu lại version của ES Cloud ở bản PoC cũ nên không đối chiếu được (Lesson learned: Phải luôn lock version của Infrastructure).
4. **Index Algorithm (HNSW)**: Đây là thuật toán tìm kiếm xấp xỉ (Approximate Nearest Neighbor), bản chất của nó là index dữ liệu ngẫu nhiên một phần, dẫn đến cây index tạo ra mỗi lần có thể khác nhau.
5. **Sharding (Global vs Shard Search)**: Đang nghi ngờ ảnh hưởng của phân mảnh dữ liệu trong Elasticsearch.

**Quyết định**: Giới hạn việc điều tra lỗi PoC đến ngày 23/05 để ưu tiên nguồn lực cho các task quan trọng khác.

#### Phân tích Nghiệp vụ phức tạp (Domain Knowledge Analysis)

- Team cần clear mối quan hệ giữa 3 thực thể cốt lõi: **Sản phẩm (Product/商品)**, **Tài liệu (Document/資料)**, và **Linh kiện (Parts/部品)**.
- **Product - Document (N:N)**: Có tài liệu map trực tiếp được với sản phẩm (Bản vẽ, HDSD). Có tài liệu không map được (QA quá khứ, Sổ tay sửa chữa).
- **Product - Parts (N:N)**: Đang thiết kế luồng tìm linh kiện riêng cho từng sản phẩm. Data được quản lý ở hai hệ thống khác nhau: *PIM* (quản lý Product) và *Phần mềm tìm kiếm linh kiện* (quản lý Parts).
- Mối quan hệ phức tạp này đòi hỏi ETL pipeline phải xử lý mapping cực kỳ khéo léo trước khi đẩy vào Elasticsearch.

#### Tiến độ Dự án (Schedule & Prioritization)

- Feature List và System Interface dự kiến chốt bản cuối vào đầu/giữa tháng 6.
- Ưu tiên làm tài liệu so sánh 3 giải pháp ETL (Databricks / Data Fusion / Dataflow) bao gồm cả Cost.
- Tạm gác các task PoC để tập trung vào: *Review Wireframe*, *Phân quyền (Authorization)*, và *Nghiên cứu cơ chế Xác thực đa hệ thống (Azure, EEA, MyLX)*.

### Giai đoạn Tháng 9/2025 (Tương ứng SPRINT 7)

#### Thiết kế Xác thực & Phân quyền (AuthN/AuthZ Refinement)

- Đã cập nhật tài liệu Auth dựa trên specs từ Confluence của khách hàng (Lixil).
- **Process**: GW đã trao đổi với Client, note lại các kết quả xác nhận (màu xanh dương) và các vấn đề còn tồn đọng/bài tập về nhà (màu xanh lá) để chuẩn bị cho buổi họp tiếp theo với các bên liên quan.

#### Nghiên cứu tính năng Preview Tài liệu (Document Preview Implementation)

**Tài liệu PDF**: Có thể thực hiện được. Đang cân nhắc sử dụng thư viện `React-PDF` (sử dụng nền tảng PDF.js). Sẽ đánh giá thêm các thư viện khác tùy thuộc vào Specs cụ thể của trình xem (Viewer).

**Tài liệu Office (Word/Excel/PowerPoint)**: Gặp khó khăn lớn (Technical Blocker).
- Office Viewer cũ đã ngừng hỗ trợ (End of Support).
- Office 365 Web Viewer yêu cầu người dùng phải có tài khoản Microsoft (không khả thi cho mọi user).
- **Workaround**: Đang đặt câu hỏi ngược lại cho khách hàng: *"Có thực sự cần Preview Office file đến mức phải convert nó sang PDF trước khi hiển thị hay không?"* (Trade-off giữa effort và User Experience).

#### Tiếp tục điều tra PoC Benchmark (The "Non-Deterministic" Vector Search Issue)

**Kết luận ban đầu**: Việc re-index (tạo lại chỉ mục) với cùng một cấu hình vẫn có thể cho ra kết quả khác nhau do bản chất của Vector Search là thuật toán tìm kiếm xấp xỉ (Approximate).

**Thực tế**: Tỉ lệ sai lệch kết quả thấp, nhưng có sự biến động lớn về thứ hạng (Rank).
- Ví dụ 1 (Tệ đi): Keyword "リシェント玄関ドア 引手 内外" - Lần 1: Rank 14 -> Lần 2: Rank 73.
- Ví dụ 2 (Tốt lên): Keyword "クリエラガラスドア 内外シリンダー" - Lần 1: Rank 67 -> Lần 2: Rank 2.

**Yêu cầu từ GW**: Không cần ép kết quả của các lần phải giống hệt nhau, nhưng **phải giải thích được tại sao lại có hiện tượng này**. Việc không hiểu rõ nguyên nhân gốc rễ sẽ gây rủi ro lớn cho độ chính xác (Accuracy) của hệ thống Search trên PROD. Đội offshore phải điều tra cách ổn định Index và báo cáo lại vào ngày 04/06.

#### Lên kế hoạch các Sprints tới (Planning)

- Dịch tài liệu thiết kế API.
- Chuẩn bị tài liệu Interface liên kết với các hệ thống khác.
- Nghiên cứu cơ chế Keyword Suggestion (Gợi ý từ khóa).

### Giai đoạn 2025/06/06 (Pre-development Phase)

#### Kiến trúc API (REST vs GraphQL/gRPC)

**Vấn đề**: Chọn kiến trúc nào cho Backend (Python) của dự án KINKEN.

**Quyết định**: Chọn **REST API**.

**Lý do (Case Study)**:
- **GraphQL**: Mạnh về linh hoạt truy vấn (client lấy đúng những gì cần), nhưng dễ bị "Over-fetching" ẩn dưới database (N+1 query problem). Phức tạp trong việc cache (HTTP caching khó hoạt động với 1 endpoint duy nhất) và Rate Limiting (chống spam API).
- **gRPC**: Rất nhanh (dùng Protobuf thay vì JSON), lý tưởng cho microservices giao tiếp với nhau (Server-to-Server). Tuy nhiên, khó debug qua trình duyệt (phải dùng gRPC-Web) và Learning curve cao.
- **REST**: Đủ tốt cho hầu hết nhu cầu, tận dụng tối đa HTTP Cache, công cụ test/debug phong phú (Postman, Swagger). Cấu trúc Client-Server của KINKEN (Web UI gọi Backend) phù hợp với REST nhất.

#### Chuẩn hóa thiết kế API (API Design Rules)

- Chốt các rule khắt khe: Dùng danh từ số nhiều cho Resource (`/users`, không phải `/user`).
- Dùng đúng HTTP Methods (GET, POST, PUT, DELETE, PATCH).
- HTTP Status Codes rõ ràng (2xx cho thành công, 4xx lỗi client, 5xx lỗi server).
- Response luôn có cấu trúc chung (data, meta cho pagination, errors).

#### Chiến lược Versioning (Quản lý phiên bản API)

- **Internal API (Dùng nội bộ)**: Không cần Versioning để tránh maintain mệt mỏi. Khi có thay đổi, Frontend và Backend phối hợp update cùng lúc.
- **Public/Common Search API (Cho hệ thống khác gọi)**: BẮT BUỘC có Versioning (ví dụ: `/v1/search`). Lý do: Nếu LIXIL thay đổi API mà không báo trước, các hệ thống khác đang dùng API này sẽ bị sập ("Breaking changes").

#### Bảo mật & Xác thực (Security & Auth)

- **Payload của JWT**: Cần chốt với khách hàng việc thêm trường `id_type` vào payload để phân biệt loại User (vd: End-user bình thường hay Admin/Partner).
- **Authentication cho Hệ thống thứ 3**: Tạm thời chốt dùng **API Key + HMAC** (nhẹ, nhanh, bảo mật tốt bằng cách mã hóa signature) hoặc chỉ cần API Key nếu Apigee có thể giới hạn IP (IP Whitelisting). Chưa cần dùng đến OAuth phức tạp trừ khi LIXIL yêu cầu sau này.

#### Troubleshooting AI (Vấn đề Thuật toán ANN)

**Sự cố**: Chức năng tìm kiếm xấp xỉ (Approximate Nearest Neighbor - ANN) của Elasticsearch đôi khi cho ra kết quả chất lượng bị rớt thê thảm (bị "rớt hạng" kết quả chuẩn).

*(Các case study tiếp theo sẽ được cập nhật khi bạn cung cấp thêm thông tin từ các sprint sau)*
