JsOsaDAS1.001.00bplist00�Vscript_�var app = Application.currentApplication()
app.includeStandardAdditions = true

readFile("/Users/thomashansknecht/Library/Mobile Documents/com~apple~ScriptEditor2/Documents/code1.txt")


function readFile(file) {
    // Convert the file to a string
   	var fileString = file.toString()
	
	if (app.read(Path(fileString)) == "Disconnecting from Bluetooth Headset") {
	writeTextToFile("Already Disconnected from Bluetooth Headset", "/Users/thomashansknecht/Library/Mobile Documents/com~apple~ScriptEditor2/Documents/code1.txt", true)
}
	else {
	
	writeTextToFile("Disconnecting from Bluetooth Headset", "/Users/thomashansknecht/Library/Mobile Documents/com~apple~ScriptEditor2/Documents/code1.txt", true)
	
	}
app.displayNotification(app.read(Path(fileString)), {
    withTitle: "Sony WH-1000XM3",
    subtitle: "",
    soundName: "glass"
})
 
    // Read the file and return its contents
    return app.read(Path(fileString))
	
}


function writeTextToFile(text, file, overwriteExistingContent) {
    try {
 
        // Convert the file to a string
        var fileString = file.toString()
 
        // Open the file for writing
        var openedFile = app.openForAccess(Path(fileString), { writePermission: true })
 
        // Clear the file if content should be overwritten
        if (overwriteExistingContent) {
            app.setEof(openedFile, { to: 0 })
        }
 
        // Write the new content to the file
        app.write(text, { to: openedFile, startingAt: app.getEof(openedFile) })
 
        // Close the file
        app.closeAccess(openedFile)
 
        // Return a boolean indicating that writing was successful
        return true
    }
    catch(error) {
 
        try {
            // Close the file
            app.closeAccess(file)
        }
        catch(error) {
            // Report the error is closing failed
            console.log(`Couldn't close file: ${error}`)
        }
 
        // Return a boolean indicating that writing was successful
        return false
    }
	
}                              �jscr  ��ޭ