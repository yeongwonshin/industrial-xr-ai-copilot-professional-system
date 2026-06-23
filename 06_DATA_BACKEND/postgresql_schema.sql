-- FieldSense XR AI Work Copilot - PostgreSQL Schema Draft

CREATE TABLE tenants (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    plan TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sites (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    name TEXT NOT NULL,
    timezone TEXT NOT NULL DEFAULT 'Asia/Seoul',
    address TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE users (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    email TEXT NOT NULL,
    display_name TEXT NOT NULL,
    role TEXT NOT NULL CHECK (role IN ('operator','technician','supervisor','admin','expert','auditor')),
    certification_tags TEXT[] NOT NULL DEFAULT '{}',
    active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (tenant_id, email)
);

CREATE TABLE assets (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    site_id UUID NOT NULL REFERENCES sites(id),
    parent_asset_id UUID REFERENCES assets(id),
    asset_code TEXT NOT NULL,
    asset_name TEXT NOT NULL,
    asset_model TEXT,
    asset_class TEXT,
    metadata JSONB NOT NULL DEFAULT '{}',
    UNIQUE(site_id, asset_code)
);

CREATE TABLE documents (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    title TEXT NOT NULL,
    doc_type TEXT NOT NULL CHECK (doc_type IN ('manual','sop','jsa','bom','error_code','training','quality_standard')),
    version TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('draft','review','approved','retired')),
    storage_uri TEXT NOT NULL,
    approved_by UUID REFERENCES users(id),
    approved_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE procedures (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    document_id UUID REFERENCES documents(id),
    procedure_code TEXT NOT NULL,
    title TEXT NOT NULL,
    version TEXT NOT NULL,
    asset_model TEXT,
    risk_level TEXT NOT NULL CHECK (risk_level IN ('LOW','MEDIUM','HIGH','CRITICAL')),
    status TEXT NOT NULL CHECK (status IN ('draft','approved','retired')),
    UNIQUE(tenant_id, procedure_code, version)
);

CREATE TABLE procedure_steps (
    id UUID PRIMARY KEY,
    procedure_id UUID NOT NULL REFERENCES procedures(id),
    step_order INT NOT NULL,
    step_code TEXT NOT NULL,
    title TEXT NOT NULL,
    instruction TEXT NOT NULL,
    preconditions JSONB NOT NULL DEFAULT '[]',
    required_ppe TEXT[] NOT NULL DEFAULT '{}',
    required_evidence TEXT[] NOT NULL DEFAULT '{}',
    risk_level TEXT NOT NULL CHECK (risk_level IN ('LOW','MEDIUM','HIGH','CRITICAL')),
    next_step_rules JSONB NOT NULL DEFAULT '{}',
    UNIQUE(procedure_id, step_code)
);

CREATE TABLE work_orders (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    site_id UUID NOT NULL REFERENCES sites(id),
    asset_id UUID REFERENCES assets(id),
    external_ref TEXT,
    title TEXT NOT NULL,
    priority TEXT NOT NULL DEFAULT 'normal',
    status TEXT NOT NULL DEFAULT 'open',
    due_at TIMESTAMPTZ,
    metadata JSONB NOT NULL DEFAULT '{}',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE work_sessions (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    site_id UUID NOT NULL REFERENCES sites(id),
    work_order_id UUID REFERENCES work_orders(id),
    procedure_id UUID REFERENCES procedures(id),
    worker_id UUID REFERENCES users(id),
    device_id TEXT,
    status TEXT NOT NULL,
    started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    ended_at TIMESTAMPTZ,
    summary JSONB NOT NULL DEFAULT '{}'
);

CREATE TABLE step_executions (
    id UUID PRIMARY KEY,
    work_session_id UUID NOT NULL REFERENCES work_sessions(id),
    procedure_step_id UUID NOT NULL REFERENCES procedure_steps(id),
    status TEXT NOT NULL,
    started_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ,
    result JSONB NOT NULL DEFAULT '{}'
);

CREATE TABLE evidence (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    work_session_id UUID NOT NULL REFERENCES work_sessions(id),
    step_execution_id UUID REFERENCES step_executions(id),
    evidence_type TEXT NOT NULL,
    storage_uri TEXT,
    redacted BOOLEAN NOT NULL DEFAULT true,
    model_outputs JSONB NOT NULL DEFAULT '[]',
    human_confirmation JSONB NOT NULL DEFAULT '{}',
    retention_until TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE safety_policies (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    policy_code TEXT NOT NULL,
    version TEXT NOT NULL,
    title TEXT NOT NULL,
    rule_json JSONB NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('draft','approved','retired')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(tenant_id, policy_code, version)
);

CREATE TABLE audit_events (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL REFERENCES tenants(id),
    site_id UUID REFERENCES sites(id),
    event_type TEXT NOT NULL,
    actor_user_id UUID REFERENCES users(id),
    work_session_id UUID REFERENCES work_sessions(id),
    payload JSONB NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_assets_site ON assets(site_id);
CREATE INDEX idx_documents_tenant_status ON documents(tenant_id, status);
CREATE INDEX idx_work_sessions_status ON work_sessions(tenant_id, status);
CREATE INDEX idx_audit_events_type_time ON audit_events(event_type, created_at DESC);
CREATE INDEX idx_evidence_session ON evidence(work_session_id);
