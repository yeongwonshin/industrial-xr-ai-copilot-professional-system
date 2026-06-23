# 위험 감지와 Safety Case

## 안전 설계 철학

FieldSense XR은 “AI가 안전 책임자가 되는 시스템”이 아닙니다. AI는 작업자가 위험을 인지하고 절차를 준수하도록 돕는 보조 시스템이며, 고위험 판단은 정책과 사람 승인 체계를 포함합니다.

## 위험 카테고리

| 위험 | 감지 신호 | 시스템 반응 |
|---|---|---|
| PPE 미착용 | 시각/PPE checklist | 작업 시작 차단 또는 주의 |
| LOTO 누락 | breaker/lock/tag 인식, 절차 상태 | 고위험 단계 BLOCK |
| 잔류 압력 | 센서/OCR/작업 단계 | 배관 분해 단계 차단 |
| 고온 표면 접근 | asset hazard zone + hand tracking | 경고/거리 유지 안내 |
| 잘못된 부품 방향 | 객체 포즈/마커 | 재조립 안내 |
| 금지 순서 | procedure state machine | 다음 단계 전환 불가 |
| 비인가 작업자 | role/certification | 승인 요청 |
| 문서 버전 오류 | document version check | 작업 시작 차단 |

## Safety Case 템플릿

```text
Claim: 시스템은 Compressor-A7 필터 교체 작업에서 LOTO 누락 상태의 분해 작업을 방지한다.
Argument:
  1. SOP graph는 분해 단계의 전제 조건으로 전원 차단과 LOTO를 요구한다.
  2. Safety Engine은 step transition 전에 LOTO evidence를 검증한다.
  3. LOTO evidence가 없거나 신뢰도 기준 미달이면 BLOCK을 반환한다.
  4. AI Orchestrator는 BLOCK 결정을 우회할 수 없다.
Evidence:
  - policy rule test result
  - visual detector validation result
  - integration test log
  - pilot incident simulation report
Residual Risk:
  - 카메라 시야 밖에서 LOTO가 적용된 경우 미확인 가능
  - 해결: 수동 증거 캡처와 supervisor 승인 절차 제공
```

## 위험 등급별 응답

| 등급 | 예시 | 응답 |
|---|---|---|
| LOW | 문서 검색, 일반 안내 | AI 답변 허용 |
| MEDIUM | PPE 확인, 도구 준비 | 주의 + 확인 요청 |
| HIGH | LOTO, 압력 해제, 전기 작업 | BLOCK/승인/증거 필요 |
| CRITICAL | 즉시 생명 위험, 화재/누출 | 작업 중지, 대피/현장 절차 안내 |

## 금지 설계

- AI가 “괜찮을 것 같다”라고 고위험 작업 진행을 허용하지 않음
- OCR/시각 인식 단독으로 고위험 작업 완료 확정 금지
- 사용자가 경고를 반복 무시할 때 단순히 알림을 끄는 기능 금지
- 문서 근거 없는 안전 절차 생성 금지
