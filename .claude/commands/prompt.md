---
description: Prompt improvement command - uses context-engineer sub-agent to optimize prompts
argument-hint: '[prompt to improve]'
---

# Prompt Improvement Command

**Usage:** `/prompt [prompt to improve]`

**Purpose:** Analyze user prompts and optimize them for efficient work with Claude Code

## Execution Flow

### 1. Confirm Input

```
Executing prompt improvement

Target: "$ARGUMENTS"

Calling context-engineer sub-agent...
```

### 2. Call Sub-Agent

**Always use Task tool to call `context-engineer`:**

```
Please improve the following prompt for efficient work with Claude Code.

<original_prompt>
$ARGUMENTS
</original_prompt>

<improvement_criteria>
1. **Clarification** (critical)
   - Make vague expressions specific
   - Supplement missing information with questions
   - State quantitative criteria explicitly

2. **Work Scope** (critical)
   - Specify target files/modules
   - Define implementation/test scope
   - Consider impact scope

3. **Technical Specifications** (high)
   - Specify tech stack constraints
   - Follow coding conventions
   - Clarify dependencies

4. **Deliverables** (high)
   - Define creation/modification content
   - Describe expected behavior
   - Define completion criteria

5. **Context** (medium)
   - Reference related patterns
   - Mention implementation patterns
   - Reference domain knowledge
</improvement_criteria>

<output_format>
Required sections:
1. **Questions for Clarification** (if there are unclear points)
2. **Improved Prompt** (in code block, XML structure recommended)
3. **Improvement Points** (3-5 items)
</output_format>
```

### 3. Quality Check

- Is it specific and executable?
- Are questions for unclear points appropriate?
- Is project context considered?
- Does it follow Claude prompting best practices? (clear instructions, examples, XML tags, role definition)

### 4. Present Results

Output the improved prompt and improvement points to the user.

## Start Command Execution

Following the flow above, start prompt improvement for: `$ARGUMENTS`
