run("Close All");  // Close all windows

// Set the directory to analyze
dir_to_analyze = "INSERT DIRECTORY HERE";

// Get the list of files in the directory
list = getFileList(dir_to_analyze);

// Disable batch mode to show images
setBatchMode(false);

// Loop over all files
for (i = 0; i < list.length; i++) {
    if (endsWith(list[i], ".oir")) {
        // Get the full file path
        filePath = dir_to_analyze + "/" + list[i];
        // Open the image using Bio-Formats Importer
        run("Bio-Formats Importer", "open=[" + filePath + "] virtual");
        // Get the name of the current window (full path)
        currentWindow = getTitle(); // Get the current window title, including the full path

    //  Opperation to Run



    //



		run("Close All"); 
    }
}
