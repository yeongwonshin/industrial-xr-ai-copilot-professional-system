# 멀티모달 인식 명세

## 인식 대상

### 객체/부품
- 밸브, 스위치, 게이지, 커넥터, 필터, 배관, 전원 차단기
- 부품 방향, 삽입 상태, 조립 누락
- QR/바코드/시리얼/라벨/OCR

### PPE
- 헬멧, 보안경, 장갑, 마스크, 안면보호구, 안전화, 방진복
- PPE 착용 여부는 얼굴/신체 개인정보 처리에 민감하므로 최소 캡처/즉시 폐기 정책 필요

### 동작/상태
- 손이 위험 영역에 접근
- 잠금장치 체결/해제
- 부품 삽입/탈거
- 계기값 확인
- 도구 사용 여부

### 환경
- 누출, 연기, 불꽃, 액체 고임, 금지 구역 접근
- 표지판/경고 라벨
- 온도/압력/전압 센서 연동값

## 모델 구성

| 모델 | 역할 | 배포 위치 |
|---|---|---|
| object detector | 장비/부품/PPE 인식 | edge/on-device |
| OCR/VLM | 에러코드/라벨/계기판 읽기 | edge/cloud |
| action recognition | 손동작/작업 상태 추론 | edge |
| segmentation | 위험 영역/부품 영역 | edge |
| multimodal LLM | 질의 이해/설명/예외 처리 | cloud/private/edge |
| reranker | 검색 결과 정렬 | edge/cloud |

## 신뢰도 정책

```text
if risk_level == HIGH and visual_confidence < 0.95:
    decision = REQUIRE_HUMAN_CONFIRMATION
elif risk_level == MEDIUM and visual_confidence < 0.85:
    decision = ASK_FOR_RECAPTURE
else:
    decision = ALLOW_WITH_LOG
```

## 데이터셋 구축

- 고객 현장 촬영 데이터는 opt-in과 masking 후 사용
- 초기에는 synthetic/CAD render + 공개 데이터 + 고객 샘플 이미지로 시작
- 도메인별 active learning: 오탐/미탐 사례를 annotation queue로 보냄
- annotation taxonomy는 `13_GOVERNANCE/data_annotation_guideline.md` 참고

## 평가 지표

| 영역 | 지표 |
|---|---|
| 객체 인식 | mAP, precision/recall, false negative rate |
| OCR | exact match, character error rate |
| PPE | class별 recall, 현장 조명/각도 robustness |
| 동작 인식 | temporal IoU, sequence accuracy |
| 경고 | warning precision/recall, time-to-alert |
| 현장 UX | nuisance alert rate, manual override rate |
