# 데이터 어노테이션 가이드라인

## 목적
현장 시야 이미지/영상에서 객체, PPE, 위험 상태, 작업 동작을 일관되게 라벨링합니다.

## 라벨 카테고리

### Equipment Object
- valve_open
- valve_closed
- breaker_on
- breaker_off
- pressure_gauge
- lockout_tag
- filter_housing
- connector
- tool_wrench

### PPE
- helmet
- safety_glasses
- face_shield
- gloves
- mask
- safety_shoes
- protective_suit

### Hazard
- hand_in_danger_zone
- residual_pressure
- exposed_wire
- leak_visible
- smoke_visible
- hot_surface_zone

### Action
- applying_lockout
- closing_valve
- reading_gauge
- removing_cover
- inserting_part
- tightening_bolt

## 라벨링 규칙

- 가려진 객체는 `occluded=true`로 표시한다.
- 확실하지 않은 경우 guess하지 말고 `uncertain=true`를 표시한다.
- PPE는 신체 일부가 명확히 보일 때만 positive로 라벨링한다.
- 위험 영역은 장비 기준 좌표와 이미지 bbox를 함께 기록한다.
- 작업자 얼굴은 annotation export 전에 masking한다.

## 품질 관리

- 2인 라벨 검수
- disagreement review
- class imbalance monitoring
- site별/조명별 split 유지
- safety-critical class는 recall 중심 평가
