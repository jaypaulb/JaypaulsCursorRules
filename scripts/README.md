# Deployment Scripts

This folder contains scripts for deploying and managing the llm-dev-rules configuration.

## Scripts

### deploy-llm-rules.sh

Deploys llm-dev-rules to your local Claude Code and Agent OS installations.

**What it does:**
- Creates timestamped backups of existing configurations
- Symlinks Claude Code agents, commands, and skills to `~/.claude/`
- Symlinks Agent OS profile to `~/agent-os/profiles/llm-dev-rules`
- Preserves all existing configurations

**Usage:**
```bash
./scripts/deploy-llm-rules.sh
```

**Benefits:**
- ✅ Automatic backups before deployment
- ✅ Symlinks mean repo changes instantly reflect in Claude Code
- ✅ Safe - no data loss
- ✅ Easy to rollback

### rollback-llm-rules.sh

Reverts deployment and restores previous configuration.

**What it does:**
- Removes llm-dev-rules symlinks
- Restores configurations from most recent backup
- Preserves backup for future reference

**Usage:**
```bash
./scripts/rollback-llm-rules.sh
```

**When to use:**
- Something isn't working after deployment
- Want to test different configurations
- Need to revert to previous state

## Deployment Workflow

### Initial Deployment

```bash
# 1. Deploy
./scripts/deploy-llm-rules.sh

# 2. Verify symlinks created
ls -l ~/.claude/agents ~/.claude/commands ~/.claude/skills
ls -l ~/agent-os/profiles/llm-dev-rules

# 3. (Optional) Activate Agent OS profile
# Edit ~/agent-os/config.yml and set: profile: llm-dev-rules
```

### If Problems Occur

```bash
# Instantly rollback
./scripts/rollback-llm-rules.sh
```

### Updating Configuration

Since deployment uses symlinks:
```bash
# Make changes in this repo
git pull  # or edit files directly

# Changes are instantly active in Claude Code
# No need to re-deploy!
```

## File Locations

**Claude Code:**
- Agents: `~/.claude/agents/` → symlinks to `.claude/agents/`
- Commands: `~/.claude/commands/` → symlinks to `.claude/commands/`
- Skills: `~/.claude/skills/` → symlinks to `.claude/skills/`

**Agent OS:**
- Profile: `~/agent-os/profiles/llm-dev-rules/` → symlinks to `agent-os/profiles/default/`

**Backups:**
- Claude Code: `~/.claude/backup_YYYYMMDD_HHMMSS/`
- Agent OS: `~/agent-os/profiles/default.backup_YYYYMMDD_HHMMSS/`

## Safety Features

1. **Automatic Backups**: Every deployment creates timestamped backups
2. **Symlinks**: Changes in repo instantly reflect without re-deployment
3. **One-Command Rollback**: Instant reversion if needed
4. **Preserves Originals**: Never deletes your original configurations
5. **Idempotent**: Can run deployment multiple times safely

## Requirements

- Bash shell
- Claude Code installed (`~/.claude/` exists)
- Agent OS installed (`~/agent-os/` exists)

## Troubleshooting

**Problem: "No such file or directory"**
- Ensure Claude Code is installed: `ls ~/.claude`
- Ensure Agent OS is installed: `ls ~/agent-os`

**Problem: "Permission denied"**
- Make scripts executable: `chmod +x scripts/*.sh`

**Problem: "Backup not found" when rolling back**
- No previous deployment to rollback to
- Deploy first, then rollback will work

## Version History

- **1.0.0** (2025-11-20): Initial deployment scripts with backup/rollback support
