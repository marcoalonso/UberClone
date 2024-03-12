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
    @Published var selectedUberLocation: UberLocation?
    @Published var pickupTime: String?
    @Published var dropOffTime: String?
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var userLocation: CLLocationCoordinate2D?
    
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
            self.selectedUberLocation = UberLocation(title: localSearch.title, coordinate: coordinate)
        }
    }
    
    func computeRidePrice(forType type: RideType) -> Double {
        guard let coordinate = selectedUberLocation?.coordinate else { return 0.0 }
        guard let userLocation = self.userLocation else { return 0.0 }
        
        let userLocationDistance = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let destination = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        let tripDistanceInMeters = userLocationDistance .distance(from: destination)
        
        return type.computePrice(for: tripDistanceInMeters)
    }
    
    //    Get coordinates from place
        func locationSearch(forLocalSearchCompletion locaslSearch: MKLocalSearchCompletion, completion: @escaping(MKLocalSearch.CompletionHandler)) {
            
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = locaslSearch.title.appending(locaslSearch.subtitle)
            
            let search = MKLocalSearch(request: searchRequest)
            search.start(completionHandler: completion)
        }
    
    func getDestinationroute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void) {
        let userPlascemark = MKPlacemark(coordinate: userLocation)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlascemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            if let error = error {
                print("Debug: error getting directions \(error.localizedDescription)")
            }
            
            guard let route = response?.routes.first else { return }
            self.configurePickUpAndDropOffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configurePickUpAndDropOffTimes(with expectedTraveltime: Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        pickupTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTraveltime)
    }
}

//    MARK: - LocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
