# 문서/지식 인제스천 파이프라인

## 단계

1. 업로드: PDF, DOCX, 이미지, CSV, CAD metadata, 영상 transcript
2. 보안 스캔: 악성 파일, PII/영업비밀 태깅
3. OCR/Layout parsing: 표, 그림, 캡션, 페이지 번호 보존
4. 구조화: 장비 모델, 절차 단계, 위험 태그, 도구/부품 추출
5. Human review: SME가 절차와 위험 태그 승인
6. Embedding/indexing: 승인된 문서만 production index 반영
7. SOP graph compile: step/precondition/evidence/risk relation 생성
8. Regression test: 기존 질문 세트와 safety test 통과 확인
9. 배포: site/device cache sync

## 인제스천 Manifest

```json
{
  "document_id": "MAN-A7-2026",
  "title": "Compressor A7 Service Manual",
  "version": "3.2",
  "asset_models": ["Compressor-A7"],
  "doc_type": "manual",
  "owner": "Maintenance Engineering",
  "approval_required": true,
  "contains_regulated_data": false,
  "target_sites": ["plant_01"],
  "effective_date": "2026-07-01"
}
```

## 품질 게이트

- OCR confidence 평균 95% 이상 또는 수동 검수
- 표/단위/수치 항목 수동 검증
- 위험 키워드 누락 검사
- 절차 단계 순서와 전제 조건 SME 승인
- 문서 버전 중복/충돌 검사
- prompt injection 문자열 탐지

## 운영 지표

- ingestion lead time
- manual review backlog
- failed parsing rate
- chunk coverage by procedure
- outdated document count
- production index freshness
