state("FNaF_World") {
  int dialog : "gdi32full.dll", 0xBAFE8, 0x104;
  int dialog4th : "FNaF_World.exe", 0xAC40C, 0x3C, 0x0, 0x64, 0x0, 0x88, 0xFC, 0x48C;
  int area : "FNaF_World.exe", 0xAC9AC, 0x1F0;
}

startup
{
  settings.Add("CP", false, "Update 1.019+");
  settings.Add("Normal", false, "Normal Mode Ending", "CP");
  settings.Add("Hard", false, "Hard Mode Ending", "CP");
  settings.Add("4th", false, "4th Glitch Ending", "CP");
  settings.Add("Chip", false, "Chipper Ending", "CP");
  settings.Add("Clock", false, "Clock Ending", "CP");
  settings.Add("Universe", false, "Universe Ending", "CP");
  settings.Add("Rainbow", false, "Rainbow Ending", "CP");
  settings.Add("Mini", false, "Slipt At New Character Screen After Minigames", "CP");
  settings.Add("OP", false, "Update 1.019");
  settings.Add("Normal0", false, "Normal Mode Ending", "OP");
  settings.Add("Hard0", false, "Hard Mode Ending", "OP");
  settings.Add("4th0", false, "4th Glitch Ending", "OP");
  settings.Add("Chip0", false, "Chipper Ending", "OP");
  settings.Add("Clock0", false, "Clock Ending", "OP");
  settings.Add("Universe0", false, "Universe Ending", "OP");
}

start {
  if(settings["CP"] && current.area == 27 && old.area == -1 || settings["OP"] && current.area == 26 && old.area == -1) {
    return true;
  }
}

split {
  if(settings["Normal"] && old.dialog == 22 && current.dialog == 7 || settings["Hard"] && current.dialog == 7 && old.dialog == 30 || settings["4th"] && current.dialog4th == 511 && old.dialog4th == 2175 || settings["Clock"] && current.area == 29 && old.area != 29 || settings["Chip"] && current.dialog == 7 && old.dialog == 16 || settings["Universe"] && current.area == 30 && old.area != 30 || settings["Rainbow"] && current.area == 45 && old.area != 45 || settings["Mini"] && current.area == 43 && old.area != 43 ||
  settings["Normal0"] && old.dialog == 22 && current.dialog == 7 || settings["Hard0"] && current.dialog == 7 && old.dialog == 30 || settings["4th0"] && current.dialog4th == 511 && old.dialog4th == 2175 || settings["Clock0"] && current.area == 28 && old.area != 28 || settings["Chip0"] && current.dialog == 7 && old.dialog == 16 || settings["Universe0"] && current.area == 29 && old.area != 29) {
    return true;
  }
}

reset {
  if(settings["CP"] && current.area == 6 || settings["OP"] && current.area == 5) {
    return true;
  }
}

isLoading {
  if(current.area == -1 || settings["CP"] && current.area == 9 || settings["CP"] && current.area == 31 || settings["OP"] && current.area == 8 || settings["OP"] && current.area == 30) {
    return true;
  }
  else {
    return false;
  }
}
