# Interview Mock Skill

Run a mock BrSE interview session for practice.

## Trigger Phrases

- "Mock interview"
- "Chạy mock interview"
- "Practice phỏng vấn"
- "Hỏi tôi câu phỏng vấn"
- "Interview practice"

## Session Types

### Quick Practice (5-10 min)
- 1-2 random questions
- Quick feedback
- Good for daily practice

### Full Mock Interview (30-45 min)
- 5-7 questions (mix of types)
- Detailed feedback for each
- Final score and recommendations
- Good for serious preparation

### Specific Topic Practice
- Focus on one area (e.g., "KINKEN case studies")
- 3-4 related questions
- Deep dive feedback
- Good for targeted improvement

## Question Types

1. **Behavioral** (Tell me about a time when...)
2. **Technical** (Explain/Design)
3. **BrSE-Specific** (What does a BrSE do?)
4. **Case Study** (Tell me about a decision you made)
5. **Situational** (What would you do if...)

## Flow

### Step 1: Ask Question
```
📝 **Question [X/Y]**: [Type]
[Question text]

💡 **Hint**: [Optional hint if user struggles]
```

### Step 2: Wait for Answer
User provides their answer.

### Step 3: Provide Feedback
```
✅ **Strengths**:
- [What was good]

⚠️ **Areas to Improve**:
- [What could be better]

💡 **Better Answer Example**:
[Improved version]

📊 **Score**: [1-5 stars]
- Clarity: [1-5]
- Structure: [1-5]
- Technical accuracy: [1-5]
- BrSE relevance: [1-5]
```

### Step 4: Next Question or Summary
If more questions: Return to Step 1
If done: Show final summary

### Step 5: Final Summary
```
🎯 **Final Score**: [X/5]

📈 **Strengths**:
- [Overall strengths]

📉 **Areas to Focus**:
- [Areas needing improvement]

📚 **Recommended Practice**:
- [Specific suggestions]

💪 **Encouragement**: [Motivational message]
```

## Example Usage

### Example 1: Quick Practice
**User**: "Mock interview quick"

**Skill**:
```
📝 **Question 1/2**: Behavioral
"Tell me about a time when you had to communicate a technical issue to non-technical stakeholders."

💡 **Hint**: Use STAR method (Situation, Task, Action, Result)
```

**User**: [answers]

**Skill**: [provides feedback, asks next question]

### Example 2: Full Mock
**User**: "Full mock interview"

**Skill**:
```
🎯 **Starting Full Mock Interview**
Duration: ~30-45 minutes
Questions: 5-7

📝 **Question 1/5**: Behavioral
"Tell me about yourself and why you want to become a BrSE."
```

### Example 3: Topic-Specific
**User**: "Practice KINKEN case studies"

**Skill**:
```
🎯 **KINKEN Case Study Practice**
Focus: Technical decisions and communication

📝 **Question 1/3**: Case Study
"Tell me about the ETL tool selection decision in KINKEN. What was your role?"
```

## Question Bank

### Behavioral Questions
1. "Tell me about a time when you had to communicate a technical issue to non-technical stakeholders."
2. "Describe a situation where you had to bridge a gap between two teams."
3. "Tell me about a time when you had to learn something new quickly."
4. "Describe a conflict you resolved in a team."
5. "Tell me about a time when you had to adapt to a changing requirement."

### Technical Questions
1. "Explain Elasticsearch to a business user."
2. "How would you explain API versioning to a non-technical person?"
3. "What's the difference between REST and GraphQL?"
4. "Explain the ETL process in simple terms."
5. "What is vector search and why is it useful?"

### BrSE-Specific Questions
1. "What does a BrSE do differently from a developer?"
2. "How do you handle ambiguous requirements?"
3. "Tell me about your experience working with Japanese teams."
4. "How do you ensure clear communication across language barriers?"
5. "What's the most important skill for a BrSE?"

### Case Study Questions (KINKEN)
1. "Tell me about the PoC benchmark discrepancy issue."
2. "How did the team decide on ETL tools?"
3. "Explain the API architecture decision."
4. "Tell me about the document preview challenge."
5. "How was the authentication model designed?"

### Situational Questions
1. "What would you do if a client asked for something technically impossible?"
2. "How would you handle a situation where the team and client disagreed?"
3. "What if you didn't understand a requirement?"
4. "How would you handle a tight deadline with unclear requirements?"
5. "What would you do if you discovered a critical bug before release?"

## Integration

- **Reference**: `/Users/taiht/.claude/agents/interview-prep.md`
- **Reference**: `/Users/taiht/.claude/projects/kinken/05_interview/playbook.md`
- **Reference**: `/Users/taiht/.claude/projects/kinken/05_interview/case_studies.md`

---

**Last updated**: 2026-04-29
**Version**: 1.0
