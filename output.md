ubuntu@refined-troll:~/5g-term-project$ bash scripts/render_manifests.sh
grep -nE "db_uri|freeDiameter|udr.yaml|smf.yaml" manifests/all-in-one.yaml
bash scripts/deploy.sh
bash scripts/check_registration.sh
Rendered manifests at: ./manifests/all-in-one.yaml
68:  smf.yaml: |
97:      freeDiameter: /open5gs/install/etc/freeDiameter/smf.conf
149:  udr.yaml: |
157:      db_uri: mongodb://mongodb/open5gs
466:          args: ["open5gs-udrd -c /open5gs/udr.yaml"]
471:              mountPath: /open5gs/udr.yaml
472:              subPath: udr.yaml
656:          args: ["open5gs-smfd -c /open5gs/smf.yaml"]
665:              mountPath: /open5gs/smf.yaml
666:              subPath: smf.yaml
Release "open5gs-lab" has been upgraded. Happy Helming!
NAME: open5gs-lab
LAST DEPLOYED: Wed Apr 29 06:30:54 2026
NAMESPACE: 5g-core
STATUS: deployed
REVISION: 2
TEST SUITE: None
Waiting for core components...
deployment.apps/mongodb condition met
job.batch/subscriber-bootstrap condition met
deployment.apps/nrf condition met
deployment.apps/amf condition met

error: timed out waiting for the condition on deployments/smf
AMF logs (last 200 lines):
Open5GS daemon v2.7.0

04/29 05:58:22.517: [app] INFO: Configuration: '/open5gs/amf.yaml' (../lib/app/ogs-init.c:130)
04/29 05:58:22.520: [sbi] INFO: NF Service [namf-comm] (../lib/sbi/context.c:1812)
04/29 05:58:22.520: [sbi] INFO: nghttp2_server() [http://0.0.0.0]:7777 (../lib/sbi/nghttp2-server.c:414)
04/29 05:58:22.521: [amf] INFO: ngap_server() [0.0.0.0]:38412 (../src/amf/ngap-sctp.c:61)
04/29 05:58:22.521: [sctp] INFO: AMF initialize...done (../src/amf/app.c:33)
04/29 05:58:22.523: [sbi] WARNING: [7] Failed to connect to nrf port 7777: Connection refused (../lib/sbi/client.c:698)
04/29 05:58:22.523: [sbi] WARNING: ogs_sbi_client_handler() failed [-1] (../lib/sbi/path.c:62)
04/29 05:58:33.526: [sbi] WARNING: [6e0271a2-4390-41f1-b307-13f0ee0222a3] Retry registration with NRF (../lib/sbi/nf-sm.c:182)
04/29 05:58:33.529: [sbi] INFO: [6e0271a2-4390-41f1-b307-13f0ee0222a3] NF registered [Heartbeat:10s] (../lib/sbi/nf-sm.c:221)
04/29 05:58:33.530: [sbi] INFO: [74927666-4390-41f1-9c7b-978b1e392f29] Subscription created until 2026-04-30T05:58:33.530357+00:00 [duration:86400,validity:86399.999391,patch:43199.999695] (../lib/sbi/nnrf-handler.c:708)
04/29 05:58:33.531: [sbi] INFO: [7492811a-4390-41f1-9c7b-978b1e392f29] Subscription created until 2026-04-30T05:58:33.530608+00:00 [duration:86400,validity:86399.999163,patch:43199.999581] (../lib/sbi/nnrf-handler.c:708)
04/29 05:58:33.531: [sbi] INFO: [749283f4-4390-41f1-9c7b-978b1e392f29] Subscription created until 2026-04-30T05:58:33.530678+00:00 [duration:86400,var.c:708)
04/29 05:58:33.531: [sbi] INFO: [74928660-4390-41f1-9c7b-978b1e392f29] Subscription created until 2026-04-30T05:58:33.530741+00:00 [duration:86400,validity:86399.999017,patch:43199.999508] (../lib/sbi/nnrf-handler.c:708)
04/29 05:58:33.532: [sbi] INFO: [74928fb6-4390-41f1-9c7b-978b1e392f29] Subscription created until 2026-04-30T05:58:33.530980+00:00 [duration:86400,validity:86399.998781,patch:43199.999390] (../lib/sbi/nnrf-handler.c:708)
04/29 05:58:33.532: [sbi] INFO: [7492916e-4390-41f1-9c7b-978b1e392f29] Subscription created until 2026-04-30T05:58:33.531023+00:00 [duration:86400,validity:86399.998787,patch:43199.999393] (../lib/sbi/nnrf-handler.c:708)
04/29 05:58:33.532: [sbi] INFO: [749295a6-4390-41f1-9c7b-978b1e392f29] Subscription created until 2026-04-30T05:58:33.531135+00:00 [duration:86400,validity:86399.998853,patch:43199.999426] (../lib/sbi/nnrf-handler.c:708)
04/29 05:58:41.808: [amf] INFO: gNB-N2 accepted[10.42.0.1]:42544 in ng-path module (../src/amf/ngap-sctp.c:113)
04/29 05:58:41.809: [amf] INFO: gNB-N2 accepted[10.42.0.1] in master_sm module (../src/amf/amf-sm.c:741)
04/29 05:58:41.814: [amf] INFO: [Added] Number of gNBs is now 1 (../src/amf/context.c:1231)
04/29 05:58:41.814: [amf] INFO: gNB-N2[10.42.0.1] max_num_of_ostreams : 10 (../src/amf/amf-sm.c:780)

UE logs (last 200 lines):
[2026-04-29 06:02:03.632] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:02:27.963] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:02:27.963] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:02:34.564] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:02:58.000] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:02:58.000] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:03:05.494] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:03:28.082] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:03:28.082] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:03:36.482] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:03:58.130] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:03:58.130] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:04:07.434] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:04:28.167] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:04:28.167] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:04:38.383] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:04:58.225] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:04:58.225] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:05:09.265] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:05:28.305] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:05:28.305] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:05:40.187] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:05:58.372] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:05:58.372] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:06:11.058] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:06:28.425] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage[2026-04-29 06:06:28.425] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:06:42.007] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:06:58.515] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:06:58.515] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:07:12.982] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:07:28.576] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:07:28.576] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:07:43.877] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:07:58.625] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:07:58.625] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:08:14.785] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:08:28.640] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:08:28.640] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:08:45.729] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:08:58.667] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:08:58.667] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:09:16.647] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:09:28.723] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:09:28.723] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:09:47.588] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:09:58.754] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:09:58.754] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:10:18.517] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:10:28.824] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:10:28.824] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:10:49.442] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:10:58.866] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:10:58.866] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:11:20.408] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:11:28.952] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:11:28.952] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:11:51.327] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:11:59.000] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:11:59.000] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:12:22.251] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:12:29.022] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:12:29.022] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:12:53.176] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:12:59.056] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:12:59.056] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:13:24.074] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:13:29.128] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:13:29.128] [rrc] [error] Cell selection failure, no suitable or acceptable cell found[2026-04-29 06:13:54.972] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:13:59.171] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:13:59.171] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:14:25.905] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:14:29.205] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:14:29.205] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:14:56.808] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:14:59.230] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:14:59.230] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:15:27.740] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:15:29.315] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:15:29.315] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:15:58.661] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:15:59.351] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:15:59.351] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:16:29.424] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:16:29.424] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:16:29.620] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:16:59.459] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:16:59.459] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:17:00.621] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:17:29.506] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:17:29.506] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:17:31.508] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:17:59.566] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:17:59.566] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:18:02.486] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:18:29.609] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:18:29.609] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:18:33.433] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:18:59.632] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:18:59.632] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:19:04.354] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:19:29.711] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:19:29.711] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:19:35.270] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:19:59.787] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:19:59.787] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:20:06.234] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:20:29.817] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:20:29.817] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:20:37.239] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:20:59.889] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:20:59.889] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:21:08.188] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:21:29.933] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage  [2026-04-29 06:21:29.933] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:21:39.159] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:21:59.973] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:21:59.973] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:22:10.070] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:22:30.004] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:22:30.004] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:22:40.955] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:23:00.060] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:23:00.060] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:23:11.868] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:23:30.122] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:23:30.122] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:23:42.746] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:24:00.134] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:24:00.134] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:24:13.743] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:24:30.188] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:24:30.188] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:24:44.632] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:25:00.243] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:25:00.243] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:25:15.600] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:25:30.324] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:25:30.324] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:25:46.510] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:26:00.411] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:26:00.411] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:26:17.438] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:26:30.498] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:26:30.498] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:26:48.397] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:27:00.579] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:27:00.579] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:27:19.324] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:27:30.631] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:27:30.631] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:27:50.252] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:28:00.698] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:28:00.698] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:28:21.136] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:28:30.751] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage[2026-04-29 06:28:30.751] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:28:52.115] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:29:00.790] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:29:00.790] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:29:23.051] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:29:30.830] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:29:30.830] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:29:54.025] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:30:00.859] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:30:00.859] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:30:24.956] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:30:30.944] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:30:30.944] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:30:55.908] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:31:00.970] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:31:00.970] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:31:26.859] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:31:31.028] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:31:31.029] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:31:57.855] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:32:01.071] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:32:01.071] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:32:28.761] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:32:31.129] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:32:31.129] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:32:59.727] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:33:01.166] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:33:01.166] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:33:30.660] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:33:31.237] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:33:31.237] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:34:01.352] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:34:01.352] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:34:01.597] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:34:31.414] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:34:31.414] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:34:32.589] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:35:01.469] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:35:01.469] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:35:03.470] [nas] [error] PLMN selection failure, no cells in coverage
[2026-04-29 06:35:31.555] [rrc] [warning] Acceptable cell selection failed, no cell is in coverage
[2026-04-29 06:35:31.555] [rrc] [error] Cell selection failure, no suitable or acceptable ce26-04-29 06:35:31.555] [rrc] [error] Cell selection failure, no suitable or acceptable cell found
[2026-04-29 06:35:34.440] [nas] [error] PLMN selection failure, no cells in coverage

Quick registration checks:
No explicit AMF registration match found yet.
No explicit UE registration/session accept match found yet.
ubuntu@refined-troll:~/5g-term-project$ 