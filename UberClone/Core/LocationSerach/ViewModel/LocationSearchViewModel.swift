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
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    
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
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("Debug: error getting coordinate \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            print("Debug: coordinate \(coordinate)")
            self.selectedLocationCoordinate = coordinate
        }
    }
    
//    Get coordinates from place
    func locationSearch(forLocalSearchCompletion locaslSearch: MKLocalSearchCompletion, completion: @escaping(MKLocalSearch.CompletionHandler)) {
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = locaslSearch.title.appending(locaslSearch.subtitle)
        
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
    }
}

//    MARK: - LocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
