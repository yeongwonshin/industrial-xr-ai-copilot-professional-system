# 디바이스 전략

## 기본 원칙

1. 특정 헤드셋 전용 제품으로 시작하지 않는다.
2. Unity/OpenXR 기반 공통 클라이언트를 중심으로 device adapter를 둔다.
3. 장비별 장단점에 따라 고객 세그먼트를 나눈다.
4. 하드웨어 로드맵과 기업용 지원 정책 변화를 제품 리스크로 관리한다.

## 후보 디바이스

| 디바이스군 | 장점 | 주의점 | 적합 use case |
|---|---|---|---|
| Meta Quest 3/3S | 저렴, 패스스루 MR, 개발 접근성 | 기업용 관리 정책 변동 리스크, 장시간 착용성 | 파일럿, 교육, 저위험 공정 |
| Apple Vision Pro | 고품질 디스플레이/공간컴퓨팅, 기업 UX | 가격, 무게, 카메라/시선 데이터 접근 제한 | 고부가 설계/훈련/전문가 작업 |
| HoloLens 2 계열 | 기존 산업 AR 생태계 | 하드웨어 세대 전환 리스크 | 기존 Guides/원격지원 고객 |
| RealWear/스마트글래스 | 산업 착용성, 핸즈프리 | MR 표현력 제한 | 정비/점검/음성 Q&A 중심 |
| 산업용 카메라 + 태블릿 | 저렴하고 견고 | hands-free 약함 | 초기 도입/관리자 검수 |

## Adapter 구조

```text
XRClientCore
  ├── RenderingAdapter
  ├── InputAdapter
  ├── CameraFrameAdapter
  ├── SpatialAnchorAdapter
  ├── VoiceAdapter
  ├── DevicePolicyAdapter
  └── OfflineCacheAdapter
```

## 플랫폼별 제약 관리

- raw camera/gaze/depth 접근 가능 여부를 기능 flag로 관리한다.
- 기능 제공 문구는 기기별로 다르게 표시한다.
- 위험 감지 기능은 카메라 접근 권한과 엣지 추론 가능성에 따라 등급화한다.
- 고객 계약서에 지원 디바이스와 기능 matrix를 명시한다.
