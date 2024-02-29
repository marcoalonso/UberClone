//
//  LocationSearchViewModel.swift
//  UberClone
//
//  Created by Marco Alonso on 27/02/24.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
//    MARK: - Properties
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocation: String?
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            print("Debug: queryFragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    //    MARK: - Helpers
    func selectLocation(_ location: String) {
        self.selectedLocation = location
        print("Debug: selectedLocation \(self.selectedLocation)")
    }
}

//    MARK: - LocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
