# Glossary Lookup Skill

Quick lookup technical terms from KINKEN glossary.

## Trigger Phrases

- "Nghĩa của X là gì?"
- "Lookup X"
- "Định nghĩa X"
- "Giải thích từ X"
- "What is X?"

## How It Works

1. Search in `/Users/taiht/.claude/projects/kinken/05_interview/glossary.md`
2. Return full definition with all languages
3. Provide context from KINKEN project

## Output Format

```
📖 **Term**: 見込み (みこみ)

**EN**: Depth dimension of window frame (from inside to outside)
**VI**: Chiều sâu khung cửa (từ trong nhà ra ngoài)

**Context (KINKEN)**: Used to specify aluminum window frame dimensions in product specifications. Important for identifying replacement parts.

**Category**: Domain Knowledge (Nghiệp vụ Nhôm Kính)

**Related Terms**:
- 見付け (Mitsuke) - Width dimension
- 商品 (Shohin) - Product
```

## Example Usage

### Example 1: Japanese Term
**User**: "Nghĩa của 見込み là gì?"

**Skill**:
```
📖 **Term**: 見込み (みこみ)

**EN**: Depth dimension of window frame (from inside to outside)
**VI**: Chiều sâu khung cửa (từ trong nhà ra ngoài)

**Context (KINKEN)**: Used to specify aluminum window frame dimensions in product specifications.
```

### Example 2: English Term
**User**: "What is RRF?"

**Skill**:
```
📖 **Term**: RRF (Reciprocal Rank Fusion)

**JP**: -
**VI**: Thuật toán "lai" kết hợp điểm số của Keyword Search và Vector Search

**Context (KINKEN)**: Used in Elasticsearch hybrid search to combine morphological and semantic search results.
```

### Example 3: Vietnamese Term
**User**: "Định nghĩa 'chiều sâu khung cửa'"

**Skill**:
```
📖 **Term**: 見込み (みこみ) - Chiều sâu khung cửa

**EN**: Depth dimension of window frame (from inside to outside)
**JP**: 見込み (みこみ)

**Context (KINKEN)**: Used to specify aluminum window frame dimensions.
```

## Fallback

If term not found in glossary:
```
❌ **Not Found**: "X" không có trong glossary.

💡 **Suggestion**:
- Check spelling
- Try searching in English/Japanese
- Ask to add to glossary if it's a new term
```

## Integration

- **Glossary File**: `/Users/taiht/.claude/projects/kinken/05_interview/glossary.md`
- **Related Agent**: `/Users/taiht/.claude/agents/japanese-study.md`

---

**Last updated**: 2026-04-29
**Version**: 1.0
