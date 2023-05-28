//
//  Alert .swift
//  BarcodeScanner
//
//  Created by Josue Cruz on 5/28/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismiss: Alert.Button
    
}

struct AlertContext {
    static let invalidDevideInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera. We are unable to capture the input.",
                                              dismiss: .default(Text("OK")))
    
    static let invalidScannedValye = AlertItem(title: "Invalid Scan Type",
                                              message: "The value scanned is not valid. This app scans EAN-8 and EAN-13.",
                                              dismiss: .default(Text("OK")))
}
