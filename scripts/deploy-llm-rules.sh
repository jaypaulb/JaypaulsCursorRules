#!/bin/bash
set -e

echo "🔧 Safe Deployment of llm-dev-rules"
echo "===================================="

REPO_DIR="/home/jaypaulb/Documents/gh/llm-dev-rules"
CLAUDE_HOME="$HOME/.claude"
AGENT_OS_HOME="$HOME/agent-os"

# 1. Backup existing configurations
echo ""
echo "📦 Step 1: Creating backups..."
BACKUP_DATE=$(date +%Y%m%d_%H%M%S)

# Backup Claude Code config
if [ -d "$CLAUDE_HOME/agents" ] || [ -d "$CLAUDE_HOME/commands" ] || [ -d "$CLAUDE_HOME/skills" ]; then
    echo "  - Backing up existing Claude Code config to $CLAUDE_HOME/backup_$BACKUP_DATE/"
    mkdir -p "$CLAUDE_HOME/backup_$BACKUP_DATE"
    [ -d "$CLAUDE_HOME/agents" ] && cp -r "$CLAUDE_HOME/agents" "$CLAUDE_HOME/backup_$BACKUP_DATE/" 2>/dev/null || true
    [ -d "$CLAUDE_HOME/commands" ] && cp -r "$CLAUDE_HOME/commands" "$CLAUDE_HOME/backup_$BACKUP_DATE/" 2>/dev/null || true
    [ -d "$CLAUDE_HOME/skills" ] && cp -r "$CLAUDE_HOME/skills" "$CLAUDE_HOME/backup_$BACKUP_DATE/" 2>/dev/null || true
fi

# Backup Agent OS profiles
if [ -d "$AGENT_OS_HOME/profiles/default" ]; then
    echo "  - Backing up existing Agent OS profile to $AGENT_OS_HOME/profiles/default.backup_$BACKUP_DATE/"
    cp -r "$AGENT_OS_HOME/profiles/default" "$AGENT_OS_HOME/profiles/default.backup_$BACKUP_DATE"
fi

# 2. Deploy Claude Code configuration (symlinks)
echo ""
echo "🔗 Step 2: Deploying Claude Code configuration (symlinks)..."

# Remove old symlinks/dirs if they exist
[ -L "$CLAUDE_HOME/agents" ] && rm "$CLAUDE_HOME/agents"
[ -L "$CLAUDE_HOME/commands" ] && rm "$CLAUDE_HOME/commands"
[ -L "$CLAUDE_HOME/skills" ] && rm "$CLAUDE_HOME/skills"
[ -d "$CLAUDE_HOME/agents" ] && rm -rf "$CLAUDE_HOME/agents"
[ -d "$CLAUDE_HOME/commands" ] && rm -rf "$CLAUDE_HOME/commands"
[ -d "$CLAUDE_HOME/skills" ] && rm -rf "$CLAUDE_HOME/skills"

# Create symlinks
ln -s "$REPO_DIR/.claude/agents" "$CLAUDE_HOME/agents"
ln -s "$REPO_DIR/.claude/commands" "$CLAUDE_HOME/commands"
ln -s "$REPO_DIR/.claude/skills" "$CLAUDE_HOME/skills"

echo "  ✅ Symlinked agents, commands, and skills"

# 3. Deploy Agent OS profile (symlink)
echo ""
echo "🔗 Step 3: Deploying Agent OS profile (symlink)..."

# Remove old symlink/dir if it exists
[ -L "$AGENT_OS_HOME/profiles/llm-dev-rules" ] && rm "$AGENT_OS_HOME/profiles/llm-dev-rules"
[ -d "$AGENT_OS_HOME/profiles/llm-dev-rules" ] && rm -rf "$AGENT_OS_HOME/profiles/llm-dev-rules"

# Create symlink
ln -s "$REPO_DIR/agent-os/profiles/default" "$AGENT_OS_HOME/profiles/llm-dev-rules"

echo "  ✅ Symlinked Agent OS profile as 'llm-dev-rules'"

# 4. Summary
echo ""
echo "✅ Deployment Complete!"
echo "====================="
echo ""
echo "Claude Code:"
echo "  - Agents:   $CLAUDE_HOME/agents -> $REPO_DIR/.claude/agents"
echo "  - Commands: $CLAUDE_HOME/commands -> $REPO_DIR/.claude/commands"
echo "  - Skills:   $CLAUDE_HOME/skills -> $REPO_DIR/.claude/skills"
echo ""
echo "Agent OS:"
echo "  - Profile:  $AGENT_OS_HOME/profiles/llm-dev-rules -> $REPO_DIR/agent-os/profiles/default"
echo ""
echo "Backups:"
echo "  - Claude:   $CLAUDE_HOME/backup_$BACKUP_DATE/"
echo "  - Agent OS: $AGENT_OS_HOME/profiles/default.backup_$BACKUP_DATE/"
echo ""
echo "To use the new Agent OS profile, edit $AGENT_OS_HOME/config.yml and set:"
echo "  profile: llm-dev-rules"
echo ""
