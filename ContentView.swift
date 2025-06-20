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
	@State private var clipboardTypes = [String]()
	var body: some View {
		VStack(spacing: 20) {
			Text("Clipboard Information")
				.font(.largeTitle)
				.padding()
			
			Button(action: {
				readClipboardTypes()
			}) {
				Text("Read Clipboard Types")
					.padding()
					.background(Color.blue)
					.foregroundColor(.white)
					.cornerRadius(10)
			}
			
			List(clipboardTypes, id: \.self) { type in Text(type)
			}
			.cornerRadius(10)
		}
		.padding()
	}
	
	func readClipboardTypes() {
		let pasteboard = UIPasteboard.general
		clipboardTypes = pasteboard.types
	}
	
}

//struct ContentView_Previews: PreviewProvider {
//	static var previews: some View {
//		ContentView()
//	}
//}
