# Edge/Cloud 아키텍처

## Edge Gateway 기능

- XR session broker
- WebRTC relay/SFU option
- frame sampling and redaction
- local object/OCR inference
- local vector cache
- OT connector proxy
- offline queue
- site policy cache
- device health monitor

## Cloud Control Plane 기능

- tenant/site/user/device management
- document ingestion and approval
- production vector index build
- model registry and deployment
- KPI dashboards
- audit and evidence retention policy
- billing and license management

## 오프라인 모드

| 기능 | Cloud 연결 | Edge만 | 완전 오프라인 |
|---|---|---|---|
| 일반 문서 Q&A | 가능 | 캐시 범위 가능 | 제한 |
| 안전 경고 | 가능 | 가능 | 기기 로컬 룰만 |
| 단계 체크리스트 | 가능 | 가능 | 최근 승인 절차만 |
| 전문가 연결 | 가능 | 현장 LAN만 | 불가 |
| 작업 완료 sync | 즉시 | queue | 나중에 sync |

## 데이터 동기화

```text
Cloud -> Edge:
  approved SOP bundles
  safety policies
  model artifacts
  device configs
  user/role cache

Edge -> Cloud:
  audit events
  evidence metadata
  KPI aggregates
  model drift samples
  incident reports
```

## 권장 기술

- API: FastAPI/Go/Java Spring 등
- Streaming: WebRTC, gRPC streaming, MQTT for telemetry
- Queue: Kafka/NATS/Redis Streams
- DB: PostgreSQL, object storage, vector DB
- Edge: K3s or Docker Compose for pilot
- Observability: OpenTelemetry, Prometheus, Grafana
