---
name: project_kinken_sprint_tracking
description: Tracking the overall progress and flow of KINKEN project from early sprints to SPRINT 25 (PROD release).
type: project
originSessionId: 9bdebdd7-459b-474e-a4df-4bd3a1513398
---

# KINKEN Sprint Tracking & Retrospective

## Overview

Dự án hiện tại đang ở **SPRINT 25**, giai đoạn chuẩn bị release lên môi trường PROD. Tài liệu này dùng để nhìn lại (retrospective) toàn bộ quá trình phát triển dự án từ sơ khai, theo dõi tiến độ tổng thể, các vấn đề gặp phải và cách giải quyết (case studies) qua từng giai đoạn.

## Timeline Clarification
- **Trước 2025/07/25**: Giai đoạn Tiền dự án (Pre-project / Foundation & Infrastructure Planning). **Không được gọi là Sprint**.
- **2025/07/25**: Chính thức bắt đầu **SPRINT 1**.

## Sprint History (Từ SPRINT 1 đến SPRINT 25)

Dưới đây là danh sách các Output Summary Report qua các mốc thời gian:

- **SPRINT 25** *(Current - Preparing for PROD Release)*
- **SPRINT 24**
- **SPRINT 23**
- **SPRINT 22**
- **SPRINT 21**
- **SPRINT 20**
- **SPRINT 19**
- **SPRINT 18**
- **SPRINT 17**
- **SPRINT 16**
- **SPRINT 15**
- **SPRINT 14**
- **SPRINT 13**
- **SPRINT 12**
- **SPRINT 11**
- **SPRINT 10**
- **SPRINT 9**
- **SPRINT 3**
  - 2025/08/08: Output Summary Report (SPRINT 3)
- **SPRINT 2**
  - 2025/08/01: Output Summary Report (SPRINT 2)
- **SPRINT 1**
  - 2025/07/25: Output Summary Report (SPRINT 1)

## Key Milestones & Case Studies

### Giai đoạn Tiền dự án (Tháng 5 - Giữa tháng 7/2025)
*(Xem chi tiết ở các bản ghi cũ)*

### Giai đoạn SPRINT 1 (Bắt đầu từ 2025/07/25)
*(Xem chi tiết ở các bản ghi cũ)*

### Giai đoạn SPRINT 2 (Kết thúc 2025/08/01)
*(Xem chi tiết ở các bản ghi cũ)*

### Giai đoạn SPRINT 3 (Kết thúc 2025/08/08)

#### 1. "Boosting" - Linh hồn của Search Engine 🧠
- **Sự kiện**: Team đã hoàn thành thiết kế Index và đặc biệt là **Boosting Query** cho Elasticsearch.
- **Ý nghĩa**: Search không chỉ là tìm thấy, mà là tìm thấy cái "đúng nhất" ở trên đầu. Việc thiết kế Boosting sớm cho thấy team đang tập trung vào chất lượng kết quả tìm kiếm (Relevance Scoring) ngay từ đầu.

#### 2. Chiến lược Test: Chia để trị (Test Strategy) 🧪
- **Vấn đề**: API và môi trường GCP chưa hoàn thiện 100% dẫn đến việc test bị nghẽn.
- **Giải quyết**: Team quyết định tách các ticket Test thành 2 phần: **"Tạo Test Case"** (đã xong) và **"Thực thi Test"** (đợi môi trường). 
- **QA Action**: Test thực thi sẽ được chạy trên môi trường DEV của GCP (dự kiến build bằng **Terraform** ở Sprint 4). Việc này giúp team QA không bị "ngồi chơi" mà luôn có output (Test Case) sẵn sàng.

#### 3. Nút thắt cổ chai Hạ tầng (Infra & Data Bottleneck) 🏗️
- **Vấn đề 1**: Chờ LIXIL kích hoạt **Databricks** (thành phần cực quan trọng cho ETL).
- **Vấn đề 2**: Chờ data "xịn" (Production-like data) để validation. Dự kiến cuối tháng 8 mới có đủ.
- **Rủi ro**: Dự án có dấu hiệu chậm tiến độ (delay) so với Detail Schedule ban đầu do khâu chuẩn bị môi trường và data tốn thời gian.
- **Đối sách**: Team BE/Test cam kết sẽ "hấp thụ" (absorb) phần delay này trong tháng 8 bằng cách đẩy nhanh tiến độ sau khi có môi trường.

#### 4. Kỹ năng BrSE: Quản lý Q&A mượt mà 💬
- **Vấn đề**: Q&A bị nghẽn do chờ trả lời.
- **Giải quyết**: Thống nhất quy trình "Fast-track Q&A". MOR có Q nào thì dịch và đẩy ngay cho GW. GW cam kết trả lời sớm nhất có thể. 
- **Tầm quan trọng**: BrSE cần đảm bảo luồng thông tin không bị tắc nghẽn, vì một câu hỏi chưa được giải đáp có thể làm dừng cả một line code của Dev.

#### 5. Bảo mật dữ liệu (Data Security) 🔒
- **Lưu ý**: Khách hàng nhấn mạnh dữ liệu dùng cho validation là dữ liệu thật (Production-like), yêu cầu team phải cực kỳ cẩn trọng trong việc bảo mật (Handle with care).

---
*(Các phần SPRINT 4 đến SPRINT 25 sẽ tiếp tục cập nhật)*
