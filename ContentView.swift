import SwiftUI
/*
 public.utf8-plain-text --- regular text
 -------- copy from photos gives these four ---------
 com.apple.uikit.image
 public.heic
 public.png
 public.jpeg
 ----------------------------------------------------
 */

struct ContentView: View {
	@State private var clipboardInfo = ""
	@State private var clipboardTypes = [String]()
	@State private var showTextButton = false
	@State private var textContent = ""
	
	var body: some View {
		VStack(spacing: 20) {
			Text("Clipboard Information")
				.font(.largeTitle)
				.padding()
			Button(action: {
				readClipboardInfo()
			}) {
				Text("Read Clipboard")
					.padding()
					.background(Color.blue)
					.foregroundColor(.white)
					.cornerRadius(10)
			}
			List{
				ForEach(clipboardTypes, id: \.self) { type in
					if type == "public.utf8-plain-text" {
						HStack {
							
							Button(action: {
								textContent = getTextFromClipboard()
								//clipboardInfo = "Text content copied to display area."
							}) {
								Text(type)
								//							.padding()
								//							.background(Color.green)
								//							.foregroundColor(.white)
								//							.cornerRadius(10)
							}
							Text(textContent)
							
						}
					}
					else {
						Text(type)
					}
				}
				.cornerRadius(10)
				
			}
		}
	}
	
	func readClipboardTypes() {
		let pasteboard = UIPasteboard.general
		clipboardTypes = pasteboard.types
	}
	
	func readClipboardInfo() {
		let pasteboard = UIPasteboard.general
		clipboardTypes = pasteboard.types
		var info: String = ""
		for type in clipboardTypes {
			info += type + "\n"
		}
		
		if clipboardTypes.contains("public.utf8-plain-text") {
			showTextButton = true        } else {
				showTextButton = false
			}
		
		if info.isEmpty {
			clipboardInfo = "No data in clipboard"
		} else {
			clipboardInfo = info        }
	}
	
	func getTextFromClipboard() -> String {
		let pasteboard = UIPasteboard.general
		return pasteboard.string ?? "No text found in clipboard"
	}
}

struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
				ContentView()
		}
}
