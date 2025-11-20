#!/bin/bash
set -e

echo "🔙 Rollback llm-dev-rules Deployment"
echo "===================================="

CLAUDE_HOME="$HOME/.claude"
AGENT_OS_HOME="$HOME/agent-os"

# Find the most recent backup
LATEST_BACKUP=$(ls -dt "$CLAUDE_HOME"/backup_* 2>/dev/null | head -1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No backups found in $CLAUDE_HOME"
    echo "Cannot rollback - no previous configuration to restore"
    exit 1
fi

BACKUP_DATE=$(basename "$LATEST_BACKUP" | sed 's/backup_//')

echo ""
echo "📦 Found backup from: $BACKUP_DATE"
echo ""
echo "Step 1: Removing current symlinks..."

# Remove Claude Code symlinks
[ -L "$CLAUDE_HOME/agents" ] && rm "$CLAUDE_HOME/agents" && echo "  ✅ Removed agents symlink"
[ -L "$CLAUDE_HOME/commands" ] && rm "$CLAUDE_HOME/commands" && echo "  ✅ Removed commands symlink"
[ -L "$CLAUDE_HOME/skills" ] && rm "$CLAUDE_HOME/skills" && echo "  ✅ Removed skills symlink"

# Remove Agent OS profile symlink
[ -L "$AGENT_OS_HOME/profiles/llm-dev-rules" ] && rm "$AGENT_OS_HOME/profiles/llm-dev-rules" && echo "  ✅ Removed Agent OS profile symlink"

echo ""
echo "Step 2: Restoring from backup..."

# Restore Claude Code config
if [ -d "$LATEST_BACKUP/agents" ]; then
    cp -r "$LATEST_BACKUP/agents" "$CLAUDE_HOME/"
    echo "  ✅ Restored agents"
fi

if [ -d "$LATEST_BACKUP/commands" ]; then
    cp -r "$LATEST_BACKUP/commands" "$CLAUDE_HOME/"
    echo "  ✅ Restored commands"
fi

if [ -d "$LATEST_BACKUP/skills" ]; then
    cp -r "$LATEST_BACKUP/skills" "$CLAUDE_HOME/"
    echo "  ✅ Restored skills"
fi

# Restore Agent OS profile
if [ -d "$AGENT_OS_HOME/profiles/default.backup_$BACKUP_DATE" ]; then
    rm -rf "$AGENT_OS_HOME/profiles/default"
    cp -r "$AGENT_OS_HOME/profiles/default.backup_$BACKUP_DATE" "$AGENT_OS_HOME/profiles/default"
    echo "  ✅ Restored Agent OS default profile"
fi

echo ""
echo "✅ Rollback Complete!"
echo "===================="
echo ""
echo "Your configuration has been restored to the state from $BACKUP_DATE"
echo ""
echo "The backup will remain at: $LATEST_BACKUP"
echo "You can delete it manually if you no longer need it."
echo ""
