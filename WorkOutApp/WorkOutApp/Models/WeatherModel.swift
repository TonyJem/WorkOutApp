import Foundation

struct WeatherModel: Decodable {
    let currently: Currently
}

struct Currently: Decodable {
    let temperature: Double
    let icon: String?
    
    var temperatureCelsius: Int {
        return (Int(temperature) - 32) * 5 / 9
    }
    
    var iconLocal: String {
        switch icon {
        case "clear-day": return "Clear day"
        case "clear-night": return "Clear day"
        case "rain": return "Rain"
        case "snow": return "Snow"
        case "sleet": return "Sleet"
        case "wind": return "Wind"
        case "fog": return "Fog"
        case "cloudy": return "Cloudy"
        case "partly-cloudy-day": return "Partly cloudy day"
        case "partly-cloudy-night": return "Partly cloudy night"
        default: return "No data"
        }
    }
    
    var description: String {
        switch icon {
        case "clear-day": return "Clear day text description here..."
        case "clear-night": return "Clear day text description here..."
        case "rain": return "Rain text description here..."
        case "snow": return "Snow text description here..."
        case "sleet": return "Sleet text description here..."
        case "wind": return "Wind text description here..."
        case "fog": return "Fog text description here..."
        case "cloudy": return "Cloudy text description here..."
        case "partly-cloudy-day": return "Partly cloudy day text description here..."
        case "partly-cloudy-night": return "Partly cloudy night text description here..."
        default: return "No data"
        }
    }
}
