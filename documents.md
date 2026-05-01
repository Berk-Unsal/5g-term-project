# Fixes Applied (1 May 2026)

This document summarizes the fixes applied during debugging.

- Added SMF `gtpc` bind to `0.0.0.0:2123` to prevent GTPC socket assertion at startup.
- Removed the minimal freeDiameter override so SMF uses the image default config.
- Set UDR `db_uri` to `mongodb://mongodb/open5gs`.
- Added a `mongo` Service alias that points to the MongoDB service for compatibility with configs that use `mongodb://mongo/open5gs`.
- Added a debug dump to `scripts/quickstart.sh` that prints pod status, recent events, and logs on rollout or wait failures.

Notes:
- After config changes, a Helm upgrade and a pod restart may be required so pods pick up updated ConfigMaps.
