# Vector Index Schema

## Collection: `knowledge_chunks`

```json
{
  "id": "chunk_uuid",
  "tenant_id": "uuid",
  "site_scope": ["site_uuid"],
  "doc_id": "uuid",
  "doc_title": "Compressor A7 Service Manual",
  "doc_type": "manual",
  "doc_version": "v3.2",
  "status": "approved",
  "asset_model": "Compressor-A7",
  "asset_class": "compressor",
  "procedure_id": "SOP-LOTO-004",
  "step_id": "step_07",
  "page_start": 37,
  "page_end": 38,
  "section_path": ["Maintenance", "Filter replacement", "Isolation"],
  "risk_tags": ["LOTO", "stored_pressure"],
  "ppe_tags": ["gloves", "face_shield"],
  "tool_tags": ["lockout_kit", "wrench_12mm"],
  "chunk_text": "...",
  "embedding": "vector<float>",
  "created_at": "timestamp"
}
```

## 검색 전략

1. metadata filter: tenant, site, asset_model, approved status
2. dense vector search
3. sparse keyword/BM25 search
4. cross-encoder reranking
5. safety/risk chunk boost
6. SOP graph adjacency boost

## Production Index 규칙

- approved 문서만 production index에 들어간다.
- retired 문서는 검색되지 않지만 감사 목적으로 보존한다.
- 문서 버전 변경 시 기존 work session은 시작 시점 버전을 유지한다.
- 안전 정책 문서와 작업 절차 문서는 별도 collection 또는 high-priority tag로 관리한다.

## 쿼리 예시

```json
{
  "tenant_id": "acme",
  "asset_model": "Compressor-A7",
  "procedure_id": "SOP-LOTO-004",
  "current_step_id": "step_07",
  "query": "이 밸브 잠갔나? V-302 close verify",
  "filters": {
    "status": "approved",
    "risk_tags": ["LOTO", "stored_pressure"]
  },
  "top_k": 20,
  "rerank_top_k": 5
}
```
