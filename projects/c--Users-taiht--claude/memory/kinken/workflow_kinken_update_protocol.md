---
name: project_kinken_update_workflow_protocol
description: Standard workflow to process KINKEN Output Summary Reports and update sprint tracking + glossary consistently across sessions.
type: project
---

Khi user làm việc với dự án KINKEN, Claude phải mặc định bám theo workflow này kể cả sau khi user clear conversation.

**Why:** User muốn quy trình ổn định, không cần nhắc lại cách làm mỗi phiên chat; mục tiêu là ghi chép xuyên suốt để phục vụ retrospective và case study BrSE.
**How to apply:** Mỗi khi user gửi Output Summary Report mới (hoặc yêu cầu tiếp tục KINKEN), thực hiện đúng tuần tự các bước dưới đây.

## KINKEN Update Workflow (Cross-session Default)

1) Source of truth ưu tiên
- Ưu tiên đọc file người dùng chỉ định (thường ở `workspace/Output Summary Report.md`).
- Sau đó đối chiếu với:
  - `projects/c--Users-taiht--claude/memory/kinken/sprint_tracking_summary.md`
  - `projects/c--Users-taiht--claude/memory/kinken/tech_glossary.md`

2) Trích xuất thông tin theo khung chuẩn
- Sprint/date: mốc thời gian, Sprint number, trạng thái (during/finish).
- Progress: FE/BE/ETL/QA/API/Infra.
- Issue/Risk: blocker, dependency, tool/process issue, performance risk.
- Decision: quyết định kiến trúc/quy trình/định danh.
- Next plan: action items cho sprint kế tiếp.
- Domain terms mới: thuật ngữ JP/EN/VN cần đưa vào glossary.

3) Cập nhật `sprint_tracking_summary.md`
- Thêm section mới theo format đã có trong file:
  - `### Giai đoạn YYYY/MM/DD (Tương ứng SPRINT X)`
  - các bullet song ngữ nghiệp vụ-kỹ thuật tương tự style hiện tại.
- Chèn theo thứ tự timeline hợp lý trong phần `## Key Milestones & Case Studies`.
- Không xóa nội dung cũ trừ khi user yêu cầu sửa sai.

4) Cập nhật `tech_glossary.md`
- Chỉ thêm thuật ngữ chưa có.
- Đặt vào category phù hợp (Cloud/API/ETL/AI/Domain Knowledge...).
- Mỗi term có định nghĩa ngắn, thực dụng, bám ngữ cảnh KINKEN.
- Nếu là từ nghiệp vụ JP (vd: 見込み, 見付け), ghi JP + romaji + nghĩa vận hành trong dự án.

5) Phản hồi cho user theo style đã thống nhất
- Mặc định tóm tắt theo kiểu kể chuyện (storytelling) dễ nhớ khi user xin giải thích.
- Nếu user chỉ yêu cầu update file thì trả lời ngắn gọn: đã cập nhật gì, ở đâu.

6) Self-check trước khi báo xong
- Kiểm tra mốc ngày/sprint không mâu thuẫn.
- Kiểm tra duplicate terms trong glossary.
- Kiểm tra section mới nằm đúng vị trí và đúng format heading/bullet.

7) Khi thiếu dữ liệu
- Nếu report thiếu ngày/sprint hoặc mơ hồ, hỏi 1 câu làm rõ trước khi ghi vào memory files.
- Không tự bịa thông tin không có trong source report.

## Guardrails
- Không đổi format tổng thể của 2 file trừ khi user yêu cầu.
- Không biến sprint note thành phân tích lan man; ưu tiên thông tin hành động và quyết định.
- Không ghi đè nội dung lớn bằng rewrite toàn file khi chỉ cần patch cục bộ.
