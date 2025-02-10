run("Close All");  // Close all windows

// Set the directory to analyze
dir_to_analyze = "C:/Users/dennis.tabuena/Gladstone Dropbox/Dennis Tabuena/_Colab_Inbox/From Jessie - NeuN and PV-SST projects/PV-GFP-Strept-SST/TIF FIles/PubImage/";
Target_dir ="/New_RGBs/"
File.makeDirectory(dir_to_analyze + Target_dir)
// Get the list of files in the directory
list = getFileList(dir_to_analyze);
print(list.length);
// Disable batch mode to show images
setBatchMode(false);

// Loop over all files
for (i = 0; i < list.length; i++) {
    if (endsWith(list[i], ".tif")) {
        // Get the full file path
        filePath = dir_to_analyze + "/" + list[i];
        // Open the image using Bio-Formats Importer
        open(filePath);
        // Get the name of the current window (full path)
        currentWindow = getTitle(); // Get the current window title, including the full path

	    //  Opperation to Run
		
		Stack.getDimensions(width, height, channels, slices, frames);
		print(channels);
		if (channels == 1){
			run("Enhance Contrast", "saturated=0.0 normalize");
			run("Apply LUT");  // This locks in the chosen LUT before conversion
			run("RGB Color");
			//run("Flatten");
			wait(500); 
			saveAs("Tiff", dir_to_analyze + Target_dir +"RGB_" +  list[i]);
		}
	    //
		run("Close All"); 
    }
}