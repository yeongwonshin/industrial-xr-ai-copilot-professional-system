# 샘플 Near-Miss 리포트

## 이벤트
- 이벤트 타입: safety.rule.blocked
- 일시: 2026-06-24 10:42 KST
- 현장: Plant 01
- 장비: Compressor-A7-03
- 작업: 필터 교체
- 단계: 밸브 V-302 CLOSE 확인 후 필터 하우징 분해 전

## 발생 내용
작업자가 압력계 G-12가 0 bar로 확인되기 전에 필터 하우징 분해 단계로 진행하려고 했습니다. 시스템은 OCR 결과 0.1 bar로 읽었고, SOP 기준 `pressure_bar <= 0.05` 조건을 만족하지 않아 작업을 차단했습니다.

## 시스템 조치
- 작업 단계 전환 BLOCK
- 작업자에게 압력 배출 절차 안내
- supervisor 승인 요청
- evidence 이미지 저장

## 후속 조치
- 압력 배출 후 재촬영
- supervisor 확인
- SOP 교육 자료에 해당 사례 추가
- OCR 오탐 여부 검토
