# Rules Directory

Tổ chức các quy tắc và guidelines cho Claude Code workspace.

---

## 📁 Cấu Trúc

```
rules/
├── README.md                    # File này
├── global/                      # Quy tắc chung cho mọi project
│   └── README.md               # Communication, Code Style, Workflow, Security
└── projects/                    # Quy tắc riêng cho từng project
    └── README.md               # KINKEN, WORKLOG, Japanese Study
```

---

## 🎯 Mục Đích

### Global Rules
Áp dụng cho **mọi dự án** trong workspace:
- Communication style (VN/EN/JP)
- Code style (naming, comments)
- Git workflow (commit, PR, merge)
- Security practices (secrets, validation)
- Testing standards (coverage, naming)

### Project-Specific Rules
Áp dụng cho **từng dự án cụ thể**:
- KINKEN: Search behavior, API endpoints, BrSE communication
- WORKLOG: Log format, categories
- Japanese Study: Vocabulary format, SRS workflow

---

## 📖 Cách Sử Dụng

### 1. Khi Bắt Đầu Dự Án Mới
1. Đọc `global/README.md` để hiểu quy tắc chung
2. Tạo section mới trong `projects/README.md` cho dự án
3. Define project-specific rules

### 2. Khi Làm Việc Với Dự Án Hiện Tại
1. Reference `global/README.md` cho best practices
2. Reference `projects/README.md` cho project-specific rules
3. Follow both sets of rules

### 3. Khi Update Rules
1. Global rules: Update `global/README.md`
2. Project rules: Update `projects/README.md`
3. Document reason for change

---

## 🔄 Integration với Claude Code

### Agents
Agents sẽ tự động reference rules khi:
- **japanese-study**: Follow vocabulary format từ `projects/README.md`
- **interview-prep**: Follow communication style từ `global/README.md`

### Skills
Skills sẽ tự động apply rules khi:
- **kinken-update**: Follow workflow từ `global/README.md`
- **notion-vocab**: Follow format từ `projects/README.md`

### Workflow
- Git operations follow `global/README.md` → Git Workflow
- Code style follow `global/README.md` → Code Style Rules
- Project-specific behavior follow `projects/README.md`

---

## 📋 Quick Reference

| Need | File | Section |
|------|------|---------|
| Language preference | `global/README.md` | Communication Rules |
| Code naming | `global/README.md` | Code Style Rules |
| Git workflow | `global/README.md` | Workflow Rules |
| Security practices | `global/README.md` | Security Rules |
| KINKEN search behavior | `projects/README.md` | KINKEN |
| Japanese vocab format | `projects/README.md` | Japanese Study |
| WORKLOG format | `projects/README.md` | WORKLOG |

---

## 🎓 Best Practices

### 1. Keep Rules DRY (Don't Repeat Yourself)
- Global rules = áp dụng cho mọi project
- Project rules = chỉ những gì khác biệt

### 2. Document WHY, Not Just WHAT
```markdown
# GOOD
Rule: Always use parameterized queries
Why: Prevent SQL injection attacks

# BAD
Rule: Use parameterized queries
```

### 3. Make Rules Actionable
```markdown
# GOOD
Rule: Commit message format: "type: description"
Example: "feat: add user authentication"

# BAD
Rule: Write good commit messages
```

### 4. Update Rules When Needed
- Rules không phải bất biến
- Update khi có lesson learned
- Document reason for change

---

## 🔗 Related Files

| File | Purpose |
|------|---------|
| `/Users/taiht/.claude/CLAUDE.md` | Global instructions for AI |
| `/Users/taiht/.claude/MEMORY.md` | Memory index |
| `/Users/taiht/.claude/agents/` | Agent definitions |
| `/Users/taiht/.claude/skills/` | Skill definitions |
| `/Users/taiht/.claude/projects/kinken/workflow_kinken_update_protocol.md` | KINKEN workflow |

---

## 📝 Changelog

| Date | Change | Reason |
|------|--------|--------|
| 2026-04-30 | Initial creation | Organize rules for better clarity |

---

## 💡 Tips

1. **Read global rules first** khi bắt đầu làm việc
2. **Reference project rules** khi làm task cụ thể
3. **Update rules** khi có lesson learned
4. **Share rules** với team members nếu cần

---

**Last updated**: 2026-04-30  
**Version**: 1.0
