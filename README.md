# AI-Dev Scaffold

Project scaffold implementing **Itohiro's AI-Driven Development Methodology** for Claude Code.

> Human defines vision & governs quality gates; AI executes the full implementation stack with formal verification at every layer.

## What's Inside

This template provides a complete methodology infrastructure for any new project — **stack-agnostic**, no framework dependencies.

### Development Lifecycle

Every feature goes through 7 steps via `/next-phase`:

```
Plan → Spec → Verify → Test Design → TDD → Review → Complete
```

### Directory Structure

```
├── CLAUDE.template.md                 # Project memory template (rename to CLAUDE.md)
├── docs/
│   ├── specs/README.md                # Spec template with invariant IDs
│   ├── verification/README.md         # Formal verification report template
│   ├── test-designs/README.md         # Test design template with traceability
│   └── decisions/README.md            # Architecture Decision Record template
├── .claude/
│   ├── commands/
│   │   ├── next-phase.md              # 7-step lifecycle orchestration
│   │   ├── verify-spec.md             # Spec consistency checker
│   │   ├── test-design.md             # Test design generator from spec
│   │   ├── pr-create.md               # PR creation workflow
│   │   ├── code-review.md             # Pre-commit code review
│   │   ├── solve-issue.md             # GitHub issue resolver
│   │   └── prompt.md                  # Prompt optimizer
│   ├── agents/
│   │   └── context-engineer.md        # Prompt improvement agent
│   ├── rules/
│   │   ├── testing.md                 # Test naming & structure conventions
│   │   ├── git.md                     # Commit & branch conventions
│   │   ├── review-criteria.md         # Code review checklist
│   │   └── spec-verification.md       # Spec verification checklist
│   └── skills/
│       ├── tdd-workflow.md            # TDD methodology (Red/Green/Refactor)
│       ├── spec-driven-dev.md         # How to write specs with invariants
│       └── domain-knowledge.md        # Domain knowledge placeholder
└── setup.sh                           # Quick copy script
```

## Quick Start

### Option 1: GitHub Template (recommended)

1. Click **"Use this template"** → **"Create a new repository"**
2. Clone your new repo
3. Rename `CLAUDE.template.md` to `CLAUDE.md` and fill in the `{{PLACEHOLDERS}}`
4. Fill in `.claude/skills/domain-knowledge.md` with your domain terms
5. Define your invariant ID prefixes in `CLAUDE.md`
6. Write your first PRD in `01_specs/`
7. Run `/next-phase your-first-feature` in Claude Code

### Option 2: Copy into existing project

```bash
./setup.sh /path/to/your-project
```

This copies Layer 1 (universal) files without overwriting existing files.

## Two Layers

### Layer 1: Universal Methodology (this template)

Stack-agnostic files that work with any language/framework:
- Spec-driven development with invariant IDs
- Formal verification checklists
- Test design with full traceability
- TDD workflow (Red/Green/Refactor)
- Code review criteria
- Git conventions
- Architecture Decision Records

### Layer 2: Stack-Specific (you add these)

Customize based on your stack:
- **TDD agents** for your test framework (Vitest, Jest, Pytest, etc.)
- **State management rules** (if React/Vue frontend)
- **Database patterns** (if using a database)
- **Security patterns** (if auth/payments in scope)
- **Deployment docs** (Railway, Vercel, AWS, etc.)

## Key Concepts

### Invariant ID System

Every requirement gets a unique ID that traces through the entire pipeline:

```
Spec:         AUTH-INV-001: "All protected endpoints MUST require valid JWT"
Verification: AUTH-INV-001: PASS
Test Design:  TC-AUTH-001 → AUTH-INV-001
Code:         // Implements AUTH-INV-001
```

### Governance Levels

| Level | When | Extra Steps |
|-------|------|-------------|
| Standard | Normal features, bug fixes | TDD + test design |
| Security-Critical | Auth, PII, payments | + Threat analysis + security review |

## Origin

Based on [Itohiro's AI-Driven Development methodology](https://zenn.dev/loglass/articles/2790c0ef0e040b) — building production systems where the human writes zero code, focusing entirely on vision, specs, and quality gates.

## License

MIT
