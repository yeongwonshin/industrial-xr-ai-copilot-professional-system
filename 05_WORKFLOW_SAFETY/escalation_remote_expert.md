# 전문가 에스컬레이션/원격지원

## 목표

AI가 해결하지 못하거나 위험도가 높은 상황에서 원격 전문가가 빠르게 맥락을 이해하고 개입할 수 있도록 합니다.

## 에스컬레이션 조건

- AI 신뢰도 낮음
- Safety Engine `REQUIRE_APPROVAL`
- 문서와 현장 상태 불일치
- 작업자가 “전문가 호출” 요청
- 반복 실패/재촬영 3회 이상
- 고위험 작업 승인 필요

## 전문가에게 전달되는 Context Bundle

```json
{
  "work_order": "WO-2026-01821",
  "asset": "Compressor-A7",
  "current_step": "SOP-LOTO-004:07",
  "worker_question": "이 밸브 잠갔나?",
  "ai_summary": "V-302 닫힘 여부 불확실. 압력계는 0.1 bar로 읽힘.",
  "risk_flags": ["stored_pressure", "LOTO_REQUIRED"],
  "evidence": ["redacted_frame_001", "ocr_gauge_001"],
  "recent_actions": ["step_05_completed", "step_06_waiting_evidence"],
  "recommended_expert_actions": ["request close-up of valve handle", "confirm pressure gauge"]
}
```

## 원격 전문가 기능

- 현장 시야 공유
- 3D/2D 주석 표시
- 작업 단계 override/approval
- 음성/텍스트 지시
- 증거 캡처 요청
- incident/near-miss 생성

## 전문가 개입 로그

- 누가 승인했는가
- 어떤 evidence를 보고 승인했는가
- 어떤 정책 예외가 적용되었는가
- 이후 작업 결과가 pass/fail인지
- 모델 개선 데이터로 보낼지 여부
