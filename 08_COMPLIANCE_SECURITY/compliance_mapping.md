# 컴플라이언스 매핑

## 적용 가능한 표준/규제 영역

| 영역 | 관련 프레임워크 | 제품 적용 방식 |
|---|---|---|
| 산업 안전 | ISO 45001, OSHA LOTO 등 | 위험 식별, 절차 준수, 사고/near-miss 기록 |
| 산업 보안 | IEC 62443 | Zone/Conduit, OT망 분리, 보안 개발/운영 |
| AI 거버넌스 | ISO/IEC 42001, NIST AI RMF | AI 위험관리, 평가, 모니터링, 책임성 |
| 품질 | ISO 9001, 고객 QMS | 절차 버전관리, evidence, 변경관리 |
| 개인정보 | GDPR/PIPA/HIPAA 등 고객 지역별 | 최소수집, redaction, 보존 정책, 접근 통제 |
| 의료/항공 | 산업별 규제 | 검증 문서, human approval, audit trail 강화 |

## AI 고위험 가능성

현장 안전에 영향을 줄 수 있는 AI 기능은 지역 규제에 따라 고위험 시스템 또는 안전 관련 보조 시스템으로 분류될 수 있습니다. 따라서 초기부터 다음 문서를 준비합니다.

- Intended Use Statement
- Risk Management File
- Model Card
- Data Card
- Evaluation Report
- Human Oversight Plan
- Incident Response Plan
- Change Control Log

## 제품 주장 제한

- “사고를 완전히 방지한다” 금지
- “AI가 안전을 보장한다” 금지
- “인간 감독 없이 고위험 작업을 승인한다” 금지
- 권장 표현: “절차 준수와 위험 인지를 보조하고, 정책 기반 확인과 감사 로그를 제공합니다.”

## 감사 패키지 구성

```text
Audit Package/
  system_description.pdf
  intended_use.md
  risk_register.csv
  safety_case_templates.md
  model_cards/
  evaluation_reports/
  data_processing_agreement.md
  access_control_matrix.xlsx
  change_control_log.csv
  incident_response_plan.md
```
