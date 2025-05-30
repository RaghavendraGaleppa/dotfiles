#!/usr/bin/python3
import sys
import subprocess
import json

result = subprocess.run(['swaymsg', '-t', 'get_workspaces', '-r'], capture_output=True, text=True)


workspace_num = None
if result.returncode == 0:
    data = json.loads(result.stdout)
    for workspace in data:
        if workspace['focused'] is True:
            workspace_num = workspace['num']

if workspace_num is None:
    raise Exception(f"Failed to retrieve any workspaces")
print(workspace_num)

