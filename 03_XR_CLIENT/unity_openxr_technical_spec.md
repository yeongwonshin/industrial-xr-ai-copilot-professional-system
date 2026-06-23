# Unity/OpenXR 기술 명세

## 개발 스택

- Unity LTS
- OpenXR Plugin
- XR Interaction Toolkit
- MRTK 또는 자체 lightweight UI layer
- WebRTC/gRPC/WebSocket 통신
- on-device cache: SQLite/Realm/Encrypted file store
- telemetry: OpenTelemetry compatible events

## XR 앱 씬 구성

```text
Scenes/
  Bootstrap
  LoginAndDeviceCheck
  WorkOrderSelection
  AssetRecognition
  ProcedureExecution
  ExpertAssist
  OfflineManualMode
  Diagnostics
```

## 핵심 Unity 컴포넌트

| 컴포넌트 | 책임 |
|---|---|
| WorkStepPresenter | 단계 카드와 공간 앵커 표시 |
| VoiceCommandRouter | 음성 명령 intent routing |
| EvidenceCaptureManager | 이미지/메타데이터 캡처 |
| SafetyAlertOverlay | 주의/중지/승인 UI |
| AssetAnchorManager | 장비별 좌표계/앵커 관리 |
| DeviceCapabilityService | 카메라/깊이/시선/마이크 기능 감지 |
| OfflineProcedureCache | 승인된 SOP 캐시 |
| TelemetryPublisher | 이벤트/성능 로그 발행 |

## 성능 목표

| 항목 | 목표 |
|---|---|
| UI response latency | 100ms 이하 체감 |
| 위험 경고 end-to-end | 500ms~1.5s |
| 음성 질의 응답 | 2~5s, 위험 관련은 빠른 중간 경고 우선 |
| 배터리 | 90분 이상 작업 세션 또는 hot-swap 전략 |
| FPS | 디바이스 기준 안정 FPS 유지 |

## 기능 flag 예시

```json
{
  "device_family": "quest_3",
  "supports_passthrough_frame_api": true,
  "supports_spatial_anchor": true,
  "supports_hand_tracking": true,
  "supports_raw_gaze": false,
  "supports_offline_rag_cache": true,
  "max_recommended_session_minutes": 45
}
```
