view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 100000ps sim:/pratica_3_tomasulo/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100000ps sim:/pratica_3_tomasulo/Reset 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100000ps sim:/pratica_3_tomasulo/Run 
WaveCollapseAll -1
wave clipboard restore
