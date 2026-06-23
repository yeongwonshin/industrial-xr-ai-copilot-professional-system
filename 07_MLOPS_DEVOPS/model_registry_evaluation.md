# 모델 레지스트리와 평가 운영

## 모델 종류

| 모델 | 예 | 배포 |
|---|---|---|
| ASR | 현장 소음 음성 인식 | device/edge/cloud |
| TTS | 짧은 음성 안내 | device/cloud |
| Object Detection | 부품/PPE/도구 | edge/device |
| OCR | 에러코드/계기값 | edge/cloud |
| VLM | 복잡한 시야 질의 | cloud/private/edge |
| LLM | 답변/요약/분기 | cloud/private |
| Reranker | 검색 결과 정렬 | edge/cloud |

## 모델 레지스트리 필드

```json
{
  "model_id": "ppe-detector-v0.7",
  "model_type": "object_detection",
  "training_data_version": "ppe-ds-2026-06",
  "eval_report_uri": "s3://...",
  "approved_for_sites": ["plant_01"],
  "approved_risk_levels": ["LOW", "MEDIUM"],
  "deployment_stage": "pilot",
  "owner": "ml-platform",
  "rollback_model_id": "ppe-detector-v0.6"
}
```

## 배포 게이트

- offline test pass
- shadow mode pass
- SME review pass
- privacy/security review pass
- rollback plan defined
- pilot site approval

## Shadow Mode

위험 감지 모델은 처음부터 작업을 차단하지 않고 shadow mode로 운영합니다.

1. 모델이 경고 후보 생성
2. 실제 작업자에게는 표시하지 않음
3. supervisor/SME가 로그 검토
4. 오탐/미탐 평가
5. 기준 충족 시 CAUTION부터 활성화
6. 고위험 BLOCK은 별도 안전 검증 후 활성화

## 드리프트 감지

- site별 precision/recall 변화
- 조명/계절/작업복 변경
- 새 장비 모델 추가
- 카메라 펌웨어 업데이트
- 작업자 행동 패턴 변화
