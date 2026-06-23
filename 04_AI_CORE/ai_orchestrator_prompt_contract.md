# AI Orchestrator Prompt/Tool Contract

## 역할

AI Orchestrator는 사용자의 질문을 이해하고, 현재 작업 상태와 문서 근거를 결합해 답변합니다. 단, 안전 정책을 직접 생성하거나 우회하지 않습니다.

## 입력 스키마

```json
{
  "session": {
    "tenant_id": "string",
    "site_id": "string",
    "device_id": "string",
    "worker_role": "operator|technician|supervisor",
    "language": "ko-KR"
  },
  "work_context": {
    "work_order_id": "string",
    "asset_id": "string",
    "procedure_id": "string",
    "current_step_id": "string",
    "risk_level": "LOW|MEDIUM|HIGH|CRITICAL"
  },
  "multimodal_context": {
    "transcript": "string",
    "detected_objects": [],
    "ocr_text": [],
    "sensor_values": {},
    "evidence_refs": []
  },
  "retrieval_context": {
    "source_chunks": [],
    "sop_graph_nodes": []
  },
  "policy_context": {
    "safety_decision": "ALLOW|CAUTION|BLOCK|REQUIRE_APPROVAL",
    "policy_refs": []
  }
}
```

## 출력 스키마

```json
{
  "intent": "ANSWER|NEXT_STEP|VERIFY_STEP|DIAGNOSE_ERROR|ESCALATE|STOP_WORK",
  "spoken_response": "string",
  "display_cards": [
    {
      "title": "string",
      "body": "string",
      "severity": "INFO|CAUTION|DANGER",
      "anchor_target": "object_id_optional"
    }
  ],
  "recommended_actions": [],
  "requires_human_confirmation": true,
  "source_refs": [],
  "confidence": 0.0,
  "audit_tags": []
}
```

## 시스템 프롬프트 핵심 규칙

```text
당신은 산업 현장 XR 작업 코파일럿입니다.
1. 문서, SOP, 정책, 센서/시각 근거가 없으면 절대 단정하지 마세요.
2. 안전 위험이 있으면 답변보다 작업 중지/확인/승인 절차를 우선하세요.
3. 사용자가 위험한 순서를 요구하면 실행 방법을 계속 안내하지 말고 안전한 절차로 리디렉션하세요.
4. 모든 작업 안내는 현재 단계, 장비 ID, 문서 버전, 전제 조건을 포함하세요.
5. Safety Engine의 BLOCK/REQUIRE_APPROVAL 결정을 우회하지 마세요.
6. 답변은 작업자가 바로 행동할 수 있도록 짧고 명확하게 하세요.
```

## Tool Calling 목록

| Tool | 용도 |
|---|---|
| `retrieve_manual_chunks` | 문서/SOP 검색 |
| `get_asset_state` | 장비/센서/CMMS 상태 조회 |
| `validate_safety_policy` | 안전 정책 평가 |
| `create_evidence` | 증거 캡처 저장 |
| `advance_procedure_step` | 단계 완료/다음 단계 전환 |
| `request_expert_assist` | 전문가 에스컬레이션 |
| `create_incident_report` | near-miss/위험 리포트 생성 |

## 안전 관련 응답 예시

```json
{
  "intent": "STOP_WORK",
  "spoken_response": "현재 전원 차단과 LOTO가 확인되지 않았습니다. 필터 분해 단계로 진행할 수 없습니다. 먼저 전원 차단기를 OFF로 전환하고 잠금 태그를 부착한 뒤 다시 확인하세요.",
  "display_cards": [
    {
      "title": "작업 중지: LOTO 미확인",
      "body": "SOP-LOTO-004 step 03이 완료되어야 step 07을 진행할 수 있습니다.",
      "severity": "DANGER",
      "anchor_target": "breaker_B12"
    }
  ],
  "requires_human_confirmation": true,
  "confidence": 0.89,
  "audit_tags": ["LOTO", "BLOCKED", "HIGH_RISK"]
}
```
