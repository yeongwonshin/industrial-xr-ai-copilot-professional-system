# 보안 위협 모델

## 보호 대상

- 매뉴얼/SOP/도면/BOM 등 영업비밀
- 작업자 음성/영상/위치/행동 데이터
- 장비 상태와 생산 조건
- 안전 정책과 감사 로그
- 모델과 지식 인덱스
- XR 기기와 엣지 서버

## 주요 위협

| 위협 | 예시 | 대응 |
|---|---|---|
| 문서 유출 | 매뉴얼 다운로드/스크린샷 | RBAC, watermark, 다운로드 제한 |
| 프롬프트 인젝션 | PDF 안에 악성 지시 삽입 | ingestion scan, instruction hierarchy |
| 잘못된 AI 안내 | 근거 없는 안전 절차 생성 | RAG gate, safety policy gate |
| 원본 영상 노출 | 작업자/고객/환자 정보 포함 | edge redaction, opt-in storage |
| 기기 분실 | 헤드셋에 캐시된 SOP | MDM, remote wipe, encrypted cache |
| OT망 침해 | 엣지 connector 오용 | network segmentation, read-only connector |
| 감사 로그 변조 | 사고 후 로그 삭제 | append-only/WORM storage, SIEM export |

## 보안 통제

- mTLS between device-edge-cloud
- device attestation where available
- encrypted local cache
- short-lived tokens
- SSO/OIDC/SAML
- RBAC/ABAC
- secrets management
- signed model/document bundles
- audit log immutability
- SIEM integration
- vulnerability scanning and SBOM

## IEC 62443 관점 적용

- Zone/Conduit 모델로 XR/Edge/OT/Cloud 경계 구분
- Edge connector는 가능한 read-only로 시작
- OT 시스템 제어 명령은 별도 승인 없이는 제공하지 않음
- 원격 전문가 접속은 session-scoped, time-limited, logged
- 보안 요구사항은 고객의 OT 보안팀과 초기 설계 단계에서 합의
