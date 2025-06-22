---
tags:
  - type=decision-record
---

# Technology Selection

## Context

The Personal Platform covers multiple user interfaces, services, autonomous systems, provisioning, governance, and storage. This requires a diverse technology stack. Here's the initial selection with tradeoff notes. This is an outline and may change before deployment.

## User Interfaces

Functional user interfaces across:

- Web UIs
- Native/WebView UIs
- Wearable UIs
- CLIs

**Selected**:

- React, as the baseline
- NextJS, for web targets due to broad rendering strategy support
- Tauri, for cross-platform native development
- Kotlin, for WearOS targets (Rust frameworks may support this in the future)
- Storybook, for design system implementation
- Penpot, as graphical design software for design systems

## Backend

Targeting WASM & WASI, with containers as an interim widely-supported platform. Solutions needed for:

- System resources definition and rules
- Service definitions
- Actor processes for autonomous units
- Hardware drivers for integration with higher-level systems
- Cybernetic controllers for resource administration

**Selected**:

- Rust, due to broad applicability
- Haskell, for abstraction power in DSL development (limited to targeted use cases)

## Data Management

Focusing on data flow and events as primary data sources, immutable and addressable. Intermediate representation through indexes and caches in specialized formats. Primary data shapes:

- Event Modelled (Event Sourced)
- Relational Graphs
- Semantic Spatial Information
- Intermediate representation for indexing and caching

**Selected**:

- SurrealDB, a multi-modal distributed database
- SQLite, for small, tightly-bounded use cases
- SeaweedFS, LAS and CAS cloud-native blob storage

## Interface/Contract Definition

Cross-language interface and type definitions require lingua franca languages with broad support.

**Selected**:

- OpenAPI, for HTTP request/reply patterns
- AsyncAPI, for other HTTP patterns
- Protobuf, for binary inter-service communication
- JSON & YAML, for configurations (JSONSchema for validation)

## Artifact Composition

Functional target with preference for declarative and deterministic builds.

**Selected**:

- Nix with flakes, unmatched ecosystem for deterministic builds and functional composition. Covers distributables, deployables, and development environments

## Infrastructure

Declarative configuration for both self-hosted infrastructure and external services.

**Selected**:

- OpenTofu (Terraform fork), for external services
- Kubernetes (Talos + FluxCD), for subsystems requiring cybernetic controls

## Documentation

Easy to use and maintain while being flexible and interpretable by multiple agents.

**Selected**:

- Markdown with frontmatter metadata, simple and easy to use
- HTML, for content requiring more semantic structure

## Policies

Policies are their own beast - while strictly assertions, they're likely managed from a single perspective.

**Selected**:

- Rego and Open Policy Agent, broad support for policies and most enforcement points

## Identities

Identities are common requirements for any system that isn't fully open.

**Selected**:

- JSON Web Tokens, for communicating identities and claims in standardized format
- OIDC, for outsourcing identity governance to external services
- X509, for heavy chain-of-trust scenarios
- SPIFFE, for defining system identities

## Telemetry

Information needs to be observable for external systems.

**Selected**:

- OpenTelemetry, emerging standard for logs, metrics, and traces

## Secrets

Short-lived secrets require rotation and version control.

**Selected**:

- SOPS, for managing sealed secrets embedded in the repository
- Age, as the cryptographic backend providing simplified interface compared to GPG
- 1Password, as external vault service for non-embedded secrets
