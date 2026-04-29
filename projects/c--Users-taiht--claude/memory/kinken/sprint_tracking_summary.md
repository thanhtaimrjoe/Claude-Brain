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

Dưới đây là danh sách các Output Summary Report qua các mốc thời gian (dựa trên format danh sách):

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

*(Phần này sẽ được cập nhật dần khi chúng ta review lại từng giai đoạn của dự án. Ghi chú các quyết định thiết kế quan trọng, thay đổi kiến trúc, hay các lỗi kỹ thuật lớn đã xử lý trong mỗi Sprint.)*

### Early Sprints (SPRINT 1 & 2 - Foundation & Infrastructure Planning)
- **Thống nhất Tài liệu & Quy trình (Documentation Strategy):**
    - **Vấn đề:** Tránh việc duy trì song song tài liệu thiết kế (Excel) và code (DDL, Backend Code) gây lãng phí effort (double maintenance).
    - **Giải quyết:** 
        - Quản lý Message tập trung trong code thay vì file MessageList.
        - Không duy trì Database Design document song song với DDL, chỉ làm khi khách hàng yêu cầu đặc thù.
        - Sử dụng công cụ hiện đại (Confluence Whiteboard) thay cho Excel truyền thống cho Screen Transition Diagram để giảm chi phí bảo trì.
    - **Guideline:** Ưu tiên dùng Markdown/Docs để viết tài liệu kỹ thuật, chỉ dùng Excel/Google Sheet khi thực sự cần thiết và gắn link vào Markdown chính để quản lý tập trung. (Tham chiếu: *Create Guideline for Document Output*).
- **Thiết kế hạ tầng & Giải quyết bài toán kế thừa (Infrastructure & ETL Pipeline):**
    - **Vấn đề:** Hệ thống cũ (SAGAS) có nhiều pattern nhập liệu (Direct DB, CSV Import). Cần tích hợp vào kiến trúc mới trên GCP.
    - **Giải quyết (ETL Evolution):** 
        - Ban đầu dự kiến dùng Databricks và thêm Cloud Run làm middleware lấy data.
        - **Quyết định quan trọng:** Cần đánh giá thêm các giải pháp ETL native của GCP như **Cloud Dataflow**, **Cloud Data Fusion** bên cạnh Databricks để tìm ra phương án tối ưu nhất.
    - **Security:** Tích hợp AuthN/AuthZ tại tầng **API Gateway** để bảo vệ hệ thống. Thêm WAF và Monitoring.
    - **Cost Management:** Lập danh sách Infrastructure Resources để dự toán chi phí (Cost Estimation) hàng tháng cho môi trường Staging và Production.
- **Lựa chọn Tech Stack & Architecture Pattern:**
    - **Backend Pattern:** Quyết định áp dụng **Clean Architecture** để thống nhất guideline cho team phát triển, đảm bảo code maintainable.
- **Môi trường & Quản lý Dự án (Project Management):**
    - **Tư duy IaC:** Khuyến khích sử dụng Terraform để quản lý hạ tầng.
    - **Tracking:** Đồng bộ task giữa các công cụ (Pivotal Tracker, Monday) bằng cách map ID để dễ dàng tra cứu.

### SPRINT 3 (Architecture Deep-Dive & Methodologies)
- **Lên kế hoạch các Phương pháp luận (Methodologies Planning):**
    - **Batch Processing:** Đánh giá cách triển khai Batch (Job vs Notebook) tập trung vào khả năng "re-execution" (Retry) dễ dàng. Lên danh sách thiết kế lịch trình (Schedule), Trigger, Retry policy và Logging cho toàn bộ Batch.
    - **Search (Elasticsearch):** Cân nhắc chiến lược cập nhật Index: **Delta Update** (chỉ cập nhật phần chênh lệch) hay **Full Reindex** (xóa và tạo lại toàn bộ).
    - **API Integration:** Đánh giá phương thức cung cấp tính năng Search cho các hệ thống khác (chỉ cung cấp Search Engine hay toàn bộ API) và phạm vi liên kết xác thực (Auth Integration).
    - **AI/Vector Search:** Bắt đầu quá trình chọn model cho Vector Embedding (so sánh giữa các Open-source model như **E5** và API thương mại như **OpenAI**).
    - **Observability & Error Handling:** Quy hoạch chiến lược Logging (API, ES) và thiết kế Exception Handling Policy (chuẩn hóa Error Response Format, Exception Patterns).
- **Phía Khách hàng (GW Tasks):**
    - Chuẩn bị "Blueprint" (Hành trình người dùng/Behavior Flow).
    - Lên danh sách Core Functions và Sitemap.
    - Thu thập tài liệu về System Interface từ End-client để share cho Offshore.

### SPRINT 4 (Advanced Architecture & PoC Planning)
- **Tối ưu hóa Chi phí & Hạ tầng (Cost & Infra Optimization):**
    - **Estimate 2.0:** Hoàn thành bản dự toán chi phí hạ tầng lần 2. Khách hàng yêu cầu tách biệt **Initial Cost** (chi phí ban đầu) và **Monthly Cost** (chi phí hàng tháng).
    - **Multimodal AI:** Bổ sung dự toán chi phí cho việc triển khai **Multimodal** (xử lý đa phương thức: hình ảnh, văn bản...).
- **Cuộc chiến ETL: Databricks vs Data Fusion vs Dataflow:**
    - **Databricks:** Được đánh giá cực mạnh về Data Analysis (Phân tích), nhưng Ingest (Thu thập) không phải là thế mạnh tuyệt đối.
    - **Cloud Data Fusion:** Mạnh về Ingest nhờ hệ thống Connector đa dạng cho nhiều Data Source. Tuy nhiên, có quan ngại về chi phí (phải duy trì server chạy liên tục) và định hướng sản phẩm (Low-code, phù hợp cho non-engineer).
    - **Cloud Dataflow:** Kết hợp tốt với Apache Beam, mạnh về xử lý Realtime và Batch nhưng đòi hỏi team phải học (Learning curve cao).
    - **Kết luận chiến lược:** Dự đoán phía Client (Lixil) đang dùng *Data Fusion* để thu thập và *Dataflow* để xử lý. Team offshore (MOR) đề xuất giữ Data Fusion để thu thập, còn phần ETL và Analysis (không yêu cầu realtime) sẽ đẩy sang **Databricks** để tận dụng sức mạnh phân tích.
- **Xây dựng môi trường PoC (Proof of Concept):**
    - Lên kế hoạch chi tiết cho PoC Environment bao gồm:
        - **Infra:** Compute Engine (n1-standard-4), ElasticCloud (360GB/8GB RAM).
        - **Security:** Cấu hình DNS, SSL/TLS cho subdomain.
        - **Elasticsearch:** Cấu hình Index Template, Mapping, Plugin/Extension.
        - **AI Integration (Indexing Strategy):** Thử nghiệm Indexing data với nhiều model khác nhau để so sánh: **OpenAI**, **VertexAI**, và **E5-base**.
- **Thiết kế chi tiết (Detailed Design Phase):**
    - Bắt đầu vẽ Overall Use Case Diagram.
    - Thiết kế ES Schema, Analyzer, và đặc biệt là **Relevance Scoring & Boosting** (đây là "linh hồn" của Search Engine - quyết định kết quả nào hiện lên đầu).
    - Xây dựng danh sách chức năng chính (VN version) để team offshore nắm bắt.

### SPRINT 5 (PoC Execution & Translation Phase)
- **Chuẩn hóa Tài liệu & Ngôn ngữ (Standardization & Translation):**
    - Các tài liệu thiết kế quan trọng như **Model Selection** (E5 vs OpenAI) và **Exception Handling Policy** đã hoàn thành bản draft.
    - **BrSE Task:** Đội offshore (MOR) cần dịch toàn bộ tài liệu sang tiếng Nhật (hạn chót 19/06) để GW review. Đây là công việc điển hình của BrSE để đảm bảo sự thấu hiểu giữa hai bên.
- **Tối ưu hóa Data Pipeline (The "T" in ETL):**
    - **Tranh luận kiến trúc:** Đang cân nhắc xem việc chuẩn hóa format dữ liệu (từ PULL sang PUSH format) nên làm ở đâu:
        - **Option A:** Làm tại tầng thu thập dữ liệu (Cloud Run phía GCP).
        - **Option B:** Gom toàn bộ logic biến đổi dữ liệu (Transformation) vào **Databricks**.
    - **Hướng xử lý:** GW sẽ cân nhắc và thảo luận lại với MOR sau.
- **Triển khai PoC (PoC Implementation):**
    - **Hạ tầng:** Thiết lập subdomain riêng cho MOR để chủ động xây dựng môi trường PoC trong lúc chờ subdomain từ GW.
    - **Indexing Strategy:** Chốt phương án ưu tiên cho PoC: Sử dụng **形態素 (Morpheme - Phân tích từ vựng)** kết hợp với **OpenAI Model**. Các model khác sẽ chỉ thêm vào nếu khách hàng (Lixil) yêu cầu.
    - **Tracking:** Sử dụng **PoC CheckList** để theo dõi tiến độ Indexing và kết quả kiểm tra.
- **Quản lý Yêu cầu (Requirement Management):**
    - Đội offshore chủ động hỏi về tiến độ của **Danh sách chức năng (Feature List)** và **Interface giữa các hệ thống**.
    - GW phản hồi: Feature List đã ổn định khoảng 80% (đến cột D trong Excel), khuyến khích MOR đặt câu hỏi (QA) hoặc họp Zoom ngay cả khi tài liệu chưa hoàn thiện 100% để tránh nghẽn cổ chai.

### SPRINT 6 (PoC Benchmarking & Domain Knowledge)
- **Đánh giá PoC & Giải quyết "Bóng ma" Dữ liệu (PoC Benchmark & Data Consistency):**
    - **Sự cố Benchmark:** Kết quả search của PoC hiện tại (tháng 5/2025) khác với kết quả của bản PoC cũ (tháng 12/2024) dù dùng chung một bộ data đã extract.
    - **Troubleshooting (Quá trình phân tích nguyên nhân):**
        1. **Embedding Vector:** Model AI nhúng (embedding) có tính "non-deterministic" (không tất định). Cùng một text đầu vào chưa chắc đã sinh ra vector giống hệt nhau ở các thời điểm khác nhau.
        2. **Model Version:** Đã check, version model không đổi.
        3. **ES Version:** Không lưu lại version của ES Cloud ở bản PoC cũ nên không đối chiếu được (Lesson learned: Phải luôn lock version của Infrastructure).
        4. **Index Algorithm (HNSW):** Đây là thuật toán tìm kiếm xấp xỉ (Approximate Nearest Neighbor), bản chất của nó là index dữ liệu ngẫu nhiên một phần, dẫn đến cây index tạo ra mỗi lần có thể khác nhau.
        5. **Sharding (Global vs Shard Search):** Đang nghi ngờ ảnh hưởng của phân mảnh dữ liệu trong Elasticsearch.
    - **Quyết định:** Giới hạn việc điều tra lỗi PoC đến ngày 23/05 để ưu tiên nguồn lực cho các task quan trọng khác.
- **Phân tích Nghiệp vụ phức tạp (Domain Knowledge Analysis):**
    - Team cần clear mối quan hệ giữa 3 thực thể cốt lõi: **Sản phẩm (Product/商品)**, **Tài liệu (Document/資料)**, và **Linh kiện (Parts/部品)**.
    - **Product - Document (N:N):** Có tài liệu map trực tiếp được với sản phẩm (Bản vẽ, HDSD). Có tài liệu không map được (QA quá khứ, Sổ tay sửa chữa).
    - **Product - Parts (N:N):** Đang thiết kế luồng tìm linh kiện riêng cho từng sản phẩm. Data được quản lý ở hai hệ thống khác nhau: *PIM* (quản lý Product) và *Phần mềm tìm kiếm linh kiện* (quản lý Parts).
    - Mối quan hệ phức tạp này đòi hỏi ETL pipeline phải xử lý mapping cực kỳ khéo léo trước khi đẩy vào Elasticsearch.
- **Tiến độ Dự án (Schedule & Prioritization):**
    - Feature List và System Interface dự kiến chốt bản cuối vào đầu/giữa tháng 6.
    - Ưu tiên làm tài liệu so sánh 3 giải pháp ETL (Databricks / Data Fusion / Dataflow) bao gồm cả Cost.
    - Tạm gác các task PoC để tập trung vào: *Review Wireframe*, *Phân quyền (Authorization)*, và *Nghiên cứu cơ chế Xác thực đa hệ thống (Azure, EEA, MyLX)*.

### SPRINT 7 (Feature Prototyping & Deep Troubleshooting)
- **Thiết kế Xác thực & Phân quyền (AuthN/AuthZ Refinement):**
    - Đã cập nhật tài liệu Auth dựa trên specs từ Confluence của khách hàng (Lixil).
    - **Process:** GW đã trao đổi với Client, note lại các kết quả xác nhận (màu xanh dương) và các vấn đề còn tồn đọng/bài tập về nhà (màu xanh lá) để chuẩn bị cho buổi họp tiếp theo với các bên liên quan.
- **Nghiên cứu tính năng Preview Tài liệu (Document Preview Implementation):**
    - **Tài liệu PDF:** Có thể thực hiện được. Đang cân nhắc sử dụng thư viện `React-PDF` (sử dụng nền tảng PDF.js). Sẽ đánh giá thêm các thư viện khác tùy thuộc vào Specs cụ thể của trình xem (Viewer).
    - **Tài liệu Office (Word/Excel/PowerPoint):** Gặp khó khăn lớn (Technical Blocker).
        - Office Viewer cũ đã ngừng hỗ trợ (End of Support).
        - Office 365 Web Viewer yêu cầu người dùng phải có tài khoản Microsoft (không khả thi cho mọi user).
        - **Workaround:** Đang đặt câu hỏi ngược lại cho khách hàng: *"Có thực sự cần Preview Office file đến mức phải convert nó sang PDF trước khi hiển thị hay không?"* (Trade-off giữa effort và User Experience).
- **Tiếp tục điều tra PoC Benchmark (The "Non-Deterministic" Vector Search Issue):**
    - **Kết luận ban đầu:** Việc re-index (tạo lại chỉ mục) với cùng một cấu hình vẫn có thể cho ra kết quả khác nhau do bản chất của Vector Search là thuật toán tìm kiếm xấp xỉ (Approximate).
    - **Thực tế:** Tỉ lệ sai lệch kết quả thấp, nhưng có sự biến động lớn về thứ hạng (Rank).
        - Ví dụ 1 (Tệ đi): Keyword "リシェント玄関ドア 引手 内外" - Lần 1: Rank 14 -> Lần 2: Rank 73.
        - Ví dụ 2 (Tốt lên): Keyword "クリエラガラスドア 内外シリンダー" - Lần 1: Rank 67 -> Lần 2: Rank 2.
    - **Yêu cầu từ GW:** Không cần ép kết quả của các lần phải giống hệt nhau, nhưng **phải giải thích được tại sao lại có hiện tượng này**. Việc không hiểu rõ nguyên nhân gốc rễ sẽ gây rủi ro lớn cho độ chính xác (Accuracy) của hệ thống Search trên PROD. Đội offshore phải điều tra cách ổn định Index và báo cáo lại vào ngày 04/06.
- **Lên kế hoạch các Sprints tới (Planning):**
    - Dịch tài liệu thiết kế API.
    - Chuẩn bị tài liệu Interface liên kết với các hệ thống khác.
    - Nghiên cứu cơ chế Keyword Suggestion (Gợi ý từ khóa).

### SPRINT 8 (API Architecture, Security & ANN Troubleshooting)
- **Kiến trúc API (REST vs GraphQL/gRPC):**
    - **Vấn đề:** Chọn kiến trúc nào cho Backend (Python) của dự án KINKEN.
    - **Quyết định:** Chọn **REST API**.
    - **Lý do (Case Study):**
        - **GraphQL:** Mạnh về linh hoạt truy vấn (client lấy đúng những gì cần), nhưng dễ bị "Over-fetching" ẩn dưới database (N+1 query problem). Phức tạp trong việc cache (HTTP caching khó hoạt động với 1 endpoint duy nhất) và Rate Limiting (chống spam API).
        - **gRPC:** Rất nhanh (dùng Protobuf thay vì JSON), lý tưởng cho microservices giao tiếp với nhau (Server-to-Server). Tuy nhiên, khó debug qua trình duyệt (phải dùng gRPC-Web) và Learning curve cao.
        - **REST:** Đủ tốt cho hầu hết nhu cầu, tận dụng tối đa HTTP Cache, công cụ test/debug phong phú (Postman, Swagger). Cấu trúc Client-Server của KINKEN (Web UI gọi Backend) phù hợp với REST nhất.
- **Chuẩn hóa thiết kế API (API Design Rules):**
    - Chốt các rule khắt khe: Dùng danh từ số nhiều cho Resource (`/users`, không phải `/user`).
    - Dùng đúng HTTP Methods (GET, POST, PUT, DELETE, PATCH).
    - HTTP Status Codes rõ ràng (2xx cho thành công, 4xx lỗi client, 5xx lỗi server).
    - Response luôn có cấu trúc chung (data, meta cho pagination, errors).
- **Chiến lược Versioning (Quản lý phiên bản API):**
    - **Internal API (Dùng nội bộ):** Không cần Versioning để tránh maintain mệt mỏi. Khi có thay đổi, Frontend và Backend phối hợp update cùng lúc.
    - **Public/Common Search API (Cho hệ thống khác gọi):** BẮT BUỘC có Versioning (ví dụ: `/v1/search`). Lý do: Nếu LIXIL thay đổi API mà không báo trước, các hệ thống khác đang dùng API này sẽ bị sập ("Breaking changes").
- **Bảo mật & Xác thực (Security & Auth):**
    - **Payload của JWT:** Cần chốt với khách hàng việc thêm trường `id_type` vào payload để phân biệt loại User (vd: End-user bình thường hay Admin/Partner).
    - **Authentication cho Hệ thống thứ 3:** Tạm thời chốt dùng **API Key + HMAC** (nhẹ, nhanh, bảo mật tốt bằng cách mã hóa signature) hoặc chỉ cần API Key nếu Apigee có thể giới hạn IP (IP Whitelisting). Chưa cần dùng đến OAuth phức tạp trừ khi LIXIL yêu cầu sau này.
- **Troubleshooting AI (Vấn đề Thuật toán ANN):**
    - **Sự cố:** Chức năng tìm kiếm xấp xỉ (Approximate Nearest Neighbor - ANN) của Elasticsearch đôi khi cho ra kết quả chất lượng bị rớt thê thảm (bị "rớt hạng" kết quả chuẩn).
    - **Kế hoạch:** Cần điều tra sâu hơn vào tháng 7. Đây là bài toán muôn thuở của Vector Search: Trade-off giữa Tốc độ (Speed) và Độ chính xác tuyệt đối (Recall).
- **Quản lý Spec & Scope (Dưới góc nhìn BrSE):**
    - Tính năng đã chốt 5/29, nhưng "Jira Driven Development": Specs liên tục cập nhật dựa trên trao đổi qua Jira và Wireframe (Màn hình thiết kế).
    - Phải làm rõ Data Source: Các màn hình "Danh sách tài liệu sản phẩm", "Chi tiết sản phẩm" sẽ lấy data từ RDB (Database quan hệ - PostgreSQL/MySQL) thay vì Elasticsearch.


### SPRINT 9 (Test Strategy, Push Integration & Suggestion Features)
- **Kiến trúc Tích hợp (Integration Architecture):**
    - **Quyết định:** Sử dụng APIGee và mô hình tích hợp dữ liệu dạng **Push (đẩy)** thay vì Pull (kéo).
    - **Lý do (Case Study):** Trong mô hình Pull, KINKEN sẽ phải chủ động đi "hỏi" các hệ thống khác xem có dữ liệu mới không (tốn tài nguyên, dễ bị độ trễ). Với mô hình Push kết hợp APIGee (như một trạm trung chuyển), các hệ thống khác khi có dữ liệu mới sẽ chủ động "đẩy" sang KINKEN. Điều này giúp dữ liệu real-time hơn và giảm tải cho hệ thống KINKEN.
- **Tính năng Suggestion (Gợi ý tìm kiếm):**
    - **Tình trạng:** MOR đã khảo sát và phân loại thành 7 pattern gợi ý khác nhau (từ cơ bản đến nâng cao).
    - **Kết quả:** Đã báo cáo sơ bộ (kèm estimate thời gian) cho LIXIL. Hiện tại LIXIL đang cân nhắc xem có nên đưa vào giai đoạn đầu (Phase 1) hay không, nên team offshore (MOR) được lệnh **tạm dừng** các hoạt động điều tra thêm về Suggestion để tập trung vào Core Features.
- **Làm rõ Feature List & Interface:**
    - Dành thời lượng lớn trong meeting để "đọc kỹ" (読み合わせ) Feature List nhằm đảm bảo hiểu đúng Specs.
    - GW (Kyogoku-san) sẽ tạo bản nháp (Draft) cho System Interface và Data Integration để chốt với MOR, tránh hiểu nhầm về cấu trúc dữ liệu giữa các hệ thống.
- **Chuẩn bị cho giai đoạn Development:**
    - Đã có chỉ thị bắt đầu chuẩn bị môi trường, tài liệu và các điều kiện cần thiết để chính thức bước vào Phase Coding (Thiết kế chi tiết & Code).


### SPRINT 10 (Test Strategy Definition)
- **Chiến lược Kiểm thử Toàn diện (Test Strategy):**
    - GW và MOR thống nhất tài liệu Chiến lược Test cho toàn bộ hệ thống, bao gồm 4 thành phần chính: Frontend (NextJS), Backend (FastAPI), Search Engine (Elasticsearch), và ETL Pipeline (Databricks).
- **Các Cấp độ Kiểm thử (Test Levels):**
    - **Unit Test (Kiểm thử Mức Đơn vị):** Dùng Pytest cho Backend, Jest cho Frontend. Đối với ETL, dùng Databricks Notebook hoặc Python script để test các hàm làm sạch dữ liệu (Data Cleaning). Điểm chú ý: Sử dụng **Mock** để tránh phụ thuộc vào hệ thống bên ngoài.
    - **Integration Test (Kiểm thử Tích hợp):** Test sự giao tiếp giữa các thành phần. Đặc biệt quan trọng: Test luồng Backend gọi Elasticsearch (dùng Docker chứa ES thật để test thay vì Mock), và luồng ETL đổ dữ liệu vào ES.
    - **System/E2E Test (Kiểm thử Hệ thống/Đầu-cuối):** Mô phỏng hành vi User từ lúc gõ từ khóa trên UI -> gọi Backend -> truy vấn ES -> trả kết quả. Trọng tâm: Đảm bảo các file PDF, Excel, Hình ảnh được OCR (nhận dạng chữ) và tìm kiếm chính xác.
    - **Performance/Load Test (Kiểm thử Hiệu năng):** Dùng JMeter/Locust để test khả năng chịu tải. Quan tâm đặc biệt đến tốc độ phản hồi của các câu truy vấn phức tạp trên Elasticsearch và hiệu năng xử lý file lớn của ETL Pipeline.
    - **ETL Test:** Đảm bảo tính toàn vẹn dữ liệu từ lúc Extract (Lấy dữ liệu từ nguồn) -> Transform (Biến đổi, thêm Meta-data) -> Load (Đưa vào Elasticsearch).
- **Chiến lược Môi trường (Environment Strategy):**
    - **Local:** Dùng Docker (FastAPI, NextJS, ES local) + file `.env.local` cho Developer tự test.
    - **Development (Dev):** Môi trường chung cho team Dev. Chạy Unit/Integration test tự động.
    - **Staging (STG):** "Bản sao" của Production. Dùng để chạy E2E, Performance Test và UAT.
    - **Production (PROD):** Cấm chạy Automation Test để tránh ảnh hưởng hiệu năng. Áp dụng Giám sát (Monitoring) bằng Kibana/Prometheus để cảnh báo lỗi.
- **CI/CD Pipeline:**
    - **CI (Continuous Integration):** Dùng GitHub Actions chạy tự động Unit/Integration Test mỗi khi có code mới (Push/PR).
    - **CD (Continuous Deployment):** Dùng Cloud Build deploy tự động lên 3 môi trường GCP sau khi CI pass.
- **Case Study (Bài toán khó): Xử lý File Unstructured & Batch Update**
    - **File PDF/Excel/Ảnh:** Khó khăn lớn nhất là trích xuất văn bản (OCR) từ các file scan hoặc format phức tạp. Giải pháp: Phải có bước Human Review (Test thủ công đối chiếu kết quả OCR) kết hợp script tự động check nội dung index.
    - **Batch Update (Cập nhật định kỳ):** Phải test xem việc chạy ETL hàng ngày/tuần có làm sót dữ liệu mới hoặc làm sập tính năng đang chạy hay không. Giải pháp: Có script tự động query Elasticsearch ngay sau mỗi lần ETL chạy xong để nghiệm thu.


### SPRINT 11 (Cost Optimization, Data Migration & Search Constraints)
- **Chiến lược cập nhật Index (Delta Update vs Wash/Full Refresh):**
    - **Vấn đề:** Khi có dữ liệu mới, nên xóa hết làm lại (Wash/Full Refresh) hay chỉ cập nhật phần thay đổi (Delta Update)?
    - **Quyết định:** Chọn **Cập nhật chênh lệch (差分更新 - Delta Update)**.
    - **Lý do (Case Study):** Dự án dùng OpenAI Embedding Model để chuyển đổi văn bản thành Vector. OpenAI tính phí dựa trên số lượng Token (chữ) được xử lý. Nếu dùng Full Refresh, mỗi lần cập nhật sẽ phải trả tiền lại cho những dữ liệu đã tồn tại => "Đốt tiền" của khách hàng. Delta update giúp tiết kiệm chi phí API triệt để.
- **Giới hạn thuật toán RRF (Reciprocal Rank Fusion):**
    - **Vấn đề:** RRF (thuật toán lai giữa Text Search và Vector Search) có một số giới hạn về mặt kỹ thuật, đặc biệt là liên quan đến số lượng kết quả trả về trong một truy vấn.
    - **Giải pháp:** Chấp nhận thiết lập giới hạn (上限 - Upper limit) cho số lượng kết quả trả về (hiện tại dự kiến là 500 kết quả). Con số này sẽ được tinh chỉnh sau khi có kết quả Test Chịu tải (Load Test).
- **Quyết định cuối cùng về ETL (Databricks vs Dataflow):**
    - Dù Dataflow có lợi thế hơn một chút về giá, nhưng **Databricks** vẫn được chọn làm công cụ ETL chính.
    - **Lý do:** MOR (đội offshore) đề xuất và có kinh nghiệm hơn với Databricks. Kiến trúc này mang lại nhiều lợi thế khác bù đắp lại chi phí. Team chốt tiến hành với Databricks, chỉ đổi tool nếu trong quá trình Performance Test phát sinh lỗi nghiêm trọng.
- **Kế hoạch Data Migration (Chuyển đổi dữ liệu ban đầu):**
    - **Nhận định của BrSE/GW:** Không bao giờ có chuyện "Import 1 lần là xong". Dữ liệu từ hệ thống cũ LIXIL đưa sang chắc chắn sẽ có lỗi (thiếu trường, sai format). Quy trình thực tế sẽ là: Import -> Lỗi -> Sửa data -> Import lại -> Lặp lại.
    - **Chiến thuật Test:** Cần xin LIXIL một bộ dữ liệu "bản sao" của Production (càng sớm càng tốt, ví dụ data của cuối tháng 7) để chạy Load Test và kiểm tra chất lượng OCR cho các file phi cấu trúc (Unstructured data).


### SPRINT 12 (Logging Strategy & Elasticsearch Internals)
- **Chiến lược Logging (Ghi log):**
    - **Frontend (NextJS):** Quyết định tạm thời KHÔNG thu thập log ở phía client (trình duyệt của user) để giảm thiểu độ phức tạp. Nếu sau này thấy cần thiết sẽ cân nhắc tích hợp Sentry.
    - **Elasticsearch (ES):** Yêu cầu offshore điều tra thêm về việc ghi log cho các câu Query (Request) và Response trả về từ ES. Quan trọng nhất: Việc thay đổi cấu hình log này có gây ra "Downtime" (thời gian chết của hệ thống) hay không?
- **Rủi ro tiềm ẩn của Delta Update (Cập nhật chênh lệch):**
    - Dù SPRINT 11 đã chốt dùng Delta Update để tiết kiệm chi phí API, nhưng team phát hiện ra một **vấn đề nội tại (Internal Issue)** của Elasticsearch:
        - Khi thực hiện Delta Update (thêm/sửa/xóa liên tục), ES thực chất không xóa ngay dữ liệu cũ mà chỉ đánh dấu là "đã xóa". Điều này tạo ra rất nhiều "Segment" (phân mảnh) rác, dẫn đến **phình to dung lượng lưu trữ (Storage bloat)**.
    - **Hành động:** Đưa vấn đề này vào danh sách "Cần điều tra" (Pending Investigation) để tìm giải pháp dọn rác (ví dụ: Force Merge) mà không làm ảnh hưởng hiệu năng.
- **Chiến lược Alias (Bí danh) cho Index:**
    - Mặc dù dùng Delta Update, team vẫn giữ "chiêu" **Alias Switching** (Chuyển đổi bí danh Index không thời gian chết) làm phương án dự phòng (Fallback). Rất hữu ích khi hệ thống gặp sự cố cần Re-index toàn bộ mà không muốn user bị gián đoạn.
- **Chuẩn bị cho Code & Thiết kế chi tiết:**
    - Yêu cầu khách hàng cung cấp bản Design (UI/UX) mới nhất (bản ngày 26/06) để team offshore đối chiếu với Sitemap và Specs.
    - Lên lịch họp trực tiếp (Offshore Camp tại Việt Nam) vào tuần sau để thảo luận sâu về kiến trúc luồng dữ liệu (Data Collection Architecture).


### Mid Sprints (Core Development & Integration)
- ...

### Late Sprints (UAT, Performance Tuning & Pre-PROD)
- ...

---
**Why:** Giúp hệ thống hóa lại lịch sử dự án, cung cấp cái nhìn tổng quan về tiến độ và là nguồn tài liệu quý giá để trích xuất case study cho các buổi phỏng vấn BrSE.
**How to apply:** Khi có thông tin mới về một Sprint hoặc một "bài toán khó" đã được giải quyết, hãy map nó vào mốc thời gian/Sprint tương ứng trong file này.