# 모듈 경계와 책임

## 모듈별 책임

| 모듈 | 책임 | 하지 않는 것 |
|---|---|---|
| XR Client | UI, 음성, 입력, 캡처, 로컬 캐시 | 장기 보관, 최종 안전 판정 |
| Edge Gateway | 저지연 추론, 필터링, 현장 연동 | 중앙 정책 승인, 장기 분석 |
| AI Orchestrator | 질문 이해, 검색, 답변, 단계 추론 | 안전 룰을 임의 생성하지 않음 |
| Safety Engine | 정책 기반 허용/중지/승인 판단 | 문서 요약, 자유 추론 |
| Knowledge OS | 문서/절차/장비 지식 관리 | 실시간 UI 렌더링 |
| Control Plane | 권한, 배포, 감사, KPI | 현장 기기 센서 직접 처리 |

## 경계 규칙

1. AI Orchestrator는 Safety Engine의 `BLOCK` 결정을 우회할 수 없다.
2. XR Client는 위험 작업 완료를 단독 확정하지 않는다. Evidence + Rule + 승인 상태가 필요하다.
3. Knowledge OS의 문서 변경은 승인 workflow를 통과해야 production index에 반영된다.
4. 모든 AI 답변은 `source_refs`, `confidence`, `actionability`, `risk_level`을 포함해야 한다.
5. 원본 영상 저장은 기본 비활성화하고, 이벤트 증거 단위로 최소 캡처한다.

## 서비스 후보

```text
services/
  xr-session-service
  ai-orchestrator-service
  retrieval-service
  sop-graph-service
  safety-policy-service
  perception-inference-service
  asset-registry-service
  work-order-service
  evidence-service
  audit-log-service
  admin-console-service
  integration-connector-service
```

## 메시지 버스 이벤트

- `xr.session.started`
- `worker.question.asked`
- `perception.object.detected`
- `procedure.step.completed`
- `safety.rule.blocked`
- `evidence.created`
- `expert.escalation.requested`
- `knowledge.document.approved`
- `model.evaluation.failed`
