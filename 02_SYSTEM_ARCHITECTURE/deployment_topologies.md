# 배포 토폴로지

## 1. 빠른 파일럿형: Cloud SaaS

- XR Client → Cloud API 직접 연결
- PDF/SOP 업로드 후 RAG 인덱스 생성
- 기본 관리자 콘솔 제공
- 추천: 교육/훈련, 저위험 조립, 데모센터

## 2. 표준 산업형: Edge + Cloud

- XR Client → Site Edge Gateway → Cloud
- CV/위험 경고는 엣지에서 처리
- 문서와 정책은 클라우드에서 버전관리
- 추천: 제조 공장, 병원 의공팀, 정비센터

## 3. 고보안형: On-Prem/Private Cloud

- 모든 데이터와 모델을 고객망 내부 운영
- 업데이트는 signed artifact로 반입
- SIEM, IAM, MDM, CMMS와 내부망 연동
- 추천: 항공, 국방, 반도체 핵심공정, 화학 플랜트

## 엣지 하드웨어 기준

| 규모 | 예시 구성 | 역할 |
|---|---|---|
| Small | 산업용 PC + RTX급 GPU 1대 | 5~20대 헤드셋, 기본 CV/RAG 캐시 |
| Medium | GPU 서버 1~2대 + NAS | 20~80대, 다중 모델, 영상 redaction |
| Large | Kubernetes edge cluster | 다수 라인/건물, 고가용성, 모델 A/B |

## 장애 대응

- Cloud 연결 끊김: 최근 승인된 SOP, 체크리스트, 정책 캐시로 제한 운영
- Edge 장애: XR Client는 read-only manual mode로 전환
- 모델 추론 실패: 수동 체크리스트와 전문가 연결로 fail-safe
- 문서 버전 불일치: 작업 시작 차단 또는 supervisor 승인 필요
