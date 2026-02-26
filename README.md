# AI-Dev Scaffold

Project scaffold implementing the **AI-Driven Development Methodology** for Claude Code.

> Human defines vision & governs quality gates; AI executes the full implementation stack with spec verification at every layer.

## Origin & Methodology

This scaffold distills the development methodology from two reference projects:

1. **LoglassCube** (Rust OLAP engine) - AI-agent teams with progressive governance, formal verification, benchmark-driven development
2. **Loglass Claw** (Tauri desktop app) - 7-layer quality gates, complete traceability with invariant IDs, STRIDE threat modeling

Combined with Anthropic's research on [effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents): session management, progress tracking, single-feature focus.

The core flow (from Itohiro's talk):

```
Vision -> Deep Research -> Roadmap -> Unambiguous Specs -> Test Design -> TDD Implementation -> Verified & Documented
```

## What's Inside

**Stack-agnostic** methodology infrastructure -- no framework dependencies.

### Directory Structure

```
.
├── CLAUDE.template.md                    # Project memory template (rename to CLAUDE.md)
├── roadmap.template.md                   # Roadmap template (rename to roadmap.md)
├── .github/
│   └── pull_request_template.md          # PR template with traceability
├── docs/
│   ├── plans/README.md                   # Implementation plan template
│   ├── specs/README.md                   # Spec template with invariant IDs
│   ├── verification/README.md            # Verification report template
│   ├── test-designs/README.md            # Test design template with traceability
│   ├── decisions/README.md               # Architecture Decision Record template
│   └── research/README.md               # Deep research template (prompt/result pairs)
├── .claude/
│   ├── settings.json                     # Hook configuration + permission deny list
│   ├── commands/
│   │   ├── next-phase.md                 # 6-step lifecycle orchestrator (main command)
│   │   ├── verify-spec.md               # Spec consistency checker
│   │   ├── test-design.md               # Test design generator from spec
│   │   ├── research.md                  # Deep research protocol
│   │   ├── code-review.md              # Pre-commit code review
│   │   ├── pr-create.md                # PR creation workflow
│   │   ├── solve-issue.md              # GitHub issue resolver
│   │   └── prompt.md                   # Prompt optimizer
│   ├── agents/
│   │   ├── spec-writer.md              # Specification detailing (Stage 2a)
│   │   ├── formal-verifier.md          # Spec verification (Stage 2b)
│   │   ├── test-architect.md           # Test design derivation (Stage 2c)
│   │   ├── tdd-practitioner.md         # TDD implementation (Stage 2d)
│   │   ├── review-lead.md             # Code quality review
│   │   ├── security-reviewer.md       # Security-focused review
│   │   └── context-engineer.md        # Prompt improvement agent
│   ├── hooks/
│   │   ├── block-dangerous.sh         # PreToolUse: blocks destructive commands
│   │   └── post-edit-security-check.sh # PostToolUse: security pattern detection
│   ├── rules/
│   │   ├── review-criteria.md         # Code review checklist
│   │   ├── spec-verification.md       # Spec verification checklist
│   │   ├── testing.md                 # Test naming & structure conventions
│   │   └── git.md                     # Commit & branch conventions
│   └── skills/
│       ├── tdd-workflow.md            # TDD methodology (Red/Green/Refactor)
│       ├── spec-driven-dev.md         # Spec-driven development with invariants
│       ├── session-management.md      # Multi-session progress management
│       └── domain-knowledge.md        # Domain knowledge placeholder
└── setup.sh                           # Copy scaffold into existing project
```

### Development Lifecycle

Every feature goes through 6 steps via `/next-phase`:

```
Step 1: Plan          -> Roadmap check + design + user approval
Step 2: Implement     -> 4-stage pipeline (Spec -> Verify -> Test Design -> TDD)
Step 3: Build/Verify  -> Full build + tests + security audit
Step 4: Commit/Review -> Commit + independent review team
Step 5: Review Fix    -> Address findings + re-test
Step 6: Complete      -> Roadmap update + docs
```

### The 2a-2b Iteration Loop (key innovation)

Specs are NOT one-shot. Before any code is written:

```
Stage 2a: Write spec (spec-writer)
    │
    v
Stage 2b: Verify spec (formal-verifier)
    │
    ├── PASS -> Proceed to test design
    │
    └── FAIL -> Return to 2a with specific issues
         (iterate until zero ambiguity)
```

## Quick Start

### Option 1: GitHub Template (recommended)

1. Click **"Use this template"** -> **"Create a new repository"**
2. Clone your new repo
3. Rename `CLAUDE.template.md` to `CLAUDE.md` and fill in the `{{PLACEHOLDERS}}`
4. Rename `roadmap.template.md` to `roadmap.md` and define your phases
5. Fill in `.claude/skills/domain-knowledge.md` with your domain terms
6. Define your invariant ID prefixes in `CLAUDE.md`
7. Run `/next-phase your-first-feature` in Claude Code

### Option 2: Copy into existing project

```bash
./setup.sh /path/to/your-project
```

This copies all methodology files without overwriting existing files.

## Key Concepts

### Invariant ID System

Every requirement gets a unique ID that traces through the entire pipeline:

```
Spec:         AUTH-INV-001: "All protected endpoints MUST require valid JWT"
Verification: AUTH-INV-001: PASS (no contradictions with existing 12 invariants)
Test Design:  TC-AUTH-001 -> AUTH-INV-001
Code:         // Implements AUTH-INV-001
Commit:       Implements invariants: AUTH-INV-001, AUTH-INV-002
```

### Governance Levels

| Level | When | Extra Steps |
|-------|------|-------------|
| Standard | Normal features, bug fixes | TDD + test design |
| Security-Critical | Auth, PII, payments | + STRIDE threat analysis + security review + Life to Date verification |

### Multi-Agent Team

The `/next-phase` command orchestrates specialized agents:

| Agent | Role | Stage |
|-------|------|-------|
| spec-writer | Detailed spec with invariants | 2a |
| formal-verifier | Consistency verification | 2b |
| test-architect | Test case derivation | 2c |
| tdd-practitioner | Red-Green-Refactor implementation | 2d |
| review-lead | Code quality review | 4 |
| security-reviewer | Security review (Security-Critical) | 4 |

### Session Management

For multi-session projects (based on Anthropic's agent harness research):
- Session startup protocol: orient -> check progress -> review recent work -> verify state -> select work
- Single-feature focus per session
- Dual progress tracking: git commits + roadmap updates
- Never leave broken state between sessions

## License

MIT
