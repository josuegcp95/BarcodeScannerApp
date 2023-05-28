//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Josue Cruz on 5/28/23.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem? 

    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                switch error {
                case .invalidDeviceInput:
                    self.scannerView.alertItem = AlertContext.invalidDevideInput
                case .invalidScannedValue:
                    self.scannerView.alertItem = AlertContext.invalidScannedValye
                }
            }
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("Preview Text"), alertItem: .constant(.none))
    }
}
