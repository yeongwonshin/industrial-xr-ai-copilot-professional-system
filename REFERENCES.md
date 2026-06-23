# References and Source Notes

이 디렉토리는 2026-06-24 기준 공개 자료와 산업 시스템 설계 관행을 바탕으로 작성되었습니다.

## XR/Spatial Computing

- Apple Vision Pro for Business: Apple은 Vision Pro를 기업의 training, work, customer engagement, spatial workspace 영역에 제시합니다. https://www.apple.com/business/enterprise/apple-vision-pro/
- Khronos OpenXR: OpenXR은 AR/VR 개발을 위한 개방형 표준 API이며, 확장 구조를 통해 런타임/플랫폼별 기능 차이를 다룹니다. https://www.khronos.org/openxr/
- Unity OpenXR Plugin: Unity의 OpenXR 플러그인은 AR/VR 개발을 위한 OpenXR 기반 워크플로우를 제공합니다. https://docs.unity3d.com/Packages/com.unity.xr.openxr@latest/
- Microsoft Dynamics 365 Guides: step-by-step instructions, images, videos, 3D holograms를 이용한 mixed reality guided work 제품 참고. https://learn.microsoft.com/en-us/dynamics365/mixed-reality/guides/overview

## Industrial AR/XR and AI/RAG

- Bridging Industrial Expertise and XR with LLM-Powered Systems, 2025: RAG enhanced LLM과 XR을 산업 환경 지식전달에 결합하는 연구. https://arxiv.org/html/2504.05527v1
- PTC/Vuforia Expert Capture: 전문가 절차를 캡처해 작업자에게 augmented expert guidance를 제공하는 산업 AR 제품 사례. https://literature.rockwellautomation.com/idc/groups/literature/documents/sp/ptc-sp002_-en-p.pdf
- Vuforia Chalk: AR remote assistance and annotation reference. https://literature.rockwellautomation.com/idc/groups/literature/documents/sp/ptc-sp001_-en-p.pdf

## Safety, Security, AI Governance

- OSHA 1910.147 Lockout/Tagout: hazardous energy control standard. https://www.osha.gov/laws-regs/regulations/standardnumber/1910/1910.147
- ISO/IEC 42001:2023: AI management system standard. https://www.iso.org/standard/42001
- NIST AI Risk Management Framework and Generative AI Profile. https://www.nist.gov/itl/ai-risk-management-framework
- IEC 62443: industrial automation/control systems cybersecurity family. https://iec.ch/
- EU AI Act policy overview: risk-based AI regulatory framework. https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai

## Design Notes

- 제품 문구는 “AI가 안전을 보장한다”가 아니라 “절차 준수와 위험 인지를 보조한다”로 제한해야 합니다.
- 안전 관련 기능은 LLM 단독 결정이 아니라 정책 엔진, evidence, 사람 승인, 감사 로그와 결합해야 합니다.
- XR 하드웨어 시장은 변동성이 있으므로 특정 기기 종속보다 OpenXR/Adapter 전략이 안전합니다.
