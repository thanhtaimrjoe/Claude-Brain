# Global Rules

Các quy tắc chung áp dụng cho mọi dự án trong workspace Claude Code của bạn.

---

## 📋 Mục lục

- [Communication Rules](#communication-rules)
- [Code Style Rules](#code-style-rules)
- [Workflow Rules](#workflow-rules)
- [Security Rules](#security-rules)

---

## Communication Rules

### 1. Language Preference

| Context | Language | Notes |
|---------|----------|-------|
| General conversation | Vietnamese | Ngôn ngữ chính |
| Code comments | English | Theo best practice |
| Bug reports | English | Standard cho team quốc tế |
| Japanese client messages | Vietnamese + Japanese | Dịch đầy đủ |
| Notion vocab entries | JP/EN/VI | 3 languages |

### 2. Output Format

- **Structured explanations**: Có luồng logic rõ ràng
- **Data tables**: Copyable format (Markdown table hoặc TSV)
- **Bug reports**: Title / Steps / Expected / Actual / Severity
- **Debugging**: Trace data pipeline từng bước

### 3. Tone & Style

- **Direct but supportive**: Rõ ràng, không vòng vo
- **Solutions-oriented**: Tập trung vào giải pháp
- **Concise**: Tránh lan man, ngắn gọn
- **Professional**: Không dùng slang quá thân mật

---

## Code Style Rules

### 1. Comment Language

```python
# GOOD: Comments in English
def process_data(data):
    """Process input data and return results."""
    # Validate input format
    # Transform data
    # Return processed results
    pass
```

```python
# BAD: Comments in Vietnamese
def process_data(data):
    """Xử lý dữ liệu đầu vào."""
    # Xác thực định dạng đầu vào
    # Biến đổi dữ liệu
    # Trả về kết quả
    pass
```

### 2. Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| Variables | camelCase | `userName`, `totalAmount` |
| Functions | camelCase | `getUserData()`, `calculateTotal()` |
| Classes | PascalCase | `UserService`, `DataProcessor` |
| Constants | UPPER_SNAKE_CASE | `MAX_RETRIES`, `API_TIMEOUT` |
| Files | kebab-case | `user-service.ts`, `data-processor.js` |
| Folders | kebab-case | `user-profile/`, `api-endpoints/` |

### 3. Error Handling

- **Validate input** ở system boundaries
- **Use try-catch** cho async operations
- **Log errors** với context đầy đủ
- **Return meaningful error messages**

---

## Workflow Rules

### 1. Git Workflow

| Action | Command | Notes |
|--------|---------|-------|
| Push to new branch | `git push -u origin feature-branch` | Luôn push vào branch mới |
| Create PR | `gh pr create` | Title < 70 chars |
| Squash merge | `git merge --squash` | Giữ history clean |
| Force push | ❌ Không bao giờ | Unless explicitly requested |

### 2. Commit Messages

```
type: description

Co-Authored-By: Claude Opus 4.7 <noreply@anthropic.com>
```

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`

### 3. PR Descriptions

```markdown
## Summary
- [Bullet point 1]
- [Bullet point 2]

## Test plan
- [Test case 1]
- [Test case 2]

🤖 Generated with [Claude Code](https://claude.com/claude-code)
```

---

## Security Rules

### 1. Secrets Management

| Do | Don't |
|----|-------|
| ✅ Use environment variables | ❌ Hardcode secrets |
| ✅ Use `.env` file (gitignored) | ❌ Commit `.env` |
| ✅ Rotate keys regularly | ❌ Use same key forever |
| ✅ Use secrets manager for prod | ❌ Store in code |

### 2. Input Validation

- **Always validate** user input
- **Sanitize** before database operations
- **Use parameterized queries** để tránh SQL injection
- **Validate file uploads** (type, size)

### 3. API Security

- **Rate limiting** cho public APIs
- **Authentication** cho protected endpoints
- **CORS** configuration đúng
- **HTTPS** luôn luôn

---

## Testing Rules

### 1. Test Coverage

| Layer | Minimum Coverage |
|-------|------------------|
| Unit tests | 80% |
| Core logic | 95%+ |
| Edge cases | 100% |
| E2E | Critical paths |

### 2. Test Naming

```
functionName_scenario_expectedBehavior
```

Ví dụ:
- `getUser_validId_returnsUser`
- `calculateTotal_emptyCart_returnsZero`
- `processData_invalidInput_throwsError`

---

## Documentation Rules

### 1. README Structure

```markdown
# Project Name

## Overview
- Purpose
- Key features

## Tech Stack
- Backend
- Frontend
- Database
- Tools

## Setup
- Prerequisites
- Installation
- Configuration

## Usage
- Examples
- API endpoints

## Testing
- Commands
- Coverage

## Contributing
- Guidelines
- Code style
```

### 2. Code Documentation

- **Functions**: Comment `WHY`, không `WHAT`
- **Classes**: Document purpose và usage
- **Complex logic**: Add inline comments
- **Constants**: Explain meaning

---

## Troubleshooting Rules

### 1. Debugging Process

1. **Reproduce** the issue
2. **Isolate** the component
3. **Check** logs/errors
4. **Hypothesize** root cause
5. **Test** fix
6. **Verify** with edge cases

### 2. Error Reporting

```
Title: [Component] Error description

Steps to reproduce:
1. ...
2. ...
3. ...

Expected: ...
Actual: ...

Environment:
- OS: ...
- Version: ...
- Configuration: ...
```

---

## Quick Reference

| Task | Command/Rule |
|------|--------------|
| Push branch | `git push -u origin branch-name` |
| Create PR | `gh pr create` |
| Commit | `git commit -m "type: description"` |
| Run tests | `npm test` / `pytest` |
| Lint | `npm run lint` / `flake8` |

---

**Last updated**: 2026-04-30  
**Version**: 1.0
