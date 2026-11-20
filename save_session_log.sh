#!/bin/bash
# save_session_log.sh SESSION_ID [TITLE]
# Copies a Claude Code session transcript (raw .jsonl) into ~/projects/logs for the owner's records,
# plus a plain-text version (only the words said, no tool output). Safe to run again: it overwrites.
set -e
id="$1"; title="${2:-session}"
src=~/.claude/projects/-home-igame3d-projects/$id.jsonl
out=~/projects/logs; mkdir -p "$out"
stamp=$(date -r "$src" +%Y-%m-%d)
base="$out/${stamp}_${title// /_}_${id:0:8}"
cp "$src" "$base.jsonl"
python3 - "$src" "$base.txt" <<'PY'
import json,sys
w=open(sys.argv[2],'w')
for line in open(sys.argv[1]):
    try: m=json.loads(line)
    except: continue
    if m.get('type') not in ('user','assistant'): continue
    c=m.get('message',{}).get('content')
    if isinstance(c,str): parts=[c]
    else: parts=[p.get('text','') for p in (c or []) if isinstance(p,dict) and p.get('type')=='text']
    t='\n'.join(p for p in parts if p.strip())
    if t: w.write(f"--- {m['type']} {m.get('timestamp','')}\n{t}\n\n")
PY
echo "saved $base.jsonl and .txt"
