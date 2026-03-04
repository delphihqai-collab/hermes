# Add Credentials / API Keys
**Type:** decision routine
**Applies to:** Any time a new API key, secret, connection string, or credential needs to be stored for use by HERMES or the gateway
**Trigger keywords:** add key, store credential, API key, connection string, secret, token, password, integrate service
**Times used:** 1
**Last used:** 2026-03-04

## Runbook

### Standard approach — env block in openclaw.json via Raw config

This is the recommended method. Credentials are stored in the `env` block of `~/.openclaw/openclaw.json`. The gateway reads them at startup and makes them available as environment variables to all exec commands and agents.

**Step 1 — Ask the user to open the OpenClaw dashboard**
URL: `https://hermes.tail280e9c.ts.net`
Navigate to: Settings → Config → Raw

**Step 2 — Add the credentials to the `env` block**
In Raw mode, find or add the `env` block at the top level of the JSON:

```json
"env": {
  "MY_API_KEY": "value-here",
  "MY_OTHER_KEY": "value-here"
}
```

If an `env` block already exists, add the new keys inside it. Do not replace existing keys.

**Step 3 — Save and Apply**
Click Save, then Apply. The gateway will reload.

**Step 4 — Verify**
I run:
```bash
echo "KEY=${MY_API_KEY:-NOT_SET}"
```
If it returns the value (not NOT_SET), credentials are live.

---

### Fallback — `~/.openclaw/.env` file (if dashboard is unavailable)

Create or edit the file directly on PC2:
```bash
nano ~/.openclaw/.env
```

Add entries:
```
MY_API_KEY=value-here
```

Then restart the gateway:
```bash
systemctl --user restart openclaw-gateway.service
```

---

### Never do this
- Never paste credentials in Discord channels
- Never commit credentials to git
- Never store credentials in workspace markdown files

---

### After credentials are stored
Update TOOLS.md to reflect the new service as connected. Remove any "not connected" warning for that service.

## Notes
- The `env` block in openclaw.json is non-overriding — it only sets values that aren't already present in the process environment. This is correct behaviour.
- Variables are available immediately after gateway reload — no session restart needed.
- The `.env` file at `~/.openclaw/.env` is gitignored by default. The `env` block in openclaw.json is NOT — be careful not to commit real credentials if the config file is tracked anywhere.

**First extracted:** 2026-03-04
