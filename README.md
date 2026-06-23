# FieldSense XR AI Work Copilot

산업 현장 작업자가 스마트글래스/MR 헤드셋을 착용하면, AI가 장비·부품·문서·작업 순서·손동작·PPE 상태를 종합해 **다음 작업을 안내하고 위험한 순서를 차단하는 전문 엔터프라이즈 시스템**입니다.

이 디렉토리는 단순 MVP가 아니라 실제 B2B 파일럿·투자설명·개발 착수·보안/안전 검토에 바로 사용할 수 있는 시스템 패키지로 구성했습니다.

## 핵심 제품 정의

- **현장 작업 코파일럿**: 음성 질의응답, 매뉴얼 기반 안내, 체크리스트, 오류코드 진단, 부품 방향/상태 확인
- **안전 게이트**: PPE, LOTO, 고전압/고온/압력, 순서 위반, 금지 구역 접근, 2인 승인 등 위험 제어
- **품질 보증**: 조립 방향, 토크값, 부품 누락, 시리얼/로트 확인, 증거 이미지/영상 로그
- **지식 운영체제**: PDF/도면/SOP/정비이력/CMMS/ERP 데이터를 RAG + 절차 그래프로 변환
- **엔터프라이즈 배포**: XR 클라이언트, 엣지 게이트웨이, 클라우드 백엔드, 관리자 콘솔, 감사 로그, 보안 정책

## 디렉토리 구조

```text
industrial_xr_ai_copilot_professional_system/
├── 00_EXECUTIVE_SUMMARY/
├── 01_PRODUCT_STRATEGY/
├── 02_SYSTEM_ARCHITECTURE/
├── 03_XR_CLIENT/
├── 04_AI_CORE/
├── 05_WORKFLOW_SAFETY/
├── 06_DATA_BACKEND/
├── 07_MLOPS_DEVOPS/
├── 08_COMPLIANCE_SECURITY/
├── 09_IMPLEMENTATION_ROADMAP/
├── 10_COMMERCIALIZATION/
├── 11_DOMAIN_PACKS/
├── 12_DEMO_ASSETS/
├── 13_GOVERNANCE/
├── REFERENCES.md
└── directory_tree.txt
```

## 권장 사용 순서

1. `00_EXECUTIVE_SUMMARY/system_blueprint.md`로 전체 컨셉을 이해합니다.
2. `02_SYSTEM_ARCHITECTURE/architecture_overview.md`와 `06_DATA_BACKEND/openapi.yaml`로 개발 범위를 정의합니다.
3. `04_AI_CORE/rag_pipeline.md`, `04_AI_CORE/ai_orchestrator_prompt_contract.md`로 AI 시스템을 설계합니다.
4. `05_WORKFLOW_SAFETY/hazard_detection_safety_cases.md`로 안전 기능의 법적·운영적 경계를 정합니다.
5. `09_IMPLEMENTATION_ROADMAP/12_month_build_plan.md`와 `10_COMMERCIALIZATION/pricing_packaging.md`로 파일럿·상용화를 준비합니다.

## 제품 한 줄 설명

> FieldSense XR은 산업 현장의 절차 지식, 실시간 시야 인식, 안전 정책, 작업 로그를 하나로 묶어 작업자가 실수하기 전에 안내·검증·차단하는 XR 기반 AI 작업 코파일럿입니다.
