# 파일럿 성공 지표

## 파일럿 설계

- 기간: 8~12주
- 범위: 1개 현장, 1~3개 장비군, 2~5개 작업 절차
- 사용자: 작업자 10~30명, supervisor 2~5명
- 비교: 기존 방식 baseline 2~4주 수집 후 XR 사용

## KPI

| 영역 | 지표 | 목표 예시 |
|---|---|---|
| 생산성 | 평균 작업 완료 시간 | 10~25% 감소 |
| 교육 | 신규 작업자 독립 수행 시간 | 30% 감소 |
| 품질 | 재작업/누락 체크 | 10~30% 감소 |
| 안전 | near-miss/순서 위반 감지 | 감지율 증가, 위험 재발 감소 |
| 지원 | 전문가 호출 전 자체 해결률 | 20% 증가 |
| 사용성 | 주간 활성 사용자 | 대상자의 70%+ |
| 신뢰 | AI 답변 근거 만족도 | 4/5 이상 |

## 측정 방법

- work session telemetry
- supervisor observation
- pre/post 작업자 설문
- quality defect record
- safety near-miss log
- CMMS/MES data 비교
- expert escalation log

## 파일럿 종료 의사결정

| 결과 | 판단 |
|---|---|
| KPI 달성 + 안전 이슈 없음 | 유료 확장 제안 |
| 생산성은 좋으나 오탐 많음 | shadow mode 연장/모델 개선 |
| 사용성 낮음 | UX/디바이스 재선정 |
| 보안/데이터 이슈 | 배포 토폴로지 전환 |
| 위험 관련 false negative | 출시 차단, safety case 재작성 |
