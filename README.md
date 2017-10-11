# img_server_shell
> shell scripts for Image Server (GOCI Observation Application)

### Main Code 
`/home/dev/test/generateImage.sh`

### Crontab
```bash
15 11-19/1 * * * sh /home/dev/test/generateImage.sh
```

### RUNNING TIME (KST)
* RGB, L2A (CHL, TSS, CDOM)
  * 00 : 11:15
  * 01 : 12:15
  * 02 : 13:15
  * 03 : 14:15
  * 04 : 15:15
  * 05 : 16:15
  * 06 : 17:15
  * 07 : 18:15

### RUNTIME ERROR
* check the server no.100 
* c:/gdds1/goci_monitor/l2
