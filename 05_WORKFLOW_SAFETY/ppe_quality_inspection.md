# PPE와 품질 검사 기능

## PPE 검사

### 검사 항목
- 안전모/헬멧
- 보안경/안면보호구
- 장갑
- 방진복/보호복
- 마스크/호흡보호구
- 안전화

### 구현 방식

1. 작업 시작 전 self-check card 표시
2. 카메라 frame에서 PPE 후보 인식
3. 신뢰도 낮으면 거울/동료 확인/수동 확인 요청
4. 고위험 작업은 supervisor 또는 현장 checkpoint와 결합
5. 개인정보 보호를 위해 얼굴 저장 금지 또는 자동 masking

## 품질 검사

### 검사 항목

| 항목 | 방식 |
|---|---|
| 부품 방향 | 객체 포즈/마커/3D 모델 비교 |
| 체결 상태 | 시각 인식 + 토크렌치 연동 |
| 라벨/시리얼 | OCR/바코드 |
| 계기값 | OCR 또는 센서 API |
| 누락 부품 | BOM checklist + visual detection |
| 작업 순서 | procedure state machine |

## Evidence 패키지

```json
{
  "evidence_id": "ev_001",
  "type": "quality_check",
  "asset_id": "pump_P2",
  "procedure_step": "step_08",
  "result": "PASS",
  "model_outputs": [
    {"label": "filter_inserted_correctly", "confidence": 0.94}
  ],
  "human_confirmation": {
    "worker_id_hash": "sha256:...",
    "confirmed_at": "2026-06-24T10:30:00+09:00"
  },
  "storage": {
    "redacted_image_uri": "s3://...",
    "retention_days": 180
  }
}
```

## 품질 대시보드

- step별 fail rate
- 작업자/라인/장비별 편차
- 반복 오탐/미탐 모델 개선 queue
- audit-ready evidence completeness
- 재작업 원인 Top 10
